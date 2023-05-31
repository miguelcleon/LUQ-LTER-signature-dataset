# Package ID: knb-lter-luq.17.573682 Cataloging System:https://pasta.edirepository.org.
# Data set title: Minimum temperature at El Verde Field Station, Rio Grande, Puerto Rico since 1975.
# Data set creator:  Alonso Ramirez - University of Puerto Rico, Rio Piedras Campus 
# Contact:  Alonso Ramirez -  University of Puerto Rico, Rio Piedras Campus  - aramirez@ramirezlab.net
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/17/573684/ba356dbf5eee3f1aca674290be390f89" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date",     
                 "YEAR",     
                 "JULIAN",     
                 "MINTEMP.paren.F.paren.",     
                 "MINTEMP.paren.C.paren."    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$YEAR)!="factor") dt1$YEAR<- as.factor(dt1$YEAR)
if (class(dt1$JULIAN)!="factor") dt1$JULIAN<- as.factor(dt1$JULIAN)
if (class(dt1$MINTEMP.paren.F.paren.)=="factor") dt1$MINTEMP.paren.F.paren. <-as.numeric(levels(dt1$MINTEMP.paren.F.paren.))[as.integer(dt1$MINTEMP.paren.F.paren.) ]               
if (class(dt1$MINTEMP.paren.F.paren.)=="character") dt1$MINTEMP.paren.F.paren. <-as.numeric(dt1$MINTEMP.paren.F.paren.)
if (class(dt1$MINTEMP.paren.C.paren.)=="factor") dt1$MINTEMP.paren.C.paren. <-as.numeric(levels(dt1$MINTEMP.paren.C.paren.))[as.integer(dt1$MINTEMP.paren.C.paren.) ]               
if (class(dt1$MINTEMP.paren.C.paren.)=="character") dt1$MINTEMP.paren.C.paren. <-as.numeric(dt1$MINTEMP.paren.C.paren.)

# Convert Missing Values to NA for non-dates

dt1$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt1$MINTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt1$MINTEMP.paren.F.paren.)               
suppressWarnings(dt1$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt1$MINTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt1$MINTEMP.paren.F.paren.))
dt1$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt1$MINTEMP.paren.F.paren.))==trimws("-9999")),NA,dt1$MINTEMP.paren.F.paren.)               
suppressWarnings(dt1$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt1$MINTEMP.paren.F.paren.))==as.character(as.numeric("-9999"))),NA,dt1$MINTEMP.paren.F.paren.))
dt1$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt1$MINTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt1$MINTEMP.paren.C.paren.)               
suppressWarnings(dt1$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt1$MINTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt1$MINTEMP.paren.C.paren.))
dt1$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt1$MINTEMP.paren.C.paren.))==trimws("-9999")),NA,dt1$MINTEMP.paren.C.paren.)               
suppressWarnings(dt1$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt1$MINTEMP.paren.C.paren.))==as.character(as.numeric("-9999"))),NA,dt1$MINTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(YEAR)
summary(JULIAN)
summary(MINTEMP.paren.F.paren.)
summary(MINTEMP.paren.C.paren.) 
# Get more details on character variables

summary(as.factor(dt1$YEAR)) 
summary(as.factor(dt1$JULIAN))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/17/573684/bce8f61cac4939aacb6979a2316716d7" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date",     
                 "YEAR",     
                 "JULIAN",     
                 "MINTEMP.paren.F.paren.",     
                 "MINTEMP.paren.C.paren."    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$YEAR)!="factor") dt2$YEAR<- as.factor(dt2$YEAR)
if (class(dt2$JULIAN)!="factor") dt2$JULIAN<- as.factor(dt2$JULIAN)
if (class(dt2$MINTEMP.paren.F.paren.)=="factor") dt2$MINTEMP.paren.F.paren. <-as.numeric(levels(dt2$MINTEMP.paren.F.paren.))[as.integer(dt2$MINTEMP.paren.F.paren.) ]               
if (class(dt2$MINTEMP.paren.F.paren.)=="character") dt2$MINTEMP.paren.F.paren. <-as.numeric(dt2$MINTEMP.paren.F.paren.)
if (class(dt2$MINTEMP.paren.C.paren.)=="factor") dt2$MINTEMP.paren.C.paren. <-as.numeric(levels(dt2$MINTEMP.paren.C.paren.))[as.integer(dt2$MINTEMP.paren.C.paren.) ]               
if (class(dt2$MINTEMP.paren.C.paren.)=="character") dt2$MINTEMP.paren.C.paren. <-as.numeric(dt2$MINTEMP.paren.C.paren.)

# Convert Missing Values to NA for non-dates

dt2$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt2$MINTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt2$MINTEMP.paren.F.paren.)               
suppressWarnings(dt2$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt2$MINTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt2$MINTEMP.paren.F.paren.))
dt2$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt2$MINTEMP.paren.F.paren.))==trimws("-9999")),NA,dt2$MINTEMP.paren.F.paren.)               
suppressWarnings(dt2$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt2$MINTEMP.paren.F.paren.))==as.character(as.numeric("-9999"))),NA,dt2$MINTEMP.paren.F.paren.))
dt2$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt2$MINTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt2$MINTEMP.paren.C.paren.)               
suppressWarnings(dt2$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt2$MINTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt2$MINTEMP.paren.C.paren.))
dt2$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt2$MINTEMP.paren.C.paren.))==trimws("-9999")),NA,dt2$MINTEMP.paren.C.paren.)               
suppressWarnings(dt2$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt2$MINTEMP.paren.C.paren.))==as.character(as.numeric("-9999"))),NA,dt2$MINTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(YEAR)
summary(JULIAN)
summary(MINTEMP.paren.F.paren.)
summary(MINTEMP.paren.C.paren.) 
# Get more details on character variables

summary(as.factor(dt2$YEAR)) 
summary(as.factor(dt2$JULIAN))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/17/573684/f4bab13100f9c7cd5ed6452829cf1f71" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date",     
                 "YEAR",     
                 "JULIAN",     
                 "MINTEMP.paren.F.paren.",     
                 "MINTEMP.paren.C.paren."    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$YEAR)!="factor") dt3$YEAR<- as.factor(dt3$YEAR)
if (class(dt3$JULIAN)!="factor") dt3$JULIAN<- as.factor(dt3$JULIAN)
if (class(dt3$MINTEMP.paren.F.paren.)=="factor") dt3$MINTEMP.paren.F.paren. <-as.numeric(levels(dt3$MINTEMP.paren.F.paren.))[as.integer(dt3$MINTEMP.paren.F.paren.) ]               
if (class(dt3$MINTEMP.paren.F.paren.)=="character") dt3$MINTEMP.paren.F.paren. <-as.numeric(dt3$MINTEMP.paren.F.paren.)
if (class(dt3$MINTEMP.paren.C.paren.)=="factor") dt3$MINTEMP.paren.C.paren. <-as.numeric(levels(dt3$MINTEMP.paren.C.paren.))[as.integer(dt3$MINTEMP.paren.C.paren.) ]               
if (class(dt3$MINTEMP.paren.C.paren.)=="character") dt3$MINTEMP.paren.C.paren. <-as.numeric(dt3$MINTEMP.paren.C.paren.)

# Convert Missing Values to NA for non-dates

dt3$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt3$MINTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt3$MINTEMP.paren.F.paren.)               
suppressWarnings(dt3$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt3$MINTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt3$MINTEMP.paren.F.paren.))
dt3$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt3$MINTEMP.paren.F.paren.))==trimws("-9999")),NA,dt3$MINTEMP.paren.F.paren.)               
suppressWarnings(dt3$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt3$MINTEMP.paren.F.paren.))==as.character(as.numeric("-9999"))),NA,dt3$MINTEMP.paren.F.paren.))
dt3$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt3$MINTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt3$MINTEMP.paren.C.paren.)               
suppressWarnings(dt3$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt3$MINTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt3$MINTEMP.paren.C.paren.))
dt3$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt3$MINTEMP.paren.C.paren.))==trimws("-9999")),NA,dt3$MINTEMP.paren.C.paren.)               
suppressWarnings(dt3$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt3$MINTEMP.paren.C.paren.))==as.character(as.numeric("-9999"))),NA,dt3$MINTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(YEAR)
summary(JULIAN)
summary(MINTEMP.paren.F.paren.)
summary(MINTEMP.paren.C.paren.) 
# Get more details on character variables

summary(as.factor(dt3$YEAR)) 
summary(as.factor(dt3$JULIAN))
detach(dt3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/17/573684/98bfd40f2c76187aef38619df4187595" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date",     
                 "YEAR",     
                 "JULIAN",     
                 "MINTEMP.paren.F.paren.",     
                 "MINTEMP.paren.C.paren.",     
                 "Field.Comments"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt4$YEAR)!="factor") dt4$YEAR<- as.factor(dt4$YEAR)
if (class(dt4$JULIAN)!="factor") dt4$JULIAN<- as.factor(dt4$JULIAN)
if (class(dt4$MINTEMP.paren.F.paren.)=="factor") dt4$MINTEMP.paren.F.paren. <-as.numeric(levels(dt4$MINTEMP.paren.F.paren.))[as.integer(dt4$MINTEMP.paren.F.paren.) ]               
if (class(dt4$MINTEMP.paren.F.paren.)=="character") dt4$MINTEMP.paren.F.paren. <-as.numeric(dt4$MINTEMP.paren.F.paren.)
if (class(dt4$MINTEMP.paren.C.paren.)=="factor") dt4$MINTEMP.paren.C.paren. <-as.numeric(levels(dt4$MINTEMP.paren.C.paren.))[as.integer(dt4$MINTEMP.paren.C.paren.) ]               
if (class(dt4$MINTEMP.paren.C.paren.)=="character") dt4$MINTEMP.paren.C.paren. <-as.numeric(dt4$MINTEMP.paren.C.paren.)
if (class(dt4$Field.Comments)!="factor") dt4$Field.Comments<- as.factor(dt4$Field.Comments)

# Convert Missing Values to NA for non-dates

dt4$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt4$MINTEMP.paren.F.paren.))==trimws("BLANK")),NA,dt4$MINTEMP.paren.F.paren.)               
suppressWarnings(dt4$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt4$MINTEMP.paren.F.paren.))==as.character(as.numeric("BLANK"))),NA,dt4$MINTEMP.paren.F.paren.))
dt4$MINTEMP.paren.F.paren. <- ifelse((trimws(as.character(dt4$MINTEMP.paren.F.paren.))==trimws("-9999")),NA,dt4$MINTEMP.paren.F.paren.)               
suppressWarnings(dt4$MINTEMP.paren.F.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt4$MINTEMP.paren.F.paren.))==as.character(as.numeric("-9999"))),NA,dt4$MINTEMP.paren.F.paren.))
dt4$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt4$MINTEMP.paren.C.paren.))==trimws("BLANK")),NA,dt4$MINTEMP.paren.C.paren.)               
suppressWarnings(dt4$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt4$MINTEMP.paren.C.paren.))==as.character(as.numeric("BLANK"))),NA,dt4$MINTEMP.paren.C.paren.))
dt4$MINTEMP.paren.C.paren. <- ifelse((trimws(as.character(dt4$MINTEMP.paren.C.paren.))==trimws("-9999")),NA,dt4$MINTEMP.paren.C.paren.)               
suppressWarnings(dt4$MINTEMP.paren.C.paren. <- ifelse(!is.na(as.numeric("-9999")) & (trimws(as.character(dt4$MINTEMP.paren.C.paren.))==as.character(as.numeric("-9999"))),NA,dt4$MINTEMP.paren.C.paren.))


# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(YEAR)
summary(JULIAN)
summary(MINTEMP.paren.F.paren.)
summary(MINTEMP.paren.C.paren.)
summary(Field.Comments) 
# Get more details on character variables

summary(as.factor(dt4$YEAR)) 
summary(as.factor(dt4$JULIAN)) 
summary(as.factor(dt4$Field.Comments))
detach(dt4)               





