# rainfall and throughfall chemistry and amounts 

# Package ID: knb-lter-luq.174.2110859 Cataloging System:https://pasta.edirepository.org.
# Data set title: Chemistry of rainfall and throughfall from El Verde and Bisley.
# Data set creator:  William H. McDowell -  
# Data set creator:    - International Institute of Tropical Forestry(IITF), USDA Forest Service. 
# Metadata Provider:  Jody Potter -  
# Contact:  William H. McDowell -    - Bill.McDowell@unh.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/b22fd5ed1c470cf6d433d88856b4aaa5"
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Analyte",     
                 "MDL",     
                 "Units"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$Analyte)!="factor") dt1$Analyte<- as.factor(dt1$Analyte)
if (class(dt1$MDL)=="factor") dt1$MDL <-as.numeric(levels(dt1$MDL))[as.integer(dt1$MDL) ]               
if (class(dt1$MDL)=="character") dt1$MDL <-as.numeric(dt1$MDL)
if (class(dt1$Units)=="factor") dt1$Units <-as.numeric(levels(dt1$Units))[as.integer(dt1$Units) ]               
if (class(dt1$Units)=="character") dt1$Units <-as.numeric(dt1$Units)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Analyte)
summary(MDL)
summary(Units) 
# Get more details on character variables

summary(as.factor(dt1$Analyte))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/6054f9f1aacb6bbefddface8f4464016"
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "Watershed.or.Collector.s.location",     
                 "Sample.Code",     
                 "Sample.Date",     
                 "Sample.Time",     
                 "Weekly.amount.collected",     
                 "Temperature.of.water.sample",     
                 "pH.Electrometric.with.combination.electrode",     
                 "Conductivity",     
                 "Comments.at.the.field",     
                 "Amount_Unit"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$Watershed.or.Collector.s.location)!="factor") dt2$Watershed.or.Collector.s.location<- as.factor(
  dt2$Watershed.or.Collector.s.location)
if (class(dt2$Sample.Code)=="factor") dt2$Sample.Code <-as.numeric(levels(dt2$Sample.Code))[as.integer(dt2$Sample.Code) ]               
if (class(dt2$Sample.Code)=="character") dt2$Sample.Code <-as.character(dt2$Sample.Code)                                   
# attempting to convert dt2$Sample.Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%d/%m/%Y"
tmp2Sample.Date<-as.Date(dt2$Sample.Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp2Sample.Date) == length(tmp2Sample.Date[!is.na(tmp2Sample.Date)])){dt2$Sample.Date <- tmp2Sample.Date } else {print("Date conversion failed for dt2$Sample.Date. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp2Sample.Date) 
if (class(dt2$Sample.Time)=="factor") dt2$Sample.Time <-as.numeric(levels(dt2$Sample.Time))[as.integer(dt2$Sample.Time) ]               
if (class(dt2$Sample.Time)=="character") dt2$Sample.Time <-as.numeric(dt2$Sample.Time)
if (class(dt2$Weekly.amount.collected)!="factor") dt2$Weekly.amount.collected<- as.factor(dt2$Weekly.amount.collected)
if (class(dt2$Temperature.of.water.sample)=="factor") dt2$Temperature.of.water.sample <-as.numeric(levels(dt2$Temperature.of.water.sample))[as.integer(dt2$Temperature.of.water.sample) ]               
if (class(dt2$Temperature.of.water.sample)=="character") dt2$Temperature.of.water.sample <-as.numeric(dt2$Temperature.of.water.sample)
if (class(dt2$pH.Electrometric.with.combination.electrode)=="factor") dt2$pH.Electrometric.with.combination.electrode <-as.numeric(levels(dt2$pH.Electrometric.with.combination.electrode))[as.integer(dt2$pH.Electrometric.with.combination.electrode) ]               
if (class(dt2$pH.Electrometric.with.combination.electrode)=="character") dt2$pH.Electrometric.with.combination.electrode <-as.numeric(dt2$pH.Electrometric.with.combination.electrode)
if (class(dt2$Conductivity)=="factor") dt2$Conductivity <-as.numeric(levels(dt2$Conductivity))[as.integer(dt2$Conductivity) ]               
if (class(dt2$Conductivity)=="character") dt2$Conductivity <-as.numeric(dt2$Conductivity)
if (class(dt2$Comments.at.the.field)!="factor") dt2$Comments.at.the.field<- as.factor(dt2$Comments.at.the.field)
if (class(dt2$Amount_Unit)!="factor") dt2$Amount_Unit<- as.factor(dt2$Amount_Unit)
                
# Convert Missing Values to NA for non-dates
                
dt2$Sample.Code <- ifelse((trimws(as.character(dt2$Sample.Code))==trimws("NA")),NA,dt2$Sample.Code)               
suppressWarnings(dt2$Sample.Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Sample.Code))==as.character(as.numeric("NA"))),NA,dt2$Sample.Code))
dt2$Sample.Time <- ifelse((trimws(as.character(dt2$Sample.Time))==trimws("NA")),NA,dt2$Sample.Time)               
suppressWarnings(dt2$Sample.Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Sample.Time))==as.character(as.numeric("NA"))),NA,dt2$Sample.Time))
dt2$Temperature.of.water.sample <- ifelse((trimws(as.character(dt2$Temperature.of.water.sample))==trimws("NA")),NA,dt2$Temperature.of.water.sample)               
suppressWarnings(dt2$Temperature.of.water.sample <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Temperature.of.water.sample))==as.character(as.numeric("NA"))),NA,dt2$Temperature.of.water.sample))
dt2$pH.Electrometric.with.combination.electrode <- ifelse((trimws(as.character(dt2$pH.Electrometric.with.combination.electrode))==trimws("NA")),NA,dt2$pH.Electrometric.with.combination.electrode)               
suppressWarnings(dt2$pH.Electrometric.with.combination.electrode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$pH.Electrometric.with.combination.electrode))==as.character(as.numeric("NA"))),NA,dt2$pH.Electrometric.with.combination.electrode))
dt2$Conductivity <- ifelse((trimws(as.character(dt2$Conductivity))==trimws("NA")),NA,dt2$Conductivity)               
suppressWarnings(dt2$Conductivity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Conductivity))==as.character(as.numeric("NA"))),NA,dt2$Conductivity))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Watershed.or.Collector.s.location)
summary(Sample.Code)
summary(Sample.Date)
summary(Sample.Time)
summary(Weekly.amount.collected)
summary(Temperature.of.water.sample)
summary(pH.Electrometric.with.combination.electrode)
summary(Conductivity)
summary(Comments.at.the.field)
summary(Amount_Unit) 
# Get more details on character variables

summary(as.factor(dt2$Watershed.or.Collector.s.location)) 
summary(as.factor(dt2$Weekly.amount.collected)) 
summary(as.factor(dt2$Comments.at.the.field)) 
summary(as.factor(dt2$Amount_Unit))
detach(dt2)               
         

inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/da51d75107589e890aeaf5a4c36f0f4c"
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")

                   
 dt3 <-read.csv(infile3,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "Sample_ID",     
                    "Code",     
                    "Sample_Date",     
                    "Sample_Time",     
                    "Temperature.of.water.sample",     
                    "pH",     
                    "Cond",     
                    "Cl",     
                    "NO3.hyphen.N",     
                    "SO4.hyphen.S",     
                    "Na",     
                    "K",     
                    "Mg",     
                    "Ca",     
                    "NH4.hyphen.N",     
                    "PO4.hyphen.P",     
                    "DOC",     
                    "DIC",     
                    "TDN",     
                    "TDP",     
                    "SiO2",     
                    "ChlorideCode",     
                    "NitrateCode",     
                    "SulfateCode",     
                    "SodiumCode",     
                    "PotassiumCode",     
                    "MagnesiumCode",     
                    "CalciumCode",     
                    "NH4Code",     
                    "PO4Code",     
                    "DOCCode",     
                    "DICCode",     
                    "TDNCode",     
                    "SiO2Code"    ), check.names=TRUE)
               
unlink(infile3)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt3$Sample_ID)!="factor") dt3$Sample_ID<- as.factor(dt3$Sample_ID)
if (class(dt3$Code)=="factor") dt3$Code <-as.numeric(levels(dt3$Code))[as.integer(dt3$Code) ]               
if (class(dt3$Code)=="character") dt3$Code <-as.numeric(dt3$Code)                                   
# attempting to convert dt3$Sample_Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp3Sample_Date<-as.Date(dt3$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp3Sample_Date) == length(tmp3Sample_Date[!is.na(tmp3Sample_Date)])){dt3$Sample_Date <- tmp3Sample_Date } else {print("Date conversion failed for dt3$Sample_Date. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp3Sample_Date) 
if (class(dt3$Sample_Time)=="factor") dt3$Sample_Time <-as.numeric(levels(dt3$Sample_Time))[as.integer(dt3$Sample_Time) ]               
if (class(dt3$Sample_Time)=="character") dt3$Sample_Time <-as.numeric(dt3$Sample_Time)
if (class(dt3$Temperature.of.water.sample)=="factor") dt3$Temperature.of.water.sample <-as.numeric(levels(dt3$Temperature.of.water.sample))[as.integer(dt3$Temperature.of.water.sample) ]               
if (class(dt3$Temperature.of.water.sample)=="character") dt3$Temperature.of.water.sample <-as.numeric(dt3$Temperature.of.water.sample)
if (class(dt3$pH)=="factor") dt3$pH <-as.numeric(levels(dt3$pH))[as.integer(dt3$pH) ]               
if (class(dt3$pH)=="character") dt3$pH <-as.numeric(dt3$pH)
if (class(dt3$Cond)=="factor") dt3$Cond <-as.numeric(levels(dt3$Cond))[as.integer(dt3$Cond) ]               
if (class(dt3$Cond)=="character") dt3$Cond <-as.numeric(dt3$Cond)
if (class(dt3$Cl)=="factor") dt3$Cl <-as.numeric(levels(dt3$Cl))[as.integer(dt3$Cl) ]               
if (class(dt3$Cl)=="character") dt3$Cl <-as.numeric(dt3$Cl)
if (class(dt3$NO3.hyphen.N)=="factor") dt3$NO3.hyphen.N <-as.numeric(levels(dt3$NO3.hyphen.N))[as.integer(dt3$NO3.hyphen.N) ]               
if (class(dt3$NO3.hyphen.N)=="character") dt3$NO3.hyphen.N <-as.numeric(dt3$NO3.hyphen.N)
if (class(dt3$SO4.hyphen.S)=="factor") dt3$SO4.hyphen.S <-as.numeric(levels(dt3$SO4.hyphen.S))[as.integer(dt3$SO4.hyphen.S) ]               
if (class(dt3$SO4.hyphen.S)=="character") dt3$SO4.hyphen.S <-as.numeric(dt3$SO4.hyphen.S)
if (class(dt3$Na)!="factor") dt3$Na<- as.factor(dt3$Na)
if (class(dt3$K)=="factor") dt3$K <-as.numeric(levels(dt3$K))[as.integer(dt3$K) ]               
if (class(dt3$K)=="character") dt3$K <-as.numeric(dt3$K)
if (class(dt3$Mg)=="factor") dt3$Mg <-as.numeric(levels(dt3$Mg))[as.integer(dt3$Mg) ]               
if (class(dt3$Mg)=="character") dt3$Mg <-as.numeric(dt3$Mg)
if (class(dt3$Ca)=="factor") dt3$Ca <-as.numeric(levels(dt3$Ca))[as.integer(dt3$Ca) ]               
if (class(dt3$Ca)=="character") dt3$Ca <-as.numeric(dt3$Ca)
if (class(dt3$NH4.hyphen.N)=="factor") dt3$NH4.hyphen.N <-as.numeric(levels(dt3$NH4.hyphen.N))[as.integer(dt3$NH4.hyphen.N) ]               
if (class(dt3$NH4.hyphen.N)=="character") dt3$NH4.hyphen.N <-as.numeric(dt3$NH4.hyphen.N)
if (class(dt3$PO4.hyphen.P)=="factor") dt3$PO4.hyphen.P <-as.numeric(levels(dt3$PO4.hyphen.P))[as.integer(dt3$PO4.hyphen.P) ]               
if (class(dt3$PO4.hyphen.P)=="character") dt3$PO4.hyphen.P <-as.numeric(dt3$PO4.hyphen.P)
if (class(dt3$DOC)=="factor") dt3$DOC <-as.numeric(levels(dt3$DOC))[as.integer(dt3$DOC) ]               
if (class(dt3$DOC)=="character") dt3$DOC <-as.numeric(dt3$DOC)
if (class(dt3$DIC)=="factor") dt3$DIC <-as.numeric(levels(dt3$DIC))[as.integer(dt3$DIC) ]               
if (class(dt3$DIC)=="character") dt3$DIC <-as.numeric(dt3$DIC)
if (class(dt3$TDN)=="factor") dt3$TDN <-as.numeric(levels(dt3$TDN))[as.integer(dt3$TDN) ]               
if (class(dt3$TDN)=="character") dt3$TDN <-as.numeric(dt3$TDN)
if (class(dt3$TDP)=="factor") dt3$TDP <-as.numeric(levels(dt3$TDP))[as.integer(dt3$TDP) ]               
if (class(dt3$TDP)=="character") dt3$TDP <-as.numeric(dt3$TDP)
if (class(dt3$SiO2)=="factor") dt3$SiO2 <-as.numeric(levels(dt3$SiO2))[as.integer(dt3$SiO2) ]               
if (class(dt3$SiO2)=="character") dt3$SiO2 <-as.numeric(dt3$SiO2)
if (class(dt3$ChlorideCode)!="factor") dt3$ChlorideCode<- as.factor(dt3$ChlorideCode)
if (class(dt3$NitrateCode)!="factor") dt3$NitrateCode<- as.factor(dt3$NitrateCode)
if (class(dt3$SulfateCode)!="factor") dt3$SulfateCode<- as.factor(dt3$SulfateCode)
if (class(dt3$SodiumCode)!="factor") dt3$SodiumCode<- as.factor(dt3$SodiumCode)
if (class(dt3$PotassiumCode)!="factor") dt3$PotassiumCode<- as.factor(dt3$PotassiumCode)
if (class(dt3$MagnesiumCode)!="factor") dt3$MagnesiumCode<- as.factor(dt3$MagnesiumCode)
if (class(dt3$CalciumCode)!="factor") dt3$CalciumCode<- as.factor(dt3$CalciumCode)
if (class(dt3$NH4Code)!="factor") dt3$NH4Code<- as.factor(dt3$NH4Code)
if (class(dt3$PO4Code)!="factor") dt3$PO4Code<- as.factor(dt3$PO4Code)
if (class(dt3$DOCCode)!="factor") dt3$DOCCode<- as.factor(dt3$DOCCode)
if (class(dt3$DICCode)!="factor") dt3$DICCode<- as.factor(dt3$DICCode)
if (class(dt3$TDNCode)!="factor") dt3$TDNCode<- as.factor(dt3$TDNCode)
if (class(dt3$SiO2Code)!="factor") dt3$SiO2Code<- as.factor(dt3$SiO2Code)
                
# Convert Missing Values to NA for non-dates
                
dt3$Code <- ifelse((trimws(as.character(dt3$Code))==trimws("NA")),NA,dt3$Code)               
suppressWarnings(dt3$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Code))==as.character(as.numeric("NA"))),NA,dt3$Code))
dt3$Sample_Time <- ifelse((trimws(as.character(dt3$Sample_Time))==trimws("NA")),NA,dt3$Sample_Time)               
suppressWarnings(dt3$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Sample_Time))==as.character(as.numeric("NA"))),NA,dt3$Sample_Time))
dt3$Temperature.of.water.sample <- ifelse((trimws(as.character(dt3$Temperature.of.water.sample))==trimws("NA")),NA,dt3$Temperature.of.water.sample)               
suppressWarnings(dt3$Temperature.of.water.sample <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Temperature.of.water.sample))==as.character(as.numeric("NA"))),NA,dt3$Temperature.of.water.sample))
dt3$pH <- ifelse((trimws(as.character(dt3$pH))==trimws("NA")),NA,dt3$pH)               
suppressWarnings(dt3$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$pH))==as.character(as.numeric("NA"))),NA,dt3$pH))
dt3$Cond <- ifelse((trimws(as.character(dt3$Cond))==trimws("NA")),NA,dt3$Cond)               
suppressWarnings(dt3$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Cond))==as.character(as.numeric("NA"))),NA,dt3$Cond))
dt3$Cl <- ifelse((trimws(as.character(dt3$Cl))==trimws("NA")),NA,dt3$Cl)               
suppressWarnings(dt3$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Cl))==as.character(as.numeric("NA"))),NA,dt3$Cl))
dt3$NO3.hyphen.N <- ifelse((trimws(as.character(dt3$NO3.hyphen.N))==trimws("NA")),NA,dt3$NO3.hyphen.N)               
suppressWarnings(dt3$NO3.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$NO3.hyphen.N))==as.character(as.numeric("NA"))),NA,dt3$NO3.hyphen.N))
dt3$SO4.hyphen.S <- ifelse((trimws(as.character(dt3$SO4.hyphen.S))==trimws("NA")),NA,dt3$SO4.hyphen.S)               
suppressWarnings(dt3$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt3$SO4.hyphen.S))
dt3$Mg <- ifelse((trimws(as.character(dt3$Mg))==trimws("NA")),NA,dt3$Mg)               
suppressWarnings(dt3$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Mg))==as.character(as.numeric("NA"))),NA,dt3$Mg))
dt3$Ca <- ifelse((trimws(as.character(dt3$Ca))==trimws("NA")),NA,dt3$Ca)               
suppressWarnings(dt3$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Ca))==as.character(as.numeric("NA"))),NA,dt3$Ca))
dt3$NH4.hyphen.N <- ifelse((trimws(as.character(dt3$NH4.hyphen.N))==trimws("NA")),NA,dt3$NH4.hyphen.N)               
suppressWarnings(dt3$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt3$NH4.hyphen.N))
dt3$PO4.hyphen.P <- ifelse((trimws(as.character(dt3$PO4.hyphen.P))==trimws("NA")),NA,dt3$PO4.hyphen.P)               
suppressWarnings(dt3$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt3$PO4.hyphen.P))
dt3$DOC <- ifelse((trimws(as.character(dt3$DOC))==trimws("NA")),NA,dt3$DOC)               
suppressWarnings(dt3$DOC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$DOC))==as.character(as.numeric("NA"))),NA,dt3$DOC))
dt3$DIC <- ifelse((trimws(as.character(dt3$DIC))==trimws("NA")),NA,dt3$DIC)               
suppressWarnings(dt3$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$DIC))==as.character(as.numeric("NA"))),NA,dt3$DIC))
dt3$TDN <- ifelse((trimws(as.character(dt3$TDN))==trimws("NA")),NA,dt3$TDN)               
suppressWarnings(dt3$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$TDN))==as.character(as.numeric("NA"))),NA,dt3$TDN))
dt3$TDP <- ifelse((trimws(as.character(dt3$TDP))==trimws("NA")),NA,dt3$TDP)               
suppressWarnings(dt3$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$TDP))==as.character(as.numeric("NA"))),NA,dt3$TDP))
dt3$SiO2 <- ifelse((trimws(as.character(dt3$SiO2))==trimws("NA")),NA,dt3$SiO2)               
suppressWarnings(dt3$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$SiO2))==as.character(as.numeric("NA"))),NA,dt3$SiO2))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Temperature.of.water.sample)
summary(pH)
summary(Cond)
summary(Cl)
summary(NO3.hyphen.N)
summary(SO4.hyphen.S)
summary(Na)
summary(K)
summary(Mg)
summary(Ca)
summary(NH4.hyphen.N)
summary(PO4.hyphen.P)
summary(DOC)
summary(DIC)
summary(TDN)
summary(TDP)
summary(SiO2)
summary(ChlorideCode)
summary(NitrateCode)
summary(SulfateCode)
summary(SodiumCode)
summary(PotassiumCode)
summary(MagnesiumCode)
summary(CalciumCode)
summary(NH4Code)
summary(PO4Code)
summary(DOCCode)
summary(DICCode)
summary(TDNCode)
summary(SiO2Code) 
                # Get more details on character variables
                 
summary(as.factor(dt3$Sample_ID)) 
summary(as.factor(dt3$Na)) 
summary(as.factor(dt3$ChlorideCode)) 
summary(as.factor(dt3$NitrateCode)) 
summary(as.factor(dt3$SulfateCode)) 
summary(as.factor(dt3$SodiumCode)) 
summary(as.factor(dt3$PotassiumCode)) 
summary(as.factor(dt3$MagnesiumCode)) 
summary(as.factor(dt3$CalciumCode)) 
summary(as.factor(dt3$NH4Code)) 
summary(as.factor(dt3$PO4Code)) 
summary(as.factor(dt3$DOCCode)) 
summary(as.factor(dt3$DICCode)) 
summary(as.factor(dt3$TDNCode)) 
summary(as.factor(dt3$SiO2Code))
detach(dt3)               
         

inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/28d1ddb6464df58ffec5db4612aca2b6"
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")

                   
 dt4 <-read.csv(infile4,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "Sample_ID",     
                    "Code",     
                    "Sample_Date",     
                    "Sample_Time",     
                    "Temperature.of.water.sample",     
                    "pH",     
                    "Cond",     
                    "Cl",     
                    "NO3.hyphen.N",     
                    "SO4.hyphen.S",     
                    "Na",     
                    "K",     
                    "Mg",     
                    "Ca",     
                    "NH4.hyphen.N",     
                    "PO4.hyphen.P",     
                    "DOC",     
                    "DIC",     
                    "TDN",     
                    "TDP",     
                    "SiO2",     
                    "ChlorideCode",     
                    "NitrateCode",     
                    "SulfateCode",     
                    "SodiumCode",     
                    "PotassiumCode",     
                    "MagnesiumCode",     
                    "CalciumCode",     
                    "NH4Code",     
                    "PO4Code",     
                    "DOCCode",     
                    "DICCode",     
                    "TDNCode",     
                    "SiO2Code"    ), check.names=TRUE)
               
unlink(infile4)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt4$Sample_ID)!="factor") dt4$Sample_ID<- as.factor(dt4$Sample_ID)
if (class(dt4$Code)=="factor") dt4$Code <-as.numeric(levels(dt4$Code))[as.integer(dt4$Code) ]               
if (class(dt4$Code)=="character") dt4$Code <-as.numeric(dt4$Code)                                   
# attempting to convert dt4$Sample_Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp4Sample_Date<-as.Date(dt4$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp4Sample_Date) == length(tmp4Sample_Date[!is.na(tmp4Sample_Date)])){dt4$Sample_Date <- tmp4Sample_Date } else {print("Date conversion failed for dt4$Sample_Date. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp4Sample_Date) 
if (class(dt4$Sample_Time)=="factor") dt4$Sample_Time <-as.numeric(levels(dt4$Sample_Time))[as.integer(dt4$Sample_Time) ]               
if (class(dt4$Sample_Time)=="character") dt4$Sample_Time <-as.numeric(dt4$Sample_Time)
if (class(dt4$Temperature.of.water.sample)=="factor") dt4$Temperature.of.water.sample <-as.numeric(levels(dt4$Temperature.of.water.sample))[as.integer(dt4$Temperature.of.water.sample) ]               
if (class(dt4$Temperature.of.water.sample)=="character") dt4$Temperature.of.water.sample <-as.numeric(dt4$Temperature.of.water.sample)
if (class(dt4$pH)=="factor") dt4$pH <-as.numeric(levels(dt4$pH))[as.integer(dt4$pH) ]               
if (class(dt4$pH)=="character") dt4$pH <-as.numeric(dt4$pH)
if (class(dt4$Cond)=="factor") dt4$Cond <-as.numeric(levels(dt4$Cond))[as.integer(dt4$Cond) ]               
if (class(dt4$Cond)=="character") dt4$Cond <-as.numeric(dt4$Cond)
if (class(dt4$Cl)=="factor") dt4$Cl <-as.numeric(levels(dt4$Cl))[as.integer(dt4$Cl) ]               
if (class(dt4$Cl)=="character") dt4$Cl <-as.numeric(dt4$Cl)
if (class(dt4$NO3.hyphen.N)=="factor") dt4$NO3.hyphen.N <-as.numeric(levels(dt4$NO3.hyphen.N))[as.integer(dt4$NO3.hyphen.N) ]               
if (class(dt4$NO3.hyphen.N)=="character") dt4$NO3.hyphen.N <-as.numeric(dt4$NO3.hyphen.N)
if (class(dt4$SO4.hyphen.S)=="factor") dt4$SO4.hyphen.S <-as.numeric(levels(dt4$SO4.hyphen.S))[as.integer(dt4$SO4.hyphen.S) ]               
if (class(dt4$SO4.hyphen.S)=="character") dt4$SO4.hyphen.S <-as.numeric(dt4$SO4.hyphen.S)
if (class(dt4$Na)!="factor") dt4$Na<- as.factor(dt4$Na)
if (class(dt4$K)=="factor") dt4$K <-as.numeric(levels(dt4$K))[as.integer(dt4$K) ]               
if (class(dt4$K)=="character") dt4$K <-as.numeric(dt4$K)
if (class(dt4$Mg)=="factor") dt4$Mg <-as.numeric(levels(dt4$Mg))[as.integer(dt4$Mg) ]               
if (class(dt4$Mg)=="character") dt4$Mg <-as.numeric(dt4$Mg)
if (class(dt4$Ca)=="factor") dt4$Ca <-as.numeric(levels(dt4$Ca))[as.integer(dt4$Ca) ]               
if (class(dt4$Ca)=="character") dt4$Ca <-as.numeric(dt4$Ca)
if (class(dt4$NH4.hyphen.N)=="factor") dt4$NH4.hyphen.N <-as.numeric(levels(dt4$NH4.hyphen.N))[as.integer(dt4$NH4.hyphen.N) ]               
if (class(dt4$NH4.hyphen.N)=="character") dt4$NH4.hyphen.N <-as.numeric(dt4$NH4.hyphen.N)
if (class(dt4$PO4.hyphen.P)=="factor") dt4$PO4.hyphen.P <-as.numeric(levels(dt4$PO4.hyphen.P))[as.integer(dt4$PO4.hyphen.P) ]               
if (class(dt4$PO4.hyphen.P)=="character") dt4$PO4.hyphen.P <-as.numeric(dt4$PO4.hyphen.P)
if (class(dt4$DOC)=="factor") dt4$DOC <-as.numeric(levels(dt4$DOC))[as.integer(dt4$DOC) ]               
if (class(dt4$DOC)=="character") dt4$DOC <-as.numeric(dt4$DOC)
if (class(dt4$DIC)=="factor") dt4$DIC <-as.numeric(levels(dt4$DIC))[as.integer(dt4$DIC) ]               
if (class(dt4$DIC)=="character") dt4$DIC <-as.numeric(dt4$DIC)
if (class(dt4$TDN)=="factor") dt4$TDN <-as.numeric(levels(dt4$TDN))[as.integer(dt4$TDN) ]               
if (class(dt4$TDN)=="character") dt4$TDN <-as.numeric(dt4$TDN)
if (class(dt4$TDP)=="factor") dt4$TDP <-as.numeric(levels(dt4$TDP))[as.integer(dt4$TDP) ]               
if (class(dt4$TDP)=="character") dt4$TDP <-as.numeric(dt4$TDP)
if (class(dt4$SiO2)=="factor") dt4$SiO2 <-as.numeric(levels(dt4$SiO2))[as.integer(dt4$SiO2) ]               
if (class(dt4$SiO2)=="character") dt4$SiO2 <-as.numeric(dt4$SiO2)
if (class(dt4$ChlorideCode)!="factor") dt4$ChlorideCode<- as.factor(dt4$ChlorideCode)
if (class(dt4$NitrateCode)!="factor") dt4$NitrateCode<- as.factor(dt4$NitrateCode)
if (class(dt4$SulfateCode)!="factor") dt4$SulfateCode<- as.factor(dt4$SulfateCode)
if (class(dt4$SodiumCode)!="factor") dt4$SodiumCode<- as.factor(dt4$SodiumCode)
if (class(dt4$PotassiumCode)!="factor") dt4$PotassiumCode<- as.factor(dt4$PotassiumCode)
if (class(dt4$MagnesiumCode)!="factor") dt4$MagnesiumCode<- as.factor(dt4$MagnesiumCode)
if (class(dt4$CalciumCode)!="factor") dt4$CalciumCode<- as.factor(dt4$CalciumCode)
if (class(dt4$NH4Code)!="factor") dt4$NH4Code<- as.factor(dt4$NH4Code)
if (class(dt4$PO4Code)!="factor") dt4$PO4Code<- as.factor(dt4$PO4Code)
if (class(dt4$DOCCode)!="factor") dt4$DOCCode<- as.factor(dt4$DOCCode)
if (class(dt4$DICCode)!="factor") dt4$DICCode<- as.factor(dt4$DICCode)
if (class(dt4$TDNCode)!="factor") dt4$TDNCode<- as.factor(dt4$TDNCode)
if (class(dt4$SiO2Code)!="factor") dt4$SiO2Code<- as.factor(dt4$SiO2Code)
                
# Convert Missing Values to NA for non-dates
                
dt4$Code <- ifelse((trimws(as.character(dt4$Code))==trimws("NA")),NA,dt4$Code)               
suppressWarnings(dt4$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Code))==as.character(as.numeric("NA"))),NA,dt4$Code))
dt4$Sample_Time <- ifelse((trimws(as.character(dt4$Sample_Time))==trimws("NA")),NA,dt4$Sample_Time)               
suppressWarnings(dt4$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Sample_Time))==as.character(as.numeric("NA"))),NA,dt4$Sample_Time))
dt4$Temperature.of.water.sample <- ifelse((trimws(as.character(dt4$Temperature.of.water.sample))==trimws("NA")),NA,dt4$Temperature.of.water.sample)               
suppressWarnings(dt4$Temperature.of.water.sample <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Temperature.of.water.sample))==as.character(as.numeric("NA"))),NA,dt4$Temperature.of.water.sample))
dt4$pH <- ifelse((trimws(as.character(dt4$pH))==trimws("NA")),NA,dt4$pH)               
suppressWarnings(dt4$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$pH))==as.character(as.numeric("NA"))),NA,dt4$pH))
dt4$Cond <- ifelse((trimws(as.character(dt4$Cond))==trimws("NA")),NA,dt4$Cond)               
suppressWarnings(dt4$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Cond))==as.character(as.numeric("NA"))),NA,dt4$Cond))
dt4$Cl <- ifelse((trimws(as.character(dt4$Cl))==trimws("NA")),NA,dt4$Cl)               
suppressWarnings(dt4$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Cl))==as.character(as.numeric("NA"))),NA,dt4$Cl))
dt4$NO3.hyphen.N <- ifelse((trimws(as.character(dt4$NO3.hyphen.N))==trimws("NA")),NA,dt4$NO3.hyphen.N)               
suppressWarnings(dt4$NO3.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$NO3.hyphen.N))==as.character(as.numeric("NA"))),NA,dt4$NO3.hyphen.N))
dt4$SO4.hyphen.S <- ifelse((trimws(as.character(dt4$SO4.hyphen.S))==trimws("NA")),NA,dt4$SO4.hyphen.S)               
suppressWarnings(dt4$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt4$SO4.hyphen.S))
dt4$Mg <- ifelse((trimws(as.character(dt4$Mg))==trimws("NA")),NA,dt4$Mg)               
suppressWarnings(dt4$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Mg))==as.character(as.numeric("NA"))),NA,dt4$Mg))
dt4$Ca <- ifelse((trimws(as.character(dt4$Ca))==trimws("NA")),NA,dt4$Ca)               
suppressWarnings(dt4$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Ca))==as.character(as.numeric("NA"))),NA,dt4$Ca))
dt4$NH4.hyphen.N <- ifelse((trimws(as.character(dt4$NH4.hyphen.N))==trimws("NA")),NA,dt4$NH4.hyphen.N)               
suppressWarnings(dt4$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt4$NH4.hyphen.N))
dt4$PO4.hyphen.P <- ifelse((trimws(as.character(dt4$PO4.hyphen.P))==trimws("NA")),NA,dt4$PO4.hyphen.P)               
suppressWarnings(dt4$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt4$PO4.hyphen.P))
dt4$DOC <- ifelse((trimws(as.character(dt4$DOC))==trimws("NA")),NA,dt4$DOC)               
suppressWarnings(dt4$DOC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$DOC))==as.character(as.numeric("NA"))),NA,dt4$DOC))
dt4$DIC <- ifelse((trimws(as.character(dt4$DIC))==trimws("NA")),NA,dt4$DIC)               
suppressWarnings(dt4$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$DIC))==as.character(as.numeric("NA"))),NA,dt4$DIC))
dt4$TDN <- ifelse((trimws(as.character(dt4$TDN))==trimws("NA")),NA,dt4$TDN)               
suppressWarnings(dt4$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$TDN))==as.character(as.numeric("NA"))),NA,dt4$TDN))
dt4$TDP <- ifelse((trimws(as.character(dt4$TDP))==trimws("NA")),NA,dt4$TDP)               
suppressWarnings(dt4$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$TDP))==as.character(as.numeric("NA"))),NA,dt4$TDP))
dt4$SiO2 <- ifelse((trimws(as.character(dt4$SiO2))==trimws("NA")),NA,dt4$SiO2)               
suppressWarnings(dt4$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$SiO2))==as.character(as.numeric("NA"))),NA,dt4$SiO2))


# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Temperature.of.water.sample)
summary(pH)
summary(Cond)
summary(Cl)
summary(NO3.hyphen.N)
summary(SO4.hyphen.S)
summary(Na)
summary(K)
summary(Mg)
summary(Ca)
summary(NH4.hyphen.N)
summary(PO4.hyphen.P)
summary(DOC)
summary(DIC)
summary(TDN)
summary(TDP)
summary(SiO2)
summary(ChlorideCode)
summary(NitrateCode)
summary(SulfateCode)
summary(SodiumCode)
summary(PotassiumCode)
summary(MagnesiumCode)
summary(CalciumCode)
summary(NH4Code)
summary(PO4Code)
summary(DOCCode)
summary(DICCode)
summary(TDNCode)
summary(SiO2Code) 
                # Get more details on character variables
                 
summary(as.factor(dt4$Sample_ID)) 
summary(as.factor(dt4$Na)) 
summary(as.factor(dt4$ChlorideCode)) 
summary(as.factor(dt4$NitrateCode)) 
summary(as.factor(dt4$SulfateCode)) 
summary(as.factor(dt4$SodiumCode)) 
summary(as.factor(dt4$PotassiumCode)) 
summary(as.factor(dt4$MagnesiumCode)) 
summary(as.factor(dt4$CalciumCode)) 
summary(as.factor(dt4$NH4Code)) 
summary(as.factor(dt4$PO4Code)) 
summary(as.factor(dt4$DOCCode)) 
summary(as.factor(dt4$DICCode)) 
summary(as.factor(dt4$TDNCode)) 
summary(as.factor(dt4$SiO2Code))
detach(dt4)               
         

inUrl5  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/44004eb91bc4f303bfcc5d5d3ee84a23"
infile5 <- tempfile()
try(download.file(inUrl5,infile5,method="curl"))
if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")

                   
 dt5 <-read.csv(infile5,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "Sample_ID",     
                    "Code",     
                    "Sample_Date",     
                    "Sample_Time",     
                    "Temperature.of.water.sample",     
                    "pH",     
                    "Cond",     
                    "Cl",     
                    "NO3.hyphen.N",     
                    "SO4.hyphen.S",     
                    "Na",     
                    "K",     
                    "Mg",     
                    "Ca",     
                    "NH4.hyphen.N",     
                    "PO4.hyphen.P",     
                    "DOC",     
                    "DIC",     
                    "TDN",     
                    "TDP",     
                    "SiO2",     
                    "ChlorideCode",     
                    "NitrateCode",     
                    "SulfateCode",     
                    "SodiumCode",     
                    "PotassiumCode",     
                    "MagnesiumCode",     
                    "CalciumCode",     
                    "NH4Code",     
                    "PO4Code",     
                    "DOCCode",     
                    "DICCode",     
                    "TDNCode",     
                    "SiO2Code"    ), check.names=TRUE)
               
unlink(infile5)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt5$Sample_ID)!="factor") dt5$Sample_ID<- as.factor(dt5$Sample_ID)
if (class(dt5$Code)=="factor") dt5$Code <-as.numeric(levels(dt5$Code))[as.integer(dt5$Code) ]               
if (class(dt5$Code)=="character") dt5$Code <-as.numeric(dt5$Code)                                   
# attempting to convert dt5$Sample_Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp5Sample_Date<-as.Date(dt5$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp5Sample_Date) == length(tmp5Sample_Date[!is.na(tmp5Sample_Date)])){dt5$Sample_Date <- tmp5Sample_Date } else {print("Date conversion failed for dt5$Sample_Date. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp5Sample_Date) 
if (class(dt5$Sample_Time)=="factor") dt5$Sample_Time <-as.numeric(levels(dt5$Sample_Time))[as.integer(dt5$Sample_Time) ]               
if (class(dt5$Sample_Time)=="character") dt5$Sample_Time <-as.numeric(dt5$Sample_Time)
if (class(dt5$Temperature.of.water.sample)=="factor") dt5$Temperature.of.water.sample <-as.numeric(levels(dt5$Temperature.of.water.sample))[as.integer(dt5$Temperature.of.water.sample) ]               
if (class(dt5$Temperature.of.water.sample)=="character") dt5$Temperature.of.water.sample <-as.numeric(dt5$Temperature.of.water.sample)
if (class(dt5$pH)=="factor") dt5$pH <-as.numeric(levels(dt5$pH))[as.integer(dt5$pH) ]               
if (class(dt5$pH)=="character") dt5$pH <-as.numeric(dt5$pH)
if (class(dt5$Cond)=="factor") dt5$Cond <-as.numeric(levels(dt5$Cond))[as.integer(dt5$Cond) ]               
if (class(dt5$Cond)=="character") dt5$Cond <-as.numeric(dt5$Cond)
if (class(dt5$Cl)=="factor") dt5$Cl <-as.numeric(levels(dt5$Cl))[as.integer(dt5$Cl) ]               
if (class(dt5$Cl)=="character") dt5$Cl <-as.numeric(dt5$Cl)
if (class(dt5$NO3.hyphen.N)=="factor") dt5$NO3.hyphen.N <-as.numeric(levels(dt5$NO3.hyphen.N))[as.integer(dt5$NO3.hyphen.N) ]               
if (class(dt5$NO3.hyphen.N)=="character") dt5$NO3.hyphen.N <-as.numeric(dt5$NO3.hyphen.N)
if (class(dt5$SO4.hyphen.S)=="factor") dt5$SO4.hyphen.S <-as.numeric(levels(dt5$SO4.hyphen.S))[as.integer(dt5$SO4.hyphen.S) ]               
if (class(dt5$SO4.hyphen.S)=="character") dt5$SO4.hyphen.S <-as.numeric(dt5$SO4.hyphen.S)
if (class(dt5$Na)!="factor") dt5$Na<- as.factor(dt5$Na)
if (class(dt5$K)=="factor") dt5$K <-as.numeric(levels(dt5$K))[as.integer(dt5$K) ]               
if (class(dt5$K)=="character") dt5$K <-as.numeric(dt5$K)
if (class(dt5$Mg)=="factor") dt5$Mg <-as.numeric(levels(dt5$Mg))[as.integer(dt5$Mg) ]               
if (class(dt5$Mg)=="character") dt5$Mg <-as.numeric(dt5$Mg)
if (class(dt5$Ca)=="factor") dt5$Ca <-as.numeric(levels(dt5$Ca))[as.integer(dt5$Ca) ]               
if (class(dt5$Ca)=="character") dt5$Ca <-as.numeric(dt5$Ca)
if (class(dt5$NH4.hyphen.N)=="factor") dt5$NH4.hyphen.N <-as.numeric(levels(dt5$NH4.hyphen.N))[as.integer(dt5$NH4.hyphen.N) ]               
if (class(dt5$NH4.hyphen.N)=="character") dt5$NH4.hyphen.N <-as.numeric(dt5$NH4.hyphen.N)
if (class(dt5$PO4.hyphen.P)=="factor") dt5$PO4.hyphen.P <-as.numeric(levels(dt5$PO4.hyphen.P))[as.integer(dt5$PO4.hyphen.P) ]               
if (class(dt5$PO4.hyphen.P)=="character") dt5$PO4.hyphen.P <-as.numeric(dt5$PO4.hyphen.P)
if (class(dt5$DOC)=="factor") dt5$DOC <-as.numeric(levels(dt5$DOC))[as.integer(dt5$DOC) ]               
if (class(dt5$DOC)=="character") dt5$DOC <-as.numeric(dt5$DOC)
if (class(dt5$DIC)=="factor") dt5$DIC <-as.numeric(levels(dt5$DIC))[as.integer(dt5$DIC) ]               
if (class(dt5$DIC)=="character") dt5$DIC <-as.numeric(dt5$DIC)
if (class(dt5$TDN)=="factor") dt5$TDN <-as.numeric(levels(dt5$TDN))[as.integer(dt5$TDN) ]               
if (class(dt5$TDN)=="character") dt5$TDN <-as.numeric(dt5$TDN)
if (class(dt5$TDP)=="factor") dt5$TDP <-as.numeric(levels(dt5$TDP))[as.integer(dt5$TDP) ]               
if (class(dt5$TDP)=="character") dt5$TDP <-as.numeric(dt5$TDP)
if (class(dt5$SiO2)=="factor") dt5$SiO2 <-as.numeric(levels(dt5$SiO2))[as.integer(dt5$SiO2) ]               
if (class(dt5$SiO2)=="character") dt5$SiO2 <-as.numeric(dt5$SiO2)
if (class(dt5$ChlorideCode)!="factor") dt5$ChlorideCode<- as.factor(dt5$ChlorideCode)
if (class(dt5$NitrateCode)!="factor") dt5$NitrateCode<- as.factor(dt5$NitrateCode)
if (class(dt5$SulfateCode)!="factor") dt5$SulfateCode<- as.factor(dt5$SulfateCode)
if (class(dt5$SodiumCode)!="factor") dt5$SodiumCode<- as.factor(dt5$SodiumCode)
if (class(dt5$PotassiumCode)!="factor") dt5$PotassiumCode<- as.factor(dt5$PotassiumCode)
if (class(dt5$MagnesiumCode)!="factor") dt5$MagnesiumCode<- as.factor(dt5$MagnesiumCode)
if (class(dt5$CalciumCode)!="factor") dt5$CalciumCode<- as.factor(dt5$CalciumCode)
if (class(dt5$NH4Code)!="factor") dt5$NH4Code<- as.factor(dt5$NH4Code)
if (class(dt5$PO4Code)!="factor") dt5$PO4Code<- as.factor(dt5$PO4Code)
if (class(dt5$DOCCode)!="factor") dt5$DOCCode<- as.factor(dt5$DOCCode)
if (class(dt5$DICCode)!="factor") dt5$DICCode<- as.factor(dt5$DICCode)
if (class(dt5$TDNCode)!="factor") dt5$TDNCode<- as.factor(dt5$TDNCode)
if (class(dt5$SiO2Code)!="factor") dt5$SiO2Code<- as.factor(dt5$SiO2Code)
                
# Convert Missing Values to NA for non-dates
                
dt5$Code <- ifelse((trimws(as.character(dt5$Code))==trimws("NA")),NA,dt5$Code)               
suppressWarnings(dt5$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Code))==as.character(as.numeric("NA"))),NA,dt5$Code))
dt5$Sample_Time <- ifelse((trimws(as.character(dt5$Sample_Time))==trimws("NA")),NA,dt5$Sample_Time)               
suppressWarnings(dt5$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Sample_Time))==as.character(as.numeric("NA"))),NA,dt5$Sample_Time))
dt5$Temperature.of.water.sample <- ifelse((trimws(as.character(dt5$Temperature.of.water.sample))==trimws("NA")),NA,dt5$Temperature.of.water.sample)               
suppressWarnings(dt5$Temperature.of.water.sample <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Temperature.of.water.sample))==as.character(as.numeric("NA"))),NA,dt5$Temperature.of.water.sample))
dt5$pH <- ifelse((trimws(as.character(dt5$pH))==trimws("NA")),NA,dt5$pH)               
suppressWarnings(dt5$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$pH))==as.character(as.numeric("NA"))),NA,dt5$pH))
dt5$Cond <- ifelse((trimws(as.character(dt5$Cond))==trimws("NA")),NA,dt5$Cond)               
suppressWarnings(dt5$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Cond))==as.character(as.numeric("NA"))),NA,dt5$Cond))
dt5$Cl <- ifelse((trimws(as.character(dt5$Cl))==trimws("NA")),NA,dt5$Cl)               
suppressWarnings(dt5$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Cl))==as.character(as.numeric("NA"))),NA,dt5$Cl))
dt5$NO3.hyphen.N <- ifelse((trimws(as.character(dt5$NO3.hyphen.N))==trimws("NA")),NA,dt5$NO3.hyphen.N)               
suppressWarnings(dt5$NO3.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$NO3.hyphen.N))==as.character(as.numeric("NA"))),NA,dt5$NO3.hyphen.N))
dt5$SO4.hyphen.S <- ifelse((trimws(as.character(dt5$SO4.hyphen.S))==trimws("NA")),NA,dt5$SO4.hyphen.S)               
suppressWarnings(dt5$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt5$SO4.hyphen.S))
dt5$Mg <- ifelse((trimws(as.character(dt5$Mg))==trimws("NA")),NA,dt5$Mg)               
suppressWarnings(dt5$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Mg))==as.character(as.numeric("NA"))),NA,dt5$Mg))
dt5$Ca <- ifelse((trimws(as.character(dt5$Ca))==trimws("NA")),NA,dt5$Ca)               
suppressWarnings(dt5$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Ca))==as.character(as.numeric("NA"))),NA,dt5$Ca))
dt5$NH4.hyphen.N <- ifelse((trimws(as.character(dt5$NH4.hyphen.N))==trimws("NA")),NA,dt5$NH4.hyphen.N)               
suppressWarnings(dt5$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt5$NH4.hyphen.N))
dt5$PO4.hyphen.P <- ifelse((trimws(as.character(dt5$PO4.hyphen.P))==trimws("NA")),NA,dt5$PO4.hyphen.P)               
suppressWarnings(dt5$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt5$PO4.hyphen.P))
dt5$DOC <- ifelse((trimws(as.character(dt5$DOC))==trimws("NA")),NA,dt5$DOC)               
suppressWarnings(dt5$DOC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$DOC))==as.character(as.numeric("NA"))),NA,dt5$DOC))
dt5$DIC <- ifelse((trimws(as.character(dt5$DIC))==trimws("NA")),NA,dt5$DIC)               
suppressWarnings(dt5$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$DIC))==as.character(as.numeric("NA"))),NA,dt5$DIC))
dt5$TDN <- ifelse((trimws(as.character(dt5$TDN))==trimws("NA")),NA,dt5$TDN)               
suppressWarnings(dt5$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$TDN))==as.character(as.numeric("NA"))),NA,dt5$TDN))
dt5$TDP <- ifelse((trimws(as.character(dt5$TDP))==trimws("NA")),NA,dt5$TDP)               
suppressWarnings(dt5$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$TDP))==as.character(as.numeric("NA"))),NA,dt5$TDP))
dt5$SiO2 <- ifelse((trimws(as.character(dt5$SiO2))==trimws("NA")),NA,dt5$SiO2)               
suppressWarnings(dt5$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$SiO2))==as.character(as.numeric("NA"))),NA,dt5$SiO2))


# Here is the structure of the input data frame:
str(dt5)                            
attach(dt5)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Temperature.of.water.sample)
summary(pH)
summary(Cond)
summary(Cl)
summary(NO3.hyphen.N)
summary(SO4.hyphen.S)
summary(Na)
summary(K)
summary(Mg)
summary(Ca)
summary(NH4.hyphen.N)
summary(PO4.hyphen.P)
summary(DOC)
summary(DIC)
summary(TDN)
summary(TDP)
summary(SiO2)
summary(ChlorideCode)
summary(NitrateCode)
summary(SulfateCode)
summary(SodiumCode)
summary(PotassiumCode)
summary(MagnesiumCode)
summary(CalciumCode)
summary(NH4Code)
summary(PO4Code)
summary(DOCCode)
summary(DICCode)
summary(TDNCode)
summary(SiO2Code) 
                # Get more details on character variables
                 
summary(as.factor(dt5$Sample_ID)) 
summary(as.factor(dt5$Na)) 
summary(as.factor(dt5$ChlorideCode)) 
summary(as.factor(dt5$NitrateCode)) 
summary(as.factor(dt5$SulfateCode)) 
summary(as.factor(dt5$SodiumCode)) 
summary(as.factor(dt5$PotassiumCode)) 
summary(as.factor(dt5$MagnesiumCode)) 
summary(as.factor(dt5$CalciumCode)) 
summary(as.factor(dt5$NH4Code)) 
summary(as.factor(dt5$PO4Code)) 
summary(as.factor(dt5$DOCCode)) 
summary(as.factor(dt5$DICCode)) 
summary(as.factor(dt5$TDNCode)) 
summary(as.factor(dt5$SiO2Code))
detach(dt5)               
         

inUrl6  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/09ff0efc017f7b271a5c8c2ec367cc93"
infile6 <- tempfile()
try(download.file(inUrl6,infile6,method="curl"))
if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")

                   
 dt6 <-read.csv(infile6,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "Sample_ID",     
                    "Code",     
                    "Sample_Date",     
                    "Sample_Time",     
                    "Temperature.of.water.sample",     
                    "pH",     
                    "Cond",     
                    "Cl",     
                    "NO3.hyphen.N",     
                    "SO4.hyphen.S",     
                    "Na",     
                    "K",     
                    "Mg",     
                    "Ca",     
                    "NH4.hyphen.N",     
                    "PO4.hyphen.P",     
                    "DOC",     
                    "DIC",     
                    "TDN",     
                    "TDP",     
                    "SiO2",     
                    "ChlorideCode",     
                    "NitrateCode",     
                    "SulfateCode",     
                    "SodiumCode",     
                    "PotassiumCode",     
                    "MagnesiumCode",     
                    "CalciumCode",     
                    "NH4Code",     
                    "PO4Code",     
                    "DOCCode",     
                    "DICCode",     
                    "TDNCode",     
                    "SiO2Code"    ), check.names=TRUE)
               
unlink(infile6)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt6$Sample_ID)!="factor") dt6$Sample_ID<- as.factor(dt6$Sample_ID)
if (class(dt6$Code)=="factor") dt6$Code <-as.numeric(levels(dt6$Code))[as.integer(dt6$Code) ]               
if (class(dt6$Code)=="character") dt6$Code <-as.numeric(dt6$Code)                                   
# attempting to convert dt6$Sample_Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp6Sample_Date<-as.Date(dt6$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp6Sample_Date) == length(tmp6Sample_Date[!is.na(tmp6Sample_Date)])){dt6$Sample_Date <- tmp6Sample_Date } else {print("Date conversion failed for dt6$Sample_Date. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp6Sample_Date) 
if (class(dt6$Sample_Time)=="factor") dt6$Sample_Time <-as.numeric(levels(dt6$Sample_Time))[as.integer(dt6$Sample_Time) ]               
if (class(dt6$Sample_Time)=="character") dt6$Sample_Time <-as.numeric(dt6$Sample_Time)
if (class(dt6$Temperature.of.water.sample)=="factor") dt6$Temperature.of.water.sample <-as.numeric(levels(dt6$Temperature.of.water.sample))[as.integer(dt6$Temperature.of.water.sample) ]               
if (class(dt6$Temperature.of.water.sample)=="character") dt6$Temperature.of.water.sample <-as.numeric(dt6$Temperature.of.water.sample)
if (class(dt6$pH)=="factor") dt6$pH <-as.numeric(levels(dt6$pH))[as.integer(dt6$pH) ]               
if (class(dt6$pH)=="character") dt6$pH <-as.numeric(dt6$pH)
if (class(dt6$Cond)=="factor") dt6$Cond <-as.numeric(levels(dt6$Cond))[as.integer(dt6$Cond) ]               
if (class(dt6$Cond)=="character") dt6$Cond <-as.numeric(dt6$Cond)
if (class(dt6$Cl)=="factor") dt6$Cl <-as.numeric(levels(dt6$Cl))[as.integer(dt6$Cl) ]               
if (class(dt6$Cl)=="character") dt6$Cl <-as.numeric(dt6$Cl)
if (class(dt6$NO3.hyphen.N)=="factor") dt6$NO3.hyphen.N <-as.numeric(levels(dt6$NO3.hyphen.N))[as.integer(dt6$NO3.hyphen.N) ]               
if (class(dt6$NO3.hyphen.N)=="character") dt6$NO3.hyphen.N <-as.numeric(dt6$NO3.hyphen.N)
if (class(dt6$SO4.hyphen.S)=="factor") dt6$SO4.hyphen.S <-as.numeric(levels(dt6$SO4.hyphen.S))[as.integer(dt6$SO4.hyphen.S) ]               
if (class(dt6$SO4.hyphen.S)=="character") dt6$SO4.hyphen.S <-as.numeric(dt6$SO4.hyphen.S)
if (class(dt6$Na)!="factor") dt6$Na<- as.factor(dt6$Na)
if (class(dt6$K)=="factor") dt6$K <-as.numeric(levels(dt6$K))[as.integer(dt6$K) ]               
if (class(dt6$K)=="character") dt6$K <-as.numeric(dt6$K)
if (class(dt6$Mg)=="factor") dt6$Mg <-as.numeric(levels(dt6$Mg))[as.integer(dt6$Mg) ]               
if (class(dt6$Mg)=="character") dt6$Mg <-as.numeric(dt6$Mg)
if (class(dt6$Ca)=="factor") dt6$Ca <-as.numeric(levels(dt6$Ca))[as.integer(dt6$Ca) ]               
if (class(dt6$Ca)=="character") dt6$Ca <-as.numeric(dt6$Ca)
if (class(dt6$NH4.hyphen.N)=="factor") dt6$NH4.hyphen.N <-as.numeric(levels(dt6$NH4.hyphen.N))[as.integer(dt6$NH4.hyphen.N) ]               
if (class(dt6$NH4.hyphen.N)=="character") dt6$NH4.hyphen.N <-as.numeric(dt6$NH4.hyphen.N)
if (class(dt6$PO4.hyphen.P)=="factor") dt6$PO4.hyphen.P <-as.numeric(levels(dt6$PO4.hyphen.P))[as.integer(dt6$PO4.hyphen.P) ]               
if (class(dt6$PO4.hyphen.P)=="character") dt6$PO4.hyphen.P <-as.numeric(dt6$PO4.hyphen.P)
if (class(dt6$DOC)=="factor") dt6$DOC <-as.numeric(levels(dt6$DOC))[as.integer(dt6$DOC) ]               
if (class(dt6$DOC)=="character") dt6$DOC <-as.numeric(dt6$DOC)
if (class(dt6$DIC)=="factor") dt6$DIC <-as.numeric(levels(dt6$DIC))[as.integer(dt6$DIC) ]               
if (class(dt6$DIC)=="character") dt6$DIC <-as.numeric(dt6$DIC)
if (class(dt6$TDN)=="factor") dt6$TDN <-as.numeric(levels(dt6$TDN))[as.integer(dt6$TDN) ]               
if (class(dt6$TDN)=="character") dt6$TDN <-as.numeric(dt6$TDN)
if (class(dt6$TDP)=="factor") dt6$TDP <-as.numeric(levels(dt6$TDP))[as.integer(dt6$TDP) ]               
if (class(dt6$TDP)=="character") dt6$TDP <-as.numeric(dt6$TDP)
if (class(dt6$SiO2)=="factor") dt6$SiO2 <-as.numeric(levels(dt6$SiO2))[as.integer(dt6$SiO2) ]               
if (class(dt6$SiO2)=="character") dt6$SiO2 <-as.numeric(dt6$SiO2)
if (class(dt6$ChlorideCode)!="factor") dt6$ChlorideCode<- as.factor(dt6$ChlorideCode)
if (class(dt6$NitrateCode)!="factor") dt6$NitrateCode<- as.factor(dt6$NitrateCode)
if (class(dt6$SulfateCode)!="factor") dt6$SulfateCode<- as.factor(dt6$SulfateCode)
if (class(dt6$SodiumCode)!="factor") dt6$SodiumCode<- as.factor(dt6$SodiumCode)
if (class(dt6$PotassiumCode)!="factor") dt6$PotassiumCode<- as.factor(dt6$PotassiumCode)
if (class(dt6$MagnesiumCode)!="factor") dt6$MagnesiumCode<- as.factor(dt6$MagnesiumCode)
if (class(dt6$CalciumCode)!="factor") dt6$CalciumCode<- as.factor(dt6$CalciumCode)
if (class(dt6$NH4Code)!="factor") dt6$NH4Code<- as.factor(dt6$NH4Code)
if (class(dt6$PO4Code)!="factor") dt6$PO4Code<- as.factor(dt6$PO4Code)
if (class(dt6$DOCCode)!="factor") dt6$DOCCode<- as.factor(dt6$DOCCode)
if (class(dt6$DICCode)!="factor") dt6$DICCode<- as.factor(dt6$DICCode)
if (class(dt6$TDNCode)!="factor") dt6$TDNCode<- as.factor(dt6$TDNCode)
if (class(dt6$SiO2Code)!="factor") dt6$SiO2Code<- as.factor(dt6$SiO2Code)
                
# Convert Missing Values to NA for non-dates
                
dt6$Code <- ifelse((trimws(as.character(dt6$Code))==trimws("NA")),NA,dt6$Code)               
suppressWarnings(dt6$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Code))==as.character(as.numeric("NA"))),NA,dt6$Code))
dt6$Sample_Time <- ifelse((trimws(as.character(dt6$Sample_Time))==trimws("NA")),NA,dt6$Sample_Time)               
suppressWarnings(dt6$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Sample_Time))==as.character(as.numeric("NA"))),NA,dt6$Sample_Time))
dt6$Temperature.of.water.sample <- ifelse((trimws(as.character(dt6$Temperature.of.water.sample))==trimws("NA")),NA,dt6$Temperature.of.water.sample)               
suppressWarnings(dt6$Temperature.of.water.sample <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Temperature.of.water.sample))==as.character(as.numeric("NA"))),NA,dt6$Temperature.of.water.sample))
dt6$pH <- ifelse((trimws(as.character(dt6$pH))==trimws("NA")),NA,dt6$pH)               
suppressWarnings(dt6$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$pH))==as.character(as.numeric("NA"))),NA,dt6$pH))
dt6$Cond <- ifelse((trimws(as.character(dt6$Cond))==trimws("NA")),NA,dt6$Cond)               
suppressWarnings(dt6$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Cond))==as.character(as.numeric("NA"))),NA,dt6$Cond))
dt6$Cl <- ifelse((trimws(as.character(dt6$Cl))==trimws("NA")),NA,dt6$Cl)               
suppressWarnings(dt6$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Cl))==as.character(as.numeric("NA"))),NA,dt6$Cl))
dt6$NO3.hyphen.N <- ifelse((trimws(as.character(dt6$NO3.hyphen.N))==trimws("NA")),NA,dt6$NO3.hyphen.N)               
suppressWarnings(dt6$NO3.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$NO3.hyphen.N))==as.character(as.numeric("NA"))),NA,dt6$NO3.hyphen.N))
dt6$SO4.hyphen.S <- ifelse((trimws(as.character(dt6$SO4.hyphen.S))==trimws("NA")),NA,dt6$SO4.hyphen.S)               
suppressWarnings(dt6$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt6$SO4.hyphen.S))
dt6$Mg <- ifelse((trimws(as.character(dt6$Mg))==trimws("NA")),NA,dt6$Mg)               
suppressWarnings(dt6$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Mg))==as.character(as.numeric("NA"))),NA,dt6$Mg))
dt6$Ca <- ifelse((trimws(as.character(dt6$Ca))==trimws("NA")),NA,dt6$Ca)               
suppressWarnings(dt6$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Ca))==as.character(as.numeric("NA"))),NA,dt6$Ca))
dt6$NH4.hyphen.N <- ifelse((trimws(as.character(dt6$NH4.hyphen.N))==trimws("NA")),NA,dt6$NH4.hyphen.N)               
suppressWarnings(dt6$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt6$NH4.hyphen.N))
dt6$PO4.hyphen.P <- ifelse((trimws(as.character(dt6$PO4.hyphen.P))==trimws("NA")),NA,dt6$PO4.hyphen.P)               
suppressWarnings(dt6$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt6$PO4.hyphen.P))
dt6$DOC <- ifelse((trimws(as.character(dt6$DOC))==trimws("NA")),NA,dt6$DOC)               
suppressWarnings(dt6$DOC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$DOC))==as.character(as.numeric("NA"))),NA,dt6$DOC))
dt6$DIC <- ifelse((trimws(as.character(dt6$DIC))==trimws("NA")),NA,dt6$DIC)               
suppressWarnings(dt6$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$DIC))==as.character(as.numeric("NA"))),NA,dt6$DIC))
dt6$TDN <- ifelse((trimws(as.character(dt6$TDN))==trimws("NA")),NA,dt6$TDN)               
suppressWarnings(dt6$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$TDN))==as.character(as.numeric("NA"))),NA,dt6$TDN))
dt6$TDP <- ifelse((trimws(as.character(dt6$TDP))==trimws("NA")),NA,dt6$TDP)               
suppressWarnings(dt6$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$TDP))==as.character(as.numeric("NA"))),NA,dt6$TDP))
dt6$SiO2 <- ifelse((trimws(as.character(dt6$SiO2))==trimws("NA")),NA,dt6$SiO2)               
suppressWarnings(dt6$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$SiO2))==as.character(as.numeric("NA"))),NA,dt6$SiO2))


# Here is the structure of the input data frame:
str(dt6)                            
attach(dt6)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Temperature.of.water.sample)
summary(pH)
summary(Cond)
summary(Cl)
summary(NO3.hyphen.N)
summary(SO4.hyphen.S)
summary(Na)
summary(K)
summary(Mg)
summary(Ca)
summary(NH4.hyphen.N)
summary(PO4.hyphen.P)
summary(DOC)
summary(DIC)
summary(TDN)
summary(TDP)
summary(SiO2)
summary(ChlorideCode)
summary(NitrateCode)
summary(SulfateCode)
summary(SodiumCode)
summary(PotassiumCode)
summary(MagnesiumCode)
summary(CalciumCode)
summary(NH4Code)
summary(PO4Code)
summary(DOCCode)
summary(DICCode)
summary(TDNCode)
summary(SiO2Code) 
                # Get more details on character variables
                 
summary(as.factor(dt6$Sample_ID)) 
summary(as.factor(dt6$Na)) 
summary(as.factor(dt6$ChlorideCode)) 
summary(as.factor(dt6$NitrateCode)) 
summary(as.factor(dt6$SulfateCode)) 
summary(as.factor(dt6$SodiumCode)) 
summary(as.factor(dt6$PotassiumCode)) 
summary(as.factor(dt6$MagnesiumCode)) 
summary(as.factor(dt6$CalciumCode)) 
summary(as.factor(dt6$NH4Code)) 
summary(as.factor(dt6$PO4Code)) 
summary(as.factor(dt6$DOCCode)) 
summary(as.factor(dt6$DICCode)) 
summary(as.factor(dt6$TDNCode)) 
summary(as.factor(dt6$SiO2Code))
detach(dt6)               
         

inUrl7  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/174/2110862/41c09d11749326d4f5bdebaafc6993b9"
infile7 <- tempfile()
try(download.file(inUrl7,infile7,method="curl"))
if (is.na(file.size(infile7))) download.file(inUrl7,infile7,method="auto")

                   
 dt7 <-read.csv(infile7,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "Sample_ID",     
                    "Code",     
                    "Sample_Date",     
                    "Sample_Time",     
                    "pH",     
                    "Cond",     
                    "Cl",     
                    "NO3.hyphen.N",     
                    "SO4.hyphen.S",     
                    "Na",     
                    "K",     
                    "Mg",     
                    "Ca",     
                    "NH4.hyphen.N",     
                    "PO4.hyphen.P",     
                    "DOC",     
                    "TDN",     
                    "TDP",     
                    "SiO2"    ), check.names=TRUE)
               
unlink(infile7)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt7$Sample_ID)!="factor") dt7$Sample_ID<- as.factor(dt7$Sample_ID)
if (class(dt7$Code)=="factor") dt7$Code <-as.numeric(levels(dt7$Code))[as.integer(dt7$Code) ]               
if (class(dt7$Code)=="character") dt7$Code <-as.numeric(dt7$Code)                                   
# attempting to convert dt7$Sample_Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%d/%m/%Y"
tmp7Sample_Date<-as.Date(dt7$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp7Sample_Date) == length(tmp7Sample_Date[!is.na(tmp7Sample_Date)])){dt7$Sample_Date <- tmp7Sample_Date } else {print("Date conversion failed for dt7$Sample_Date. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp7Sample_Date) 
if (class(dt7$Sample_Time)=="factor") dt7$Sample_Time <-as.numeric(levels(dt7$Sample_Time))[as.integer(dt7$Sample_Time) ]               
if (class(dt7$Sample_Time)=="character") dt7$Sample_Time <-as.numeric(dt7$Sample_Time)
if (class(dt7$pH)=="factor") dt7$pH <-as.numeric(levels(dt7$pH))[as.integer(dt7$pH) ]               
if (class(dt7$pH)=="character") dt7$pH <-as.numeric(dt7$pH)
if (class(dt7$Cond)=="factor") dt7$Cond <-as.numeric(levels(dt7$Cond))[as.integer(dt7$Cond) ]               
if (class(dt7$Cond)=="character") dt7$Cond <-as.numeric(dt7$Cond)
if (class(dt7$Cl)=="factor") dt7$Cl <-as.numeric(levels(dt7$Cl))[as.integer(dt7$Cl) ]               
if (class(dt7$Cl)=="character") dt7$Cl <-as.numeric(dt7$Cl)
if (class(dt7$NO3.hyphen.N)=="factor") dt7$NO3.hyphen.N <-as.numeric(levels(dt7$NO3.hyphen.N))[as.integer(dt7$NO3.hyphen.N) ]               
if (class(dt7$NO3.hyphen.N)=="character") dt7$NO3.hyphen.N <-as.numeric(dt7$NO3.hyphen.N)
if (class(dt7$SO4.hyphen.S)=="factor") dt7$SO4.hyphen.S <-as.numeric(levels(dt7$SO4.hyphen.S))[as.integer(dt7$SO4.hyphen.S) ]               
if (class(dt7$SO4.hyphen.S)=="character") dt7$SO4.hyphen.S <-as.numeric(dt7$SO4.hyphen.S)
if (class(dt7$Na)=="factor") dt7$Na <-as.numeric(levels(dt7$Na))[as.integer(dt7$Na) ]               
if (class(dt7$Na)=="character") dt7$Na <-as.numeric(dt7$Na)
if (class(dt7$K)=="factor") dt7$K <-as.numeric(levels(dt7$K))[as.integer(dt7$K) ]               
if (class(dt7$K)=="character") dt7$K <-as.numeric(dt7$K)
if (class(dt7$Mg)=="factor") dt7$Mg <-as.numeric(levels(dt7$Mg))[as.integer(dt7$Mg) ]               
if (class(dt7$Mg)=="character") dt7$Mg <-as.numeric(dt7$Mg)
if (class(dt7$Ca)=="factor") dt7$Ca <-as.numeric(levels(dt7$Ca))[as.integer(dt7$Ca) ]               
if (class(dt7$Ca)=="character") dt7$Ca <-as.numeric(dt7$Ca)
if (class(dt7$NH4.hyphen.N)=="factor") dt7$NH4.hyphen.N <-as.numeric(levels(dt7$NH4.hyphen.N))[as.integer(dt7$NH4.hyphen.N) ]               
if (class(dt7$NH4.hyphen.N)=="character") dt7$NH4.hyphen.N <-as.numeric(dt7$NH4.hyphen.N)
if (class(dt7$PO4.hyphen.P)=="factor") dt7$PO4.hyphen.P <-as.numeric(levels(dt7$PO4.hyphen.P))[as.integer(dt7$PO4.hyphen.P) ]               
if (class(dt7$PO4.hyphen.P)=="character") dt7$PO4.hyphen.P <-as.numeric(dt7$PO4.hyphen.P)
if (class(dt7$DOC)=="factor") dt7$DOC <-as.numeric(levels(dt7$DOC))[as.integer(dt7$DOC) ]               
if (class(dt7$DOC)=="character") dt7$DOC <-as.numeric(dt7$DOC)
if (class(dt7$TDN)=="factor") dt7$TDN <-as.numeric(levels(dt7$TDN))[as.integer(dt7$TDN) ]               
if (class(dt7$TDN)=="character") dt7$TDN <-as.numeric(dt7$TDN)
if (class(dt7$TDP)=="factor") dt7$TDP <-as.numeric(levels(dt7$TDP))[as.integer(dt7$TDP) ]               
if (class(dt7$TDP)=="character") dt7$TDP <-as.numeric(dt7$TDP)
if (class(dt7$SiO2)=="factor") dt7$SiO2 <-as.numeric(levels(dt7$SiO2))[as.integer(dt7$SiO2) ]               
if (class(dt7$SiO2)=="character") dt7$SiO2 <-as.numeric(dt7$SiO2)
                
# Convert Missing Values to NA for non-dates
                
dt7$Code <- ifelse((trimws(as.character(dt7$Code))==trimws("NA")),NA,dt7$Code)               
suppressWarnings(dt7$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Code))==as.character(as.numeric("NA"))),NA,dt7$Code))
dt7$Sample_Time <- ifelse((trimws(as.character(dt7$Sample_Time))==trimws("NA")),NA,dt7$Sample_Time)               
suppressWarnings(dt7$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Sample_Time))==as.character(as.numeric("NA"))),NA,dt7$Sample_Time))
dt7$pH <- ifelse((trimws(as.character(dt7$pH))==trimws("NA")),NA,dt7$pH)               
suppressWarnings(dt7$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$pH))==as.character(as.numeric("NA"))),NA,dt7$pH))
dt7$Cond <- ifelse((trimws(as.character(dt7$Cond))==trimws("NA")),NA,dt7$Cond)               
suppressWarnings(dt7$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Cond))==as.character(as.numeric("NA"))),NA,dt7$Cond))
dt7$Cl <- ifelse((trimws(as.character(dt7$Cl))==trimws("NA")),NA,dt7$Cl)               
suppressWarnings(dt7$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Cl))==as.character(as.numeric("NA"))),NA,dt7$Cl))
dt7$SO4.hyphen.S <- ifelse((trimws(as.character(dt7$SO4.hyphen.S))==trimws("NA")),NA,dt7$SO4.hyphen.S)               
suppressWarnings(dt7$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt7$SO4.hyphen.S))
dt7$Mg <- ifelse((trimws(as.character(dt7$Mg))==trimws("NA")),NA,dt7$Mg)               
suppressWarnings(dt7$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Mg))==as.character(as.numeric("NA"))),NA,dt7$Mg))
dt7$Ca <- ifelse((trimws(as.character(dt7$Ca))==trimws("NA")),NA,dt7$Ca)               
suppressWarnings(dt7$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Ca))==as.character(as.numeric("NA"))),NA,dt7$Ca))
dt7$NH4.hyphen.N <- ifelse((trimws(as.character(dt7$NH4.hyphen.N))==trimws("NA")),NA,dt7$NH4.hyphen.N)               
suppressWarnings(dt7$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt7$NH4.hyphen.N))
dt7$PO4.hyphen.P <- ifelse((trimws(as.character(dt7$PO4.hyphen.P))==trimws("NA")),NA,dt7$PO4.hyphen.P)               
suppressWarnings(dt7$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt7$PO4.hyphen.P))
dt7$DOC <- ifelse((trimws(as.character(dt7$DOC))==trimws("blank")),NA,dt7$DOC)               
suppressWarnings(dt7$DOC <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(dt7$DOC))==as.character(as.numeric("blank"))),NA,dt7$DOC))
dt7$TDN <- ifelse((trimws(as.character(dt7$TDN))==trimws("NA")),NA,dt7$TDN)               
suppressWarnings(dt7$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$TDN))==as.character(as.numeric("NA"))),NA,dt7$TDN))
dt7$TDP <- ifelse((trimws(as.character(dt7$TDP))==trimws("NA")),NA,dt7$TDP)               
suppressWarnings(dt7$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$TDP))==as.character(as.numeric("NA"))),NA,dt7$TDP))
dt7$SiO2 <- ifelse((trimws(as.character(dt7$SiO2))==trimws("NA")),NA,dt7$SiO2)               
suppressWarnings(dt7$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$SiO2))==as.character(as.numeric("NA"))),NA,dt7$SiO2))


# Here is the structure of the input data frame:
str(dt7)                            
attach(dt7)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(pH)
summary(Cond)
summary(Cl)
summary(NO3.hyphen.N)
summary(SO4.hyphen.S)
summary(Na)
summary(K)
summary(Mg)
summary(Ca)
summary(NH4.hyphen.N)
summary(PO4.hyphen.P)
summary(DOC)
summary(TDN)
summary(TDP)
summary(SiO2) 
                # Get more details on character variables
                 
summary(as.factor(dt7$Sample_ID))
detach(dt7)               
        




