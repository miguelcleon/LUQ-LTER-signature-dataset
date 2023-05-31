# shrimp

# Package ID: knb-lter-luq.54.945759 Cataloging System:https://pasta.edirepository.org.
# Data set title: Shrimp populations in Quebrada Prieta (Pools 0, 8, 9, 15) (El Verde).
# Data set creator:  Todd Crowl -  
# Contact:  Todd Crowl -    - tcrowl@fiu.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/54/945759/63afd355201f7cf44912b02583ffc7c9" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "Month",     
                 "POOL",     
                 "ATYACPUE",     
                 "XIPHCPUE",     
                 "MACCPUE"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$YEAR)!="factor") dt1$YEAR<- as.factor(dt1$YEAR)
if (class(dt1$Month)!="factor") dt1$Month<- as.factor(dt1$Month)
if (class(dt1$POOL)!="factor") dt1$POOL<- as.factor(dt1$POOL)
if (class(dt1$ATYACPUE)=="factor") dt1$ATYACPUE <-as.numeric(levels(dt1$ATYACPUE))[as.integer(dt1$ATYACPUE) ]               
if (class(dt1$ATYACPUE)=="character") dt1$ATYACPUE <-as.numeric(dt1$ATYACPUE)
if (class(dt1$XIPHCPUE)!="factor") dt1$XIPHCPUE<- as.factor(dt1$XIPHCPUE)
if (class(dt1$MACCPUE)=="factor") dt1$MACCPUE <-as.numeric(levels(dt1$MACCPUE))[as.integer(dt1$MACCPUE) ]               
if (class(dt1$MACCPUE)=="character") dt1$MACCPUE <-as.numeric(dt1$MACCPUE)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(Month)
summary(POOL)
summary(ATYACPUE)
summary(XIPHCPUE)
summary(MACCPUE) 
# Get more details on character variables

summary(as.factor(dt1$YEAR)) 
summary(as.factor(dt1$Month)) 
summary(as.factor(dt1$POOL)) 
summary(as.factor(dt1$XIPHCPUE))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/54/945759/34d8e469e9858e13a71eb04a2eb42993" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "Month",     
                 "POOL",     
                 "ATYACPUE",     
                 "XIPHCPUE",     
                 "MACCPUE"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$YEAR)!="factor") dt2$YEAR<- as.factor(dt2$YEAR)
if (class(dt2$Month)!="factor") dt2$Month<- as.factor(dt2$Month)
if (class(dt2$POOL)!="factor") dt2$POOL<- as.factor(dt2$POOL)
if (class(dt2$ATYACPUE)=="factor") dt2$ATYACPUE <-as.numeric(levels(dt2$ATYACPUE))[as.integer(dt2$ATYACPUE) ]               
if (class(dt2$ATYACPUE)=="character") dt2$ATYACPUE <-as.numeric(dt2$ATYACPUE)
if (class(dt2$XIPHCPUE)!="factor") dt2$XIPHCPUE<- as.factor(dt2$XIPHCPUE)
if (class(dt2$MACCPUE)=="factor") dt2$MACCPUE <-as.numeric(levels(dt2$MACCPUE))[as.integer(dt2$MACCPUE) ]               
if (class(dt2$MACCPUE)=="character") dt2$MACCPUE <-as.numeric(dt2$MACCPUE)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(Month)
summary(POOL)
summary(ATYACPUE)
summary(XIPHCPUE)
summary(MACCPUE) 
# Get more details on character variables

summary(as.factor(dt2$YEAR)) 
summary(as.factor(dt2$Month)) 
summary(as.factor(dt2$POOL)) 
summary(as.factor(dt2$XIPHCPUE))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/54/945759/d03686a8ed4241535874144872e69bae" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "Month",     
                 "POOL",     
                 "ATYACPUE",     
                 "XIPHCPUE",     
                 "MACCPUE"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$YEAR)!="factor") dt3$YEAR<- as.factor(dt3$YEAR)
if (class(dt3$Month)!="factor") dt3$Month<- as.factor(dt3$Month)
if (class(dt3$POOL)!="factor") dt3$POOL<- as.factor(dt3$POOL)
if (class(dt3$ATYACPUE)=="factor") dt3$ATYACPUE <-as.numeric(levels(dt3$ATYACPUE))[as.integer(dt3$ATYACPUE) ]               
if (class(dt3$ATYACPUE)=="character") dt3$ATYACPUE <-as.numeric(dt3$ATYACPUE)
if (class(dt3$XIPHCPUE)!="factor") dt3$XIPHCPUE<- as.factor(dt3$XIPHCPUE)
if (class(dt3$MACCPUE)=="factor") dt3$MACCPUE <-as.numeric(levels(dt3$MACCPUE))[as.integer(dt3$MACCPUE) ]               
if (class(dt3$MACCPUE)=="character") dt3$MACCPUE <-as.numeric(dt3$MACCPUE)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(Month)
summary(POOL)
summary(ATYACPUE)
summary(XIPHCPUE)
summary(MACCPUE) 
# Get more details on character variables

summary(as.factor(dt3$YEAR)) 
summary(as.factor(dt3$Month)) 
summary(as.factor(dt3$POOL)) 
summary(as.factor(dt3$XIPHCPUE))
detach(dt3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/54/945759/54e1fa5f894a6e055bf3593095f252e7" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "SAMPLENUM",     
                 "WEEK",     
                 "Month",     
                 "YEAR",     
                 "POOL",     
                 "ATYACPUE",     
                 "XIPHCPUE",     
                 "MACCPUE"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt4$SAMPLENUM)=="factor") dt4$SAMPLENUM <-as.numeric(levels(dt4$SAMPLENUM))[as.integer(dt4$SAMPLENUM) ]               
if (class(dt4$SAMPLENUM)=="character") dt4$SAMPLENUM <-as.numeric(dt4$SAMPLENUM)
if (class(dt4$WEEK)!="factor") dt4$WEEK<- as.factor(dt4$WEEK)
if (class(dt4$Month)!="factor") dt4$Month<- as.factor(dt4$Month)
if (class(dt4$YEAR)!="factor") dt4$YEAR<- as.factor(dt4$YEAR)
if (class(dt4$POOL)!="factor") dt4$POOL<- as.factor(dt4$POOL)
if (class(dt4$ATYACPUE)=="factor") dt4$ATYACPUE <-as.numeric(levels(dt4$ATYACPUE))[as.integer(dt4$ATYACPUE) ]               
if (class(dt4$ATYACPUE)=="character") dt4$ATYACPUE <-as.numeric(dt4$ATYACPUE)
if (class(dt4$XIPHCPUE)!="factor") dt4$XIPHCPUE<- as.factor(dt4$XIPHCPUE)
if (class(dt4$MACCPUE)=="factor") dt4$MACCPUE <-as.numeric(levels(dt4$MACCPUE))[as.integer(dt4$MACCPUE) ]               
if (class(dt4$MACCPUE)=="character") dt4$MACCPUE <-as.numeric(dt4$MACCPUE)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(SAMPLENUM)
summary(WEEK)
summary(Month)
summary(YEAR)
summary(POOL)
summary(ATYACPUE)
summary(XIPHCPUE)
summary(MACCPUE) 
# Get more details on character variables

summary(as.factor(dt4$WEEK)) 
summary(as.factor(dt4$Month)) 
summary(as.factor(dt4$YEAR)) 
summary(as.factor(dt4$POOL)) 
summary(as.factor(dt4$XIPHCPUE))
detach(dt4)               


inUrl5  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/54/945759/1f34629212ee85b4998c023ba0645949" 
infile5 <- tempfile()
try(download.file(inUrl5,infile5,method="curl"))
if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")


dt5 <-read.csv(infile5,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "SAMPLENUM",     
                 "WEEK",     
                 "Month",     
                 "YEAR",     
                 "POOL",     
                 "ATYACPUE",     
                 "XIPHCPUE",     
                 "MACCPUE"    ), check.names=TRUE)

unlink(infile5)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt5$SAMPLENUM)=="factor") dt5$SAMPLENUM <-as.numeric(levels(dt5$SAMPLENUM))[as.integer(dt5$SAMPLENUM) ]               
if (class(dt5$SAMPLENUM)=="character") dt5$SAMPLENUM <-as.numeric(dt5$SAMPLENUM)
if (class(dt5$WEEK)!="factor") dt5$WEEK<- as.factor(dt5$WEEK)
if (class(dt5$Month)!="factor") dt5$Month<- as.factor(dt5$Month)
if (class(dt5$POOL)!="factor") dt5$POOL<- as.factor(dt5$POOL)
if (class(dt5$ATYACPUE)=="factor") dt5$ATYACPUE <-as.numeric(levels(dt5$ATYACPUE))[as.integer(dt5$ATYACPUE) ]               
if (class(dt5$ATYACPUE)=="character") dt5$ATYACPUE <-as.numeric(dt5$ATYACPUE)
if (class(dt5$XIPHCPUE)!="factor") dt5$XIPHCPUE<- as.factor(dt5$XIPHCPUE)
if (class(dt5$MACCPUE)=="factor") dt5$MACCPUE <-as.numeric(levels(dt5$MACCPUE))[as.integer(dt5$MACCPUE) ]               
if (class(dt5$MACCPUE)=="character") dt5$MACCPUE <-as.numeric(dt5$MACCPUE)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt5)                            
attach(dt5)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(SAMPLENUM)
summary(WEEK)
summary(Month)
summary(YEAR)
summary(POOL)
summary(ATYACPUE)
summary(XIPHCPUE)
summary(MACCPUE) 
# Get more details on character variables

summary(as.factor(dt5$WEEK)) 
summary(as.factor(dt5$Month)) 
summary(as.factor(dt5$POOL)) 
summary(as.factor(dt5$XIPHCPUE))
detach(dt5)               


inUrl6  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/54/945759/7a7a8f81d13569cb7e6dc70368399cf2" 
infile6 <- tempfile()
try(download.file(inUrl6,infile6,method="curl"))
if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")


dt6 <-read.csv(infile6,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "SAMPLENUM",     
                 "WEEK",     
                 "Month",     
                 "YEAR",     
                 "POOL",     
                 "ATYACPUE",     
                 "XIPHCPUE",     
                 "MACCPUE"    ), check.names=TRUE)

unlink(infile6)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt6$SAMPLENUM)=="factor") dt6$SAMPLENUM <-as.numeric(levels(dt6$SAMPLENUM))[as.integer(dt6$SAMPLENUM) ]               
if (class(dt6$SAMPLENUM)=="character") dt6$SAMPLENUM <-as.numeric(dt6$SAMPLENUM)
if (class(dt6$WEEK)!="factor") dt6$WEEK<- as.factor(dt6$WEEK)
if (class(dt6$Month)!="factor") dt6$Month<- as.factor(dt6$Month)
if (class(dt6$YEAR)!="factor") dt6$YEAR<- as.factor(dt6$YEAR)
if (class(dt6$POOL)!="factor") dt6$POOL<- as.factor(dt6$POOL)
if (class(dt6$ATYACPUE)=="factor") dt6$ATYACPUE <-as.numeric(levels(dt6$ATYACPUE))[as.integer(dt6$ATYACPUE) ]               
if (class(dt6$ATYACPUE)=="character") dt6$ATYACPUE <-as.numeric(dt6$ATYACPUE)
if (class(dt6$XIPHCPUE)!="factor") dt6$XIPHCPUE<- as.factor(dt6$XIPHCPUE)
if (class(dt6$MACCPUE)=="factor") dt6$MACCPUE <-as.numeric(levels(dt6$MACCPUE))[as.integer(dt6$MACCPUE) ]               
if (class(dt6$MACCPUE)=="character") dt6$MACCPUE <-as.numeric(dt6$MACCPUE)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt6)                            
attach(dt6)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(SAMPLENUM)
summary(WEEK)
summary(Month)
summary(YEAR)
summary(POOL)
summary(ATYACPUE)
summary(XIPHCPUE)
summary(MACCPUE) 
# Get more details on character variables

summary(as.factor(dt6$WEEK)) 
summary(as.factor(dt6$Month)) 
summary(as.factor(dt6$YEAR)) 
summary(as.factor(dt6$POOL)) 
summary(as.factor(dt6$XIPHCPUE))
detach(dt6)               





