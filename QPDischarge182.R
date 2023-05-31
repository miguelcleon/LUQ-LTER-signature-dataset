# https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-luq.182.210373

# Package ID: knb-lter-luq.182.210373 Cataloging System:https://pasta.edirepository.org.
# Data set title: Prieta streams- Discharge and water level.
# Data set creator:  Alonso Ramirez - North Carolina State University 
# Metadata Provider:  Alonso Ramirez - North Carolina State University 
# Contact:  Alonso Ramirez -  North Carolina State University  - alonso.ramirez@ncsu.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/182/210373/11d92b4ada3b58bfc4c5e91bf0ae0063" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "Date.and.Time",     
                 "Water.level.at.measurement.time",     
                 "Discharge",     
                 "QA.code"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$Water.level.at.measurement.time)=="factor") dt1$Water.level.at.measurement.time <-as.numeric(levels(dt1$Water.level.at.measurement.time))[as.integer(dt1$Water.level.at.measurement.time) ]               
if (class(dt1$Water.level.at.measurement.time)=="character") dt1$Water.level.at.measurement.time <-as.numeric(dt1$Water.level.at.measurement.time)
if (class(dt1$Discharge)=="factor") dt1$Discharge <-as.numeric(levels(dt1$Discharge))[as.integer(dt1$Discharge) ]               
if (class(dt1$Discharge)=="character") dt1$Discharge <-as.numeric(dt1$Discharge)
if (class(dt1$QA.code)!="factor") dt1$QA.code<- as.factor(dt1$QA.code)

# Convert Missing Values to NA for non-dates

dt1$Water.level.at.measurement.time <- ifelse((trimws(as.character(dt1$Water.level.at.measurement.time))==trimws("nan")),NA,dt1$Water.level.at.measurement.time)               
suppressWarnings(dt1$Water.level.at.measurement.time <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt1$Water.level.at.measurement.time))==as.character(as.numeric("nan"))),NA,dt1$Water.level.at.measurement.time))
dt1$Discharge <- ifelse((trimws(as.character(dt1$Discharge))==trimws("nan")),NA,dt1$Discharge)               
suppressWarnings(dt1$Discharge <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt1$Discharge))==as.character(as.numeric("nan"))),NA,dt1$Discharge))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date.and.Time)
summary(Water.level.at.measurement.time)
summary(Discharge)
summary(QA.code) 
# Get more details on character variables

summary(as.factor(dt1$QA.code))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/182/210373/854b9d07fc4b27574d4aaeb46fe9aefe" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "Date.and.Time",     
                 "Water.level.at.measurement.time"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$Water.level.at.measurement.time)=="factor") dt2$Water.level.at.measurement.time <-as.numeric(levels(dt2$Water.level.at.measurement.time))[as.integer(dt2$Water.level.at.measurement.time) ]               
if (class(dt2$Water.level.at.measurement.time)=="character") dt2$Water.level.at.measurement.time <-as.numeric(dt2$Water.level.at.measurement.time)

# Convert Missing Values to NA for non-dates

dt2$Water.level.at.measurement.time <- ifelse((trimws(as.character(dt2$Water.level.at.measurement.time))==trimws("nan")),NA,dt2$Water.level.at.measurement.time)               
suppressWarnings(dt2$Water.level.at.measurement.time <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt2$Water.level.at.measurement.time))==as.character(as.numeric("nan"))),NA,dt2$Water.level.at.measurement.time))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date.and.Time)
summary(Water.level.at.measurement.time) 
# Get more details on character variables

detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/182/210373/6e1e9cb65584eb2c1ebba39136aa28c1" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "Date.and.Time",     
                 "Water.level.at.measurement.time"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$Water.level.at.measurement.time)=="factor") dt3$Water.level.at.measurement.time <-as.numeric(levels(dt3$Water.level.at.measurement.time))[as.integer(dt3$Water.level.at.measurement.time) ]               
if (class(dt3$Water.level.at.measurement.time)=="character") dt3$Water.level.at.measurement.time <-as.numeric(dt3$Water.level.at.measurement.time)

# Convert Missing Values to NA for non-dates

dt3$Water.level.at.measurement.time <- ifelse((trimws(as.character(dt3$Water.level.at.measurement.time))==trimws("nan")),NA,dt3$Water.level.at.measurement.time)               
suppressWarnings(dt3$Water.level.at.measurement.time <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt3$Water.level.at.measurement.time))==as.character(as.numeric("nan"))),NA,dt3$Water.level.at.measurement.time))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date.and.Time)
summary(Water.level.at.measurement.time) 
# Get more details on character variables

detach(dt3)               





