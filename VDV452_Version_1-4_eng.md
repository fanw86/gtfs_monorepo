# OPNV Data Model 5.0

"Interface Initiative"

VDV Standard Interface Network / TimetableIncluding enhancement: definition of connections

Version: 1.4

# Edited by:

Committee for Information Processing

# Verband Deutscher Verkehrsunternehmen (VDV)

# Members of the working group VDV-Datamodel at the time this document was prepared:

Amann Uwe Bad Honnef ELGEBA Geratebau GmbH  Beck Michael Karlsruhe PTV AG  Bruns Winfried Koln VDV  Dux Wilfried Munchen Mentz Datenverarbeitung GmbH  Duisberg Christian Berlin PSI Transcom GmbH  Dury Gerald Neuhausen am Rheinfall Siemens VDO Automotive AG  Elsensohn Peter Rankweil Technische Informationssysteme GmbH  Finker Martin Potsdam MOvEO Software GmbH  Husser Karl- Friedrich Ermatingen DILAX Intelcom AG  Klos Volkmar Mainz Unternehmensberatung fur Verkehr  Koch Oliver Berlin IVU Traffic Technologies AG  Lenzen Karl Horst Mulheim T- Systems GEI GmbH  Lisbach Bettina Karlsruhe init GmbH  Muller Achim Buxtehude STAM  Reich Hans- Joachim Rastatt Lawo Luminator- Europa  Rossol Christian Karlsruhe PTV AG  Spinner Josef Oberkirch COS Gesellschaft fur  Zaugg Marcel Neuhausen am Rheinfall Siemens VDO Automotive AG

# Contents

CHANGES 5

# 1 FOREWORD TO THE VDV DATA MODEL 5.0: 7

1.1 The OPNV Data Model as a Reference Point for Data Modelling in Public Transport 7

1.2 The VDV Interface Initiative OPNV Data Model 7

2 DEFINITIONS 8

3 OBJECTIVES 9

4 DELIMITATION 10

# 5 GENERAL DESCRIPTION 11

5.1 Scope of Data 11

5.2 Data Flow 13

5.3 Interface Files 13

5.4 SQL Access 13

5.5 Data Requirements 14

# 6 SCOPE OF APPLICATION 16

6.1 Export Network / Timetable 16

6.2 Import Network / Timetable 16

6.3 Network / Timetable Data Exchange 16

7 COMPATIBILITY 18

8 COMPATIBLE PRODUCTS 19

8.1 Description of the Products 19

1.6 29

# 8.2 Application Matrix for Relations 31

8.2.1 Data Export Table 32  8.2.2 Data Import Table 34

# 9 INTERFACE DESCRIPTION 36

# 9.1 Data Model Structure 36

9.1.1 Notation System 36

9.1.2 Data Types 36

9.1.3 Value Ranges 37

9.1.4 Times 37

9.1.5 Diagram of the Data Model 38

# 9.2 Relation Overview 40

# 9.3 Calendar Data 42

9.3.1 BASE_VERSION_VALID (BASIS_VER_GUELTIGKEIT) 42

9.3.2 BASE_VERSION (MENGE_BASIS_VERSIONEN) 43

9.3.3 PERIOD (FIRMENKALENDER) 44

9.3.4 DAY_TYPE (MENGE_TAGESART) 44

# 9.4 Location Data 46

9.4.1 POINT_TYPE (MENGE_ONR_TYP) 46

9.4.2 STOP_TYPE (MENGE_ORT_TYP) 47

9.4.3 STOP_POINT (REC_HP) 48

9.4.4 ACTIVATION_POINT (REC_OM) 49

9.4.5 STOP (REC_ORT) 50

# 9.5 Operational Data 52

9.5.1 VEHICLE (FAHRZEUG) 52

9.5.2 TRANSPORT_COMPANY (ZUL_VERKEHRSBETRIEB) 53

9.5.3 OPERATING_DEPARTMENT (MENGE_BEREICH) 54

9.5.4 VEHICLE_TYPE (MENGE_FZG_TYP) 55

9.5.5 ANNOUNCEMENT (REC_ANR) 56

9.5.6 DESTINATION (REC_ZNR) 57

# 9.6 Network Data 58

9.6.1 LINK (REC_SEL) 58

9.6.2 POINT_ON_LINK (REC_SEL_ZP) 59

9.6.3 TIMING_GROUP (MENGE_FGR) 60

9.6.4 WAIT_TIME (ORT_HZTF) 61

9.6.5 TRAVEL_TIME (SEL_FZT_FELD) 62

9.6.6 DEAD_RUN (REC_UEB) 64

# VDV 452

VDV Standard Interface Network / Timetable Contents

9.6.7 DEAD_RUN_TIME (UEB_FZT) 65  9.6.8 JOURNEY_TYPE (MENGE_FAHRTART) 66

9.7 Line Data 67

9.7.1 ROUTE_SEQUENCE (LID_VERLAUF) 67  9.7.2 LINE (REC_LID) 69

9.8 Timetable Data 71

9.8.1 JOURNEY (REC_FRT) 71  9.8.2 JOURNEY_WAIT_TIME (REC_FRT_HZT) 73  9.8.3 BLOCK (REC_UMLAUF) 74

10 INTERFACE DESCRIPTION: CONNECTION DATA FOR AVMS 75

10.1 JOURNEY CONNECTION (EINZELANSCHLUSS) (432) 76

10.2 INTERCHANGE (REC_UMS) (232) 77

11 COMPARISON GERMAN - ENGLISH - TRANSMODEL 80

12 POSSIBLE FUTURE DEVELOPMENTS AND OPTIONS 94

# Changes

Version 1.3 has been enhanced compared to version 1.2 by connection information. In Version 1.4 intermediate points in 'point_type' and coordinates in 'stop' have been introduced to support a graphical representation. DAY_TYPE_NO (TAGESART_NR) changed from 1. .99 to 1. .999 TIMING_GROUP_NO (FGR_NR) changed from 1. .65535 to 1. .999 999 999 LINE_NO (LL_NR) changed from 1. .999 to 1. .9999 ZONE_CELL_NO (ZONE_WABE_NR) changed from 1. .9999 to 1. .99999

The core of this document is unchanged from the first version 1.0 of 1999But some parts have been added to ease the use of the standard:

English names for tables and attributes have been defined and can be used alternatively to the German names. To simplify the use of the VDV- document the numbers that can be used according to VDV- Schrift 451 alternatively to the table names, have been added. A comparison of the data elements with those of CEN standard ,Transmodel" (EN 12896) underlines the accordance of this standard with the European conceptual data model.

# 1 Foreword to the VDV Data Model 5.0:

# 1.1 The OPNV Data Model as a Reference Point for Data Modelling in Public Transport

After the first publication of the VDV recommendation (\*\*) "OPNV Data Model", also known as the "VDV Data Model" outside German territory in 1990, it has become the basis for data modelling in public transport. Perhaps it was due to the great success of the VDV Data Model that the VDV faced increasing demands to also develop practically orientated solutions, extending even beyond the capabilities of the VDV Data Model Ideas included standard interfaces which, thanks to their plug- compatibility, are instantly usable, and which permit standard software modules to communicate with each other at a reasonable cost.

# 1.2 The VDV Interface Initiative OPNV Data Model

That is why in 1998 the VDV decided to establish an initiative entitled "The OPNV Interface Initiative" in order to promote the creation of standardised data interfaces based on the OPNV Data Model. These interfaces basically represent a part of the OPNV model. Therefore, we are not dealing with a new concept, but with a logical application of the OPNV Data Model which was the result of many years of investigation. Provision of a more exact description and an expansion on technical specifications concerning data transfer, as well as functional aspects, means, however, that it is more practice oriented than was the case with the simple OPNV Data Model.

<table><tr><td>*</td><td>ÖPNV: Offentlicher Personennahverkehr – Public Transport.</td></tr><tr><td>**</td><td>VDV: Verband Deutscher Verkehrsunternehmen - Association of German Transport Operators. Schrift(en): recommendation</td></tr></table>

This current edition of the VDV recommendation contains the first interface definition from the initiative. It deals with the "Network and Timetable" area. The definition distinguishes itself from the OPNV Data Model insofar as it has the following characteristics:

In conjunction with SQL access as required in earlier versions of the OPNV Data Model, an alternative file format is defined for offline data transfer (cf. VDV Schrift 451) The minimum scope of the Data Model is clearly outlined The range of values is more restrictively defined for the individual attributes of the user The individual attributes were described in more detail and therefore more precisely

# 2 Definitions

# VDV "Network / Timetable" Standard Interface

An interface definition based on the OPNV Data Model for the transfer of network and timetable data. It consists of a definition of the data model and the two possibilities for gaining access - SQL and OPNV file format.

# VDV Database

Relational database based on the OPNV Data Model. The section used focuses on the data model for the VDV standard interfaces. The VDV database can form part of a product- specific database. Data can be transferred into and out of the VDV database using SQL or OPNV file format.

# OPNV File Format

Qualified ASCII data format for the offline data transfer of specified OPNV Data Model data.

# VDV Standard Interfaces Compatibility

A software system is regarded as being compatible when it is capable of exporting data into the VDV database or importing data from it. It does not matter whether this occurs using files in OPNV file format or via direct SQL access to the VDV database. In both cases, the functions and consistency tests as described in section 2.4 must be adhered to. Should there be any discrepancies between the contents of this recommendation and the "OPNV Data Model" issue (especially as regards attribute value range), this one is taken as being a continuation. Therefore, the information in this document is decisive.

# Planning Programme

Software for vehicle and crew scheduling in Public Transport.

# 3 Objectives

In the field of transport, various manufacturers' software modules are used. Data exchange between these software modules is frequently necessary. Various departments within the transport industry and also the general public need up- to- date timetable data which is drawn up by traffic planning. For example, it is needed for:

Transit operations' supervision and control with an AVMS Statistics Counting of passengers Counting of handicapped people Crew scheduling and personnel arrangements Dynamic passenger information Timetable information

Establishing such information flows is a very expensive procedure, especially when specific interfaces have to be written in each individual case.

The standardisation of interfaces for the exchange of data between Public Transport software systems as part of the "OPNV Data Model Interface Initiative" therefore pursues the following aims:

General minimisation of individual interfaces Avoidance of repeated updating Clear documentation on the standard interfaces Interfaces which function independently of the systems involved Use of the same interface for each transport company (standard product) Transparency of data for all systems Important numerical or alphanumerical data fields (key attributes) are identically allocated in both systems

# 4Delimitation

4 DelimitationThe interface description "VDV Standard Interface Network / Timetable" is exclusively concerned with data describing networks and timetables. It therefore represents a section of the ÖPNV Data Model V.4.1.

The ÖPNV Data Model 5.0 concentrates exclusively on the data structures of interfaces between software modules in Public Transport. The individual, internal system data structures do not form part of this specification. In many cases it will still make sense to compare the own product data model with the ÖPNV Data Model.

# 5 General Description

The aim of the "VDV Standard Interface Network / Timetable" is to transfer network definitions and timetables from a source system into a target system. As a general rule, the timetable data from a (vehicle and crew) scheduling programme is passed on to consumer systems for the purpose of transit operations' supervision and control (AVMS'), cost control and / or publication.

When transferring data from a planning system into an AVMS, the data in the AVMS can be supplemented by the user with AVMS- specific data. This will be referred to as "AVMS- specific data".

Examples of data which are updated in the AVMS and which are not mapped in the VDV Standard Interface "Network / Timetable":

Traffic light influencing parameters Radio parameterising for the AVMS Data for dynamic passenger information

When transferring new data from the VDV Standard Interface "Network / Timetable", the AVMS- specific data already present in the AVMS database must be taken into account.

# 5.1 Scope of Data

The VDV Standard Interface "Network / Timetable" comprises the following data:

Calendar data (day types and their validity in the company calendar) Operational data (vehicle stock, vehicle types, announcement texts and destination texts) Location data (bus stops, stopping points, beacons, depots) Network data (route sections, distances, running time groups, running times, stopping times) Line data (lines and courses for different routes) Timetable data (runs and run- dependent stopping times, blocks) In Version 1.3 (chapter 10) connection information has been included in the interface, which facilitate the transfer of connection definitions together with their validity for example from a journey planning system to an avms, thus laying the basis for the protection of and information about connections.

![](https://cdn-mineru.openxlab.org.cn/result/2025-08-24/079b878b-92e7-46ba-bc75-cbe2811240eb/3e293523e10652ed86df8e05098259afe1723d37e9a5f4167d503a58d4a2f4cc.jpg)

# 5.2 Data Flow

![](https://cdn-mineru.openxlab.org.cn/result/2025-08-24/079b878b-92e7-46ba-bc75-cbe2811240eb/2836da613a39157cfe3e2b50c47fd3cc0654511ec81677a94d142293c9ad552a.jpg)

# 5.3 Interface Files

Data exchange using interface files becomes necessary under the following circumstances:

- Data is imported or exported from an external system. The data may possibly be reused on another hardware platform.

- Data must be post processed, inspected or evaluated using standard market software:

- e.g. a database should be inspected or modified using a text editor- e.g. a database should be read in or out (possibly with the aid of additional macros) using a table calculation programme

# 5.4 SQL Access

5.4 SQL AccessAccess to VDV Standard Interface "Network / Timetable" data should also be possible via an SQL interface which enables direct (interactive) access to the VDV database. This means that data in the VDV Database can be modified, deleted or selectively read out.

# 5.5 Data Requirements

# Formal Conditions

The data structure (tables, attributes, value ranges) corresponds to the description published in this recommendation. Data transfer takes place via OPNV interface files or via SQL access The integrity of the references for the network and timetable data must be guaranteed by the exporting system. The consistency and completeness of the database must be checked by the system which is exporting the data.

# Logical and content-related conditions

A prerequisite for successful implementation of the interface is that the logical and content- related relationships of the network and timetable data have been correctly mapped. In this respect it is important that

the departure times for successive runs, as based on the line definition, can be adhered to the data elements are clearly identifiable (e.g. unambiguous bus stop abbreviations, line numbers, route numbers per line, track numbers per line, block numbers) blocks have unbroken coverage, beginning with exit from the depot as far as return to the depot

The logical and content- related conditions are already guaranteed by the data supplier when the data is exported.

Individual conditions will be dealt with in the specifications (further below)

Apart from the conditions described in this recommendation issue, company conditions must also be met if export of data for an AVMS is planned.

# Example: Data transfer from the Interplan transport planning system to VICOS-LIO-DATA in order to update AVMS's VICOS-LIO.

Some planning systems only record those runs which are operated by a transport company on a productive level (e.g. for the production of timetable information). In order to achieve an exact model of operational activity and successfully update all the AVMS components, all runs should in fact be recorded in the planning system. If a transport company makes use of trams, then at the termini of these lines the vehicles will encounter turning points. If the data for the turning points (e.g. distances and stopping points) is not passed on by Interplan to the VICOS- LIO- DATA via the "VDV- Import- Interface", then this route section data is missing for the AVMS components and must be collected manually in VICOS- LIO- DATA at a later stage. That leads to considerably increased updating expenditure in VICOS- LIO- DATA, which can be avoided by constant complete updating of the route and timetable data in Interplan. The "VDV- Import- Interface"

only accepts the data made available to it and converts it for the VICOS- LIO- DATA. It does not make any changes on route or timetable level.- The distances between the bus stops must be measured exactly and recorded (to the exact metre) in the Interplan planning system, since these distances, in addition to the beacons, form the basis for the logical navigation of the AVMS.- The journey times between the bus stops and the stopping times should also be recorded as exactly as possible (in seconds), as the timetable theoretical versus actual comparison depends on these values. If the times are recorded to the nearest minute, then the timetable comparison cannot deliver exact results either at the control centre or on the on- board vehicle computer.- The quality of the distances and times measured in the planning system has a direct effect on the operation of the AVMS. That is because this data forms the basis for the navigation, dynamic passenger information, ensuring connections, statistics etc.

# 6 Scope of Application

# 6.1 Export Network/ Timetable

The specification enables a data supplier to convert product- specific network and timetable data into a standardised format. An application for data export could be considered for:

Scheduling programmes (e.g. to update an AVMS system) or An AVMS system e.g. to update a company database

# 6.2 Import Network/ Timetable

The specification enables the data consumer to convert standardised network and timetable data into product- specific data. An application for data import could be considered for:

AVMS system (from vehicle and crew scheduling programmes) Timetable information Ticket printers Counting passengers Company traffic database

# 6.3 Network/ Timetable Data Exchange

A data transfer system based on the VDV Standard Interface Network / Timetable is notable for its controlled redundant database organisation. Thais means that the network and timetable data is only recorded and updated in a source system (e.g. in the scheduling programme) and is transferred to the data consumer (e.g. AVMS) for further processing. The database in the target system therefore corresponds to a mapping of the data in the source system. The data consumers have their own database in their product- specific databases.

The data consumers (target systems) generally require further internal data for their operation to be productive. It cannot always be supplied by the source system (e.g. with an AVMS, the beacons and their position on the route) and must therefore be completed in the target system.

# Data adjustment in the consumer system through data import

If new data is imported from the source system during a data transfer, then this new data must be compared with the data in the target system by the import programme. This process can be performed by a so- called Update Function, which, when importing the data, re- uses the target system specific data as much as possible. The comparison between the source system interface data and the data which is already present in the target system must be undertaken in a logical sequence. The data must first be read, then compared or completed and only then imported by the target system.

For example, beacons are provided along the route of an AVMS system. A new data transfer using an identical route and different run and stopping times should not affect these beacon positions.

# Data Comparison in the Source System by Updating

When transferring data from a source system into the target system via interface files or SQL access, existing data is replaced by the new data. If, as an exception, the changes to the data are made in the target system directly, then you have to make sure, prior to the next data exchange, that the corresponding changes were also made in the source system. If no such updating occurs in the source system, then the changes to data in the consumer system will be overwritten when the next data exchange takes place.

# 7 Compatibility

Application software interfaces may be compatible with the interface described here. The following conditions must be met:

The interface must use exactly the same data model as described in this publication. The data must be stored in OPNv file format and / or in a relational database. The interface must be available to transport companies as a product of the provider. It must be able to be used independently of customers. It must be accompanied by a performance manual and operating instructions so that information is available on the interface's performance range and functionality and on the extent to which the requirements as covered in this article are met.

Compatibility only applies to the published version of the interface programme. Any changes to the interface programme means it is necessary to carry out a new examination. On the request of the software provider, the test is carried out by the VDV. The VDV publishes compatibility results for a given interface in this recommendation, among others.

Depending on the eventual use, various types of compatibility with the interface description are possible:

An Export Compatibility exists if the software's own database can provide network and timetable data for another application. A certain minimum scope is required. The corresponding tables and attributes are identified in the article by "AVMS".

An Import Compatibility can exist if a piece of software (target system) imports network and timetable data from another system and can map the contents properly in its own database. If data is going to be used in an AVMS, a minimum scope is required. (The corresponding tables and attributes are identified in the article by "AVMS".) An interface which is capable of doing this is designated as import compatible for AVMS.

Full compatibility comprises export compatibility and import compatibility for AVMS, i.e. data exchange in both directions.

# Scope of the implemented interface

The specification to hand describes the minimum scope of an interface. Depending on operational circumstances and the systems involved, it can be necessary to implement a more comprehensive interface. Suggestions for the standard interface to expand to include further tables are welcome. The VDV will examine these and publish them in a subsequent issue of the recommendation.

# 8 Compatible Products

8 Compatible ProductsProducts (interfaces) will now be listed and described which are compatible with the VDV Standard Interface Network / Timetable. In some cases a compatible version of the interfaces is still nowhere in operation but has nevertheless been planned (depending on orders). Corresponding annotations have been made.The use of these products is recommended by the VDV, since, by using them as a basis, the information flow between software applications in Public Transport is facilitated. This recommendation only refers to the capability of the software in question to export or import data via the VDV Standard Interface. No statement can be made here regarding the general quality of the software and especially regarding its ability to fulfil company requirements.

In order to achieve compatibility status, the software manufacturer had to: provide the VDV with a performance description of the interface including data model, product name and version and prove that the interface performed according to the description.

Details regarding locations for installation are pending further information from the software providers.

# 8.1 Description of the Products

<table><tr><td>Interface name</td><td>LIQ2FGZ</td><td>Interface version</td><td>05/2001</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">Unternehmensberatung für Verkehr und Technik GmbH (UVT)</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Josefsstr. 54-56, 55118 Mainz</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">FADA@/AFZ programme system for evaluating automatic passenger counts</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Imports data in Lucerne from LIO Adapter</td></tr><tr><td>Also installed in</td><td colspan="3">Base (BVB)</td></tr></table>

<table><tr><td>Interface name</td><td>FadaPlus
VDV-Schnittstelle</td><td>Interface version</td><td>12/2007</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">UVT Unternehmensberatung für Verkehr und Technik GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Josefssar, 54-56, D-55118 Mainz</td></tr><tr><td>Compatibility type</td><td colspan="3">Export- Compatibility      X
Import- Compatibility      X
Import- Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">Programmsystem FADA®/FadaPlus zur Auswertung automatischer Fahrgastzählungen sowie Fahr- und Verlustzeitmessungen</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Zürich (VBZ) zum Import von Liniennetz- und Fahrplandaten</td></tr><tr><td>Also installed in</td><td colspan="3">Bern, Luzern, Mainz, Baden-Baden, Krefeld, Basel...</td></tr></table>

<table><tr><td>Interface name</td><td>FIMSExport</td><td>Interface version</td><td>1.2</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">HanseCom GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Wedestr. 120 b, 11083 Hamburg</td></tr><tr><td>Compatibility type</td><td colspan="3">Export- Compatibility  ☑
Import- Compatibility
Import- Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">ILONA</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3">Hamburger Hochbahn</td></tr></table>

<table><tr><td>Interface name</td><td>DIVA Import</td><td>Interface version</td><td>1.50</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">MDV GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Grillparzerstr. 18, 81675 München</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility  ☑
Import Compatibility  ☑
Import Compatibility for AVMS  ☑ depending on supplier</td></tr><tr><td>ÖPNV Standard</td><td colspan="3">DIVA / EFA</td></tr></table>

<table><tr><td>Interface for (software)</td><td></td></tr><tr><td>Certified with (transport company)</td><td>Data exchange with LIO Adapter in Frankfurt (RMV)</td></tr><tr><td>Also installed in</td><td>Darmstadt, VRR, NVBW</td></tr></table>

# Diva Import performance characteristics

The Diva Import programme converts data from the planning systems of other manufacturers into DIVA format.

In the case of external systems, whose export data are based on the VDV format, DIVA Import accesses the external data via the MDV- VDV class library. The external data can therefore appear as text file- style exported database tables, or databases can be accessed directly via ODBC drivers. The MDV- VDV class library fulfils the role here of an intermediate layer, which offsets the differences of the actually existing VDV formats, i.e. some VDV- like data formats can also be imported.

Examples for import via the VDV class library:

LIO Adapter (IFES)  HASTUS VDV Export (Vienna Line)  TITAN database  VTDB database (Hamm) and other data suppliers who can produce the MDV- VDV text format.

All the necessary parameters for the transfer process are stored in special import setting files. This means that the programme can not only be started manually, but can also act as a "demon" or "service", carrying out transfers in periodic intervals or event- driven.

The transfers always function in an additive fashion, i.e. data which does not come from the external system remains in the DIVA timetables.

The DIVA Import programme does not only serve the purpose of converting data but also updates necessary code conversion tables.

Transfer protocols can be shown on the screen, printed and stored in files.

<table><tr><td>Interface name</td><td>DIVA2VDV</td><td>Interface version</td><td>1.0</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">MDV GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Grillparzerstr. 18, 81675 München</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility  ☑
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">DIVA</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3">ZVV Zürich</td></tr></table>

<table><tr><td>Interface name</td><td></td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">INIT GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Käppeleistr. 6, 76131 Karlsruhe</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility  ☑
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">MFS90 vehicle and crew scheduling</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Neuss, data exchange with VICOS-LIO</td></tr><tr><td>Also installed in</td><td colspan="3"></td></tr></table>

<table><tr><td>Interface name</td><td>MOBILE VDV Interface</td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">INIT GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Käppeleistr. 6, 76131 Karlsruhe</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">“Mobile” Automatic Vehicle Management System (AVMS)</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Frankfurt (Stadtwerke), data exchange with VICOS-LIO (since 1997)</td></tr></table>

<table><tr><td>Also installed in</td><td></td></tr><tr><td>Note</td><td>An interface with complete “Import Compatibility for AVMS” can be delivered on the basis of MOBILE’s compatibility with the ÖPNV Data Model Version 4.0.</td></tr></table>

<table><tr><td>Interface name</td><td>FIMSExport</td><td>Interface version</td><td>1.20</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">HanseCom GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Wedestr. 120 b, 11083 Hamburg</td></tr><tr><td>Compatibility type</td><td colspan="3">Export- Compatibility      X
Import- Compatibility
Import- Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">ILONA</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3">Hamburger Hochbahn AG</td></tr></table>

<table><tr><td>Interface name</td><td>BON/AFAB trans4xx</td><td>Interface version</td><td>4.1</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">IVU Traffic Technologies AG</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Bundesallee 88, D-12161 Berlin</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility          ✘
Import Compatibility          ✘
Import Compatibility for AVL   ✘</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">BON® – Computer-Aided Dispatching and Automatic Vehicle Location (CAD/AVL) system
AFAB® – Ticketing system
i.box – on-board computer family</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3">Lübeck (SL), Essen (EVAG), Bielefeld (BVO), Kassel (RKH), Münster (SWMS), Pforzheim (SWP), Hannover (RegioBus), Mantova/IT (APAM), Posen/PL (MPK)</td></tr></table>

The Trans4.xx-Interface family of IVU Traffic Technologies AG allow the import and export of data from or to other systems on basic of the VDV-Standard-Interface.

Additional to the VDV- Standard- Interface supports the IVU interface the following data packages:

traffic light data connection data duty planning data ticketing data

The data exchange is made by SQL data access, CSV- or XML data files. The data management module works with a graphical user interface on Windows- NT/2000/XP systems.

The import module has an integrated consistency check and it is possible to edit and complete the imported data without data loss by any re- import.

The Trans4. xx- Interface is the connection to the complete products BON and AFAB, as well as the IVU on- board computer i- box family.

<table><tr><td>Interface name</td><td>VDV-Import
VDV-Export</td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">VDO Automotiv AG</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Industrieplatz 3, CH-8212 Neuhausen am Rheinfall</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility          ✘
Import Compatibility          ✘
Import Compatibility for AVMS          ✘</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">VICOS-LIO</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Neuss (Stadtwerke)</td></tr><tr><td>Also installed in</td><td colspan="3">Hamburg HHA, Frankfurt VFG, Leipzig LVB, Köln KVB
Hong Kong KCRC, Athen OASA, Genf TPG,
Newcastle GoNorthEast/Arriva, Dublin BusEireann, Essex
Council, Brighton and Hove
VDV-Import is used by 50, VDV-Export by 40 companies.</td></tr></table>

The program "VICOS- LIO- Data" is the central data management system for the control centre, vehicle, passenger information, statistics and passenger counting. VICOS- LIO- Data currently supports two data exchange interfaces:

* The VDV Import/export interface, the standard for transferring the line network and timetable * A direct database connection to the planning system DIVA from Mentz Datenverarbeitung.

The line network and timetable data is currently linked to 11 different planning systems using the VDV- Import mechanis. During the importation the data is checked for consistency, plausibility and completeness. Once the importation is complete, if necessary, additional control system specific information can be added. Future importations from the planning system, VICOS LIO Data will retain this additional information. Changes to the data supply as a result of the import, are recorded in a log.

The data within VICOS LIO Data can be exported for processing by other data users, for example timetable reporting systems.

Via the functions "VDV- Import" and "VDV- Export", the VICOS LIO control system is fully compatible with the VDV Standard interface to the OPNV- Data model 5.0.

<table><tr><td>Interface name</td><td>Microbus / LIO</td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">IVU Traffic Technologies AG</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Bundesallee 88, 12161 Berlin</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>OPNV Standard Interface for (software)</td><td colspan="3">Microbus 2.0</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Zwickau</td></tr><tr><td>Also installed in</td><td colspan="3">Leverkusen (KWS), Retlingen (RSV), Gera (GVB), Plauen (PSB), Köln (KVB), Braunschweig (BSVAG), Kiel (KVAG), Brandenburg (VBBR), Belzing (VBBB), Teltow-Fläming (VTF)</td></tr><tr><td>Special version for &#x27;Mobile&#x27;</td><td colspan="3">Schwerin (NVS), Hof (Hofbus), Leverkusen (KWS), Herne (HCR)</td></tr><tr><td>Special version for &#x27;ATRON&#x27;</td><td colspan="3">Keiswerke Heinsberg (KWH), Hameln (KVG)</td></tr><tr><td>Special version for &#x27;BON&#x27;</td><td colspan="3">Jena (JNV), Cottbus (CVC), Perleberg-Pritzwalk (VGP), Posen, Mantova, Kassel (RKH), Essen (EVAG), Mülheim (BTMH), Bad Kreuznach, Aachen (ASEAG)</td></tr></table>

The interface MICROBUS,LIO by IVU Traffic Technologies AG exports all AVL related data from the MICROBUS 2 scheduling system to the TTS's LIO system according to the VDV data model.

There is the possibility of exporting only parts of the data pool. The data will be checked for consistency and completeness during the export and an error log file will be written. The export data will be generated in ASCII format.

<table><tr><td>Interface name</td><td>interplan
VLD-Schnittstelle</td><td>Interface version</td><td>1.0</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">initplan GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Stumpfstr. 1, 76131 Karlsruhe</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility
×
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">PTV Interplan</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Niederheinische Versorgung und Verkehr AG (NVV) München-Gladbach</td></tr><tr><td>Also installed in</td><td colspan="3"></td></tr><tr><td>Remark</td><td colspan="3">Special – enhanced version will be used for VAG Nuernberg for the driver-less undergrunf</td></tr></table>

ptv interplan is the advanced public transport timetable planning system developed by PTV AG. ptv interplan effectively supports your operational planning during all phases. As an efficient, interactive system, ptv interplan fulfils all needs, in particular those of urban public transport companies, based on a modern operation planning approach. Together with ptv interplan/select, which provides powerful computerised support for the drivers duty selection process and the timekeeping function, ptv interplan covers the full range of scheduling, dispatching and administration.

The use of efficient timetable optimisation procedures and automatic planning functions, together with easy planning options, make ptv interplan one of the most comprehensive fleet operations planning systems ever. However, you don't have to make any changes in your current planning processes. ptv interplan fits itself to the requirements of your operation.

<table><tr><td>Interface name</td><td>VISUM VDV-Schnittstelle</td><td>Interface version</td><td>1.0</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">PTV AG</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Stumpfstraße 1, 76131 Karlsruhe</td></tr><tr><td rowspan="3">Compatibility type</td><td>Export-Kompatibilität</td><td>X</td><td></td></tr><tr><td>Import-Kompatibilität</td><td>X</td><td></td></tr><tr><td colspan="3">Import-Kompatibilität für RBL</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">VISUM</td></tr><tr><td>installed in</td><td colspan="3"></td></tr></table>

<table><tr><td>Interface name</td><td>VDV Interface</td><td>Interface version</td><td>5.0</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">DILAX (International) AG</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Fidlerstr. 2, CH 8272 Ermatingen</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">DAVIS 97</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Data exchange with LIO Adapter in Zürich</td></tr><tr><td>Also installed in</td><td colspan="3">Regensburg, Hannover (ÜSTRA), Darmstadt (HEAG), Schaffhausen (VBSH), Genf (TPG)</td></tr></table>

<table><tr><td>Interface name</td><td>UNI Interface</td><td>Interface version</td><td>2.0</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">DILAX (International) AG</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Fidlerstr. 2
CH 8272 Ermatingen</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility
Import Compatibility
Import Compatibility for AVMS</td></tr><tr><td>ÖPNV Standard Interface for (software)</td><td colspan="3">DAVIS 2000</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3"></td></tr></table>

<table><tr><td>Interface name</td><td>PERDIS®
- 
PlanDataImport</td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">Idsysteme</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Am Stadtrand 56, 22047 Hamburg</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility   □
Import Compatibility    □
Import Compatibility for AVMS</td></tr><tr><td>OPNV Standard Interface for (software)</td><td colspan="3">PERDIS - Personaldisposition
DepotManager - Fahrzeugdisposition</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3">SSB Stuttgart, FVAG Freiburg (DIVA); Hertener SB, MVB Magdeburg, SW Remscheid (epon), in all 25 companies</td></tr></table>

<table><tr><td>Interface name</td><td>BMS</td><td>Interface version</td><td>1.0, 12/2000</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">PSI Transportation GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Dircksenstr. 42-44, D-10178 Berlin</td></tr><tr><td rowspan="3">Compatibility type</td><td>Export Compatibility</td><td colspan="2">□</td></tr><tr><td>Import Compatibility</td><td colspan="2">□</td></tr><tr><td>Import Compatibility for AVMS</td><td colspan="2">□</td></tr><tr><td>OPNV Standard Interface for (software)</td><td colspan="3">PSI Traffic/BMS</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Import von VICOS- LIO-DATA und REDI2 in Rostock (RSAG)</td></tr><tr><td>Also installed in</td><td colspan="3">-</td></tr></table>

<table><tr><td>Interface name</td><td>PSItraffic/RBL</td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">PSI Transportation GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Dircksenstr. 42-44, D-10178 Berlin</td></tr><tr><td>Compatibility type</td><td>Export- Compatibility
Import Compatibility
Import- Compatibility for AVMS</td><td colspan="2">□
□
□</td></tr><tr><td>OPNV Standard Interface for (software)</td><td colspan="3">PSItraffic/RBL</td></tr></table>

<table><tr><td>Certified with (transport company)</td><td>VHH/PVG Hamburg, BVN Nordhausen, Süd-Thüringen Bahn, GVB Amsterdam, PVG Schwedt/Angermünde, Barnimer Busgesellschaft Eberswalde, Uckermärkische Verkehrsgesellschaft Templin, Oberhavel Verkehrsgesellschaft</td></tr><tr><td>Also installed in</td><td></td></tr></table>

<table><tr><td>Interface name</td><td>ATRIS-Import</td><td>Interface version</td><td></td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">ATRON electronic GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Am Ziegelstadel 12 + 14, 85570 Markt Schwaben</td></tr><tr><td>Compatibility type</td><td colspan="3">Export Compatibility  ☐
Import Compatibility  ☑
Import Compatibility for AVMS  ☑</td></tr><tr><td>OPNV Standard Interface for (software)</td><td colspan="3">Software ATRIS</td></tr><tr><td>Certified with (transport company)</td><td colspan="3">Kraftverkehrsgesellschaft (KVG) Kiel</td></tr><tr><td>Also installed in</td><td colspan="3"></td></tr></table>

<table><tr><td>Interface name</td><td>epon – VDV-Schnittstelle</td><td>Interface version</td><td>19.2</td></tr><tr><td>Manufacturer&#x27;s name</td><td colspan="3">ISIDATA GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Lister Meile 23, 30161 Hannover</td></tr><tr><td>Compatibility type</td><td colspan="3">Export- Compatibility 
X
Import- Compatibility
Import- Compatibility for AVMS</td></tr><tr><td>OPNV Standard Interface for (software)</td><td colspan="3">epon – Einsatzplanung für den öffentlichen Nahverkehr</td></tr><tr><td>Certified with (transport company)</td><td colspan="3"></td></tr><tr><td>Also installed in</td><td colspan="3">AVG, Augsburg, BSAG Bremen, DVB Dresden, EVAG Erfurt, LVB Leipzig, MVG Mainz, SWK Krefeld, VMR Herford, ZVB Zug</td></tr></table>

<table><tr><td>Interface name</td><td>CP RBL-Import</td><td>Interface version</td><td>1.6</td></tr><tr><td>CSC Deutschland Solutions GmbH</td><td colspan="3">CSC Deutschland Solutions GmbH</td></tr><tr><td>Manufacturer&#x27;s address</td><td colspan="3">Bergstraße 2, 01069 Dresden</td></tr></table>

<table><tr><td>Compatibility type</td><td>Export- Compatibility
Import- Compatibility      X
Import- Compatibility for RBL   X</td></tr><tr><td>OPNV Standard Interface for (software)</td><td>CP RBL</td></tr><tr><td>Certified with (transport company)</td><td></td></tr><tr><td>Also installed in</td><td>Dresdner Verkehrsbetriebe AG (DVB)</td></tr><tr><td></td><td>The import interfaces use an ascii format, but on request, an interface fully compliant with VDV452 will be installed.</td></tr></table>

# 8.2 Application Matrix for Relations

A prerequisite for coupling two products is, in addition to being compatible with the interface description as published in this recommendation issue, that the source system is capable of delivering the relations which are required by the target system.

When data exchange takes place, basically all the tables contained in the Network / Timetable VDV Standard Interface are transferred. Depending on what products are involved, it is however possible that some tables will be transferred empty.

The following table shows the relations which are supported by the various products.

For good coupling possibilities to exist, it is generally very important to have the largest possible number of supported relations (x).

In an actual coupling, it is desirable that all relations which can be imported by the receive system are then also delivered by the exporting system. Manual updating is also possible. Under no circumstances should the tables be interpreted as meaning that only those products can be coupled which have the same relations crossed (x)!

# 8.2.1 Data Export Table

<table><tr><td>Products:</td><td>Table number</td><td>neede d for AVMS</td><td>lONA (Hanse com)</td><td>GIRO inc</td><td>HOTII (Hans ecom)</td><td>VDV-Export (VDO Automo tiv AG)</td><td>MFS-90 (INIT)</td><td>Micro bus 2.0 (TVU) !</td><td>BON (IVU)</td><td>DIVA (MDV)</td><td>Fada Plus (UVT)</td><td>EPON (ISI DATA)</td><td>VISU M (PTV)</td></tr><tr><td>Calendar Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>BASE_VERSION_VALID_993</td><td></td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>BASE_VERSION</td><td>485</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>PERIOD</td><td>348</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>DAY_TYPE</td><td>290</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>Location Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>POINT_TYPE</td><td>998</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>STOP_TYPE</td><td>997</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>STOP_POINT</td><td>229</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>ACTIVATION_POINT</td><td>295</td><td></td><td>(x)</td><td>x</td><td>(x)</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>STOP</td><td>253</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr></table>

<table><tr><td>Products:</td><td>Table number</td><td>neede d for AVMS</td><td>lONA (Hanse com)</td><td>GIRO inc</td><td>HOTII (Hans ecom)</td><td>VDV- Export (VDO Automo tiv AG)</td><td>MFS-90 (INIT)</td><td>Micro bus 2.0 (VU)</td><td>BON (IVU)</td><td>DIVA (MDV)</td><td>Fada Plus (UVT)</td><td>EPON (ISI DATA)</td><td>VISU M (PTV)</td></tr><tr><td>Operational Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>VEHICLE</td><td>443</td><td></td><td>(x)</td><td></td><td>(x)</td><td>x</td><td></td><td>x</td><td>x</td><td></td><td></td><td>x</td><td></td></tr><tr><td>TRANSPORT_COMPANY992</td><td></td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td></td><td></td><td>x</td><td>x</td></tr><tr><td>OPERATING_DEPARTMEN 333</td><td></td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>T</td><td></td><td></td><td>x</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>VEHICLE_TYPE</td><td>293</td><td></td><td>x</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>ANNOUNCEMENT</td><td>996</td><td></td><td>(x)</td><td></td><td>(x)</td><td>x</td><td>x</td><td>x</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>DESTINATION</td><td>994</td><td></td><td>(x)</td><td></td><td>(x)</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>Network Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>LINK</td><td>299</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>POINT_ON_LINK</td><td>995</td><td></td><td>(x)</td><td></td><td>(x)</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>TIMING_GROUP</td><td>222</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>WAIT_TIME</td><td>999</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>TRAVEL_TIME</td><td>282</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>DEAD_RUN</td><td>225</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>DEAD_RUN_TIME</td><td>247</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>JOURNEY_TYPE</td><td>332</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>Line Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ROUTE_SEQUENCE</td><td>246</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>LINE</td><td>226</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>Timetable Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>JOURNEY</td><td>715</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>JOURNEY_WAIT_TIME</td><td>308</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>BLOCK</td><td>310</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td></tr><tr><td>Connection Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>JOURNEY_CONNECTION</td><td>432</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>x</td><td></td></tr><tr><td>INTERCHANGE</td><td>232</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>x</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table>

# 8.2.2 Data Import Table

<table><tr><td>Products</td><td>Table number</td><td>ree ced for AV MS</td><td>Inter- plan (PTV)</td><td>VISU M (PTV)</td><td>BMS (PSI)</td><td>BON/ AFAB (IVU)</td><td>Mobil e (INIT)</td><td>traffic/RBL (PSI)</td><td>DIVA (MDV)</td><td>CP RBL- Import (GSC)</td><td>FADA Fada Plus LIO2F GZ (UVT)</td><td>VDV- Import (VDO Auto motiv AG)</td><td>Davis9 7 / DAVIS 2000 (DILAX Inter-national)</td><td>Perdi S (id- sys- teme)</td><td>ATRI S (Atron)</td></tr><tr><td>Calendar Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>BASE_VERSION_VALID 993</td><td>→</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>(x)</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>BASE_VERSION</td><td>485</td><td>→</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>(x)</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>PERIOD</td><td>348</td><td>→</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>(x)</td><td></td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>DAY_TYPE</td><td>290</td><td>→</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>Location Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>POINT_TYPE</td><td>998</td><td>→</td><td>(x)</td><td>(x)</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>STOP_TYPE</td><td>997</td><td>→</td><td>(x)</td><td>(x)</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>STOP_POINT</td><td>229</td><td>→</td><td>x</td><td>x</td><td></td><td>x</td><td>x</td><td>(x)</td><td>x</td><td>x</td><td></td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>ACTIVATION_POINT</td><td>295</td><td>→</td><td>x</td><td>x</td><td></td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr><tr><td>STOP</td><td>253</td><td>→</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td>x</td><td></td><td></td></tr></table>

<table><tr><td>Products</td><td>Table number</td><td>one code for AV MS</td><td>Inter-plan (PTV)</td><td>VISU M (PTV)</td><td>BMS (PSI)</td><td>BON/ AFAB (IVU)</td><td>Mobil e (INIT)</td><td>traffic RBL (PSI)</td><td>DIVA (MDV)</td><td>CP RBL- Import (CSC)</td><td>FADA Fada Plus LIO2F GZ (UVT)</td><td>VDV- Impor t (VDO Auto motiv AG)</td><td>Davis9 7 / DAVIS 2000 (DILAX Inter-national )</td><td>Perdi s (id- sys- teme)</td><td>ATRI S (Atron )</td></tr><tr><td>Operational Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>VEHICLE</td><td>443</td><td></td><td></td><td></td><td>X</td><td>X</td><td>X</td><td>(x)</td><td>(x)</td><td></td><td></td><td></td><td>X</td><td></td><td></td></tr><tr><td>TRANSPORT COMPAN 992</td><td></td><td></td><td></td><td></td><td></td><td>X</td><td></td><td>(x)</td><td>(x)</td><td></td><td></td><td></td><td>X</td><td></td><td></td></tr><tr><td>Y</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>OPERATING DEPARTME</td><td>333</td><td>✘</td><td></td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>NT</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>VEHICLE_TYPE</td><td>293</td><td>✘</td><td></td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>ANNOUNCEMENT</td><td>996</td><td></td><td></td><td></td><td></td><td></td><td></td><td>(x)</td><td>X</td><td></td><td></td><td></td><td>X</td><td></td><td></td></tr><tr><td>DESTINATION</td><td>994</td><td></td><td></td><td></td><td></td><td>X</td><td></td><td>(x)</td><td>X</td><td></td><td></td><td></td><td>X</td><td></td><td></td></tr><tr><td>Network Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>LINK</td><td>299</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>POINT_ON_LINK</td><td>995</td><td></td><td></td><td>X</td><td></td><td>X</td><td>X</td><td>(x)</td><td>X</td><td>X</td><td></td><td></td><td>X</td><td></td><td></td></tr><tr><td>TIMING_GROUP</td><td>222</td><td>✘</td><td>X</td><td>X</td><td></td><td>X</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>WAIT_TIME</td><td>999</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td></td><td>(x)</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>TRAVEL_TIME</td><td>282</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>DEAD_RUN</td><td>225</td><td>✘</td><td>X</td><td>X</td><td></td><td>X</td><td>X</td><td>(x)</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>DEAD_RUN_TIME</td><td>247</td><td>✘</td><td>X</td><td>X</td><td></td><td>X</td><td></td><td>(x)</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>JOURNEY_TYPE</td><td>332</td><td>✘</td><td>X</td><td></td><td></td><td>X</td><td></td><td>(x)</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>Line Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ROUTE_SEQUENCE</td><td>246</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>LINE</td><td>226</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>Timetable Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>JOURNEY</td><td>715</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>JOURNEY_WAIT_TIME</td><td>308</td><td></td><td></td><td></td><td>X</td><td>X</td><td></td><td>(x)</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>BLOCK</td><td>310</td><td>✘</td><td>X</td><td>X</td><td>X</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>Connection Data</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>JOURNEY_CONNECTION</td><td>432</td><td></td><td></td><td></td><td></td><td></td><td></td><td>(x)</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>INTERCHANGE</td><td>232</td><td></td><td></td><td></td><td></td><td></td><td></td><td>(x)</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table>

$(x) = 1s$  not updated in the exporting product, but, for consistency, is made available for use.

# 9 Interface Description

# 9.1 Data Model Structure

The data descriptions are divided into 6 groups, based on content:

Calendar Data Location Data Operational Data Network Data Line Data Timetable Data

Each area is introduced by a short explanation about its basic concept.

The meaning of the relations, as well as their attributes, is explained using short descriptions. Data types and key properties for the attributes are listed in table form.

# 9.1.1 Notation System

Relations which are necessary for transferring network definitions and timetable data into an AVMS system, are indicated in the "needed" column with the letters "AVMS". The letters "AVMS" (bold) indicate a key attribute, which is used for data exchange with a Automatic Vehicle Monitoring System (AVMS).

The key property of the attributes is indicated by a "P" when it is the primary key. The keys are generally compound in nature, with the result that the record is only clearly identifiable when all the key attributes are examined together. Attributes which enable clear record access are indicated by a "C".

Attributes which were not present in the OPNV Data Model v. 4.1 are indicated in the relation description using italics.

English and German attribute names and relation names have been assigned. Either of them can be used. The German names are written in brackets, eg: OPERATING_DAY (RETRIEBSTAG)

Instead of the English or German name of a relation, it is possible to use a number to identify each relation, ex: Table 290: DAY_TYPE (MENGE_TAGESART)

# 9.1.2 Data Types

The data types used in the Network / Timetable Interface Description have been taken from the OPNV Data Model v. 4.1. Here they are explained with examples:

decimal (x)

decimal value, whereby x represents the maximum number of places char(x) char(x) Character string, whereby x represents the maximum number of characters boolean boolean Logical type :  $0 =$  FALSE/1  $=$  TRUE

# 9.1.3 Value Ranges

In the Network / Timetable Interface Description, expressions for describing the range of values is defined as follows:

ISO 8859- 1

This character set is described in the VDV recommendation "File Format for Data Transfer".

NULL

NULL This attribute corresponds to the ZERO value in the database, i.e. the attribute has no contents. In interface files, such values appear as the figure "0".

(x)

(x) If a system cannot deliver the described attribute, the attribute is marked with an x.

# 9.1.4 Times

All times are controlled in seconds.

# 9.1.5 Diagram of the Data Model

![](https://cdn-mineru.openxlab.org.cn/result/2025-08-24/079b878b-92e7-46ba-bc75-cbe2811240eb/04d2424865b22d9265b89ba9c2c2e2d8a3ead32c23ee6961195c17ad4330f68d.jpg)

# 9.2 Relation Overview

<table><tr><td colspan="4">Calendar Data</td></tr><tr><td>Table name</td><td>Table name English</td><td>Table</td><td>description</td></tr><tr><td>German</td><td></td><td>-No.</td><td></td></tr><tr><td>BASIS_VER_GUEL</td><td>BASE_VERSION_VALID</td><td>993</td><td>Validity of the basic versions</td></tr><tr><td>TIGKEIT</td><td></td><td></td><td></td></tr><tr><td>MENGE_BASIS_V</td><td>BASE_VERSION</td><td>485</td><td>Version of the master files, timetable and round trip data</td></tr><tr><td>ERSION</td><td></td><td></td><td></td></tr><tr><td>FIRMENKALENDE</td><td>PERIOD</td><td>348</td><td>Assigning day type to the calendar date</td></tr><tr><td>R</td><td></td><td></td><td></td></tr><tr><td>MENGE_TAGESA</td><td>DAY_TYPE</td><td>290</td><td>List of day types</td></tr><tr><td>RT</td><td></td><td></td><td></td></tr><tr><td colspan="4">Location Data</td></tr><tr><td>Table name</td><td>Table name English</td><td>Table</td><td></td></tr><tr><td>German</td><td></td><td>-No.</td><td></td></tr><tr><td>MENGE_ONR_TYP</td><td>POINT_TYPE</td><td>998</td><td>List of functional location types (stopping point, depot, KWA, location marker)</td></tr><tr><td>MENGE_ORT_TYP</td><td>STOP_TYPE</td><td>997</td><td>List of grouping features for locations (e.g. spatial)</td></tr><tr><td>REC_HP</td><td>STOP_POINT</td><td>229</td><td>Definition of network points</td></tr><tr><td>REC_OM</td><td>ACTIVATION_POINT</td><td>295</td><td>Assigning location markers to locations including details of coding</td></tr><tr><td>REC_ORT</td><td>STOP</td><td>253</td><td>Definition of a bus stop or depot</td></tr><tr><td colspan="4">Operational Data</td></tr><tr><td>Table name</td><td>Table name English</td><td>Table</td><td></td></tr><tr><td>German</td><td></td><td>-No.</td><td></td></tr><tr><td>FAHRZEUG</td><td>VEHICLE</td><td>443</td><td>Vehicle description</td></tr><tr><td>ZUL_VERKEHRSB</td><td>TRANSPORT_COMPANY</td><td>992</td><td>Transport companies</td></tr><tr><td>ETRIEB</td><td></td><td></td><td></td></tr><tr><td>MENGE_BEREICH</td><td>OPERATING_DEPARTMEN</td><td>333</td><td>Industry branch (underground, light railway, bus etc.)</td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>MENGE_FZG_TYP</td><td>VEHICLE_TYPE</td><td>293</td><td>Vehicle type descriptions</td></tr><tr><td>REC_ANR</td><td>ANNOUNCEMENT</td><td>996</td><td>List of announcement texts</td></tr><tr><td>REC_ZNR</td><td>DESTINATION</td><td>994</td><td>List of journey destinations (destination numbers)</td></tr></table>

Line Data  

<table><tr><td colspan="3">Network Data</td><td></td></tr><tr><td>Table name</td><td>Table name English</td><td>Table</td><td></td></tr><tr><td>German</td><td></td><td>-No.</td><td></td></tr><tr><td>REC_SEL</td><td>LINK</td><td>299</td><td>Defines directed (one-way) connections between two points on the network</td></tr><tr><td>REC_SEL_ZP</td><td>POINT_ON_LINK</td><td>995</td><td>Definition of intermediate points on a route</td></tr><tr><td>MENGE_FGR</td><td>TIMING_GROUP</td><td>222</td><td>Definition of the text description of a running time grouping</td></tr><tr><td>ORT_HZTF</td><td>WAIT_TIME</td><td>999</td><td>Stopping times per running time grouping and location</td></tr><tr><td>SEL_FZT_FELD</td><td>TRAVEL_TIME</td><td>282</td><td>Journey time for defined route sections</td></tr><tr><td>REC_UEB</td><td>DEAD_RUN</td><td>225</td><td>Defines directed (one-way) connections between two points on the network for connection journeys</td></tr><tr><td>UEB_FZT</td><td>DEAD_RUN_TIME</td><td>247</td><td>Connection running time for defined route sections</td></tr><tr><td>MENGE_FAHTAR</td><td>JOURNEY_TYPE</td><td>332</td><td>List of journey types</td></tr><tr><td>T</td><td></td><td></td><td></td></tr></table>

Timetable Data  

<table><tr><td>Table name</td><td>Table name English</td><td>Table</td><td></td></tr><tr><td>German</td><td></td><td>-No.</td><td></td></tr><tr><td>LID_VERLAUF</td><td>ROUTE_SEQUENCE</td><td>246</td><td>Route course as part of a line</td></tr><tr><td>REC_LID</td><td>LINE</td><td>226</td><td>Line description</td></tr></table>

<table><tr><td>Table name</td><td>Table name English</td><td>Table</td><td></td></tr><tr><td>German</td><td></td><td>-No.</td><td></td></tr><tr><td>RECFRT</td><td>JOURNEY</td><td>715</td><td>Journey description</td></tr><tr><td>RECFRT_HZT</td><td>JOURNEY_WAIT_TIME</td><td>308</td><td>Journey waiting time at the bus stop</td></tr><tr><td>RECUMLAUF</td><td>BLOCK</td><td>310</td><td>Description of the vehicle round trips</td></tr></table>

# 9.3 Calendar Data

# 9.3.1 BASE_VERSION_VALID (BASIS_VER_GUELTIGKEIT)

Description:

Description: Validity of the basic versions. At any given point in time, the most valid version is the one which was begun most recently (expressed by the date on which it was first created, Attr. VER_GUELTIGKEIT)

<table><tr><td colspan="6">Table 993: BASE_VERSION_VALID (BASIS_VER_GUELTIGKEIT)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P</td><td>BASE_VERSION_ VALID (VER_GUELTIGKEIT)</td><td>decimal (8)</td><td>&amp;gt;0</td><td>AVMS</td><td>Date from which the general version is valid. Example: the figure 1995/231 means 31 December 1995</td></tr><tr><td></td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (8)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of BASE_VERSION_VALID (BASIS_VER_GUELTIGKEIT) is a secondary key in</td><td>BASE_VERSION_VALID (BASIS_VER_GUELTIGKEIT) has the following secondary key(s):</td></tr></table>

Non applicable

# 9.3.2 BASE_VERSION (MENGE_BASIS_VERSIONEN)

Description:

Description: Valid versions for network, structural and timetable data. By being able to refer to a version number, it is possible to save several network and structural data versions side by side. From the BASIS_VER_GUELTIGKEIT table, you can tell which basic version is valid on a certain day.

<table><tr><td colspan="6">Table 485: BASE_VERSION (MENGE_BASIS_VERSIONEN)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td></td><td>BASE_VERSION_DE SC (BASIS_VERSION_T EXT)</td><td>char/49)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the general version</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of BASE_VERSION (MENGE_BASIS_VERSIONEN) is a secondary key in</td><td>BASE_VERSION (MENGE_BASIS_VERSIONEN) has the following secondary key(s):</td></tr></table>

all other relations of the Network / Timetable Interface Description

# 9.3.3 PERIOD (FIRMENKALENDER)

Description:

Description: Allocation of a day type to the calendar date for the traffic day in question (only one day type can be assigned to each traffic day)

<table><tr><td colspan="6">Table 348: PERIOD (FIRMENKALENDER)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OPERATING_DAY (BETRIEBSTAG)</td><td>decimal (8)</td><td>&amp;gt;0</td><td></td><td>Calendar date as an identifier of a traffic day (can differ from a calendar day with respect to its beginning and end time). 
Example: the figure 19951231 means 31 December 1995.</td></tr><tr><td></td><td>OPERATING_DAY_DESC (BETRIEBSTAG_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td></td><td>Description of the traffic day</td></tr><tr><td></td><td>DAY_TYPE_NO (TAGESART_NR)</td><td>decimal (3)</td><td>1..999</td><td></td><td>Identifier of the day type²</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of PERIOD (FIRMENKALENDER) is a secondary key in</td><td>PERIOD (FIRMENKALENDER) has the following secondary key(s):</td></tr></table>

Non applicable

BASE_VERSION DAY_TYPE

# 9.3.4 DAY_TYPE (MENGE_TAGESART)

Description:

Description: List of all types of traffic days

<table><tr><td colspan="6">Table 290: DAY_TYPE (MENGE_TAGESART)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>DAY_TYPE_NO (TAGESART_NR)</td><td>decimal (3)</td><td>1..999</td><td>AVMS</td><td>Identifier of the day type</td></tr><tr><td></td><td>DAY_TYPE_DESC (TAGESART_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the day type</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of DAY_TYPE (MENGE_TAGESART) is a secondary key in</td><td>DAY_TYPE (MENGE_TAGESART) has the following secondary key(s):</td></tr></table>

JOURNEY PERIOD BLOCK

# 9.4 Location Data

# 9.4.1 POINT_TYPE (MENGE_ONR_TYP)

Description:

Description: List of functional location types (HP (bus stop), BHOF (depot), OM (location marker), LSA (traffic lights))

<table><tr><td colspan="6">Table 998: POINT_TYPE (MENGE_ONR_TYP)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1, C1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..5</td><td>AVMS</td><td>Identifier of the functional type of a location &lt;location type=&quot;&quot;&gt; 1: bus stop 
2: depot 
3: location marker 
4: traffic lights 
5: intermediate points</td></tr><tr><td>C2</td><td>POINT_TYPE_ABBR (STR_ONR_TYP)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Abbreviation for the location type (HP, BHOF, OM, LSA)</td></tr><tr><td></td><td>POINT_TYPE_DESC (ONR_TYP_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the functional type of a location</td></tr></table>


</location>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of POINT_TYPE (MENGE_ONR_TYP) is a secondary key in</td><td>POINT_TYPE (MENGE_ONR_TYP) has the following secondary key(s):</td></tr><tr><td>STOP</td><td>BASE_VERSION</td></tr><tr><td>LINK</td><td></td></tr><tr><td>DEAD_RUN</td><td></td></tr><tr><td>DEAD_RUN_TIME</td><td></td></tr><tr><td>STOP_POINT</td><td></td></tr><tr><td>TRAVEL_TIME</td><td></td></tr><tr><td>WAIT_TIME</td><td></td></tr><tr><td>ACTIVATION_POINT</td><td></td></tr><tr><td>POINT_ON_LINK</td><td></td></tr><tr><td>JOURNEY_WAIT_TIME &amp;amp; BLOCK</td><td></td></tr></table>

# 9.4.2 STOP_TYPE (MENGE_ORT_TYP)

Description:

Description: List of location grouping features (e.g. spatial)

<table><tr><td colspan="6">Table 997: STOP_TYPE (MENGE_ORT_TYP)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>STOP_TYPE (ORT_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Identifier of the location grouping feature 
1: Bus stop 
2: Depot</td></tr><tr><td></td><td>STOP_TYPE_DESC (ORT_TYP_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the location grouping feature</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of STOP_TYPE (MENGE_ORT_TYP) is a secondary key in</td><td>STOP_TYPE (MENGE_ORT_TYP) has the following secondary key(s):</td></tr></table>

# 9.4.3 STOP_POINT (REC_HP)

Description:

Points are the smallest unit in timetable scheduling. Generally, passengers get on and off at a stopping point. Each stopping point must be allocated to a bus stop or depot. A bus stop / depot can only have a maximum of 100 stopping points allocated to it. No stopping points with the same number are allowed for one bus stop /depot

<table><tr><td colspan="6">Table 229: STOP_POINT (REC_HP)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (S)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Identifier of the functional type of a location &lt;location type=&quot;&quot;&gt;</td></tr><tr><td>P3</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location identifier per functional location type</td></tr><tr><td></td><td>STOP_POINT_NO (HALTEPUNKT_NR)</td><td>decimal (2)</td><td>0..99</td><td>AVMS</td><td>Identifier of a stopping point within a reference location (point on the network)</td></tr><tr><td></td><td>STOP_POINT_DESC (ZUSATZ_INFO)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the stopping point</td></tr></table>


</location>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of STOP_POINT (REC_HP) is a secondary key in</td><td>STOP_POINT (REC_HP) has the following secondary key(s):</td></tr></table>

Non applicable STOP BASE_VERSION POINT_TYPE

# 9.4.4 ACTIVATION_POINT (REC_OM)

Description:

Assigning location markers to locations including details of coding

<table><tr><td colspan="6">Table 295: ACTIVATION_POINT (REC_OM)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1, C1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>3..4</td><td></td><td>Identifier of the functional type of a location &lt;location type=&quot;&quot;&gt;</td></tr><tr><td>P3</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td></td><td>Location identifier per functional location type &lt;location number=&quot;&quot;&gt;</td></tr><tr><td>C2</td><td>ACT_POINT_ABBR (ORM_KUERZEL)</td><td>char(6)</td><td>ISO 8859-1</td><td></td><td>Clear abbreviation</td></tr><tr><td></td><td>ACT_POINT_CODE (ORMACODE)</td><td>decimal (5)</td><td>1..32765</td><td></td><td>Location marker coding</td></tr><tr><td></td><td>ACT_POINT_DESC (ORM_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td></td><td>Location marker description</td></tr></table>


</location></location>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of ACTIVATION_POINT 
(REC_OM) is a secondary key in</td><td>ACTIVATION_POINT (REC_OM) has the following secondary key(s):</td></tr></table>

Non applicable

BASE_VERSIONPOINT_TYPESTOP

# 9.4.5 STOP (REC_ORT)

9.4.5 STOP (REC_ORT)Description: Description of locations. All the points on the network are contained in this relation. There is also a description of how the network points are formed into area groups. A bus stop / depot can be made up of several stopping points (e.g. when travelling a line in both directions). In this relation, this is highlighted by references between the network points which belong together. A bus stop / depot can have a maximum of 100 stopping points assigned to it. The abbreviation (STOP_ABBR (ORT_REF_ORT_KUERZEL)) as well as the number (STOP_NO (ORT_REF_ORT)) must be clearly marked at all bus stops and depots. No stopping points with the same number are allowed for one bus stop / depot.

<table><tr><td colspan="6">Table 253: STOP (REC_ORT)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..5</td><td>AVMS</td><td>Identifier of the functional type of a location &lt;location type=&quot;&quot;&gt;</td></tr><tr><td>P3</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location identifier per functional location type</td></tr><tr><td></td><td>POINT_DESC (ORT_NAME)</td><td>char (40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the location (network point)</td></tr><tr><td></td><td>STOP_NO (ORT_REF_ORT) 1) 2)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Clear location number given to reference point for (area) grouping</td></tr><tr><td></td><td>STOP_TYPE (ORT_REF_ORT_TYP) 1)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of a given reference point for (area) grouping</td></tr><tr><td></td><td>STOP_LONG_NO (ORT_REF_ORT_LANGNR) 1)</td><td>decimal (7)</td><td>&amp;gt; 0, NULL</td><td>AVMS</td><td>Clear number given to reference location within the traffic system</td></tr><tr><td></td><td>STOP_ABBR (ORT_REF_ORT_KUERZEL) 1)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Clear abbreviation for a reference location</td></tr><tr><td></td><td>STOP_DESC (ORT_REF_ORT_NAME) 1)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Name of the reference location</td></tr><tr><td></td><td>ZONE_CELL_NO (ZONE_WABE_NR) 1)</td><td>decimal (5)</td><td>&amp;gt;0, NULL</td><td>AVMS</td><td>Describes which zone / cell the reference location belongs to for charges&#x27; purposes</td></tr></table>


</location>

<table><tr><td></td><td>POINT_LONGITUDE
(ORT_POS_LAENGE) 4)</td><td>decimal
(10)</td><td>+/- 
1800000000</td><td></td><td>Longitude in WGS 84 format in Millisecond: dddmmssnnn (degrees, minutes, seconds 3 decimal places, West/East suffix is replaced by a negative sign for west</td></tr><tr><td></td><td>POINT_LATITUDE
(ORT_POS_BREITE) 4)</td><td>decimal
(10)</td><td>+/- 
900000000</td><td></td><td>Latitude in WGS 84 Format in Millisecond: dddmmssnnn (degrees, minutes, seconds 3 decimal places, north/south suffix is replaced by a negative sign for south</td></tr><tr><td></td><td>POINT_ELEVATION
(ORT_POS_HOEHE) 3</td><td>decimal
(10)</td><td></td><td></td><td>WGS 84 Format use: elevator; multi-storey stop area.</td></tr><tr><td></td><td>POINT_HEADING
(ORT_RICHTUNG) 4</td><td>Decimal (3)</td><td>0..359</td><td></td><td>Direction of vehicle entrance to stop point 0 – north, 90 – east, 180 – south, 270 – west</td></tr></table>

# Note:

1) The attributes are only interpreted if POINT_TYPE  $(\mathsf{ONR\_TYP\_NR}) = 1$  or2

2) It has to be checked, if the whole value range can be used. Many PT-operators have devices in use, which support only a value range from 0 to 9999

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of STOP (REC_ORT) is a secondary key in</td><td>STOP (REC_ORT) has the following secondary key(s):</td></tr></table>

WAIT_TIME BASE_VERSION JOURNEY_WAIT_TIME POINT_TYPE ACTIVATION_POINT POINT_ON_LINK DEAD_RUN LINK STOP_POINT DEAD_RUN_TIME BLOCK

# 9.5 Operational Data

# 9.5.1 VEHICLE (FAHRZEUG)

Description: Description of vehicles

<table><tr><td colspan="6">Table 443: VEHICLE (Fahrzeug)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>VEHICLE_NO (FZG_NR)</td><td>decimal (4)</td><td>&amp;gt;0</td><td></td><td>Identifier of the vehicle &lt;vehicle number=&quot;&quot;&gt;</td></tr><tr><td></td><td>VEHICLE_TYPE (VH_TYPE_NO (FZG_TYP_NR))</td><td>decimal (3)</td><td>1..252, NULL</td><td></td><td>Identifier of vehicle type</td></tr><tr><td></td><td>VEHICLE_REG (POLKENN)</td><td>char(20)</td><td>ISO 8859-1</td><td></td><td>Police registration</td></tr><tr><td></td><td>COMPANY (UNTERNEHMEN)</td><td>decimal (3)</td><td>&amp;gt;0, NULL</td><td></td><td>Identifier of transport company</td></tr></table>


</vehicle>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of VEHICLE 
(FAHRZEUG) is a secondary key in</td><td>VEHICLE (FAHRZEUG) has the following secondary key(s):</td></tr></table>

Non applicable

BASE_VERSION VEHICLE_TYPE TRANSPORT_COMPANY

# 9.5.2 TRANSPORT_COMPANY (ZUL_VERKEHRSBETRIEB)

Description:

Description: List of transport companies involved in transport industry

<table><tr><td colspan="6">Table 992: TRANSPORT_COMPANY (ZUL_VERKEHRSBETRIEB)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>COMPANY (UNTERNEHMEN)</td><td>decimal (3)</td><td>&amp;gt;0</td><td></td><td>Identifier of the transport company</td></tr><tr><td></td><td>COMPANY_ABBR (ABK_UNTERNEHME N)</td><td>char(6)</td><td>ISO 8859-1</td><td></td><td>Abbreviation for transport company</td></tr><tr><td></td><td>BUSINESS_AREA_D ESC (BETRIEBSGEBIET BEZ)</td><td>char(49)</td><td>ISO 8859-1</td><td></td><td>Description of area of business</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of 
TRANSPORT_COMPANY 
(ZUL_VERKEHRSBETRIEB) is a secondary key in</td><td>TRANSPORT_COMPANY 
(ZUL_VERKEHRSBETRIEB) has the following secondary key(s):</td></tr></table>

VEHICLE

# 9.5.3 OPERATING_DEPARTMENT (MENGE_BEREICH)

Description:

A variety of valid network areas (business areas) exist when various modes of transport are made available (bus, S- Bahn (city railway), U- Bahn (underground railway)) either on separate or on the same lines.

<table><tr><td colspan="6">Table 333: OPERATING_DEPARTMENT (MENGE_BEREICH)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1, C1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td>AVMS</td><td>Identifier of the network area (business area)</td></tr><tr><td>C2</td><td>OP_DEP_ABBR (STR_BEREICH)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Abbreviation for the network area (business area)</td></tr><tr><td></td><td>OP_DEP_DESC (BEREICH_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the network area (business area)</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of OPERATING_DEPARTMENT (MENGE_BEREICH) is a secondary key in</td><td>OPERATING_DEPARTMENT 
(MENGE_BEREICH) has the following secondary key(s):</td></tr></table>

LINK BASE_VERSION DEAD_RUN

# 9.5.4 VEHICLE_TYPE (MENGE_FZG_TYP)

Description: Description of vehicle types

<table><tr><td colspan="6">Table 293: VEHICLE_TYPE (MENGE_FZG_TYP)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>VEHICLE_TYPE (VH_TYPE_NO (FZG_TYP_NR))</td><td>decimal (3)</td><td>1..252</td><td>AVMS</td><td>Identifier of vehicle type</td></tr><tr><td></td><td>VH_TYPE_LENGTH (FZG_LAENGE)</td><td>decimal (2)</td><td>&amp;gt;0</td><td>AVMS</td><td>Total length of vehicle (in metres)</td></tr><tr><td></td><td>VH_TYPE_SEAT (FZG_TYP_SITZ)</td><td>decimal (3)</td><td>&amp;gt;=0</td><td>AVMS</td><td>Vehicle seating capacity</td></tr><tr><td></td><td>VH_TYPE_STAND (FZG_TYP_STEH)</td><td>decimal (3)</td><td>&amp;gt;=0</td><td>AVMS</td><td>Vehicle standing capacity</td></tr><tr><td></td><td>VH_TYPE_DESC (FZG_TYP_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of vehicle type</td></tr><tr><td></td><td>VH_TYPE_SPEC_SE AT (SONDER_PLATZ)</td><td>decimal (3)</td><td>&amp;gt;=0</td><td>AVMS</td><td>Number of special seats (handcapped seats) in the vehicle</td></tr><tr><td></td><td>VH_TYPE_ABBR (STR_FZG_TYP)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Abbreviation of vehicle type</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of VEHICLE_TYPE (MENGE_FZG_TYP) is a secondary key in</td><td>VEHICLE_TYPE (MENGE_FZG_TYP) has the following secondary key(s):</td></tr></table>

VEHICLE BLOCK

# 9.5.5 ANNOUNCEMENT (REC_ANR)

Description:

Description: List of vehicle announcement texts (there was previously no such relation in the OPNV Data Model 4.1)

<table><tr><td colspan="6">Table 996: ANNOUNCEMENT (REC_ANR)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>ANN_NO (ANR_NR)</td><td>decimal (4)</td><td>1..9999</td><td></td><td>Announcement text number</td></tr><tr><td></td><td>ANN_DESC (ANR_TEXT)</td><td>char(200)</td><td>ISO 8859-1</td><td></td><td>Announcement text</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of ANNOUNCEMENT (REC_ANR) is a secondary key in</td><td>ANNOUNCEMENT (REC_ANR) has the following secondary key(s):</td></tr></table>

ROUTE_SEQUENCE BASE_VERSION

# 9.5.6 DESTINATION (REC_ZNR)

Description:

Description: List of journey destinations displayed on vehicle

<table><tr><td colspan="6">Table 994: DESTINATION (REC_ZNR)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>DEST_NO (ZNR_NR)</td><td>decimal (4)</td><td>0..999</td><td></td><td>Identifier of the destination display &lt;destination number&gt;. ZNR_NR 0 is used to delete the display.</td></tr><tr><td></td><td>DEST_BRIEF_TEXT (FAHRERKURZTEXT )</td><td>char(44)</td><td>ISO 8859-1</td><td></td><td>Brief destination display text</td></tr><tr><td></td><td>DEST_SIDE_TEXT (SEITENTEXT)</td><td>char(160)</td><td>ISO 8859-1</td><td></td><td>Text for the side destination display</td></tr><tr><td></td><td>DEST_FRONT_TEXT (ZNR_TEXT)</td><td>char(160)</td><td>ISO 8859-1</td><td></td><td>Text for the front destination display</td></tr><tr><td></td><td>DEST_CODE (ZNR_CODE)</td><td>char(68)</td><td>ISO 8859-1</td><td></td><td>Control code for destination text displays</td></tr></table>


</destination>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of DESTINATION (REC_ZNR) is a secondary key in</td><td>DESTINATION (REC_ZNR) has the following secondary key(s):</td></tr></table>

ROUTE_SEQUENCE BASE_VERSION

# 9.6 Network Data

# 9.6.1 LINK(REC_SEL)

Description:

Description: Defines directed (one- way) connections in the network by indicating the geometrical locations (bus stops / stopping points or depots / depot points) which form the beginning and end of a route. This means that routes in two different directions can exist between two stopping points. The connection distance is given in metres.

<table><tr><td colspan="6">Table 299: LINK (REC_SEL)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td>AVMS</td><td>Identifier of the network area (business area)</td></tr><tr><td>P3</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Identifier of the function type of route beginning point &lt;location=&quot;&quot; type=&quot;&quot;&gt;</td></tr><tr><td>P4</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the route beginning point per functional location type &lt;location=&quot;&quot; type=&quot;&quot;&gt;</td></tr><tr><td>P5</td><td>TO_POINT_NO (SEL_ZIEL)</td><td>Decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of the route ending point</td></tr><tr><td>P6</td><td>TO_POINT_TYPE (SEL_ZIEL_TYP)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of the route ending point</td></tr><tr><td></td><td>LINK_DISTANCE (SEL_LAENGE)</td><td>decimal (5)</td><td>1..81890</td><td>AVMS</td><td>Length of route (junction-oriented), in metres</td></tr></table>


</location>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of LINK (REC_SEL) is a secondary key in</td><td>LINK (REC_SEL) has the following secondary key(s):</td></tr><tr><td>TRAVEL_TIME</td><td>BASE_VERSION
OPERATING_DEPARTMENT
POINT_TYPE
STOP</td></tr></table>

# 9.6.2 POINT_ON_LINK (REC_SEL_ZP)

Description: Definition of intermediate points (location marker, traffic lights, intermediate points) on a route.

With the help of intermediate points the graphical display of a route between two Stopp points can be defined, Uber Routenzwischen- punkte kann der geografische Verlauf einer Linienroute zwischen zwei Haltepunkten definiert werden. The attribute POINT_ON_LINK_SERIAL_NO defines the order of the intermediate points on the route

<table><tr><td colspan="6">Table 995: POINT_ON_LINK (REC_SEL_ZP)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Need ed for</td><td>Description</td></tr><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td></td><td>Identifier of the network area (business area)</td></tr><tr><td>P3</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (5)</td><td>1..2</td><td></td><td>Location type of route beginning point</td></tr><tr><td>P4</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td></td><td>Location number of route beginning point</td></tr><tr><td>P6</td><td>TO_POINT_NO (SEL_ZIEL)</td><td>decimal (6)</td><td>&amp;gt;0</td><td></td><td>Location number of route ending point</td></tr><tr><td>P5</td><td>TO_POINT_TYPE (SEL_ZIEL_TYP)</td><td>decimal (2)</td><td>1..2</td><td></td><td>Location type of route ending point</td></tr><tr><td>P8</td><td>POINT_TO_LINK_NO (ZP_ONR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td></td><td>Location number of an intermediate point on the route (junction-oriented)</td></tr><tr><td>P7</td><td>POINT_TO_LINK_TYPE (ZP_TYP)</td><td>decimal (2)</td><td>3..4</td><td></td><td>Location type of an intermediate point on the route (junction-oriented)</td></tr><tr><td></td><td>POINT_TO_DISTANCE (SEL_ZP_LAENGE)</td><td>decimal (5)</td><td>1...81890</td><td></td><td>Length of route between the beginning and ending point in metres</td></tr><tr><td></td><td>POINT_ON_LINK_SERI AL_NO (ZP_LFD_NR)</td><td>decimal (3)</td><td>&amp;gt;0, NULL</td><td></td><td>Serial number of the intermediate point counted from the beginning of the route</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>Primary key of POINT_ON_LINK 
(REC_SEL_ZP) is a secondary key in</td><td>POINT_ON_LINK (REC_SEL_ZP) has the following secondary key(s):</td></tr><tr><td>Non applicable</td><td>BASE_VERSION
LINK
POINT_TYPE</td></tr></table>

# STOP

# 9.6.3 TIMING_GROUP (MENGE_FGR)

Description:

Contains the text description for the running time groups. The number of the running time group indicates a day- time interval during which the running or stopping times are valid.

<table><tr><td colspan="6">Table 222: TIMING_GROUP (MENGE_FGR)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>TIMING_GROUP_NO (FGR_NR)</td><td>decimal (9)</td><td>1..999999999</td><td>AVMS</td><td>Identifier of the running time group</td></tr><tr><td></td><td>TIMING_GROUP_DE SC (FGR_TEXT)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of the running time group</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of TIMING_GROUP (MENGE_FGR) is a secondary key in</td><td>TIMING_GROUP (MENGE_FGR) has the following secondary key(s):</td></tr></table>

WAIT_TIME BASE_VERSION TRAVEL_TIME DEAD_RUN_TIME

# 9.6.4 WAIT_TIME (ORT_HZTF)

Description:

Stopping times per running time group and location

<table><tr><td colspan="6">Table 999: WAIT_TIME (ORT_HZTF)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>TIMING_GROUP_NO (FGR_NR)</td><td>decimal (9)</td><td>1..999999999</td><td>AVMS</td><td>Identifier of the running time group6</td></tr><tr><td>P3</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Identifier of functional type of a location &lt;location=&quot;&quot; type=&quot;&quot;&gt;</td></tr><tr><td>P4</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location identifier per functional location type &lt;location number=&quot;&quot;&gt;</td></tr><tr><td></td><td>WAIT_TIME (HP_HZT)</td><td>decimal (6)</td><td>0..65532</td><td>AVMS</td><td>Stopping time at a location per running time group</td></tr></table>


</location>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of WAIT_TIME 
(ORT_HZTF) is a secondary key in</td><td>WAIT_TIME (ORT_HZTF) has the following secondary key(s)</td></tr></table>

Non applicable

BASE_VERSIONPOINT_TYPETIMING_GROUPSTOP

# 9.6.5 TRAVEL_TIME (SEL_FZT_FELD)

Description:

Contains the scheduled running time for defined route sections. The time needed to cover the route can depend on the time of day. Therefore, a number of running times could apply to the same stretch. The various running times are clearly identified by a running time group. The running times are given in seconds.

Table 282:TRAVEL_TIME (SEL_FZT_FELD)  

<table><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (S)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td>AVMS</td><td>Identifier of network area (business area)</td></tr><tr><td>P3</td><td>TIMING_GROUP_NO (FGR_NR)</td><td>decimal (S)</td><td>1..999999999</td><td>AVMS</td><td>Identifier of the running time group7</td></tr><tr><td>P4</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of route beginning point</td></tr><tr><td>P5</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of route beginning point</td></tr><tr><td>P7</td><td>TO_POINT_NO (SEL_ZIEL)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of route ending point</td></tr><tr><td>P6</td><td>TO_POINT_TYPE (SEL_ZIEL_TYP)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of route ending point</td></tr><tr><td></td><td>TRAVEL_TIME (SEL_FZT)</td><td>decimal (6)</td><td>0..65532</td><td>AVMS</td><td>Route running time per running time group (junction-oriented), in seconds</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of TRAVEL_TIME 
(SEL_FZT_FELD) is a secondary key in</td><td>TRAVEL_TIME (SEL_FZT_FELD) has the following secondary key(s):</td></tr><tr><td>Non applicable</td><td>BASE_VERSION
LINK
TIMING_GROUP</td></tr></table>

7 Within the company applying this specification it must be checked, if the value range up to 99999999 can be used. Often other modules running support only a value range up to 65533.

OPERATING_DEPARTMENTPOINT_TYPESTOP

# 9.6.6 DEAD_RUN (REC_UEB)

Description:

9.6.6 DEAD_RUN (REC_UEB)Description: Defines directed (one- way) connections in the network by indicating the geometrical locations (bus stops / stopping points) which form the beginning and end of the route. The DEAD_RUN relation is needed for connection journeys (depot departures, depot access, access routes). Connection routes only ever consist of one connection between two points, whereby these should not be identical!

<table><tr><td colspan="6">Table 225: DEAD_RUN (REC_UEB)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td>AVMS</td><td>Identifier of network area (business area)</td></tr><tr><td>P3</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of beginning point on connection route</td></tr><tr><td>P4</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of beginning point on connection route</td></tr><tr><td>P5</td><td>TO_POINT_TYPE (UEB_ZIEL_TYP)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of ending point on connection route</td></tr><tr><td>P6</td><td>TO_POINT_NO (UEB_ZIEL)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of ending point on connection route</td></tr><tr><td></td><td>DEAD_RUN_DISTAN CE (UEB_LAENGE)</td><td>decimal (6)</td><td>1..81890</td><td>AVMS</td><td>Length of connection route in metres</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of DEAD_RUN
(REC_UEB) is a secondary key in</td><td>DEAD_RUN (REC_UEB) has the following secondary key(s):</td></tr><tr><td>DEAD_RUN_TIME</td><td>BASE_VERSION
OPERATING_DEPARTMENT
POINT_TYPE
STOP</td></tr></table>

# 9.6.7 DEAD_RUN_TIME (UEB_FZT)

Description:

Running time of connection journey. Contains the scheduled running time for defined route sections. The time needed to cover the route can depend on the time of day. Therefore, a number of running times could apply to the same stretch. The various running times are clearly identified by a running time group. The running time of a connection journey must be greater than zero and both points (beginning / end) should not be identical!

<table><tr><td colspan="6">Table 247: DEAD_RUN_TIME (UEB_FZT)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td>AVMS</td><td>Identifier of the network area (business area)</td></tr><tr><td>P3</td><td>TIMING_GROUP_N O(FGR_NR)</td><td>decimal (9)</td><td>1.99999999</td><td>AVMS</td><td>Identifier of the running time group8</td></tr><tr><td>P4</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of beginning point on connection route</td></tr><tr><td>P5</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of begin-ning point on connection route</td></tr><tr><td>P6</td><td>TO_POINT_TYPE (UEB_ZIEL_TYP)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of ending point on connection route</td></tr><tr><td>P7</td><td>TO_POINT_NO (UEB_ZIEL)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of ending point on connection route</td></tr><tr><td></td><td>TRAVEL_TIME (UEB_FAHRZEIT)</td><td>decimal (6)</td><td>1.65532</td><td>AVMS</td><td>Running time of connec-ution journey per running time group, in seconds</td></tr></table>

<table><tr><td>Links to other relations:</td><td></td></tr><tr><td>The primary key of DEAD_RUN_TIME (UEB_FZT) is a secondary key in</td><td>DEAD_RUN_TIME (UEB_FZT) has the following secondary key(s):</td></tr></table>

Non applicable

BASE_VERSION OPERATING_DEPARTMENT TIMING_GROUP DEAD_RUN

# 9.6.8 JOURNEY_TYPE (MENGE_FAHRTART)

Description:

List of journey types

<table><tr><td colspan="6">Table 332: JOURNEY_TYPE (MENGE_FAHRTART)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1, C1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>so</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>JOURNEY_TYPE_N O (FAHRTART_NR)</td><td>decimal (2)</td><td>1..4</td><td>AVMS</td><td>Identifier of journey type 1: Normal journey 2: Depot departure 3: Depot access 4: Access route</td></tr><tr><td>C2</td><td>JOURNEY_TYPE_DE SC (STR_FAHRTART)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Journey type abbreviation</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of JOURNEY_TYPE 
(MENGE_FAHRTART) is a secondary key in</td><td>JOURNEY_TYPE (MENGE_FAHRTART) has the following secondary key(s):</td></tr></table>

# JOURNEY

BASE_VERSION

Note: "Access route" is a route which is used especially for line change- over journeys and empty runs.

# 9.7 Line Data

# 9.7.1 ROUTE_SEQUENCE (LID_VERLAUF)

Description:

Describes the route by listing the bus stops / points which are stopped at in numbered sequence. Bus stops / stopping points (depots / depot points) may only be stopped at once (no circular routes). A Circular route would occur if a bus stop is used more than once in a reference location. The total running time for a route cannot be zero. The same applies to distance. The beginning and end point of a route must be junctions (time- relevant locations).

<table><tr><td colspan="6">Table 246: ROUTE_SEQUENCE (LID_VERLAUF)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1, C1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P4</td><td>SEQUENCE_NO (LI_LFD_NR)</td><td>decimal (3)</td><td>&amp;gt;0</td><td>AVMS</td><td>Consecutive number of the point on the route</td></tr><tr><td>P2, C2</td><td>LINE_NO (LI_NR)</td><td>decimal (6)</td><td>1..9999</td><td>AVMS</td><td>Identifier of transport supply in terms of line or area9</td></tr><tr><td>P3, C3</td><td>ROUTE_ABBR (STR_LI_VAR)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Identifier of variant on the line (or on the route in an area)</td></tr><tr><td>C4</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Identifier of the functional type of a location &lt;location type=&quot;&quot;&gt;</td></tr><tr><td>C5</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location identifier per functional location type &lt;location number=&quot;&quot;&gt;</td></tr></table>


</location>

<table><tr><td></td><td>DEST_NO (ZNR_NR)</td><td>decimal (4)</td><td>0..999 (0)</td><td>AVMS</td><td>Identifier of destination display</td></tr><tr><td></td><td>ANN_NO (ANR_NR)</td><td>decimal (4)</td><td>1..9999, NULL</td><td>AVMS</td><td>Identifier of announcement</td></tr><tr><td></td><td>LOCKIN_RANGE (EINFANGBEREICH)</td><td>decimal (3)</td><td>0..256 (0)</td><td>AVMS</td><td>Area in metres within which the on-board computer recognises the bus stop / stopping point</td></tr><tr><td></td><td>LINE_NODE (LL_KNOTEN)</td><td>boolean</td><td>0..1 (1)</td><td>AVMS</td><td>0: not a time relevant location
1: time relevant location</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of ROUTE_SEQUENCE 
(LID_VERLAUF) is a secondary key in</td><td>ROUTE_SEQUENCE (LID_VERLAUF) has the following secondary key(s):</td></tr><tr><td rowspan="6">Non applicable</td><td>BASE_VERSION</td></tr><tr><td>LINE</td></tr><tr><td>ANNOUNCEMENT</td></tr><tr><td>DESTINATION</td></tr><tr><td>STOP</td></tr><tr><td>POINT_TYPE</td></tr></table>

# 9.7.2 LINE (REC_LID)

Description:

Description: Allocation of line to business area. The line number within a network is clear. The route number must be clearly assigned to a line and a route. LINE_ABBR (LI_KUERZEL) must have the same value for all routes on the same line (LINE_NO (LI_NR)).

<table><tr><td colspan="6">Table 226: LINE (REC_LID)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr><tr><td>P1, C1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2, C2</td><td>LINE_NO (LI_NR)</td><td>decimal (6)</td><td>1..9999</td><td>AVMS</td><td>Identifier of transport supply in terms of line or area¹⁰</td></tr><tr><td>P3</td><td>ROUTE_ABBR (STR_LI_VAR)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Identifier of variant on the line (or on the route in an area)</td></tr><tr><td>C3</td><td>ROUTE_NO (ROUTEN_NR)</td><td>decimal (3)</td><td>1..999</td><td>AVMS</td><td>Clear identification of a line route, with dependence on the line, for the vehicle on-board computer</td></tr><tr><td></td><td>DIRECTION (LI_RI_NR)</td><td>decimal (3)</td><td>1..2</td><td>AVMS</td><td>Identifier of line direction</td></tr><tr><td></td><td>OP_DEP_NO (BEREICH_NR)</td><td>decimal (3)</td><td>0..252</td><td>AVMS</td><td>Identifier of network area (business area)</td></tr><tr><td></td><td>LINE_ABBR (LI_KUERZEL)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Name of line</td></tr><tr><td></td><td>LINE_DESC (LIDNAME)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Description of line</td></tr><tr><td></td><td>ROUTE_TYPE (ROUTEN_ART)</td><td>decimal (2)</td><td>1..4</td><td>AVMS</td><td>1: Normal profile
2: Depot access
3: Depot departure
4: Access route</td></tr><tr><td></td><td>LINE_CODE (LINIEN_CODE)</td><td>decimal (2)</td><td>&amp;gt;0, NULL</td><td>AVMS</td><td>Identifier of mask number for the on-vehicle display</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of LINE (REC_LID) is a secondary key in</td><td>LINE (REC_LID) has the following secondary key(s):</td></tr></table>

ROUTE_SEQUENCE

# 9.8 Timetable Data

# 9.8.1 JOURNEY (REC_FRT)

Description:

9.8.1 JOURNEY (REC_FRT)Description: Journey definition in "Information on Scheduling Journeys". Result of the journey relationship investigation, according to which linked routes are brought together to form complete journey relations, also taking admissible line changes (mutations) into account. The run number is used to clearly allocate the vehicles on a line to a timetable. In so doing, the run identify all the vehicles which are being used at a certain point in time. The run number gives no information about the number of vehicles which are being used at a given time point. The run number is clear within the line and for the time during which the vehicle in question is on the line.

<table><tr><td colspan="6">Table 715: JOURNEY (REC_FRT)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1, C11, C21</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>JOURNEY_NO (FRT_FID)</td><td>decimal (10)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of journey</td></tr><tr><td>C15, C24</td><td>DEPARTURE_TIME (FRT_START)</td><td>decimal (6)</td><td>0..129600</td><td>AVMS</td><td>Journey departure time in seconds from 0:00</td></tr><tr><td>C13</td><td>LINE_NO (LL_NR)</td><td>decimal (6)</td><td>1..9999</td><td>AVMS</td><td>Identifier of transport supply in terms of line or area11</td></tr><tr><td>C12, C22</td><td>DAY_TYPE_NO (TAGESART_NR)</td><td>decimal (8)</td><td>1..999</td><td>AVMS</td><td>Identifier of day type</td></tr><tr><td>C14</td><td>RUN (LL_KU_NR)</td><td>decimal (6)</td><td>1..99, NULL</td><td>AVMS</td><td>run number of a line round trip</td></tr><tr><td></td><td>JOURNEY_TYPE_N O (FAHRTART_NR)</td><td>decimal (2)</td><td>1..4</td><td>AVMS</td><td>Identifier of type of journey</td></tr></table>

<table><tr><td></td><td>TIMING_GROUP_NO (FGR_NR)</td><td>Decimal (9)</td><td>1.. 999999999</td><td>AVMS</td><td>Identifier of the running time group 12</td></tr><tr><td></td><td>ROUTE_ABBR (STR_LI_VAR)</td><td>char(6)</td><td>ISO 8859-1</td><td>AVMS</td><td>Identifier of variant on the line (or on the route in an area)</td></tr><tr><td>C23</td><td>BLOCK_NO (UM_UID)</td><td>decimal (8)</td><td>&amp;gt;0, NULL</td><td>AVMS</td><td>Identifier of vehicle round trip</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of JOURNEY (REC_FRT) is a secondary key in</td><td>JOURNEY (REC_FRT) has the following secondary key(s):</td></tr></table>

JOURNEY_WAIT_TIME BASE_VERSION LINE DAY_TYPE TIMING_GROUP JOURNEY_TYPE BLOCK

Note on scheduling vehicle round trips: there are basically two ways of scheduling vehicle round trips from the various relations.

1. All the vehicle round trips, including connection journeys, are fitted into the JOURNEY relation. The relations DEAD_RUN and DEAD_RUN_TIME are not used. The advantage lies in the fact that a JOURNEY_NO (FRT_FID) and the valid journey time group exist for each connection journey as well as for the other journeys in this relation. 
2. All the journeys, apart from connection journeys, are stored in JOURNEY. If, in the course of a vehicle round trip, it is discovered in JOURNEY that the location number of the destination of the  $x$ -th journey does not agree with the location number of the beginning of the  $x + 1$ -th journey, then a suitable connection journey has to be sought in the DEAD_RUN table. The valid journey time group for the connection journey is taken from or corresponds to that of the  $x$ -th journey. If the connection journey has no predecessor (  $x$ -th journey is missing, e.g. when departing from the depot), then the journey time group is taken from the  $x + 1$ -th journey.

Note on "missing" vehicle round trips: cf. 9.8.3

# 9.8.2 JOURNEY_WAIT_TIME (REC_FRT_HZT)

Description:

Journey waiting time at the bus stop. The waiting time is made up of the time it takes for passengers to board and unboard and an actual waiting time (e.g. arriving in time to ensure the connection). Journey waiting time at the bus stop may dependent of the course for stops within a line. For the first and last stop of the line it must be independent of the course.

<table><tr><td colspan="6">Table 308: JOURNEY_WAIT_TIME (REC_FRT_HZT)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td></td><td>Identifier of the general version</td></tr><tr><td>P2</td><td>JOURNEY_NO (FRT_FID)</td><td>decimal (8)</td><td>&amp;gt;0</td><td></td><td>Identifier of journey</td></tr><tr><td>P3</td><td>POINT_TYPE (ONR_TYP_NR)</td><td>decimal (2)</td><td>1..2</td><td></td><td>Location type</td></tr><tr><td>P4</td><td>POINT_NO (ORT_NR)</td><td>decimal (6)</td><td>&amp;gt;0</td><td></td><td>Location number of stopping point</td></tr><tr><td></td><td>JOURNEY_WAIT_TI ME (FRT_HZT_ZEIT)</td><td>decimal (6)</td><td>0..65532</td><td></td><td>Journey stopping time at a bus stop (in seconds)</td></tr></table>

<table><tr><td colspan="2">Links to other relations:</td></tr><tr><td>The primary key of 
JOURNEY_WAIT_TIME 
(REC_FRT_HZT) is a secondary key in</td><td>JOURNEY_WAIT_TIME (REC_FRT_HZT) has the following secondary key(s):</td></tr></table>

<table><tr><td rowspan="4">Non applicable</td><td>BASE_VERSION</td></tr><tr><td>POINT_TYPE</td></tr><tr><td>JOURNEY</td></tr><tr><td>STOP</td></tr></table>

# 9.8.3 BLOCK(REC UMLAUF)

Description:

Description of vehicle round trips. Each vehicle round trip must begin with departure from the depot and end with access to the depot.

<table><tr><td colspan="6">Table 310: BLOCK (REC UMLAUF)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>Decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of general version</td></tr><tr><td>P2</td><td>DAY_TYPE_NO (TAGESART_NR)</td><td>Decimal (3)</td><td>1..999</td><td>AVMS</td><td>Identifier of day type</td></tr><tr><td>P3</td><td>BLOCK_NO (UM_UID)</td><td>decimal (8)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of vehicle round trip</td></tr><tr><td></td><td>FROM_POINT_NO (ANF_ORT)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of beginning location of round trip</td></tr><tr><td></td><td>FROM_POINT_TYPE (ANF_ONR_TYP)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of beginning location of round trip (type: depot)</td></tr><tr><td></td><td>TO_POINT_NO (END_ORT)</td><td>decimal (6)</td><td>&amp;gt;0</td><td>AVMS</td><td>Location number of end location of round trip</td></tr><tr><td></td><td>TO_POINT_TYPE (END_ONR_TYP)</td><td>decimal (2)</td><td>1..2</td><td>AVMS</td><td>Location type of end location of round trip (type: depot)</td></tr><tr><td></td><td>VEHICLE_TYPE (VH_TYPE_NO (FZG_TYP_NR))</td><td>decimal (3)</td><td>1..252, NULL</td><td>AVMS</td><td>Identifier of vehicle type</td></tr><tr><td colspan="6">Links to other relations:</td></tr><tr><td colspan="3">The primary key of BLOCK (REC UMLAUF) is a secondary key in</td><td colspan="3">BLOCK (REC UMLAUF) has the following secondary key(s):</td></tr><tr><td colspan="3">JOURNEY</td><td colspan="3">BASE_VERSION</td></tr></table>

DAY_TYPE

VH_TYPE_NO (FZG_TYP_NR)

# Note:

Note: For certain import systems, information on vehicle round trips is not necessary (e.g. passenger counting, counting of handicapped people and timetable information). That is why in some transport companies, no round trip scheduling is carried out. In such a case, the exporting system assigns a "0" to UM_ID in the interface file (ZERO in the database). Therefore, the round trip table (9.8.3) becomes an optional table, except when updating an AVMS.

# 10 Interface Description: Connection Data for AVMS

The tables JOURNEY_CONNECTION (Einzelanschluss) and INTERCHANGE (REC_UMS) added in this chapter allow the transfer of connection definitions and their validities, for example from a planning system to an AVMS. Thus providing the necessary information for the AVMS to monitor and protect connections.

The attributes ConnectionLinkRef (ASBID) $^{13}$ , LINE_ID (LinienID) and DIRECTION_ID (RichtungslD) provide the possibility to protect connections with vehicles not monitored by the AVMS ('foreign' vehicles) using the "Integration Interface for Automatic Vehicle Management Systems" described in VDV recommendation 453, Version 2.1.

# 10.1 JOURNEY CONNECTION (EINZELANSCHLUSS) (432)

Description:

These definitions of connections will be transferred to the AVMS and will subsequently will be used for the connection protection by the AVMS.

<table><tr><td colspan="6">Table: JOURNEY_CONNECTION (EINZELANSCHLUSS) (432)</td></tr><tr><td>Key</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION
(BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of general version</td></tr><tr><td>P2</td><td>CONNECTION_ID
(EINAN_NR)</td><td>decimal (5)</td><td>1..32764</td><td>AVMS</td><td>Unique identification number of the connection</td></tr><tr><td></td><td>CONNECTION_NAME
(ANSCHLUSS_NAME)</td><td>char(40)</td><td>ISO 8859-1</td><td>AVMS</td><td>Text to name the connection</td></tr><tr><td></td><td>PRIORITY
(ANSCHLUSS_GRUPPE)</td><td>char(6)</td><td>ISO 8859-1</td><td></td><td>Free grouping of connections to reflect priorities.</td></tr><tr><td></td><td>CONTROL CENTRE
CODE
(LEITSTELLENKENNUNG)</td><td>decimal (3)</td><td>1..255 (0)</td><td>AVMS</td><td>Identification of the AVMS Control Centre information is exchanged with. (see VDV- 453). If the FEEDER belongs to the foreign control centre the attribute is filled with a value of &amp;gt; 0. The value of this attribute defines which combination of attributes will be read: If the Control Centre Code = 0 the following attributes will be read:
• FEEDER_LINE_NO
• FEEDER_DIRECTION
• FEEDER_STOP_NO
If Control Centre Code &amp;gt; 0
• LINE_ID,
• DIRECTION_ID
• CONNECTIONLINKREF
Will be supplied. Not supplied attributes will be assumed as 0 or &quot;.&quot;.</td></tr><tr><td></td><td>FEEDER_LINE_NO
(ZUB_LL_NR)</td><td>decimal (6)</td><td>1..999</td><td></td><td>Identifier of transport supply in terms of line or area 2)</td></tr></table>

<table><tr><td></td><td>FEEDER_DIRECTION
(ZUB_LL_RI_NR)</td><td>decimal (3)</td><td>1..2 (0)</td><td></td><td>Identifier of line direction 2)</td></tr><tr><td></td><td>FEEDER_STOP_NO
(ZUB_ORT_REF_ORT)</td><td>decimal (6)</td><td>&amp;gt;01)</td><td></td><td>Point where passengers alight from a Feeder vehicle to change to the fetcher vehicle.</td></tr><tr><td></td><td>LINE_ID
(LinienID)</td><td>char(6)</td><td>ISO 8859-1</td><td></td><td>Identifier of the Feeder line; must be supplied instead of FEEDER_LINE_NO if the feeder feeder belongs to a &#x27;foreign&#x27; AVMS system (control centre). (see VDV453)</td></tr><tr><td></td><td>DIRECTION_ID
(RichtungsID)</td><td>char(6)</td><td>ISO 8859-1</td><td></td><td>Identifier of the Feeder direction; must be supplied instead of FEEDER_DIRECTION if the feeder feeder belongs to a &#x27;foreign&#x27; AVMS system (control centre). (see VDV453)</td></tr><tr><td></td><td>ConnectionLinkRef14
(ASBID)</td><td>char(10)</td><td>ISO 8859-1</td><td></td><td>Identifier of the connection protection area agreed by the participating control centres and associated with feeder arrival and distributor departure stop points known within the respective PT network. Only supplied if the feeder belongs to a &#x27;foreign&#x27; AVMS system (control centre). (see VDV453)</td></tr><tr><td></td><td>FETCHER_LINE_NO
(ABB_LL_NR)</td><td>decimal (6)</td><td>1..999</td><td>AVMS</td><td>Line identifier of the fetcher 2)</td></tr><tr><td></td><td>FETCHER_DIRECTION
(ABB_LL_RI_NR)</td><td>decimal (3)</td><td>1..2, (0)</td><td>AVMS</td><td>Identifier of line direction of the fetcher 2)</td></tr><tr><td></td><td>FETCHER_STOP_NO
(ABB_ORT_REF_ORT)</td><td>decimal (6)</td><td>&amp;gt;01)</td><td>AVMS</td><td>Point where passengers board the Fetcher vehicle 3)</td></tr></table>

1) It is necessary to check whether the entire range of values can be used. Many PT companies use equipment that only allows a range of 1 - 9999. 
2) In order to highlight the difference between feeder and fetcher, the FEEDER and FETCHER prefixes have been added to the respective attributes. Thus the attributes names are different from what one might have expected from the first part of this recommendation or the OPNV data model 4.1.

# 10.2 INTERCHANGE (REC_UMS) (232)

Description:

The protection of connections may be restricted to certain day types and

times. Thus connections can have different validities. Depending on the time of day connections may have different interchange durations.

<table><tr><td colspan="6">Tabel: INTERCHANGE (REC. UMS) (232)</td></tr><tr><td>Ke y</td><td>Attribute Name (German Attribute Name)</td><td>Data Type</td><td>Range of Values</td><td>Needed for</td><td>Description</td></tr></table>

<table><tr><td>P1</td><td>BASE_VERSION (BASIS_VERSION)</td><td>decimal (9)</td><td>&amp;gt;0</td><td>AVMS</td><td>Identifier of general version</td></tr><tr><td>P2</td><td>CONNECTION_ID (EINAN_NR)</td><td>decimal (5)</td><td>1..32764</td><td>AVMS</td><td>Unique number for a connection</td></tr><tr><td>P3</td><td>DAY_TYPE_NO (TAGESART_NR)</td><td>decimal (3)</td><td>1..999</td><td>AVMS</td><td>Identifier of day type</td></tr><tr><td>P4</td><td>VALIDITY_START_TIME (UMS_BEGIN)</td><td>decimal (6)</td><td>0..129599</td><td>AVMS</td><td>Time in seconds after midnight for the validity start time within a day type.</td></tr><tr><td>P5</td><td>VALIDITY_END_TIME (UMS_ENDE)</td><td>decimal (6)</td><td>0..129599</td><td>AVMS</td><td>Time in seconds after midnight for the validity end time within a day type.</td></tr><tr><td></td><td>INTERCHANGE_STA NDARD_DURATION (UMS_MIN)</td><td>decimal (5)</td><td>0..65532</td><td>AVMS</td><td>Minimum changeover time in seconds for a passenger to get from the feeder stop point to the fetcher stop point.</td></tr><tr><td></td><td>INTERCHANGE_MAX IMUM_DURATION (UMS_MAX)</td><td>decimal (5)</td><td>0..65532</td><td>AVMS</td><td>Maximum changeover time in seconds allowed to the passenger to get from the feeder stop point to the fetcher stop point (inclusive of the waiting time) to still be called a connection. This attribute is used to form connection pairs.</td></tr></table>

<table><tr><td></td><td>MAXIMUM_WAIT_TI ME (MAX_VERZ_MAN)</td><td>decimal (5)</td><td>0..65532</td><td>AVMS</td><td>Maximum timetable deviation in seconds that is allowed for the fetcher as a consequence of a connection protection decision taken manually by a supervisor.</td></tr><tr><td></td><td>MAXIMUM_WAIT_TI ME_AUTO (MAX_VERZ_AUTO)</td><td>decimal (5)</td><td>0..65532</td><td>AVMS</td><td>Maximum timetable deviation in seconds that is allowed for the fetcher as a consequence of an automated connection protection decision by the AVMS system. A prolonged wait must be granted manually by a supervisor.</td></tr></table>

Use of font types for attribute names: normal = the name is the same as in VDV- data- model 4.1 (ÖPNV- Datenmodell 4.1)  italics = not in VDV- data- model 4.1 (ÖPNV- Datenmodell 4.1)  underline = element name derived from VDV453

# 11 Comparison German - English - Transmodel

The European standard EN12896, known as "Transmodel" (from EN12896, "Foreword")

Transmodel 5.1 is a reference standard which provides a conceptual data model for use by organisations with an interest in information systems for the public transport industry.

As a reference standard, it is not necessary for individual systems or specifications to implement Transmodel. However, it must be possible to describe (for those elements of systems, interfaces and specifications which fall within the scope of Transmodel):

the aspects of Transmodel that they have adopted and the aspects of Transmodel that they have chosen not to adopt.

For an organisation wishing to specify, acquire and operate information systems, Transmodel may be distilled, refined, or adapted to form a comprehensive data model for the organisation, or specific data models for database design or interface specification.

For an organisation wishing to design, develop and supply information systems, Transmodel may be distilled, refined, or adapted to form a comprehensive data model for the product suite.

For the potential users, the adoption of Transmodel as a basis for development means a common language is being used. Thus, users will understand and assess the claims of suppliers better, and specification developers will be more likely to be working in alignment with each other.

# How to obtain a copy of the standard

The documentation of the standard is available on the web site www.transmodel.org.

# Comparison

This chapter compares the data elements of this VDV Standard Interface Network / Timetable ("OPNV- Data Model 5.0", also called "VDV- data model") with those of Transmodel, in order to underline that the VDV- data model is the ready to implement realisation of the conceptual European data model, "TRANSMODEL".

<table><tr><td rowspan="2">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Tabel- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td>BASIS_VER_GUELTIGKEIT</td><td></td><td>BASE_VERSION_VALID</td><td></td><td>NETWORK_VERSION
VALIDITY</td><td></td></tr><tr><td></td><td>VER_GUELTIGKEIT</td><td></td><td>BASE_VERSION_VALID</td><td></td><td>NetworkVersion_Earliest Time</td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>MENGE_BASIS_VERSIONEN</td><td></td><td>BASE_VERSION</td><td></td><td>NETWORK_VERSION</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>BASIS_VERSION_TEXT</td><td></td><td>BASE_VERSION_DESC</td><td></td><td>Network Version_Name</td></tr><tr><td>FIRMENKALENDER</td><td></td><td>PERIOD</td><td></td><td>CALENDAR_DAY</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>BETREBSTAG</td><td></td><td>OPERATING_DAY</td><td></td><td>Operating Day_Date</td></tr><tr><td></td><td>BETREBSTAG_TEXT</td><td></td><td>OPERATING_DAY_DESC</td><td></td><td>Operating DayDesc</td></tr><tr><td></td><td>TAGESART_NR</td><td></td><td>DAY_TYPE_NO</td><td></td><td>Day Type_ID</td></tr><tr><td>MENGE_TAGESART</td><td></td><td>DAY_TYPE</td><td></td><td>DAY TYPE</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>TAGESART_NR</td><td></td><td>DAY_TYPE_NO</td><td></td><td>Day Type_ID</td></tr><tr><td></td><td>TAGESART_TEXT</td><td></td><td>DAY_TYPE_DESC</td><td></td><td>Day Type_Name</td></tr><tr><td>MENGE_ONR_TYP</td><td></td><td>POINT_TYPE</td><td></td><td>TYPE OF POINT</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>VDV</td><td>81</td><td>04.06.2008</td><td></td><td></td><td></td></tr></table>

<table><tr><td rowspan="2">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td></td><td>ONR_TYP_NR</td><td></td><td>PONT_TYPE</td><td></td><td>Type of Point_Name</td></tr><tr><td></td><td>STR_ONR_TYP</td><td></td><td>PONT_TYPE_ABBR</td><td></td><td>Type of Point_Short</td></tr><tr><td></td><td>ONR_TYP_TEXT</td><td></td><td>PONT_TYPE_DESC</td><td></td><td>Type of Point_Description</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>MENGE ORT_TYP</td><td></td><td>STOP_TYPE</td><td></td><td>PURPOSE OF GROUPING</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>ORT_TYP_NR</td><td></td><td>STOP_TYPE</td><td></td><td>Purpose of Grouping_ID</td></tr><tr><td></td><td>ORT_TYP_TEXT</td><td></td><td>STOP_TYPE_DESC</td><td></td><td>Purpose of Grouping_Description</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>REC_HP</td><td></td><td>STOP_POINT</td><td></td><td>STOP POINT</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>ONR_TYP_NR</td><td></td><td>PONT_TYPE</td><td></td><td>Type of Point_Name</td></tr><tr><td></td><td>ORT_NR</td><td></td><td>PONT_NO</td><td></td><td>Point_ID</td></tr><tr><td></td><td>HALTERPUNKT_NR</td><td></td><td>STOP_POINT_NO</td><td></td><td>Stopp Point_ID</td></tr><tr><td></td><td>ZUSATZ_INFO</td><td></td><td>STOP_POINT_DESC</td><td></td><td>Stop Point_Decription</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>REC_OM</td><td></td><td>ACTIVATION_POINT</td><td></td><td>ACTIVATION_POINT</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>ONR_TYP_NR</td><td></td><td>PONT_TYPE</td><td></td><td>Type of Point_ID</td></tr><tr><td></td><td>ORT_NR</td><td></td><td>PONT_NO</td><td></td><td>Point_ID</td></tr><tr><td></td><td>ORM_KUERZEL</td><td></td><td>ACT_POINT_ABBR</td><td></td><td>Activation</td></tr><tr><td></td><td>ORMACODE</td><td></td><td>ACT_POINT_CODE</td><td></td><td>Point_Abbreviation</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td>Activation Point_Code</td></tr></table>

<table><tr><td rowspan="3">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td>ORM_TEXT</td><td>ACT_POINT_DESC</td><td></td><td></td><td>Activation Point_Description</td></tr><tr><td rowspan="16">REC_ORT</td><td>BASIS_VERSION</td><td>BASE_VERSION</td><td rowspan="12">GROUP OF POINTS</td><td rowspan="12"></td><td></td></tr><tr><td>ONR_TYP_NR</td><td>POINT_TYPE</td><td>Network Version_ID</td></tr><tr><td>ORT_NR</td><td>POINT_NO</td><td>Type of Point_Name</td></tr><tr><td>ORT_NAME</td><td>POINT_DESC</td><td>Point_ID</td></tr><tr><td>ORT_REF_ORT</td><td>STOP_NO</td><td>Point_Name</td></tr><tr><td>ORT_REF_ORT_TYP</td><td>STOP_TYPE</td><td>Group of Points_ID</td></tr><tr><td>ORT_REF_ORT_LANGN</td><td rowspan="2">STOP_LONG_NO</td><td>Purpose of Grouping_ID</td></tr><tr><td>R</td><td>Group of Points_description</td></tr><tr><td>ORT_REF_ORT_KUERZ</td><td rowspan="2">STOP_ABBR</td><td>Group of</td></tr><tr><td>EL</td><td>Points_abbreviation</td></tr><tr><td>ORT_REF_ORT_NAME</td><td>STOP_DESC</td><td>Group of Points_Name</td></tr><tr><td>ZONE_WABE_NR</td><td>ZONE_CELL_NO</td><td>Zone_Cell_No</td></tr><tr><td>ORT_POS_LAENGE</td><td>POINT_LONGITUDE</td><td>LOCATION</td><td>COORDINATE_1</td><td></td></tr><tr><td>ORT_POS BREITE</td><td>POINT_LATITUDE</td><td>LOCATION</td><td>COORDINATE_2</td><td></td></tr><tr><td>ORT_POS_HOEHE</td><td>POINT_ELEVATION</td><td>LOCATION</td><td>COORDINATE_3</td><td></td></tr><tr><td>ORT_RichtUNG</td><td>POINT_HEADING</td><td>STOP POINT</td><td>heading</td><td></td></tr><tr><td rowspan="2">FAHRZEUG</td><td>BASIS_VERSION</td><td>VEHICLE</td><td rowspan="2">BASE_VERSION</td><td rowspan="2"></td><td>vehicle</td></tr><tr><td>FZG_NR</td><td>VEHICLE_NO</td><td>Network Version_ID</td></tr><tr><td>VDV</td><td>83</td><td>04.06.2008</td><td></td><td></td><td></td></tr></table>

<table><tr><td rowspan="6">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td>FZG_TYPE_NR</td><td></td><td>VEHICLE_TYPE</td><td></td><td>Vehicle Type_ID</td></tr><tr><td>POLKENN</td><td></td><td>VEHICLE_REG</td><td></td><td>Vehicle_Vehicle</td></tr><tr><td rowspan="2">UNTERNEHMEN</td><td></td><td>COMPANY</td><td></td><td>Registration Number</td></tr><tr><td></td><td></td><td></td><td>Company_Name</td></tr><tr><td rowspan="5">ZUL_VERKEHRSBETRIEB</td><td></td><td>TRANSPORT_COMPA
NY</td><td></td><td>TRANSPORT_COMPANY</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>UNTERNEHMEN</td><td></td><td>COMPANY</td><td></td><td>Company_Name</td></tr><tr><td>ABK_UNTERNEHMEN</td><td></td><td>COMPANY_ABBR</td><td></td><td>Company_Abbreviation</td></tr><tr><td>BETRHEBSGEBIET_BEZ</td><td></td><td>BUSINESS_AREA_DESC</td><td></td><td>Business_AreaDesc</td></tr><tr><td rowspan="7">MENGE_BEREICH</td><td></td><td>OPERATING_DEPART
MENT</td><td></td><td>OPERATING
DEPARTMENT</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>BEREICH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating</td></tr><tr><td>STR_BEREICH</td><td></td><td>OP_DEP_ABBR</td><td></td><td>Department_Name</td></tr><tr><td rowspan="3">BEREICH_TEXT</td><td></td><td>OP_DEP_DESC</td><td></td><td>Operating Department_Type
ofOperation</td></tr><tr><td></td><td></td><td></td><td>Operating</td></tr><tr><td></td><td></td><td></td><td>Department_description</td></tr><tr><td rowspan="2">MENGE_FZG_TYP</td><td></td><td>VEHICLE_TYPE</td><td></td><td>VEHICLE_TYPE</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>VDV</td><td>84</td><td>04.06.2008</td><td></td><td></td><td></td></tr></table>

<table><tr><td rowspan="2">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td></td><td>FZG_TYPE_NR</td><td></td><td>VH_TYPE_NO</td><td></td><td>Vehicle Type_ID</td></tr><tr><td></td><td>FZG_LAENGE</td><td></td><td>VH_TYPE_LENGTH</td><td></td><td>Vehicle Type_Length</td></tr><tr><td></td><td>FZG_TYPE_SITZ</td><td></td><td>VH_TYPE_SEAT</td><td></td><td>Vehicle Type_Seating</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td>Capacity</td></tr><tr><td></td><td>FZG_TYPE_STEH</td><td></td><td>VH_TYPE_STAND</td><td></td><td>Vehicle Type_Standing</td></tr><tr><td></td><td>FZG_TYPE_TEXT</td><td></td><td>VH_TYPE_DESC</td><td></td><td>Capacity</td></tr><tr><td></td><td>SONDER_PLATZ</td><td></td><td>VH_TYPE_SPEC_SEAT</td><td></td><td>Vehicle Type_Description</td></tr><tr><td></td><td>STR_FZG_TYP</td><td></td><td>VH_TYPE_ABBR</td><td></td><td>Vehicle Type_Name</td></tr><tr><td>REC_ANR</td><td></td><td>ANNOUNCEMENT</td><td></td><td>ANNOUNCEMENT</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>ANR_NR</td><td></td><td>ANN_NO</td><td></td><td>Announcement_ID</td></tr><tr><td></td><td>ANR_TEXT</td><td></td><td>ANN_DESC</td><td></td><td>Announcement_Decryption</td></tr><tr><td>REC_ZNR</td><td></td><td>DESTINATION</td><td></td><td></td><td>Destination Display</td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>ZNR_NR</td><td></td><td>DEST_NO</td><td></td><td>Destination Display_ID</td></tr><tr><td></td><td>FAHRERKURZTEXT</td><td></td><td>DEST_BRIEF_TEXT</td><td></td><td>Destination Display_Name</td></tr><tr><td></td><td>SEITENTEXT</td><td></td><td>DEST_SIDE_TEXT</td><td></td><td>Destination Display_Side</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td>Text</td></tr><tr><td></td><td>ZNR_TEXT</td><td></td><td>DEST_FRONT_TEXT</td><td></td><td>Destination Display_Front Text</td></tr></table>

<table><tr><td rowspan="3">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td>ZNR_CODE</td><td></td><td>DEST_CODE</td><td></td><td>Destination Display_Code</td></tr><tr><td rowspan="9">RECSEL</td><td></td><td>LINK</td><td></td><td>LINK</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>BERECH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating</td></tr><tr><td>ONR_TYP_NR</td><td></td><td>FROM_POINT_TYPE</td><td></td><td>Department_Name</td></tr><tr><td>ORT_NR</td><td></td><td>FROM_POINT_NO</td><td></td><td>Type of Point_Name (from)</td></tr><tr><td>SEL_ZIEL</td><td></td><td>TO_POINT_NO</td><td></td><td>Point_ID (from)</td></tr><tr><td>SEL_ZIEL_TYP</td><td></td><td>TO_POINT_TYPE</td><td></td><td>Point_ID (to)</td></tr><tr><td>SEL_LAENGE</td><td></td><td>LINK_DISTANCE</td><td></td><td>Type of Point_Name (to)</td></tr><tr><td></td><td></td><td></td><td></td><td>Link_Length</td></tr><tr><td rowspan="11">RECSEL_ZP</td><td></td><td>POINT_ON_LINK</td><td></td><td>POINT ON LINK</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>BERECH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating</td></tr><tr><td>ONR_TYP_NR</td><td></td><td>FROM_POINT_TYPE</td><td></td><td>Deparment_Name</td></tr><tr><td>ORT_NR</td><td></td><td>FROM_POINT_NO</td><td></td><td>Type of Point_Name (from)</td></tr><tr><td>SEL_ZIEL</td><td></td><td>TO_POINT_NO</td><td></td><td>Point_ID (from)</td></tr><tr><td>SEL_ZIEL_TYP</td><td></td><td>TO_POINT_TYPE</td><td></td><td></td></tr><tr><td>ZP_ONR</td><td></td><td>POINT_TO_LINK_NO</td><td></td><td>Type of Point_Name (to)</td></tr><tr><td>ZP_TYP</td><td></td><td>POINT_TO_LINK_TYPE</td><td></td><td>Point on Link_Order</td></tr><tr><td>SEL_ZP_LAENGE</td><td></td><td>POINT_TO_DISTANCE</td><td></td><td>Point on Link_Type</td></tr><tr><td></td><td></td><td></td><td></td><td>Point on Link_Distance from</td></tr></table>

<table><tr><td>Table name in German</td><td>Attribut German</td><td>Table name English</td><td>Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>MENGE_FGR</td><td></td><td>TIMING_GROUP</td><td></td><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>FGR_NR</td><td></td><td>TIMING_GROUP_NO</td><td></td><td>Time Demand Type_ID</td></tr><tr><td></td><td>FGR_TEXT</td><td></td><td>TIMING_GROUP_DESC</td><td></td><td>Time Demand</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td>Type_Description</td></tr><tr><td>ORT_HZTF</td><td></td><td>WAIT_TIME</td><td></td><td>JOURNEY PATTERN WAIT TIME</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>FGR_NR</td><td></td><td>TIMING_GROUP_NO</td><td></td><td>Time Demand Type_ID</td></tr><tr><td></td><td>ONR_TYPE_NR</td><td></td><td>PONT_TYPE</td><td></td><td>Type of Point_Name</td></tr><tr><td></td><td>ORT_NR</td><td></td><td>PONT_NO</td><td></td><td>Point_ID</td></tr><tr><td></td><td>HP_HZT</td><td></td><td>WAIT_TIME</td><td></td><td>Journey Pattern Wait Time_Duration</td></tr><tr><td>SEL_FZT_FELD</td><td></td><td>TRAVEL_TIME</td><td></td><td>DEFAULT SERVICE JOURNEY RUN TIME</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>BERECH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating Department_Name</td></tr><tr><td></td><td>FGR_NR</td><td></td><td>TIMING_GROUP_NO</td><td></td><td>Time Demand Type_ID</td></tr><tr><td></td><td>ONR_TYPE_NR</td><td></td><td>FROM_POINT_TYPE</td><td></td><td>Type of Point_Name (from)</td></tr><tr><td></td><td>ORT_NR</td><td></td><td>FROM_POINT_NO</td><td></td><td>Point_ID (from)</td></tr><tr><td></td><td>SEL_ZIEL</td><td></td><td>TO_POINT_NO</td><td></td><td>Point_ID (to)</td></tr></table>

<table><tr><td rowspan="4">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td>SEL_ZIEL_TYP</td><td></td><td>TO_POINT_TYPE</td><td></td><td>Type of Point_Name (to)</td></tr><tr><td>SEL_FZT</td><td></td><td>TRAVEL_TIME</td><td></td><td>Default Service Journey Run Time_Duration</td></tr><tr><td rowspan="8">REC_UEB</td><td></td><td>DEAD_RUN</td><td></td><td>DEAD_RUN_PATTERN</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>BERECH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating</td></tr><tr><td>ONR_TYP_NR</td><td></td><td>FROM_POINT_TYPE</td><td></td><td>Department_Name</td></tr><tr><td>ORT_NR</td><td></td><td>FROM_POINT_NO</td><td></td><td>Type of Point_Name (from)</td></tr><tr><td>UEB_ZIEL_TYP</td><td></td><td>TO_POINT_TYPE</td><td></td><td>Point_ID (from)</td></tr><tr><td>UEB_ZIEL</td><td></td><td>TO_POINT_NO</td><td></td><td>Type of Point_Name (to)</td></tr><tr><td>UEB_LAENGE</td><td></td><td>DEAD_RUN_DISTANCE</td><td></td><td>Dead_Run_Distance</td></tr><tr><td rowspan="9">UEB_FZT</td><td></td><td>DEAD_RUN_TIME</td><td></td><td>DEFAULT DEAD RUN TIME</td><td></td></tr><tr><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td>BERECH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating</td></tr><tr><td>FGR_NR</td><td></td><td>TIMING_GROUP_NO</td><td></td><td>Department_Name</td></tr><tr><td>ONR_TYP_NR</td><td></td><td>FROM_POINT_TYPE</td><td></td><td>Time Demand Type_ID</td></tr><tr><td>ORT_NR</td><td></td><td>FROM_POINT_NO</td><td></td><td>Type of Point_Name (from)</td></tr><tr><td>UEB_ZIEL_TYP</td><td></td><td>TO_POINT_TYPE</td><td></td><td>Point_ID (from)</td></tr><tr><td>UEB_ZIEL</td><td></td><td>TO_POINT_NO</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>Type of Point_Name (to)</td></tr></table>

<table><tr><td rowspan="3">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td>UEB_FAHRZEIT</td><td>TRAVEL_TIME</td><td></td><td></td><td>Default Dead Run Time_Duration</td></tr><tr><td rowspan="4">MENGE_FAHRTART</td><td>BASIS_VERSION</td><td rowspan="4">JOURNEY_TYPE</td><td>BASE_VERSION</td><td rowspan="4">TYPE OF JOURNEY</td><td></td></tr><tr><td>FAHRTART_NR</td><td>JOURNEY_TYPE_NO</td><td>Network Version_ID</td></tr><tr><td rowspan="2">STR_FAHRTART</td><td rowspan="2">JOURNEY_TYPE_DESC</td><td>Type of Journey_ID</td></tr><tr><td>Type of Journey_Name</td></tr><tr><td rowspan="11">LID_VERLAUF</td><td>BASIS_VERSION</td><td rowspan="11">ROUTE_SEQUENCE</td><td></td><td rowspan="11">POINT IN JOURNEY PATTERN</td><td></td></tr><tr><td>LI_LFD_NR</td><td>BASE_VERSION</td><td>Network Version_ID</td></tr><tr><td>LI_NR</td><td>SEQUENCE_NO</td><td>Point in Journey Pattern_Order</td></tr><tr><td>STR_LI_VAR</td><td>LINE_NO</td><td>Line_ID</td></tr><tr><td>ONR_TYP_NR</td><td>ROUTE_ABBR</td><td>Route_Abbr</td></tr><tr><td>ORT_NR</td><td>POINT_TYPE</td><td>Type of Point_Name</td></tr><tr><td>ZNR_NR</td><td>POINT_NO</td><td>Point_ID</td></tr><tr><td>ANR_NR</td><td>DEST_NO</td><td>Dest_No</td></tr><tr><td>EINFANGBEREICH</td><td>ANN_NO</td><td>Ann_No</td></tr><tr><td rowspan="2">LI_KNOTEN</td><td>LOCKIN_RANGE</td><td>Lockin_Range</td></tr><tr><td>LINE_NODE</td><td>Line_Node</td></tr><tr><td>REC_LID</td><td>BASIS_VERSION</td><td>LINE</td><td>BASE_VERSION</td><td>JOURNEY PATTERN</td><td></td></tr><tr><td>VDV</td><td>89</td><td>04.06.2008</td><td></td><td></td><td></td></tr></table>

<table><tr><td rowspan="2">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td></td><td>LI_NR</td><td></td><td>LINE_NO</td><td></td><td>Line_ID</td></tr><tr><td></td><td>STR_LI_VAR</td><td></td><td>ROUTE_ABBR</td><td></td><td>Route_Abbr</td></tr><tr><td></td><td>ROUTEN_NR</td><td></td><td>ROUTE_NO</td><td></td><td>Journey Pattern_ID</td></tr><tr><td></td><td>LI_RI_NR</td><td></td><td>DIRECTION</td><td></td><td>Direction_ID</td></tr><tr><td></td><td>BERECH_NR</td><td></td><td>OP_DEP_NO</td><td></td><td>Operating</td></tr><tr><td></td><td>LI_KUERZEL</td><td></td><td>LINE_ABBR</td><td></td><td>Department_Name</td></tr><tr><td></td><td>LIDNAME</td><td></td><td>LINE_DESC</td><td></td><td>Line_Name</td></tr><tr><td></td><td>ROUTEN_ART</td><td></td><td>ROUTE_TYPE</td><td></td><td>Line_Description</td></tr><tr><td></td><td>LINIEN_CODE</td><td></td><td>LINE_CODE</td><td></td><td>Line_Code</td></tr><tr><td>REC_FRT</td><td></td><td>JOURNEY</td><td></td><td>VEHICLE JOURNEY</td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>FRT_FID</td><td></td><td>JOURNEY_NO</td><td></td><td>Vehicle Journey_ID</td></tr><tr><td></td><td>FRT_START</td><td></td><td>DEPARTURE_TIME</td><td></td><td>Vehicle Journey_Departure Time</td></tr><tr><td></td><td>LI_NR</td><td></td><td>LINE_NO</td><td></td><td>Line_ID</td></tr><tr><td></td><td>TAGESART_NR</td><td></td><td>DAY_TYPE_NO</td><td></td><td>Day Type_ID</td></tr><tr><td></td><td>LI_KU_NR</td><td></td><td>RUN</td><td></td><td>Journey Pattern_ID?</td></tr><tr><td></td><td>FAHRTART_NR</td><td></td><td>JOURNEY_TYPE</td><td></td><td>Type of Journey_ID</td></tr><tr><td></td><td>FGR_NR</td><td></td><td>TIMING_GROUP_NO</td><td></td><td>Time Demand Type_ID</td></tr><tr><td></td><td>STR_LI_VAR</td><td></td><td>ROUTE_ABBR</td><td></td><td>Route_Abbr</td></tr><tr><td></td><td>UM_UD</td><td></td><td>BLOCK_NO</td><td></td><td>Block_ID</td></tr></table>

<table><tr><td rowspan="2">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td rowspan="7">RECC_FRT_HZT</td><td></td><td>JOURNEY_WAIT_TIM</td><td>E</td><td>VEHICLE_JOURNEY WAIT</td><td>TIME</td></tr><tr><td>BASIS_VERSION</td><td>BASE_VERSION</td><td></td><td></td><td>Network Version_ID</td></tr><tr><td>FRT_FID</td><td>JOURNEY_NO</td><td></td><td></td><td>Vehicle Journey_ID</td></tr><tr><td>ONR_TYP_NR</td><td>PONT_TYPE</td><td></td><td></td><td>Type of Point_Name</td></tr><tr><td>ORT_NR</td><td>PONT_NO</td><td></td><td></td><td>Point_ID</td></tr><tr><td rowspan="2">FRT_HZT_ZEIT</td><td rowspan="2">JOURNEY_WAIT_TIME</td><td rowspan="2"></td><td rowspan="2"></td><td>Vehicle_Journey Wait</td></tr><tr><td>Time_Duration</td></tr><tr><td rowspan="9">RECUMLAUF</td><td></td><td>BLOCK</td><td></td><td>BLOCK</td><td></td></tr><tr><td>BASIS_VERSION</td><td>BASE_VERSION</td><td></td><td></td><td>Network Version_ID</td></tr><tr><td>TAGESART_NR</td><td>DAY_TYPE_NO</td><td></td><td></td><td>Day Type_ID</td></tr><tr><td>UM_UD</td><td>BLOCK_NO</td><td></td><td></td><td>Block_ID</td></tr><tr><td>ANF_CRT</td><td>FROM_POINT_NO</td><td></td><td></td><td>Point_ID (from)</td></tr><tr><td>ANF_ONR_TYPE</td><td>FROM_POINT_TYPE</td><td></td><td></td><td>Type of Point_Name (from)</td></tr><tr><td>END_CRT</td><td>TO_POINT_NO</td><td></td><td></td><td>Point_ID (to)</td></tr><tr><td>END_ONR_TYPE</td><td>TO_POINT_TYPE</td><td></td><td></td><td>Type of Point_Name (to)</td></tr><tr><td>FZG_TYP_NR</td><td>VH_TYPE_NO</td><td></td><td></td><td>Vehicle Type_ID</td></tr><tr><td rowspan="5">EINZELANSCHLUSS</td><td></td><td>JOURNEY_CONNECT</td><td>ON</td><td>SERVICE_JOURNEY</td><td>INTERCHANGE</td></tr><tr><td>BASIS_VERSION</td><td>BASE_VERSION</td><td></td><td></td><td>Network Version_ID</td></tr><tr><td>EINAN_NR</td><td>CONNECTION_ID</td><td></td><td></td><td></td></tr><tr><td>ANSCHLUSS_NAME</td><td>CONNECTION_NAME</td><td></td><td></td><td></td></tr><tr><td>ANSCHLUSS_GRUPPE</td><td>PRIORITY</td><td></td><td></td><td></td></tr><tr><td>VDV</td><td>91</td><td>04.06.2008</td><td></td><td></td><td></td></tr></table>

<table><tr><td rowspan="2">Table name in German</td><td rowspan="2">Attribut German</td><td rowspan="2">Table name English</td><td rowspan="2">Attribut English</td><td colspan="2">italics = not in Transmodel</td></tr><tr><td>Label- name Transmodel</td><td>Attribut Transmodel</td></tr><tr><td></td><td>LEITSTELLENKENNUNG</td><td></td><td>CONTROL CENTRE CODE</td><td></td><td></td></tr><tr><td></td><td>ZUB_LL_NR</td><td></td><td>FEEDER_LINE_NO</td><td></td><td></td></tr><tr><td></td><td>ZUB_LL_RL_NR</td><td></td><td>FEEDER_DIRECTION</td><td></td><td></td></tr><tr><td></td><td>ZUB_CRT_REF_ORT</td><td></td><td>FEEDER_STOP_NO</td><td></td><td></td></tr><tr><td></td><td>LinellD</td><td></td><td>LINE_ID</td><td></td><td></td></tr><tr><td></td><td>RichtungsiD</td><td></td><td>DIRECTION_ID</td><td></td><td></td></tr><tr><td></td><td>ASBD</td><td></td><td>CONNECTIONLINKREF</td><td></td><td></td></tr><tr><td></td><td>ABB_LL_NR</td><td></td><td>FETCHER_LINE_NO</td><td></td><td></td></tr><tr><td></td><td>ABB_LL_RL_NR</td><td></td><td>FETCHER_DIRECTION</td><td></td><td></td></tr><tr><td></td><td>ABB_CRT_REF_ORT</td><td></td><td>FETCHER_STOP_NO</td><td></td><td></td></tr><tr><td>REC_UMS (232)</td><td></td><td>INTERCHANGE (232)</td><td></td><td></td><td></td></tr><tr><td></td><td>BASIS_VERSION</td><td></td><td>BASE_VERSION</td><td></td><td>Network Version_ID</td></tr><tr><td></td><td>EINAN_NR</td><td></td><td>CONNECTION_ID</td><td></td><td></td></tr><tr><td></td><td>TAGESART_NR</td><td></td><td>DAY_TYPE_NO</td><td></td><td>DAY TYPE ID</td></tr><tr><td></td><td>UMS_BEGIN</td><td></td><td>VALIDITY_START_TIME</td><td></td><td></td></tr><tr><td></td><td>UMS_ENDE</td><td></td><td>VALIDITY_END_TIME</td><td></td><td></td></tr><tr><td></td><td>UMS_MIN</td><td></td><td>INTERCHANGE_STANDARD_DU</td><td></td><td>INTERCHANGE_STANDARD_D_DURATION</td></tr><tr><td></td><td>UMS_MAX</td><td></td><td>RATION</td><td></td><td>DEFAULT INTERCHANGE MAXIMUM_DURATON</td></tr><tr><td></td><td>MAX_VERZ_MAN</td><td></td><td>MAXIMUM_WAIT_TIME</td><td></td><td>SERVICE JOURNEY</td></tr><tr><td></td><td>MAX_VERZ_AUT</td><td></td><td>MAXIMUM_WAIT_TIME_AUTO</td><td></td><td>MAXIMUM WAIT TIME</td></tr></table>

<table><tr><td>Table name in German</td><td>Attribut German</td><td>Table name English</td><td>Attribut English</td><td>italics = not in Transmodel
Tabel- name Transmodel</td><td>Attribut Transmodel</td></tr></table>

# 12 Possible future developments and Options

12 Possible future developments and OptionsThis annex shall help to avoid contradictions between developments for specific projects. Therefore all users of this VDV – specification are kindly requested to inform VDV about enhancements built for their customers: tables, value ranges or supplementary data elements. They will be published (http://www.vdv.de/wir_ueber_uns/vdv_projekte/oepnv_datenmodell.html) and possibly will get part of a future version of this specification.

Mail: Bruns@VDV.de