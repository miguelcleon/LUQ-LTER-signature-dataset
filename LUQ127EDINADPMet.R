# Package ID: knb-lter-luq.127.1676174 Cataloging System:https://pasta.edirepository.org.
# Data set title: Meteorological data from El Verde Field Station: NADP Tower.
# Data set creator:  Alonso RamÃ­rez - North Carolina State University 
# Contact:  Jamarys Torres-Diaz -  University of Puerto Rico, Rio Piedras Campus  - jamarys.torres@upr.edu
# Contact:  Samuel Matta -    - smatta@ites.upr.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

# inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676174/aef5f0ea2a4a1c5c5fa5599ba86e2662"
infilehash1 <- "/8fdd12142875cd2c5ff38b7de0dba656"
infilehash2 <- "aef5f0ea2a4a1c5c5fa5599ba86e2662"
infilehash3 <- "08c01f17d967490a05ac097a1b72bde5"

packageid <- "1676179"
inUrl1  <- paste0("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/",
                  packageid, infilehash1)
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F
               ,skip=1
               ,sep=","
               , col.names=c(
                 "Date.of.measurements",
                 "YEAR",
                 "JULIAN",
                 "RAIN_MM",
                 "RELHUMMAX",
                 "RELHUMMAXTIME_HHMM",
                 "TEMPMAX_DEGREESCELSIUS",
                 "TEMPMAXTIME_HHMM",
                 "RELHUMMIN",
                 "RELHUMMINTIME_HHMM",
                 "TEMPMIN_DEGREESCELSIUS",
                 "MINTEMPTIME_HHMM",
                 "SOLARRAD_KJOULES_M2",
                 "PPFD_MILLIMOLES_M2",
                 "WINDSPEEDAVER_M_S",
                 "WINDDIR_DEGREES",
                 "SDWINDDIR",
                 "WINDROSE1.hyphen.45_M_S",
                 "WINDROSE46.hyphen.90_M_S",
                 "WINDROSE91.hyphen.135_M_S",
                 "WINDROSE136.hyphen.180_M_S",
                 "WINDROSE181.hyphen.225_M_S",
                 "WINDROSE226.hyphen.270_M_S",
                 "WINDROSE271.hyphen.315_M_S",
                 "WINDROSE316.hyphen.360_M_S",
                 "Comments"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$YEAR)!="factor") dt1$YEAR<- as.factor(dt1$YEAR)
if (class(dt1$JULIAN)!="factor") dt1$JULIAN<- as.factor(dt1$JULIAN)
if (class(dt1$RAIN_MM)=="factor") dt1$RAIN_MM <-as.numeric(levels(dt1$RAIN_MM))[as.integer(dt1$RAIN_MM) ]
if (class(dt1$RAIN_MM)=="character") dt1$RAIN_MM <-as.numeric(dt1$RAIN_MM)
if (class(dt1$RELHUMMAX)=="factor") dt1$RELHUMMAX <-as.numeric(levels(dt1$RELHUMMAX))[as.integer(dt1$RELHUMMAX) ]
if (class(dt1$RELHUMMAX)=="character") dt1$RELHUMMAX <-as.numeric(dt1$RELHUMMAX)
if (class(dt1$RELHUMMAXTIME_HHMM)!="factor") dt1$RELHUMMAXTIME_HHMM<- as.factor(dt1$RELHUMMAXTIME_HHMM)
if (class(dt1$TEMPMAX_DEGREESCELSIUS)=="factor") dt1$TEMPMAX_DEGREESCELSIUS <-as.numeric(levels(dt1$TEMPMAX_DEGREESCELSIUS))[as.integer(dt1$TEMPMAX_DEGREESCELSIUS) ]
if (class(dt1$TEMPMAX_DEGREESCELSIUS)=="character") dt1$TEMPMAX_DEGREESCELSIUS <-as.numeric(dt1$TEMPMAX_DEGREESCELSIUS)
if (class(dt1$TEMPMAXTIME_HHMM)!="factor") dt1$TEMPMAXTIME_HHMM<- as.factor(dt1$TEMPMAXTIME_HHMM)
if (class(dt1$RELHUMMIN)=="factor") dt1$RELHUMMIN <-as.numeric(levels(dt1$RELHUMMIN))[as.integer(dt1$RELHUMMIN) ]
if (class(dt1$RELHUMMIN)=="character") dt1$RELHUMMIN <-as.numeric(dt1$RELHUMMIN)
if (class(dt1$RELHUMMINTIME_HHMM)!="factor") dt1$RELHUMMINTIME_HHMM<- as.factor(dt1$RELHUMMINTIME_HHMM)
if (class(dt1$TEMPMIN_DEGREESCELSIUS)=="factor") dt1$TEMPMIN_DEGREESCELSIUS <-as.numeric(levels(dt1$TEMPMIN_DEGREESCELSIUS))[as.integer(dt1$TEMPMIN_DEGREESCELSIUS) ]
if (class(dt1$TEMPMIN_DEGREESCELSIUS)=="character") dt1$TEMPMIN_DEGREESCELSIUS <-as.numeric(dt1$TEMPMIN_DEGREESCELSIUS)
if (class(dt1$MINTEMPTIME_HHMM)!="factor") dt1$MINTEMPTIME_HHMM<- as.factor(dt1$MINTEMPTIME_HHMM)
if (class(dt1$SOLARRAD_KJOULES_M2)=="factor") dt1$SOLARRAD_KJOULES_M2 <-as.numeric(levels(dt1$SOLARRAD_KJOULES_M2))[as.integer(dt1$SOLARRAD_KJOULES_M2) ]
if (class(dt1$SOLARRAD_KJOULES_M2)=="character") dt1$SOLARRAD_KJOULES_M2 <-as.numeric(dt1$SOLARRAD_KJOULES_M2)
if (class(dt1$PPFD_MILLIMOLES_M2)=="factor") dt1$PPFD_MILLIMOLES_M2 <-as.numeric(levels(dt1$PPFD_MILLIMOLES_M2))[as.integer(dt1$PPFD_MILLIMOLES_M2) ]
if (class(dt1$PPFD_MILLIMOLES_M2)=="character") dt1$PPFD_MILLIMOLES_M2 <-as.numeric(dt1$PPFD_MILLIMOLES_M2)
if (class(dt1$WINDSPEEDAVER_M_S)=="factor") dt1$WINDSPEEDAVER_M_S <-as.numeric(levels(dt1$WINDSPEEDAVER_M_S))[as.integer(dt1$WINDSPEEDAVER_M_S) ]
if (class(dt1$WINDSPEEDAVER_M_S)=="character") dt1$WINDSPEEDAVER_M_S <-as.numeric(dt1$WINDSPEEDAVER_M_S)
if (class(dt1$WINDDIR_DEGREES)=="factor") dt1$WINDDIR_DEGREES <-as.numeric(levels(dt1$WINDDIR_DEGREES))[as.integer(dt1$WINDDIR_DEGREES) ]
if (class(dt1$WINDDIR_DEGREES)=="character") dt1$WINDDIR_DEGREES <-as.numeric(dt1$WINDDIR_DEGREES)
if (class(dt1$SDWINDDIR)=="factor") dt1$SDWINDDIR <-as.numeric(levels(dt1$SDWINDDIR))[as.integer(dt1$SDWINDDIR) ]
if (class(dt1$SDWINDDIR)=="character") dt1$SDWINDDIR <-as.numeric(dt1$SDWINDDIR)
if (class(dt1$WINDROSE1.hyphen.45_M_S)=="factor") dt1$WINDROSE1.hyphen.45_M_S <-as.numeric(levels(dt1$WINDROSE1.hyphen.45_M_S))[as.integer(dt1$WINDROSE1.hyphen.45_M_S) ]
if (class(dt1$WINDROSE1.hyphen.45_M_S)=="character") dt1$WINDROSE1.hyphen.45_M_S <-as.numeric(dt1$WINDROSE1.hyphen.45_M_S)
if (class(dt1$WINDROSE46.hyphen.90_M_S)=="factor") dt1$WINDROSE46.hyphen.90_M_S <-as.numeric(levels(dt1$WINDROSE46.hyphen.90_M_S))[as.integer(dt1$WINDROSE46.hyphen.90_M_S) ]
if (class(dt1$WINDROSE46.hyphen.90_M_S)=="character") dt1$WINDROSE46.hyphen.90_M_S <-as.numeric(dt1$WINDROSE46.hyphen.90_M_S)
if (class(dt1$WINDROSE91.hyphen.135_M_S)=="factor") dt1$WINDROSE91.hyphen.135_M_S <-as.numeric(levels(dt1$WINDROSE91.hyphen.135_M_S))[as.integer(dt1$WINDROSE91.hyphen.135_M_S) ]
if (class(dt1$WINDROSE91.hyphen.135_M_S)=="character") dt1$WINDROSE91.hyphen.135_M_S <-as.numeric(dt1$WINDROSE91.hyphen.135_M_S)
if (class(dt1$WINDROSE136.hyphen.180_M_S)=="factor") dt1$WINDROSE136.hyphen.180_M_S <-as.numeric(levels(dt1$WINDROSE136.hyphen.180_M_S))[as.integer(dt1$WINDROSE136.hyphen.180_M_S) ]
if (class(dt1$WINDROSE136.hyphen.180_M_S)=="character") dt1$WINDROSE136.hyphen.180_M_S <-as.numeric(dt1$WINDROSE136.hyphen.180_M_S)
if (class(dt1$WINDROSE181.hyphen.225_M_S)=="factor") dt1$WINDROSE181.hyphen.225_M_S <-as.numeric(levels(dt1$WINDROSE181.hyphen.225_M_S))[as.integer(dt1$WINDROSE181.hyphen.225_M_S) ]
if (class(dt1$WINDROSE181.hyphen.225_M_S)=="character") dt1$WINDROSE181.hyphen.225_M_S <-as.numeric(dt1$WINDROSE181.hyphen.225_M_S)
if (class(dt1$WINDROSE226.hyphen.270_M_S)=="factor") dt1$WINDROSE226.hyphen.270_M_S <-as.numeric(levels(dt1$WINDROSE226.hyphen.270_M_S))[as.integer(dt1$WINDROSE226.hyphen.270_M_S) ]
if (class(dt1$WINDROSE226.hyphen.270_M_S)=="character") dt1$WINDROSE226.hyphen.270_M_S <-as.numeric(dt1$WINDROSE226.hyphen.270_M_S)
if (class(dt1$WINDROSE271.hyphen.315_M_S)=="factor") dt1$WINDROSE271.hyphen.315_M_S <-as.numeric(levels(dt1$WINDROSE271.hyphen.315_M_S))[as.integer(dt1$WINDROSE271.hyphen.315_M_S) ]
if (class(dt1$WINDROSE271.hyphen.315_M_S)=="character") dt1$WINDROSE271.hyphen.315_M_S <-as.numeric(dt1$WINDROSE271.hyphen.315_M_S)
if (class(dt1$WINDROSE316.hyphen.360_M_S)=="factor") dt1$WINDROSE316.hyphen.360_M_S <-as.numeric(levels(dt1$WINDROSE316.hyphen.360_M_S))[as.integer(dt1$WINDROSE316.hyphen.360_M_S) ]
if (class(dt1$WINDROSE316.hyphen.360_M_S)=="character") dt1$WINDROSE316.hyphen.360_M_S <-as.numeric(dt1$WINDROSE316.hyphen.360_M_S)
if (class(dt1$Comments)!="factor") dt1$Comments<- as.factor(dt1$Comments)

# Convert Missing Values to NA for non-dates

dt1$RELHUMMIN <- ifelse((trimws(as.character(dt1$RELHUMMIN))==trimws("blank")),NA,dt1$RELHUMMIN)
suppressWarnings(dt1$RELHUMMIN <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt1$RELHUMMIN))==as.character(as.numeric("blank"))),NA,dt1$RELHUMMIN))
dt1$RELHUMMIN <- ifelse((trimws(as.character(dt1$RELHUMMIN))==trimws("-99999")),NA,dt1$RELHUMMIN)
suppressWarnings(dt1$RELHUMMIN <- ifelse(!is.na(as.numeric("-99999")) & (trimws(as.character(dt1$RELHUMMIN))==as.character(as.numeric("-99999"))),NA,dt1$RELHUMMIN))
dt1$TEMPMIN_DEGREESCELSIUS <- ifelse((trimws(as.character(dt1$TEMPMIN_DEGREESCELSIUS))==trimws("blank")),NA,dt1$TEMPMIN_DEGREESCELSIUS)
suppressWarnings(dt1$TEMPMIN_DEGREESCELSIUS <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt1$TEMPMIN_DEGREESCELSIUS))==as.character(as.numeric("blank"))),NA,dt1$TEMPMIN_DEGREESCELSIUS))
dt1$TEMPMIN_DEGREESCELSIUS <- ifelse((trimws(as.character(dt1$TEMPMIN_DEGREESCELSIUS))==trimws("-99999")),NA,dt1$TEMPMIN_DEGREESCELSIUS)
suppressWarnings(dt1$TEMPMIN_DEGREESCELSIUS <- ifelse(!is.na(as.numeric("-99999")) & (trimws(as.character(dt1$TEMPMIN_DEGREESCELSIUS))==as.character(as.numeric("-99999"))),NA,dt1$TEMPMIN_DEGREESCELSIUS))


# Here is the structure of the input data frame:
str(dt1)
attach(dt1)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Date.of.measurements)
summary(YEAR)
summary(JULIAN)
summary(RAIN_MM)
summary(RELHUMMAX)
summary(RELHUMMAXTIME_HHMM)
summary(TEMPMAX_DEGREESCELSIUS)
summary(TEMPMAXTIME_HHMM)
summary(RELHUMMIN)
summary(RELHUMMINTIME_HHMM)
summary(TEMPMIN_DEGREESCELSIUS)
summary(MINTEMPTIME_HHMM)
summary(SOLARRAD_KJOULES_M2)
summary(PPFD_MILLIMOLES_M2)
summary(WINDSPEEDAVER_M_S)
summary(WINDDIR_DEGREES)
summary(SDWINDDIR)
summary(WINDROSE1.hyphen.45_M_S)
summary(WINDROSE46.hyphen.90_M_S)
summary(WINDROSE91.hyphen.135_M_S)
summary(WINDROSE136.hyphen.180_M_S)
summary(WINDROSE181.hyphen.225_M_S)
summary(WINDROSE226.hyphen.270_M_S)
summary(WINDROSE271.hyphen.315_M_S)
summary(WINDROSE316.hyphen.360_M_S)
summary(Comments)
# Get more details on character variables

summary(as.factor(dt1$YEAR)) 
summary(as.factor(dt1$JULIAN)) 
summary(as.factor(dt1$RELHUMMAXTIME_HHMM)) 
summary(as.factor(dt1$TEMPMAXTIME_HHMM)) 
summary(as.factor(dt1$RELHUMMINTIME_HHMM)) 
summary(as.factor(dt1$MINTEMPTIME_HHMM)) 
summary(as.factor(dt1$Comments))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676179/aef5f0ea2a4a1c5c5fa5599ba86e2662"
inUrl2  <- paste0("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/",
                  packageid, "/", infilehash2)
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")
infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676179/aef5f0ea2a4a1c5c5fa5599ba86e2662")
infile2 <-sub("^https","http",infile2)
dt2 <-read_delim(infile2
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
                        "datetime",
                        "YEAR",
                        "JULIAN",
                        "RAIN_MM",
                        "RELHUMMAX",
                        "RELHUMMAXTIME_HHMM",
                        "TEMPMAX_DEGREESCELSIUS",
                        "TEMPMAXTIME_HHMM",
                        "RELHUMMIN",
                        "RELHUMMINTIME_HHMM",
                        "TEMPMIN_DEGREESCELSIUS",
                        "MINTEMPTIME_HHMM",
                        "SOLARRAD_KJOULES_M2",
                        "PPFD_MILLIMOLES_M2",
                        "WINDSPEEDAVER_M_S",
                        "WINDSPEEDMAX",
                        "WINDDIR_DEGREES",
                        "WINDSPEEDMAX_HHMM",
                        "SDWINDDIR",
                        "WINDROSE1.hyphen.45_M_S",
                        "WINDROSE46.hyphen.90_M_S",
                        "WINDROSE91.hyphen.135_M_S",
                        "WINDROSE136.hyphen.180_M_S",
                        "WINDROSE181.hyphen.225_M_S",
                        "WINDROSE226.hyphen.270_M_S",
                        "WINDROSE271.hyphen.315_M_S",
                        "WINDROSE316.hyphen.360_M_S",
                        "Comments"   ),
                    col_types=list(
                        col_date("%Y-%m-%d"),
                        col_character(),
                        col_character(),
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_number() ,
                        col_character(),
                        col_number() ,
                        col_character(),
                        col_number() ,
                        col_character(),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
dt2$RELHUMMIN <- ifelse((trimws(as.character(dt2$RELHUMMIN))==trimws("blank")),NA,dt2$RELHUMMIN)
suppressWarnings(dt2$RELHUMMIN <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt2$RELHUMMIN))==as.character(as.numeric("blank"))),NA,dt2$RELHUMMIN))
dt2$RELHUMMIN <- ifelse((trimws(as.character(dt2$RELHUMMIN))==trimws("-99999")),NA,dt2$RELHUMMIN)
suppressWarnings(dt2$RELHUMMIN <- ifelse(!is.na(as.numeric("-99999")) & (trimws(as.character(dt2$RELHUMMIN))==as.character(as.numeric("-99999"))),NA,dt2$RELHUMMIN))
dt2$TEMPMIN_DEGREESCELSIUS <- ifelse((trimws(as.character(dt2$TEMPMIN_DEGREESCELSIUS))==trimws("blank")),NA,dt2$TEMPMIN_DEGREESCELSIUS)
suppressWarnings(dt2$TEMPMIN_DEGREESCELSIUS <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt2$TEMPMIN_DEGREESCELSIUS))==as.character(as.numeric("blank"))),NA,dt2$TEMPMIN_DEGREESCELSIUS))
dt2$TEMPMIN_DEGREESCELSIUS <- ifelse((trimws(as.character(dt2$TEMPMIN_DEGREESCELSIUS))==trimws("-99999")),NA,dt2$TEMPMIN_DEGREESCELSIUS)
suppressWarnings(dt2$TEMPMIN_DEGREESCELSIUS <- ifelse(!is.na(as.numeric("-99999")) & (trimws(as.character(dt2$TEMPMIN_DEGREESCELSIUS))==as.character(as.numeric("-99999"))),NA,dt2$TEMPMIN_DEGREESCELSIUS))


# Observed issues when reading the data. An empty list is good!
problems(dt2)
# Here is the structure of the input data tibble:
glimpse(dt2)
# And some statistical summaries of the data
summary(dt2)
# Get more details on character variables

summary(as.factor(dt2$YEAR))
summary(as.factor(dt2$JULIAN))
summary(as.factor(dt2$RELHUMMAXTIME_HHMM))
summary(as.factor(dt2$TEMPMAXTIME_HHMM))
summary(as.factor(dt2$RELHUMMINTIME_HHMM))
summary(as.factor(dt2$MINTEMPTIME_HHMM))
summary(as.factor(dt2$WINDSPEEDMAX_HHMM))
summary(as.factor(dt2$Comments))

# inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676174/08c01f17d967490a05ac097a1b72bde5"
infile3 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676179/08c01f17d967490a05ac097a1b72bde5")
infile3 <-sub("^https","http",infile3)
# This creates a tibble named: dt3
	dt3 <-read_delim(infile3
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
                        "datetime",
                        "Rain_mm_Tot",
                        "WINDSPEEDAVER.paren.M_S.paren.",
                        "WINDDIR.paren.DEGREES.paren.",
                        "SlrmJ_Tot",
                        "AirTC_Avg",
                        "RH_percent",
                        "SOLARRAD_.paren.WATTS.per.M2.paren.",
                        "PAR_Den",
                        "PAR_Tot",
                        "NR_Wm2_Avg",
                        "DewPtC",
                        "Comments"   ),
                    col_types=list(
                        col_datetime("%Y-%m-%d %H:%M"),

                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Observed issues when reading the data. An empty list is good!
problems(dt3)
# Here is the structure of the input data tibble:
glimpse(dt3)
# And some statistical summaries of the data
summary(dt3)
# Get more details on character variables

summary(as.factor(dt3$Comments))








