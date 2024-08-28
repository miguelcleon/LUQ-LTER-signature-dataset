# Package ID: knb-lter-luq.14.470048 Cataloging System:https://pasta.edirepository.org.
# Data set title: Rainfall at El Verde Field Station, Rio Grande, Puerto Rico since 1975.
# Data set creator:  Alonso Ramirez - University of Puerto Rico, Rio Piedras Campus 
# Contact:  Alonso Ramirez -  University of Puerto Rico, Rio Piedras Campus  - aramirez@ramirezlab.net
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 
library(dplyr)
library(lubridate)
### DONT OVERWRITE ME
### DONT OVERWRITE ME
### DONT OVERWRITE ME
### DONT OVERWRITE ME

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/14/470058/b9cc3e2f916a52d466ed5ba7304501ef"
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
                 "RAINFALL..paren.MM.paren."    ), check.names=TRUE)

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
if (class(dt1$RAINFALL..paren.MM.paren.)=="factor") dt1$RAINFALL..paren.MM.paren. <-as.numeric(levels(dt1$RAINFALL..paren.MM.paren.))[as.integer(dt1$RAINFALL..paren.MM.paren.) ]               
if (class(dt1$RAINFALL..paren.MM.paren.)=="character") dt1$RAINFALL..paren.MM.paren. <-as.numeric(dt1$RAINFALL..paren.MM.paren.)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(RAINFALL..paren.MM.paren.) 
# Get more details on character variables

summary(as.factor(dt1$YEAR)) 
summary(as.factor(dt1$JULIAN))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/14/470058/11fa8d2d1b848a4e3454ef0b0af0eae7"
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
                 "RAINFALL..paren.MM.paren."    ), check.names=TRUE)

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
if (class(dt2$RAINFALL..paren.MM.paren.)=="factor") dt2$RAINFALL..paren.MM.paren. <-as.numeric(levels(dt2$RAINFALL..paren.MM.paren.))[as.integer(dt2$RAINFALL..paren.MM.paren.) ]               
if (class(dt2$RAINFALL..paren.MM.paren.)=="character") dt2$RAINFALL..paren.MM.paren. <-as.numeric(dt2$RAINFALL..paren.MM.paren.)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(RAINFALL..paren.MM.paren.) 
# Get more details on character variables

summary(as.factor(dt2$YEAR)) 
summary(as.factor(dt2$JULIAN))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/14/470058/6201fb68fdfa43d3cf85101b991cc3ae"
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
                 "RAINFALL..paren.MM.paren."    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt3$DATE dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%m/%d/%Y"
tmp3DATE<-as.Date(dt3$DATE,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp3DATE) == length(tmp3DATE[!is.na(tmp3DATE)])){dt3$DATE <- tmp3DATE } else {print("Date conversion failed for dt3$DATE. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp3DATE) 
if (class(dt3$YEAR)!="factor") dt3$YEAR<- as.factor(dt3$YEAR)
if (class(dt3$JULIAN)!="factor") dt3$JULIAN<- as.factor(dt3$JULIAN)
if (class(dt3$RAINFALL..paren.MM.paren.)=="factor") dt3$RAINFALL..paren.MM.paren. <-as.numeric(levels(dt3$RAINFALL..paren.MM.paren.))[as.integer(dt3$RAINFALL..paren.MM.paren.) ]               
if (class(dt3$RAINFALL..paren.MM.paren.)=="character") dt3$RAINFALL..paren.MM.paren. <-as.numeric(dt3$RAINFALL..paren.MM.paren.)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(RAINFALL..paren.MM.paren.) 
# Get more details on character variables

summary(as.factor(dt3$YEAR)) 
summary(as.factor(dt3$JULIAN))
detach(dt3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/14/470058/598db5118d7a0f04f154044fdbffeff6"
infile4 <- tempfile()
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


 dt4 <-read.csv(infile4,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "DATE",
                    "YEAR",
                    "JULIAN",
                    "HOUR",
                    "RAINFALL..paren.INCHES.paren.",
                    "RAINFALL..paren.MM.paren.",
                    "Field.Comments",
                    "Field.Comments"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# Define the function to try multiple date formats
try_multiple_formats <- function(date_column) {
  formats <- c("%Y-%m-%d", "%m/%d/%Y")
  for (fmt in formats) {
    parsed_dates <- as.Date(date_column, format = fmt)
    if (all(!is.na(parsed_dates))) {
      return(parsed_dates)
    }
  }
  warning("None of the formats matched.")
  return(NA)
}

# Assuming df is your data frame and DATE is the column with date strings
dt4 <- dt4 %>%
  mutate(DATE = try_multiple_formats(DATE))
# attempting to convert dt4$DATE dateTime string to R date structure (date or POSIXct)
# tmpDateFormat<-"%Y-%m-%d"
# tmpDateFormat<-"%m/%d/%Y"
# tmp4DATE<-as.Date(dt4$DATE,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
# if(length(tmp4DATE) == length(tmp4DATE[!is.na(tmp4DATE)])){dt4$DATE <- tmp4DATE } else {print("Date conversion failed for dt4$DATE. Please inspect the data and do the date conversion yourself.")}
# rm(tmpDateFormat,tmp4DATE)
if (class(dt4$YEAR)!="factor") dt4$YEAR<- as.factor(dt4$YEAR)
if (class(dt4$JULIAN)!="factor") dt4$JULIAN<- as.factor(dt4$JULIAN)
if (class(dt4$HOUR)!="factor") dt4$HOUR<- as.factor(dt4$HOUR)
if (class(dt4$RAINFALL..paren.INCHES.paren.)=="factor") dt4$RAINFALL..paren.INCHES.paren. <-as.numeric(levels(dt4$RAINFALL..paren.INCHES.paren.))[as.integer(dt4$RAINFALL..paren.INCHES.paren.) ]
if (class(dt4$RAINFALL..paren.INCHES.paren.)=="character") dt4$RAINFALL..paren.INCHES.paren. <-as.numeric(dt4$RAINFALL..paren.INCHES.paren.)
if (class(dt4$RAINFALL..paren.MM.paren.)=="factor") dt4$RAINFALL..paren.MM.paren. <-as.numeric(levels(dt4$RAINFALL..paren.MM.paren.))[as.integer(dt4$RAINFALL..paren.MM.paren.) ]
if (class(dt4$RAINFALL..paren.MM.paren.)=="character") dt4$RAINFALL..paren.MM.paren. <-as.numeric(dt4$RAINFALL..paren.MM.paren.)
if (class(dt4$Field.Comments)!="factor") dt4$Field.Comments<- as.factor(dt4$Field.Comments)
if (class(dt4$Field.Comments)!="factor") dt4$Field.Comments<- as.factor(dt4$Field.Comments)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt4)
attach(dt4)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(DATE)
summary(YEAR)
summary(JULIAN)
summary(HOUR)
summary(RAINFALL..paren.INCHES.paren.)
summary(RAINFALL..paren.MM.paren.)
summary(Field.Comments)
summary(Field.Comments)
                # Get more details on character variables

summary(as.factor(dt4$YEAR))
summary(as.factor(dt4$JULIAN))
summary(as.factor(dt4$HOUR))
summary(as.factor(dt4$Field.Comments))
summary(as.factor(dt4$Field.Comments))
detach(dt4)

