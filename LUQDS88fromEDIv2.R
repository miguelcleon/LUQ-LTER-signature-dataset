# Package ID: knb-lter-luq.88.559514 Cataloging System:https://pasta.edirepository.org.
# Data set title: Phenologies of the Tabonuco Forest trees and shrubs.
# Data set creator:  Jess Zimmerman -  
# Data set creator:    - International Institute of Tropical Forestry(IITF), USDA Forest Service. 
# Metadata Provider:  Christopher Nytch -  
# Contact:  Jess Zimmerman -  University of Puerto Rico, Rio Piedras Campus  - jesskz@ites.upr.edu
# Contact:  Christopher Nytch -    - chris.nytch@ites.upr.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/88/559515/1a915cd7cda61bb87377febce75eedb2"
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


pheno1edi <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "CENSUS",     
                 "LTER.Site",     
                 "Methods.notes",     
                 "Date",     
                 "BASKET",     
                 "SPECIES",     
                 "CODE",     
                 "NUMBER",     
                 "Seed_Trap_Area_m2",     
                 "COMMENTS"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(pheno1edi$CENSUS)=="factor") pheno1edi$CENSUS <-as.numeric(levels(pheno1edi$CENSUS))[as.integer(pheno1edi$CENSUS) ]               
if (class(pheno1edi$CENSUS)=="character") pheno1edi$CENSUS <-as.numeric(pheno1edi$CENSUS)
if (class(pheno1edi$BASKET)=="factor") pheno1edi$BASKET <-as.numeric(levels(pheno1edi$BASKET))[as.integer(pheno1edi$BASKET) ]               
if (class(pheno1edi$BASKET)=="character") pheno1edi$BASKET <-as.numeric(pheno1edi$BASKET)
if (class(pheno1edi$CODE)=="factor") pheno1edi$CODE <-as.numeric(levels(pheno1edi$CODE))[as.integer(pheno1edi$CODE) ]               
if (class(pheno1edi$CODE)=="character") pheno1edi$CODE <-as.numeric(pheno1edi$CODE)
if (class(pheno1edi$NUMBER)=="factor") pheno1edi$NUMBER <-as.numeric(levels(pheno1edi$NUMBER))[as.integer(pheno1edi$NUMBER) ]               
if (class(pheno1edi$NUMBER)=="character") pheno1edi$NUMBER <-as.numeric(pheno1edi$NUMBER)
if (class(pheno1edi$Seed_Trap_Area_m2)=="factor") pheno1edi$Seed_Trap_Area_m2 <-as.numeric(levels(pheno1edi$Seed_Trap_Area_m2))[as.integer(pheno1edi$Seed_Trap_Area_m2) ]               
if (class(pheno1edi$Seed_Trap_Area_m2)=="character") pheno1edi$Seed_Trap_Area_m2 <-as.numeric(pheno1edi$Seed_Trap_Area_m2)
if (class(pheno1edi$COMMENTS)!="factor") pheno1edi$COMMENTS<- as.factor(pheno1edi$COMMENTS)

# Convert Missing Values to NA for non-dates

pheno1edi$BASKET <- ifelse((trimws(as.character(pheno1edi$BASKET))==trimws("none")),NA,pheno1edi$BASKET)               
suppressWarnings(pheno1edi$BASKET <- ifelse(!is.na(as.numeric("none")) & (trimws(as.character(pheno1edi$BASKET))==as.character(as.numeric("none"))),NA,pheno1edi$BASKET))
pheno1edi$NUMBER <- ifelse((trimws(as.character(pheno1edi$NUMBER))==trimws("blank")),NA,pheno1edi$NUMBER)               
suppressWarnings(pheno1edi$NUMBER <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(pheno1edi$NUMBER))==as.character(as.numeric("blank"))),NA,pheno1edi$NUMBER))


# Here is the structure of the input data frame:
str(pheno1edi)                            
attach(pheno1edi)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(CENSUS)
summary(LTER.Site)
summary(Methods.notes)
summary(Date)
summary(BASKET)
summary(SPECIES)
summary(CODE)
summary(NUMBER)
summary(Seed_Trap_Area_m2)
summary(COMMENTS) 
# Get more details on character variables

summary(as.factor(pheno1edi$COMMENTS))
detach(pheno1edi)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/88/559515/e8fd3250eeaed30492228f0c0ae1518c"
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


pheno2edi <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "CENSUS",     
                 "LTER.Site",     
                 "Methods.notes",     
                 "Date",     
                 "BASKET",     
                 "SPECIES",     
                 "CODE",     
                 "NUMBER",     
                 "Seed_Trap_Area_m2",     
                 "COMMENTS"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(pheno2edi$CENSUS)=="factor") pheno2edi$CENSUS <-as.numeric(levels(pheno2edi$CENSUS))[as.integer(pheno2edi$CENSUS) ]               
if (class(pheno2edi$CENSUS)=="character") pheno2edi$CENSUS <-as.numeric(pheno2edi$CENSUS)
if (class(pheno2edi$BASKET)=="factor") pheno2edi$BASKET <-as.numeric(levels(pheno2edi$BASKET))[as.integer(pheno2edi$BASKET) ]               
if (class(pheno2edi$BASKET)=="character") pheno2edi$BASKET <-as.numeric(pheno2edi$BASKET)
if (class(pheno2edi$CODE)=="factor") pheno2edi$CODE <-as.numeric(levels(pheno2edi$CODE))[as.integer(pheno2edi$CODE) ]               
if (class(pheno2edi$CODE)=="character") pheno2edi$CODE <-as.numeric(pheno2edi$CODE)
if (class(pheno2edi$NUMBER)=="factor") pheno2edi$NUMBER <-as.numeric(levels(pheno2edi$NUMBER))[as.integer(pheno2edi$NUMBER) ]               
if (class(pheno2edi$NUMBER)=="character") pheno2edi$NUMBER <-as.numeric(pheno2edi$NUMBER)
if (class(pheno2edi$Seed_Trap_Area_m2)=="factor") pheno2edi$Seed_Trap_Area_m2 <-as.numeric(levels(pheno2edi$Seed_Trap_Area_m2))[as.integer(pheno2edi$Seed_Trap_Area_m2) ]               
if (class(pheno2edi$Seed_Trap_Area_m2)=="character") pheno2edi$Seed_Trap_Area_m2 <-as.numeric(pheno2edi$Seed_Trap_Area_m2)
if (class(pheno2edi$COMMENTS)!="factor") pheno2edi$COMMENTS<- as.factor(pheno2edi$COMMENTS)

# Convert Missing Values to NA for non-dates

pheno2edi$BASKET <- ifelse((trimws(as.character(pheno2edi$BASKET))==trimws("none")),NA,pheno2edi$BASKET)               
suppressWarnings(pheno2edi$BASKET <- ifelse(!is.na(as.numeric("none")) & (trimws(as.character(pheno2edi$BASKET))==as.character(as.numeric("none"))),NA,pheno2edi$BASKET))
pheno2edi$NUMBER <- ifelse((trimws(as.character(pheno2edi$NUMBER))==trimws("blank")),NA,pheno2edi$NUMBER)               
suppressWarnings(pheno2edi$NUMBER <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(pheno2edi$NUMBER))==as.character(as.numeric("blank"))),NA,pheno2edi$NUMBER))


# Here is the structure of the input data frame:
str(pheno2edi)                            
attach(pheno2edi)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(CENSUS)
summary(LTER.Site)
summary(Methods.notes)
summary(Date)
summary(BASKET)
summary(SPECIES)
summary(CODE)
summary(NUMBER)
summary(Seed_Trap_Area_m2)
summary(COMMENTS) 
# Get more details on character variables

summary(as.factor(pheno2edi$COMMENTS))
detach(pheno2edi)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/88/559514/bc937162b819251656d2978754f6ae1e" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")

dttemp <-read.csv(infile3)
dttemp[1,]
dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Date",     
                 "BASKET",     
                 "SPECIES",     
                 "CODE",     
                 "NUMBER",     
                 "COMMENTS"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$BASKET)=="factor") dt3$BASKET <-as.numeric(levels(dt3$BASKET))[as.integer(dt3$BASKET) ]               
if (class(dt3$BASKET)=="character") dt3$BASKET <-as.numeric(dt3$BASKET)
if (class(dt3$CODE)=="factor") dt3$CODE <-as.numeric(levels(dt3$CODE))[as.integer(dt3$CODE) ]               
if (class(dt3$CODE)=="character") dt3$CODE <-as.numeric(dt3$CODE)
if (class(dt3$NUMBER)=="factor") dt3$NUMBER <-as.numeric(levels(dt3$NUMBER))[as.integer(dt3$NUMBER) ]               
if (class(dt3$NUMBER)=="character") dt3$NUMBER <-as.numeric(dt3$NUMBER)
if (class(dt3$COMMENTS)!="factor") dt3$COMMENTS<- as.factor(dt3$COMMENTS)

# Convert Missing Values to NA for non-dates

dt3$BASKET <- ifelse((trimws(as.character(dt3$BASKET))==trimws("none")),NA,dt3$BASKET)               
suppressWarnings(dt3$BASKET <- ifelse(!is.na(as.numeric("none")) & (trimws(as.character(dt3$BASKET))==as.character(as.numeric("none"))),NA,dt3$BASKET))
dt3$NUMBER <- ifelse((trimws(as.character(dt3$NUMBER))==trimws("blank")),NA,dt3$NUMBER)               
suppressWarnings(dt3$NUMBER <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt3$NUMBER))==as.character(as.numeric("blank"))),NA,dt3$NUMBER))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(BASKET)
summary(SPECIES)
summary(CODE)
summary(NUMBER)
summary(COMMENTS) 
# Get more details on character variables

summary(as.factor(dt3$COMMENTS))
detach(dt3)               





