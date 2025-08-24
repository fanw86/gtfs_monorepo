# Comprehensive GTFS Generator from VDV Data
# Combines stop_times and shapes generation with visualization
# Input: VDV tables in .x10 format
# Output: Complete GTFS feed and visualization files

rm(list = ls())
library(dplyr)
library(readr)
library(stringr)
library(lubridate)
library(tidyr)
library(purrr)
library(sf)
library(leaflet)
library(classInt)
library(RColorBrewer)
library(readxl)

### Shared Utility Functions ###
convert_to_decimal <- function(x) {
  x <- as.numeric(x)
  sign <- ifelse(x < 0, -1, 1)
  x <- abs(x)
  
  degrees <- floor(x / 10000000)
  minutes <- floor((x - degrees * 10000000) / 100000)
  seconds <- floor((x - degrees * 10000000 - minutes * 100000) / 1000)
  milliseconds <- x - degrees * 10000000 - minutes * 100000 - seconds * 1000
  
  decimal_degrees <- sign * (degrees + minutes / 60 + (seconds + milliseconds / 1000) / 3600)
  round(decimal_degrees, 6)
}

load_vdv_table <- function(folder, path) {
  path <- paste0(folder, "/", path)
  if (!file.exists(path)) {
    stop(paste("File not found:", path))
  }
  tryCatch({
    col_names <- read_lines(path, skip = 10, n_max = 1) %>%
      str_split(";") %>%
      unlist() %>%
      str_trim()
    
    data <- read_delim(path, delim = ";", col_names = col_names, trim_ws = TRUE, skip = 12)
    data <- data[-((nrow(data)-1):nrow(data)),]
    data %>% select(-1)
  }, error = function(e) {
    stop(paste("Error loading", path, ":", e$message))
  })
}

### Stop Times Processing Functions ###
create_trip_stop_mapping <- function(journey, route_sequence) {
  journey %>%
    left_join(route_sequence,
              by = c("BASE_VERSION" = "BASE_VERSION",
                     "LINE_NO" = "LINE_NO",
                     "ROUTE_ABBR" = "ROUTE_ABBR"),
              relationship = 'many-to-many') %>%
    arrange(JOURNEY_NO, SEQUENCE_NO) %>%
    group_by(JOURNEY_NO) %>%
    mutate(
      TO_POINT_NO = lead(POINT_NO)
    ) %>%
    ungroup() 
}

calculate_stop_times <- function(trip_stop_mapping, travel_time) {
  trip_stop_mapping %>%
    left_join(travel_time,
              by = c("BASE_VERSION" = "BASE_VERSION",
                     "POINT_TYPE"="POINT_TYPE",
                     "POINT_NO" = "POINT_NO",
                     "TO_POINT_NO" = "TO_POINT_NO",
                     "TIMING_GROUP_NO" = "TIMING_GROUP_NO"
              )) %>%
    group_by(JOURNEY_NO) %>%
    mutate(
      arrival_time = first(DEPARTURE_TIME),
      arrival_time = cumsum(c(0, TRAVEL_TIME[-n()])),
      arrival_time = arrival_time + DEPARTURE_TIME[1],
      departure_time = arrival_time
    ) %>%
    ungroup() %>%
    mutate(
      arrival_time = as.character(hms::hms(arrival_time)),
      departure_time = as.character(hms::hms(departure_time))
    )
}

### Shapes Processing Functions ###
build_route_geometries <- function(point_on_link, stop, link, route_sequence) {
  # Get stop coordinates
  stop_coords <- stop %>%
    select(BASE_VERSION, POINT_NO, POINT_TYPE, POINT_LONGITUDE, POINT_LATITUDE) %>%
    mutate(
      POINT_LONGITUDE = convert_to_decimal(POINT_LONGITUDE),
      POINT_LATITUDE = convert_to_decimal(POINT_LATITUDE)
    ) %>%
    filter(!is.na(POINT_LONGITUDE), !is.na(POINT_LATITUDE))
  
  # Build complete coordinate sequences for each route
  route_coordinates <- route_sequence %>%
    group_by(BASE_VERSION, LINE_NO, ROUTE_ABBR) %>%
    arrange(SEQUENCE_NO) %>%
    mutate(
      TO_POINT_TYPE = lead(POINT_TYPE),
      TO_POINT_NO = lead(POINT_NO)
    ) %>%
    filter(!is.na(TO_POINT_NO)) %>%
    # For each stop pair, collect all coordinates along the path
    group_modify(~ {
      route_coords <- data.frame()
      
      for(i in 1:nrow(.x)) {
        # Get coordinates for current segment
        segment_coords <- get_segment_coordinates(
          .x$BASE_VERSION[i], .x$OP_DEP_NO[i],
          .x$POINT_TYPE[i], .x$POINT_NO[i],
          .x$TO_POINT_TYPE[i], .x$TO_POINT_NO[i],
          point_on_link, stop_coords
        )
        
        # Append to route (avoid duplicating connection points)
        if(nrow(route_coords) > 0 && nrow(segment_coords) > 0) {
          segment_coords <- segment_coords[-1, ] # Remove first point to avoid duplication
        }
        route_coords <- rbind(route_coords, segment_coords)
      }
      
      # Create coordinate sequence string for deduplication
      if(nrow(route_coords) > 0) {
        coord_sequence <- paste(paste(route_coords$lon, route_coords$lat, sep=","), collapse="|")
        data.frame(coordinates = list(route_coords), coord_sequence = coord_sequence)
      } else {
        data.frame(coordinates = list(data.frame(lon=numeric(0), lat=numeric(0))), coord_sequence = "")
      }
    }) %>%
    ungroup() %>%
    filter(coord_sequence != "")
  
  return(route_coordinates)
}

get_segment_coordinates <- function(base_version, op_dep_no, point_type, point_no, to_point_type, to_point_no, point_on_link, stop_coords) {
  # Get start point coordinates
  start_coord <- stop_coords %>%
    filter(BASE_VERSION == base_version, POINT_NO == point_no, POINT_TYPE == point_type) %>%
    slice(1)
  
  # Get end point coordinates  
  end_coord <- stop_coords %>%
    filter(BASE_VERSION == base_version, POINT_NO == to_point_no, POINT_TYPE == to_point_type) %>%
    slice(1)
  
  # Get intermediate points from point_on_link
  intermediate_coords <- point_on_link %>%
    filter(
      BASE_VERSION == base_version,
      OP_DEP_NO == op_dep_no,
      POINT_TYPE == point_type,
      POINT_NO == point_no,
      TO_POINT_TYPE == to_point_type,
      TO_POINT_NO == to_point_no
    ) %>%
    left_join(stop_coords, by = c("BASE_VERSION" = "BASE_VERSION",
                                 "POINT_TO_LINK_NO" = "POINT_NO",
                                 "POINT_TO_LINK_TYPE" = "POINT_TYPE")) %>%
    filter(!is.na(POINT_LONGITUDE)) %>%
    arrange(POINT_ON_LINK_SERIAL_NO) %>%
    select(lon = POINT_LONGITUDE, lat = POINT_LATITUDE)
  
  # Combine all coordinates in order
  all_coords <- data.frame()
  
  # Add start point
  if(nrow(start_coord) > 0) {
    all_coords <- rbind(all_coords, data.frame(lon = start_coord$POINT_LONGITUDE, lat = start_coord$POINT_LATITUDE))
  }
  
  # Add intermediate points
  if(nrow(intermediate_coords) > 0) {
    all_coords <- rbind(all_coords, intermediate_coords)
  }
  
  # Add end point
  if(nrow(end_coord) > 0) {
    all_coords <- rbind(all_coords, data.frame(lon = end_coord$POINT_LONGITUDE, lat = end_coord$POINT_LATITUDE))
  }
  
  return(all_coords)
}

deduplicate_shapes <- function(route_coordinates) {
  # Find unique coordinate sequences
  unique_shapes <- route_coordinates %>%
    distinct(coord_sequence, .keep_all = TRUE) %>%
    mutate(shape_id = paste0("shape_", row_number()))
  
  # Create mapping from routes to unique shapes
  route_to_shape <- route_coordinates %>%
    left_join(unique_shapes %>% select(coord_sequence, shape_id), by = "coord_sequence") %>%
    select(BASE_VERSION, LINE_NO, ROUTE_ABBR, shape_id)
  
  return(list(unique_shapes = unique_shapes, route_to_shape = route_to_shape))
}

generate_shapes_txt <- function(unique_shapes) {
  # Generate shapes.txt format
  shapes_txt <- unique_shapes %>%
    select(shape_id, coordinates) %>%
    unnest(coordinates) %>%
    group_by(shape_id) %>%
    mutate(
      shape_pt_sequence = row_number(),
      # Calculate cumulative distance using Haversine formula
      shape_dist_traveled = c(0, cumsum(geosphere::distHaversine(
        cbind(lon[-n()], lat[-n()]), 
        cbind(lon[-1], lat[-1])
      )))
    ) %>%
    ungroup() %>%
    select(
      shape_id,
      shape_pt_lat = lat,
      shape_pt_lon = lon,
      shape_pt_sequence,
      shape_dist_traveled
    )
  
  return(shapes_txt)
}

### Visualization Functions ###
create_plf_map <- function(route_shapes, plf_data) {
  s_routes <- route_shapes %>%
    left_join(plf_data, by = c("LINE_ABBR" = "LINE_NAME")) %>%
    filter(ROUTE_ABBR %in% c(10), MODALITY_NAME == 'Abu Dhabi') %>%
    mutate(PLF = as.numeric(PLF)) %>%
    st_as_sf()

  nbreaks <- 5
  breaks <- classIntervals(s_routes$PLF, n = nbreaks, style = "jenks")$brks
  pal <- colorBin(palette = "YlOrRd", domain = s_routes$PLF, bins = breaks)

  leaflet() %>%
    addProviderTiles("CartoDB.Positron") %>%
    addPolylines(data = s_routes, color = ~pal(PLF), weight = 1) %>%
    addLegend(
      position = "bottomleft",
      pal = pal,
      values = s_routes$PLF,
      title = "Peak Loading Factor",
      opacity = 1
    )
}

### Main Execution ###
day_type = 15

  folder <- "./vdv_202505080912"
  
  # Load all required tables
  stop <- load_vdv_table(folder, "i2531280.x10")
  stop_point <- load_vdv_table(folder, "i2291280.x10")
  journey <- load_vdv_table(folder, "i7151280.x10")
  travel_time <- load_vdv_table(folder, "i2821280.x10")
  route_sequence <- load_vdv_table(folder, "i2461280.x10")
  link <- load_vdv_table(folder, "i2991280.x10")
  point_on_link <- load_vdv_table(folder, "i9951280.x10")
  routes <- load_vdv_table(folder, "i2261280.x10")

  # Process stop times
  trip_stop_mapping <- create_trip_stop_mapping(journey, route_sequence)
  trip_stop_mapping_rev <- trip_stop_mapping %>% filter(ROUTE_ABBR < 30)
  stop_times <- calculate_stop_times(trip_stop_mapping_rev, travel_time) %>%
    filter(DAY_TYPE_NO %in% c(day_type))

  # Process shapes with deduplication
  route_coordinates <- build_route_geometries(point_on_link, stop, link, route_sequence)
  shape_data <- deduplicate_shapes(route_coordinates)
  unique_shapes <- shape_data$unique_shapes
  route_to_shape <- shape_data$route_to_shape

  # Create gtfs directory if it doesn't exist
  if (!dir.exists("gtfs")) {
    dir.create("gtfs")
  }

  # Generate GTFS files
  # routes.txt
  routes %>%
    select(route_id = LINE_NO, route_short_name = LINE_ABBR) %>%
    filter(!is.na(route_id)) %>%
    distinct() %>%
    mutate(route_type = 3) %>%
    write_csv("gtfs/routes.txt")

  # trips.txt with shape_id
  stop_times %>%
    select(trip_id = JOURNEY_NO, route_id = LINE_NO, ROUTE_ABBR) %>%
    distinct() %>%
    left_join(route_to_shape, by = c("route_id" = "LINE_NO", "ROUTE_ABBR" = "ROUTE_ABBR")) %>%
    mutate(service_id = 1) %>%
    select(trip_id, route_id, service_id, shape_id) %>%
    write_csv("gtfs/trips.txt")

  # stop_times.txt
  stop_times %>%
    select(trip_id = JOURNEY_NO, arrival_time, departure_time, 
           stop_id = POINT_NO, stop_sequence = SEQUENCE_NO) %>%
    write_csv("gtfs/stop_times.txt")

  # stops.txt
  stop %>% 
    filter(POINT_TYPE %in% c(1, 2, 42)) %>%
    select(stop_id = POINT_NO, stop_name = STOP_DESC,
           stop_lat = POINT_LATITUDE, stop_lon = POINT_LONGITUDE) %>%
    mutate(
      stop_lat = convert_to_decimal(stop_lat),
      stop_lon = convert_to_decimal(stop_lon),
      stop_name = iconv(stop_name, to = "utf-8")
    ) %>%
    write_csv("gtfs/stops.txt")

  # shapes.txt with deduplication and distance calculation
  shapes_txt <- generate_shapes_txt(unique_shapes)
  write_csv(shapes_txt, "gtfs/shapes.txt")

  # # Create visualizations
  # plf_data <- read_excel('route_shapes/Peak Load by Route (APC)_Oct 2024.xlsx')
  # plf_map <- create_plf_map(route_shapes, plf_data)
  # htmlwidgets::saveWidget(plf_map, file = "ad_plf_map.html", selfcontained = TRUE)


