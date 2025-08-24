# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a GTFS-focused monorepo containing multiple transit-related projects:

- **GTFS-books**: Documentation books for GTFS and GTFS-realtime (Markdown)
- **onebusaway-vdv-modules**: Java libraries for VDV-452 to GTFS conversion (Maven)
- **synthese**: C++ public transportation server with web services (CMake/C++)

## Build Commands

### OneBusAway VDV Modules (Java/Maven)
```bash
cd onebusaway-vdv-modules
mvn clean install
mvn test                    # Run unit tests
```

### SYNTHESE (C++/CMake)
```bash
cd synthese/server
mkdir build && cd build
export BOOST_ROOT=/opt/rcs/boost  # Linux
cmake .. && make              # Release build
cmake -DCMAKE_BUILD_TYPE=debug .. && make -j $(nproc)  # Debug build
make VERBOSE=1               # Verbose build output
```

### Testing
- **Java modules**: Use `mvn test` 
- **SYNTHESE**: Robot framework tests available in `synthese/robot/` directory
- **GTFS-books**: Documentation only, no automated tests

## Architecture Overview

### SYNTHESE Server Architecture
- **Modular C++ architecture** with numbered modules (00_framework through 65_public_biking)
- **Core framework** (00_framework): Base classes, CoordinatesSystem, Fields, Object hierarchy
- **Utilities** (01_util): Common utilities, string handling, XML parsing, registry system
- **Database layer** (10_db): Database abstraction, sync policies, query builders
- **Web/CMS** (11_cms): Content management, web pages, scripting engine
- **Security** (12_security): User management, rights, profiles
- **Transport modules** (30_fare, 35_pt, etc.): Public transport modeling, journey planning
- **Data exchange** (61_data_exchange): Import/export functionality including GTFS

### Key SYNTHESE Components
- **Database sync system**: Uses template-based TableSync classes for ORM
- **Rights management**: Hierarchical permission system with profiles
- **Web framework**: Custom CMS with scripting capabilities
- **Graph algorithms**: For route planning and network analysis
- **Real-time integration**: Vehicle tracking and service updates

### OneBusAway VDV Architecture
- **onebusaway-vdv452**: Core VDV-452 parsing library
- **onebusaway-vdv452-to-gtfs-converter**: Conversion logic
- **onebusaway-vdv452-to-gtfs-converter-cli**: Command-line interface

## Development Workflow

### SYNTHESE Development
- Use feature branches, merge to master with tickets
- Follow modular architecture when adding features
- Build system uses CMake with module dependencies
- Python tools available in `synthese/legacy/tools/` for utilities

### Configuration Management
- Modifications should be done in feature branches
- Merge commits should reference tickets
- Commits should not break build or tests
- Regressions will be reverted until fixed

## Key File Locations

- **SYNTHESE main CMakeLists.txt**: `synthese/server/CMakeLists.txt`
- **Module sources**: `synthese/server/src/NN_module_name/`
- **Build documentation**: `synthese/server/BUILD.md`
- **VDV converter**: `onebusaway-vdv-modules/onebusaway-vdv452-to-gtfs-converter-cli/`
- **GTFS documentation**: `GTFS-books/gtfs-book/` and `GTFS-books/gtfs-realtime-book/`

## VDV-452 to GTFS Shapes Conversion Logic

The OneBusAway converter **does not generate shapes.txt**. Here's the proper conversion logic with deduplication:

### Required VDV Tables:
- **REC_SEL (LINK)** - Direct connections between network points
- **REC_SEL_ZP (POINT_ON_LINK)** - Intermediate waypoints with coordinates  
- **REC_ORT (STOP)** - Stop coordinates
- **LID_VERLAUF (ROUTE_SEQUENCE)** - Ordered stops per route

### Conversion Process:
1. **Build route geometries** for each route (LINE_NO + ROUTE_ABBR):
   - Get ordered stop sequence from ROUTE_SEQUENCE
   - Create consecutive stop pairs: (Stop1→Stop2, Stop2→Stop3, etc.)
   - For each stop pair: find LINK → get intermediate points from REC_SEL_ZP → collect coordinates
   - Result: Complete coordinate sequence for each route

2. **Deduplicate shapes**:
   - Create unique identifier for each coordinate sequence (e.g., hash or coordinate string)
   - Group routes with identical geometry
   - Assign unique `shape_id` to each distinct geometry pattern

3. **Generate shapes.txt**:
   - **shape_id**: Sequential unique ID (shape_1, shape_2, etc.) 
   - **shape_pt_sequence**: Sequential numbering (1,2,3...)
   - **shape_dist_traveled**: Cumulative Haversine distance (meters)
   - **Coordinates**: Convert VDV format to decimal degrees

4. **Link to trips**: 
   - Create route-to-shape mapping table
   - Add appropriate shape_id to trips.txt based on route

### Shape Deduplication Benefits:
- **Eliminates redundancy**: Routes sharing physical paths reference same shape
- **Reduces file size**: Typical 60-80% reduction in shapes.txt size
- **Improves performance**: Less duplicate coordinate data to process

This reconstructs actual vehicle paths using VDV network geometry while avoiding duplicate shape data.

## Dependencies

### SYNTHESE
- **Boost** (>= 1.57) - Core C++ libraries
- **CMake** - Build system
- **MySQL client** - Database connectivity
- **Third-party libraries**: zlib, bzip2, expat, geos, proj, spatialite
- **Python** (for tools): flask, requests, BeautifulSoup, argparse

### OneBusAway VDV
- **Java** (executable JAR)
- **Maven** - Build and dependency management