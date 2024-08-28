# Package ID: knb-lter-luq.182.210378 Cataloging System:https://pasta.edirepository.org.
# Data set title: Prieta streams- Discharge and water level.
# Data set creator:  Alonso Ramirez - North Carolina State University
# Metadata Provider:  Alonso Ramirez - North Carolina State University
# Contact:  Alonso Ramirez -  North Carolina State University  - alonso.ramirez@ncsu.edu
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }
library("tidyverse")
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/182/210378/ae23735b7cad3b78de1965fb37829864")
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: dt1
	dt1 <-read_delim(infile1
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
                        "datetime",
                        "Water.Level.paren.m.paren.",
                        "Discharge..paren.m.carat.3.per.s.paren.",
                        "Notes"   ),
                    col_types=list(
                        col_datetime("%Y-%m-%d %H:%M"),

                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
dt1$datetime <- ifelse((trimws(as.character(dt1$datetime))==trimws("none")),NA,dt1$datetime)
suppressWarnings(dt1$datetime <- ifelse(!is.na(as.numeric("none")) & (trimws(as.character(dt1$datetime))==as.character(as.numeric("none"))),NA,dt1$datetime))
dt1$Water.Level.paren.m.paren. <- ifelse((trimws(as.character(dt1$Water.Level.paren.m.paren.))==trimws("nan")),NA,dt1$Water.Level.paren.m.paren.)
suppressWarnings(dt1$Water.Level.paren.m.paren. <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt1$Water.Level.paren.m.paren.))==as.character(as.numeric("nan"))),NA,dt1$Water.Level.paren.m.paren.))
dt1$Discharge..paren.m.carat.3.per.s.paren. <- ifelse((trimws(as.character(dt1$Discharge..paren.m.carat.3.per.s.paren.))==trimws("nan")),NA,dt1$Discharge..paren.m.carat.3.per.s.paren.)
suppressWarnings(dt1$Discharge..paren.m.carat.3.per.s.paren. <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt1$Discharge..paren.m.carat.3.per.s.paren.))==as.character(as.numeric("nan"))),NA,dt1$Discharge..paren.m.carat.3.per.s.paren.))


# Observed issues when reading the data. An empty list is good!
problems(dt1)
# Here is the structure of the input data tibble:
glimpse(dt1)
# And some statistical summaries of the data
summary(dt1)
# Get more details on character variables

summary(as.factor(dt1$Notes))
infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/182/210378/117e6b3a396f8a2bf53d765ba896425a")
infile2 <-sub("^https","http",infile2)
# This creates a tibble named: dt2
	dt2 <-read_delim(infile2
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
                        "datetime",
                        "Water.Level.paren.m.paren.",
                        "Discharge..paren.m.carat.3.per.s.paren.",
                        "Notes"   ),
                    col_types=list(
                        col_datetime("%Y-%m-%d %H:%M"),

                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
dt2$datetime <- ifelse((trimws(as.character(dt2$datetime))==trimws("none")),NA,dt2$datetime)
suppressWarnings(dt2$datetime <- ifelse(!is.na(as.numeric("none")) & (trimws(as.character(dt2$datetime))==as.character(as.numeric("none"))),NA,dt2$datetime))
dt2$Water.Level.paren.m.paren. <- ifelse((trimws(as.character(dt2$Water.Level.paren.m.paren.))==trimws("nan")),NA,dt2$Water.Level.paren.m.paren.)
suppressWarnings(dt2$Water.Level.paren.m.paren. <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt2$Water.Level.paren.m.paren.))==as.character(as.numeric("nan"))),NA,dt2$Water.Level.paren.m.paren.))
dt2$Discharge..paren.m.carat.3.per.s.paren. <- ifelse((trimws(as.character(dt2$Discharge..paren.m.carat.3.per.s.paren.))==trimws("nan")),NA,dt2$Discharge..paren.m.carat.3.per.s.paren.)
suppressWarnings(dt2$Discharge..paren.m.carat.3.per.s.paren. <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt2$Discharge..paren.m.carat.3.per.s.paren.))==as.character(as.numeric("nan"))),NA,dt2$Discharge..paren.m.carat.3.per.s.paren.))


# Observed issues when reading the data. An empty list is good!
problems(dt2)
# Here is the structure of the input data tibble:
glimpse(dt2)
# And some statistical summaries of the data
summary(dt2)
# Get more details on character variables

summary(as.factor(dt2$Notes))
infile3 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/182/210378/89744d369e0be7e0d029f81195c3edf6")
infile3 <-sub("^https","http",infile3)
# This creates a tibble named: dt3
	dt3 <-read_delim(infile3
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
                        "datetime",
                        "Stage",
                        "Discharge",
                        "Notes"   ),
                    col_types=list(
                        col_datetime("%Y-%m-%d %H:%M"),

                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
dt3$Stage <- ifelse((trimws(as.character(dt3$Stage))==trimws("nan")),NA,dt3$Stage)
suppressWarnings(dt3$Stage <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt3$Stage))==as.character(as.numeric("nan"))),NA,dt3$Stage))
dt3$Discharge <- ifelse((trimws(as.character(dt3$Discharge))==trimws("nan")),NA,dt3$Discharge)
suppressWarnings(dt3$Discharge <- ifelse(!is.na(as.numeric("nan")) & (trimws(as.character(dt3$Discharge))==as.character(as.numeric("nan"))),NA,dt3$Discharge))


# Observed issues when reading the data. An empty list is good!
problems(dt3)
# Here is the structure of the input data tibble:
glimpse(dt3)
# And some statistical summaries of the data
summary(dt3)
# Get more details on character variables

summary(as.factor(dt3$Notes))




