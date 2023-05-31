# Package ID: knb-lter-luq.16.538558 Cataloging System:https://pasta.edirepository.org.
# Data set title: Maximum temperature at El Verde Field Station, Rio Grande, Puerto Rico since October 1992.
# Data set creator:  Alonso Ramirez - University of Puerto Rico, Rio Piedras Campus 
# Contact:  Alonso Ramirez -  University of Puerto Rico, Rio Piedras Campus  - aramirez@ramirezlab.net
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/16/538560/357b137c1fd346ba191765ae058b4c7a" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "DATE",     
                 "YEAR",     
                 "JULIAN",     
                 "MAXTEMP.paren.F.paren.",     
                 "MAXTEMP.paren.C.paren."    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt1$DATE dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%m/%d/%Y"
tmp1DATE<-as.Date(dt1$DATE,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp1DATE) == length(tmp1DATE[!is.na(tmp1DATE)])){dt1$DATE <- tmp1DATE } else {print("Date conversion failed for dt1$DATE. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp1DATE) 
if (class(dt1$YEAR)!="factor") dt1$YEAR<- as.factor(dt1$YEAR)
if (class(dt1$JULIAN)!="factor") dt1$JULIAN<- as.factor(dt1$JULIAN)
if (class(dt1$MAXTEMP.paren.F.paren.)=="factor") dt1$MAXTEMP.paren.F.paren. <-as.numeric(levels(dt1$MAXTEMP.paren.F.paren.))[as.integer(dt1$MAXTEMP.paren.F.paren.) ]               
if (class(dt1$MAXTEMP.paren.F.paren.)=="character") dt1$MAXTEMP.paren.F.paren. <-as.numeric(dt1$MAXTEMP.paren.F.paren.)
if (class(dt1$MAXTEMP.paren.C.paren.)=="factor") dt1$MAXTEMP.paren.C.paren. <-as.numeric(levels(dt1$MAXTEMP.paren.C.paren.))[as.integer(dt1$MAXTEMP.paren.C.paren.) ]               
if (class(dt1$MAXTEMP.paren.C.paren.)=="character") dt1$MAXTEMP.paren.C.paren. <-as.numeric(dt1$MAXTEMP.paren.C.paren.)

# Convert Missing Values to NA for non-dates

dt1$MAXTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt1$MAXTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt1$MAXTEMP.paren.F.paren.)               
suppressWarnings(dt1$MAXTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt1$MAXTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt1$MAXTEMP.paren.F.paren.))
dt1$MAXTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt1$MAXTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt1$MAXTEMP.paren.C.paren.)               
suppressWarnings(dt1$MAXTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt1$MAXTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt1$MAXTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(MAXTEMP.paren.F.paren.)
summary(MAXTEMP.paren.C.paren.) 
# Get more details on character variables

summary(as.factor(dt1$YEAR)) 
summary(as.factor(dt1$JULIAN))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/16/538560/89d2d5fb4c21f40704171113a04ed55a" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "DATE",     
                 "YEAR",     
                 "JULIAN",     
                 "MAXTEMP.paren.F.paren.",     
                 "MAXTEMP.paren.C.paren."    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt2$DATE dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%m/%d/%Y"
tmp2DATE<-as.Date(dt2$DATE,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp2DATE) == length(tmp2DATE[!is.na(tmp2DATE)])){dt2$DATE <- tmp2DATE } else {print("Date conversion failed for dt2$DATE. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp2DATE) 
if (class(dt2$YEAR)!="factor") dt2$YEAR<- as.factor(dt2$YEAR)
if (class(dt2$JULIAN)!="factor") dt2$JULIAN<- as.factor(dt2$JULIAN)
if (class(dt2$MAXTEMP.paren.F.paren.)=="factor") dt2$MAXTEMP.paren.F.paren. <-as.numeric(levels(dt2$MAXTEMP.paren.F.paren.))[as.integer(dt2$MAXTEMP.paren.F.paren.) ]               
if (class(dt2$MAXTEMP.paren.F.paren.)=="character") dt2$MAXTEMP.paren.F.paren. <-as.numeric(dt2$MAXTEMP.paren.F.paren.)
if (class(dt2$MAXTEMP.paren.C.paren.)=="factor") dt2$MAXTEMP.paren.C.paren. <-as.numeric(levels(dt2$MAXTEMP.paren.C.paren.))[as.integer(dt2$MAXTEMP.paren.C.paren.) ]               
if (class(dt2$MAXTEMP.paren.C.paren.)=="character") dt2$MAXTEMP.paren.C.paren. <-as.numeric(dt2$MAXTEMP.paren.C.paren.)

# Convert Missing Values to NA for non-dates

dt2$MAXTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt2$MAXTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt2$MAXTEMP.paren.F.paren.)               
suppressWarnings(dt2$MAXTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt2$MAXTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt2$MAXTEMP.paren.F.paren.))
dt2$MAXTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt2$MAXTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt2$MAXTEMP.paren.C.paren.)               
suppressWarnings(dt2$MAXTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt2$MAXTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt2$MAXTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(MAXTEMP.paren.F.paren.)
summary(MAXTEMP.paren.C.paren.) 
# Get more details on character variables

summary(as.factor(dt2$YEAR)) 
summary(as.factor(dt2$JULIAN))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/16/538560/fd089db1f85695c215309eaade0057c0" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "DATE",     
                 "YEAR",     
                 "JULIAN",     
                 "MAXTEMP.paren.F.paren.",     
                 "MAXTEMP.paren.C.paren.",     
                 "Field.Comments"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$DATE)=="factor") dt3$DATE <-as.numeric(levels(dt3$DATE))[as.integer(dt3$DATE) ]               
if (class(dt3$DATE)=="character") dt3$DATE <-as.numeric(dt3$DATE)
if (class(dt3$YEAR)!="factor") dt3$YEAR<- as.factor(dt3$YEAR)
if (class(dt3$JULIAN)!="factor") dt3$JULIAN<- as.factor(dt3$JULIAN)
if (class(dt3$MAXTEMP.paren.F.paren.)=="factor") dt3$MAXTEMP.paren.F.paren. <-as.numeric(levels(dt3$MAXTEMP.paren.F.paren.))[as.integer(dt3$MAXTEMP.paren.F.paren.) ]               
if (class(dt3$MAXTEMP.paren.F.paren.)=="character") dt3$MAXTEMP.paren.F.paren. <-as.numeric(dt3$MAXTEMP.paren.F.paren.)
if (class(dt3$MAXTEMP.paren.C.paren.)=="factor") dt3$MAXTEMP.paren.C.paren. <-as.numeric(levels(dt3$MAXTEMP.paren.C.paren.))[as.integer(dt3$MAXTEMP.paren.C.paren.) ]               
if (class(dt3$MAXTEMP.paren.C.paren.)=="character") dt3$MAXTEMP.paren.C.paren. <-as.numeric(dt3$MAXTEMP.paren.C.paren.)
if (class(dt3$Field.Comments)!="factor") dt3$Field.Comments<- as.factor(dt3$Field.Comments)

# Convert Missing Values to NA for non-dates

dt3$MAXTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt3$MAXTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt3$MAXTEMP.paren.F.paren.)               
suppressWarnings(dt3$MAXTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt3$MAXTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt3$MAXTEMP.paren.F.paren.))
dt3$MAXTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt3$MAXTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt3$MAXTEMP.paren.C.paren.)               
suppressWarnings(dt3$MAXTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt3$MAXTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt3$MAXTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(MAXTEMP.paren.F.paren.)
summary(MAXTEMP.paren.C.paren.)
summary(Field.Comments) 
# Get more details on character variables

summary(as.factor(dt3$YEAR)) 
summary(as.factor(dt3$JULIAN)) 
summary(as.factor(dt3$Field.Comments))
detach(dt3)               





