# Package ID: knb-lter-luq.127.1676174 Cataloging System:https://pasta.edirepository.org.
# Data set title: Meteorological data from El Verde Field Station: NADP Tower.
# Data set creator:  Alonso RamÃ­rez - North Carolina State University 
# Contact:  Jamarys Torres-Diaz -  University of Puerto Rico, Rio Piedras Campus  - jamarys.torres@upr.edu
# Contact:  Samuel Matta -    - smatta@ites.upr.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676174/aef5f0ea2a4a1c5c5fa5599ba86e2662" 
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


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676174/8fdd12142875cd2c5ff38b7de0dba656" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date.and.time.of.measurements",     
                 "RAIN_.paren.MM.paren.",     
                 "RH_percent",     
                 "temp_air_degrees_c",     
                 "SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.",     
                 "SOLARRAD_.paren.WATTS.per.M2.paren.",     
                 "PPFD_.paren.MICROMOLES.per.M2.paren.",     
                 "WINDMAX",     
                 "WINDMAXTIME",     
                 "WINDSPEEDAVER.paren.M_S.paren.",     
                 "PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.",     
                 "WINDDIR.paren.DEGREES.paren.",     
                 "SDWINDDIR",     
                 "WINDROSE1.hyphen.45.paren.M_S.paren.",     
                 "WINDROSE46.hyphen.90.paren.M_S.paren.",     
                 "WINDROSE91.hyphen.135.paren.M_S.paren.",     
                 "WINDROSE136.hyphen.180.paren.M_S.paren.",     
                 "WINDROSE181.hyphen.225.paren.M_S.paren.",     
                 "WINDROSE226.hyphen.270.paren.M_S.paren.",     
                 "WINDROSE271.hyphen.315.paren.M_S.paren.",     
                 "WINDROSE316.hyphen.360.paren.M_S.paren.",     
                 "Comments"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$RAIN_.paren.MM.paren.)=="factor") dt2$RAIN_.paren.MM.paren. <-as.numeric(levels(dt2$RAIN_.paren.MM.paren.))[as.integer(dt2$RAIN_.paren.MM.paren.) ]               
if (class(dt2$RAIN_.paren.MM.paren.)=="character") dt2$RAIN_.paren.MM.paren. <-as.numeric(dt2$RAIN_.paren.MM.paren.)
if (class(dt2$RH_percent)=="factor") dt2$RH_percent <-as.numeric(levels(dt2$RH_percent))[as.integer(dt2$RH_percent) ]               
if (class(dt2$RH_percent)=="character") dt2$RH_percent <-as.numeric(dt2$RH_percent)
if (class(dt2$temp_air_degrees_c)=="factor") dt2$temp_air_degrees_c <-as.numeric(levels(dt2$temp_air_degrees_c))[as.integer(dt2$temp_air_degrees_c) ]               
if (class(dt2$temp_air_degrees_c)=="character") dt2$temp_air_degrees_c <-as.numeric(dt2$temp_air_degrees_c)
if (class(dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.)=="factor") dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren. <-as.numeric(levels(dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.))[as.integer(dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.) ]               
if (class(dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.)=="character") dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren. <-as.numeric(dt2$SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.)
if (class(dt2$SOLARRAD_.paren.WATTS.per.M2.paren.)=="factor") dt2$SOLARRAD_.paren.WATTS.per.M2.paren. <-as.numeric(levels(dt2$SOLARRAD_.paren.WATTS.per.M2.paren.))[as.integer(dt2$SOLARRAD_.paren.WATTS.per.M2.paren.) ]               
if (class(dt2$SOLARRAD_.paren.WATTS.per.M2.paren.)=="character") dt2$SOLARRAD_.paren.WATTS.per.M2.paren. <-as.numeric(dt2$SOLARRAD_.paren.WATTS.per.M2.paren.)
if (class(dt2$PPFD_.paren.MICROMOLES.per.M2.paren.)=="factor") dt2$PPFD_.paren.MICROMOLES.per.M2.paren. <-as.numeric(levels(dt2$PPFD_.paren.MICROMOLES.per.M2.paren.))[as.integer(dt2$PPFD_.paren.MICROMOLES.per.M2.paren.) ]               
if (class(dt2$PPFD_.paren.MICROMOLES.per.M2.paren.)=="character") dt2$PPFD_.paren.MICROMOLES.per.M2.paren. <-as.numeric(dt2$PPFD_.paren.MICROMOLES.per.M2.paren.)
if (class(dt2$WINDMAX)=="factor") dt2$WINDMAX <-as.numeric(levels(dt2$WINDMAX))[as.integer(dt2$WINDMAX) ]               
if (class(dt2$WINDMAX)=="character") dt2$WINDMAX <-as.numeric(dt2$WINDMAX)
if (class(dt2$WINDMAXTIME)!="factor") dt2$WINDMAXTIME<- as.factor(dt2$WINDMAXTIME)
if (class(dt2$WINDSPEEDAVER.paren.M_S.paren.)=="factor") dt2$WINDSPEEDAVER.paren.M_S.paren. <-as.numeric(levels(dt2$WINDSPEEDAVER.paren.M_S.paren.))[as.integer(dt2$WINDSPEEDAVER.paren.M_S.paren.) ]               
if (class(dt2$WINDSPEEDAVER.paren.M_S.paren.)=="character") dt2$WINDSPEEDAVER.paren.M_S.paren. <-as.numeric(dt2$WINDSPEEDAVER.paren.M_S.paren.)
if (class(dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.)=="factor") dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren. <-as.numeric(levels(dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.))[as.integer(dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.) ]               
if (class(dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.)=="character") dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren. <-as.numeric(dt2$PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.)
if (class(dt2$WINDDIR.paren.DEGREES.paren.)=="factor") dt2$WINDDIR.paren.DEGREES.paren. <-as.numeric(levels(dt2$WINDDIR.paren.DEGREES.paren.))[as.integer(dt2$WINDDIR.paren.DEGREES.paren.) ]               
if (class(dt2$WINDDIR.paren.DEGREES.paren.)=="character") dt2$WINDDIR.paren.DEGREES.paren. <-as.numeric(dt2$WINDDIR.paren.DEGREES.paren.)
if (class(dt2$SDWINDDIR)=="factor") dt2$SDWINDDIR <-as.numeric(levels(dt2$SDWINDDIR))[as.integer(dt2$SDWINDDIR) ]               
if (class(dt2$SDWINDDIR)=="character") dt2$SDWINDDIR <-as.numeric(dt2$SDWINDDIR)
if (class(dt2$WINDROSE1.hyphen.45.paren.M_S.paren.)=="factor") dt2$WINDROSE1.hyphen.45.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE1.hyphen.45.paren.M_S.paren.))[as.integer(dt2$WINDROSE1.hyphen.45.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE1.hyphen.45.paren.M_S.paren.)=="character") dt2$WINDROSE1.hyphen.45.paren.M_S.paren. <-as.numeric(dt2$WINDROSE1.hyphen.45.paren.M_S.paren.)
if (class(dt2$WINDROSE46.hyphen.90.paren.M_S.paren.)=="factor") dt2$WINDROSE46.hyphen.90.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE46.hyphen.90.paren.M_S.paren.))[as.integer(dt2$WINDROSE46.hyphen.90.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE46.hyphen.90.paren.M_S.paren.)=="character") dt2$WINDROSE46.hyphen.90.paren.M_S.paren. <-as.numeric(dt2$WINDROSE46.hyphen.90.paren.M_S.paren.)
if (class(dt2$WINDROSE91.hyphen.135.paren.M_S.paren.)=="factor") dt2$WINDROSE91.hyphen.135.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE91.hyphen.135.paren.M_S.paren.))[as.integer(dt2$WINDROSE91.hyphen.135.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE91.hyphen.135.paren.M_S.paren.)=="character") dt2$WINDROSE91.hyphen.135.paren.M_S.paren. <-as.numeric(dt2$WINDROSE91.hyphen.135.paren.M_S.paren.)
if (class(dt2$WINDROSE136.hyphen.180.paren.M_S.paren.)=="factor") dt2$WINDROSE136.hyphen.180.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE136.hyphen.180.paren.M_S.paren.))[as.integer(dt2$WINDROSE136.hyphen.180.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE136.hyphen.180.paren.M_S.paren.)=="character") dt2$WINDROSE136.hyphen.180.paren.M_S.paren. <-as.numeric(dt2$WINDROSE136.hyphen.180.paren.M_S.paren.)
if (class(dt2$WINDROSE181.hyphen.225.paren.M_S.paren.)=="factor") dt2$WINDROSE181.hyphen.225.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE181.hyphen.225.paren.M_S.paren.))[as.integer(dt2$WINDROSE181.hyphen.225.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE181.hyphen.225.paren.M_S.paren.)=="character") dt2$WINDROSE181.hyphen.225.paren.M_S.paren. <-as.numeric(dt2$WINDROSE181.hyphen.225.paren.M_S.paren.)
if (class(dt2$WINDROSE226.hyphen.270.paren.M_S.paren.)=="factor") dt2$WINDROSE226.hyphen.270.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE226.hyphen.270.paren.M_S.paren.))[as.integer(dt2$WINDROSE226.hyphen.270.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE226.hyphen.270.paren.M_S.paren.)=="character") dt2$WINDROSE226.hyphen.270.paren.M_S.paren. <-as.numeric(dt2$WINDROSE226.hyphen.270.paren.M_S.paren.)
if (class(dt2$WINDROSE271.hyphen.315.paren.M_S.paren.)=="factor") dt2$WINDROSE271.hyphen.315.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE271.hyphen.315.paren.M_S.paren.))[as.integer(dt2$WINDROSE271.hyphen.315.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE271.hyphen.315.paren.M_S.paren.)=="character") dt2$WINDROSE271.hyphen.315.paren.M_S.paren. <-as.numeric(dt2$WINDROSE271.hyphen.315.paren.M_S.paren.)
if (class(dt2$WINDROSE316.hyphen.360.paren.M_S.paren.)=="factor") dt2$WINDROSE316.hyphen.360.paren.M_S.paren. <-as.numeric(levels(dt2$WINDROSE316.hyphen.360.paren.M_S.paren.))[as.integer(dt2$WINDROSE316.hyphen.360.paren.M_S.paren.) ]               
if (class(dt2$WINDROSE316.hyphen.360.paren.M_S.paren.)=="character") dt2$WINDROSE316.hyphen.360.paren.M_S.paren. <-as.numeric(dt2$WINDROSE316.hyphen.360.paren.M_S.paren.)
if (class(dt2$Comments)!="factor") dt2$Comments<- as.factor(dt2$Comments)

# Convert Missing Values to NA for non-dates

dt2$WINDMAX <- ifelse((trimws(as.character(dt2$WINDMAX))==trimws("blank")),NA,dt2$WINDMAX)               
suppressWarnings(dt2$WINDMAX <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt2$WINDMAX))==as.character(as.numeric("blank"))),NA,dt2$WINDMAX))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date.and.time.of.measurements)
summary(RAIN_.paren.MM.paren.)
summary(RH_percent)
summary(temp_air_degrees_c)
summary(SOLARRAD_.paren.KJOULES.per.M2.per.DAY.paren.)
summary(SOLARRAD_.paren.WATTS.per.M2.paren.)
summary(PPFD_.paren.MICROMOLES.per.M2.paren.)
summary(WINDMAX)
summary(WINDMAXTIME)
summary(WINDSPEEDAVER.paren.M_S.paren.)
summary(PPFD_.paren.MILLIMOLES.per.M2.per.HOUR.paren.)
summary(WINDDIR.paren.DEGREES.paren.)
summary(SDWINDDIR)
summary(WINDROSE1.hyphen.45.paren.M_S.paren.)
summary(WINDROSE46.hyphen.90.paren.M_S.paren.)
summary(WINDROSE91.hyphen.135.paren.M_S.paren.)
summary(WINDROSE136.hyphen.180.paren.M_S.paren.)
summary(WINDROSE181.hyphen.225.paren.M_S.paren.)
summary(WINDROSE226.hyphen.270.paren.M_S.paren.)
summary(WINDROSE271.hyphen.315.paren.M_S.paren.)
summary(WINDROSE316.hyphen.360.paren.M_S.paren.)
summary(Comments) 
# Get more details on character variables

summary(as.factor(dt2$WINDMAXTIME)) 
summary(as.factor(dt2$Comments))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/127/1676174/08c01f17d967490a05ac097a1b72bde5" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date.and.time.of.measurements",     
                 "Rain_mm_Tot",     
                 "RH_percent",     
                 "AirTC_Avg",     
                 "SlrmJ_Tot",     
                 "SOLARRAD_.paren.WATTS.per.M2.paren.",     
                 "PAR_Den",     
                 "NR_Wm2_Avg",     
                 "WINDSPEEDAVER.paren.M_S.paren.",     
                 "PAR_Tot",     
                 "WINDDIR.paren.DEGREES.paren.",     
                 "DewPtC"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$Rain_mm_Tot)=="factor") dt3$Rain_mm_Tot <-as.numeric(levels(dt3$Rain_mm_Tot))[as.integer(dt3$Rain_mm_Tot) ]               
if (class(dt3$Rain_mm_Tot)=="character") dt3$Rain_mm_Tot <-as.numeric(dt3$Rain_mm_Tot)
if (class(dt3$RH_percent)=="factor") dt3$RH_percent <-as.numeric(levels(dt3$RH_percent))[as.integer(dt3$RH_percent) ]               
if (class(dt3$RH_percent)=="character") dt3$RH_percent <-as.numeric(dt3$RH_percent)
if (class(dt3$AirTC_Avg)=="factor") dt3$AirTC_Avg <-as.numeric(levels(dt3$AirTC_Avg))[as.integer(dt3$AirTC_Avg) ]               
if (class(dt3$AirTC_Avg)=="character") dt3$AirTC_Avg <-as.numeric(dt3$AirTC_Avg)
if (class(dt3$SlrmJ_Tot)=="factor") dt3$SlrmJ_Tot <-as.numeric(levels(dt3$SlrmJ_Tot))[as.integer(dt3$SlrmJ_Tot) ]               
if (class(dt3$SlrmJ_Tot)=="character") dt3$SlrmJ_Tot <-as.numeric(dt3$SlrmJ_Tot)
if (class(dt3$SOLARRAD_.paren.WATTS.per.M2.paren.)=="factor") dt3$SOLARRAD_.paren.WATTS.per.M2.paren. <-as.numeric(levels(dt3$SOLARRAD_.paren.WATTS.per.M2.paren.))[as.integer(dt3$SOLARRAD_.paren.WATTS.per.M2.paren.) ]               
if (class(dt3$SOLARRAD_.paren.WATTS.per.M2.paren.)=="character") dt3$SOLARRAD_.paren.WATTS.per.M2.paren. <-as.numeric(dt3$SOLARRAD_.paren.WATTS.per.M2.paren.)
if (class(dt3$PAR_Den)=="factor") dt3$PAR_Den <-as.numeric(levels(dt3$PAR_Den))[as.integer(dt3$PAR_Den) ]               
if (class(dt3$PAR_Den)=="character") dt3$PAR_Den <-as.numeric(dt3$PAR_Den)
if (class(dt3$NR_Wm2_Avg)=="factor") dt3$NR_Wm2_Avg <-as.numeric(levels(dt3$NR_Wm2_Avg))[as.integer(dt3$NR_Wm2_Avg) ]               
if (class(dt3$NR_Wm2_Avg)=="character") dt3$NR_Wm2_Avg <-as.numeric(dt3$NR_Wm2_Avg)
if (class(dt3$WINDSPEEDAVER.paren.M_S.paren.)=="factor") dt3$WINDSPEEDAVER.paren.M_S.paren. <-as.numeric(levels(dt3$WINDSPEEDAVER.paren.M_S.paren.))[as.integer(dt3$WINDSPEEDAVER.paren.M_S.paren.) ]               
if (class(dt3$WINDSPEEDAVER.paren.M_S.paren.)=="character") dt3$WINDSPEEDAVER.paren.M_S.paren. <-as.numeric(dt3$WINDSPEEDAVER.paren.M_S.paren.)
if (class(dt3$PAR_Tot)=="factor") dt3$PAR_Tot <-as.numeric(levels(dt3$PAR_Tot))[as.integer(dt3$PAR_Tot) ]               
if (class(dt3$PAR_Tot)=="character") dt3$PAR_Tot <-as.numeric(dt3$PAR_Tot)
if (class(dt3$WINDDIR.paren.DEGREES.paren.)=="factor") dt3$WINDDIR.paren.DEGREES.paren. <-as.numeric(levels(dt3$WINDDIR.paren.DEGREES.paren.))[as.integer(dt3$WINDDIR.paren.DEGREES.paren.) ]               
if (class(dt3$WINDDIR.paren.DEGREES.paren.)=="character") dt3$WINDDIR.paren.DEGREES.paren. <-as.numeric(dt3$WINDDIR.paren.DEGREES.paren.)
if (class(dt3$DewPtC)=="factor") dt3$DewPtC <-as.numeric(levels(dt3$DewPtC))[as.integer(dt3$DewPtC) ]               
if (class(dt3$DewPtC)=="character") dt3$DewPtC <-as.numeric(dt3$DewPtC)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date.and.time.of.measurements)
summary(Rain_mm_Tot)
summary(RH_percent)
summary(AirTC_Avg)
summary(SlrmJ_Tot)
summary(SOLARRAD_.paren.WATTS.per.M2.paren.)
summary(PAR_Den)
summary(NR_Wm2_Avg)
summary(WINDSPEEDAVER.paren.M_S.paren.)
summary(PAR_Tot)
summary(WINDDIR.paren.DEGREES.paren.)
summary(DewPtC) 
# Get more details on character variables

detach(dt3)               





