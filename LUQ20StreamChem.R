# Package ID: knb-lter-luq.20.4923061 Cataloging System:https://pasta.edirepository.org.
# Data set title: Chemistry of stream water from the Luquillo Mountains.
# Data set creator:  William H. McDowell -
# Data set creator:    - International Institute of Tropical Forestry(IITF), USDA Forest Service.
# Contact:  William H. McDowell -    - Bill.McDowell@unh.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/b22fd5ed1c470cf6d433d88856b4aaa5"
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


 dt1 <-read.csv(infile1,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Analyte_ID",
                    "MDL",
                    "Units"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$Analyte_ID)!="factor") dt1$Analyte_ID<- as.factor(dt1$Analyte_ID)
if (class(dt1$MDL)=="factor") dt1$MDL <-as.numeric(levels(dt1$MDL))[as.integer(dt1$MDL) ]
if (class(dt1$MDL)=="character") dt1$MDL <-as.numeric(dt1$MDL)
if (class(dt1$Units)!="factor") dt1$Units<- as.factor(dt1$Units)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)
attach(dt1)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Analyte_ID)
summary(MDL)
summary(Units)
                # Get more details on character variables

summary(as.factor(dt1$Analyte_ID))
summary(as.factor(dt1$Units))
detach(dt1)


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/96e0ef7b3f2bc92485a559645d545845"
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


 dt2 <-read.csv(infile2,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$Sample_ID)!="factor") dt2$Sample_ID<- as.factor(dt2$Sample_ID)
if (class(dt2$Code)=="factor") dt2$Code <-as.numeric(levels(dt2$Code))[as.integer(dt2$Code) ]
if (class(dt2$Code)=="character") dt2$Code <-as.numeric(dt2$Code)
# attempting to convert dt2$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp2Sample_Date<-as.Date(dt2$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp2Sample_Date) == length(tmp2Sample_Date[!is.na(tmp2Sample_Date)])){dt2$Sample_Date <- tmp2Sample_Date } else {print("Date conversion failed for dt2$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp2Sample_Date)
if (class(dt2$Sample_Time)=="factor") dt2$Sample_Time <-as.numeric(levels(dt2$Sample_Time))[as.integer(dt2$Sample_Time) ]
if (class(dt2$Sample_Time)=="character") dt2$Sample_Time <-as.numeric(dt2$Sample_Time)
if (class(dt2$Gage_Ht)=="factor") dt2$Gage_Ht <-as.numeric(levels(dt2$Gage_Ht))[as.integer(dt2$Gage_Ht) ]
if (class(dt2$Gage_Ht)=="character") dt2$Gage_Ht <-as.numeric(dt2$Gage_Ht)
if (class(dt2$Temp)=="factor") dt2$Temp <-as.numeric(levels(dt2$Temp))[as.integer(dt2$Temp) ]
if (class(dt2$Temp)=="character") dt2$Temp <-as.numeric(dt2$Temp)
if (class(dt2$pH)=="factor") dt2$pH <-as.numeric(levels(dt2$pH))[as.integer(dt2$pH) ]
if (class(dt2$pH)=="character") dt2$pH <-as.numeric(dt2$pH)
if (class(dt2$Cond)=="factor") dt2$Cond <-as.numeric(levels(dt2$Cond))[as.integer(dt2$Cond) ]
if (class(dt2$Cond)=="character") dt2$Cond <-as.numeric(dt2$Cond)
if (class(dt2$Cl)=="factor") dt2$Cl <-as.numeric(levels(dt2$Cl))[as.integer(dt2$Cl) ]
if (class(dt2$Cl)=="character") dt2$Cl <-as.numeric(dt2$Cl)
if (class(dt2$NO3.hyphen.N)=="factor") dt2$NO3.hyphen.N <-as.numeric(levels(dt2$NO3.hyphen.N))[as.integer(dt2$NO3.hyphen.N) ]
if (class(dt2$NO3.hyphen.N)=="character") dt2$NO3.hyphen.N <-as.numeric(dt2$NO3.hyphen.N)
if (class(dt2$SO4.hyphen.S)=="factor") dt2$SO4.hyphen.S <-as.numeric(levels(dt2$SO4.hyphen.S))[as.integer(dt2$SO4.hyphen.S) ]
if (class(dt2$SO4.hyphen.S)=="character") dt2$SO4.hyphen.S <-as.numeric(dt2$SO4.hyphen.S)
if (class(dt2$Na)=="factor") dt2$Na <-as.numeric(levels(dt2$Na))[as.integer(dt2$Na) ]
if (class(dt2$Na)=="character") dt2$Na <-as.numeric(dt2$Na)
if (class(dt2$K)=="factor") dt2$K <-as.numeric(levels(dt2$K))[as.integer(dt2$K) ]
if (class(dt2$K)=="character") dt2$K <-as.numeric(dt2$K)
if (class(dt2$Mg)=="factor") dt2$Mg <-as.numeric(levels(dt2$Mg))[as.integer(dt2$Mg) ]
if (class(dt2$Mg)=="character") dt2$Mg <-as.numeric(dt2$Mg)
if (class(dt2$Ca)=="factor") dt2$Ca <-as.numeric(levels(dt2$Ca))[as.integer(dt2$Ca) ]
if (class(dt2$Ca)=="character") dt2$Ca <-as.numeric(dt2$Ca)
if (class(dt2$NH4.hyphen.N)=="factor") dt2$NH4.hyphen.N <-as.numeric(levels(dt2$NH4.hyphen.N))[as.integer(dt2$NH4.hyphen.N) ]
if (class(dt2$NH4.hyphen.N)=="character") dt2$NH4.hyphen.N <-as.numeric(dt2$NH4.hyphen.N)
if (class(dt2$PO4.hyphen.P)=="factor") dt2$PO4.hyphen.P <-as.numeric(levels(dt2$PO4.hyphen.P))[as.integer(dt2$PO4.hyphen.P) ]
if (class(dt2$PO4.hyphen.P)=="character") dt2$PO4.hyphen.P <-as.numeric(dt2$PO4.hyphen.P)
if (class(dt2$DOC)=="factor") dt2$DOC <-as.numeric(levels(dt2$DOC))[as.integer(dt2$DOC) ]
if (class(dt2$DOC)=="character") dt2$DOC <-as.numeric(dt2$DOC)
if (class(dt2$DIC)=="factor") dt2$DIC <-as.numeric(levels(dt2$DIC))[as.integer(dt2$DIC) ]
if (class(dt2$DIC)=="character") dt2$DIC <-as.numeric(dt2$DIC)
if (class(dt2$TDN)=="factor") dt2$TDN <-as.numeric(levels(dt2$TDN))[as.integer(dt2$TDN) ]
if (class(dt2$TDN)=="character") dt2$TDN <-as.numeric(dt2$TDN)
if (class(dt2$TDP)=="factor") dt2$TDP <-as.numeric(levels(dt2$TDP))[as.integer(dt2$TDP) ]
if (class(dt2$TDP)=="character") dt2$TDP <-as.numeric(dt2$TDP)
if (class(dt2$SiO2)=="factor") dt2$SiO2 <-as.numeric(levels(dt2$SiO2))[as.integer(dt2$SiO2) ]
if (class(dt2$SiO2)=="character") dt2$SiO2 <-as.numeric(dt2$SiO2)
if (class(dt2$DON)=="factor") dt2$DON <-as.numeric(levels(dt2$DON))[as.integer(dt2$DON) ]
if (class(dt2$DON)=="character") dt2$DON <-as.numeric(dt2$DON)
if (class(dt2$TSS)=="factor") dt2$TSS <-as.numeric(levels(dt2$TSS))[as.integer(dt2$TSS) ]
if (class(dt2$TSS)=="character") dt2$TSS <-as.numeric(dt2$TSS)
if (class(dt2$ChlorideCode)!="factor") dt2$ChlorideCode<- as.factor(dt2$ChlorideCode)
if (class(dt2$NitrateCode)!="factor") dt2$NitrateCode<- as.factor(dt2$NitrateCode)
if (class(dt2$SulfateCode)!="factor") dt2$SulfateCode<- as.factor(dt2$SulfateCode)
if (class(dt2$SodiumCode)!="factor") dt2$SodiumCode<- as.factor(dt2$SodiumCode)
if (class(dt2$PotassiumCode)!="factor") dt2$PotassiumCode<- as.factor(dt2$PotassiumCode)
if (class(dt2$MagnesiumCode)!="factor") dt2$MagnesiumCode<- as.factor(dt2$MagnesiumCode)
if (class(dt2$CalciumCode)!="factor") dt2$CalciumCode<- as.factor(dt2$CalciumCode)
if (class(dt2$NH4Code)!="factor") dt2$NH4Code<- as.factor(dt2$NH4Code)
if (class(dt2$PO4Code)!="factor") dt2$PO4Code<- as.factor(dt2$PO4Code)
if (class(dt2$DOCCode)!="factor") dt2$DOCCode<- as.factor(dt2$DOCCode)
if (class(dt2$DICCode)!="factor") dt2$DICCode<- as.factor(dt2$DICCode)
if (class(dt2$TDNCode)!="factor") dt2$TDNCode<- as.factor(dt2$TDNCode)
if (class(dt2$SiO2Code)!="factor") dt2$SiO2Code<- as.factor(dt2$SiO2Code)
if (class(dt2$DONCode)!="factor") dt2$DONCode<- as.factor(dt2$DONCode)

# Convert Missing Values to NA for non-dates

dt2$Code <- ifelse((trimws(as.character(dt2$Code))==trimws("NA")),NA,dt2$Code)
suppressWarnings(dt2$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Code))==as.character(as.numeric("NA"))),NA,dt2$Code))
dt2$Sample_Time <- ifelse((trimws(as.character(dt2$Sample_Time))==trimws("NA")),NA,dt2$Sample_Time)
suppressWarnings(dt2$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Sample_Time))==as.character(as.numeric("NA"))),NA,dt2$Sample_Time))
dt2$Gage_Ht <- ifelse((trimws(as.character(dt2$Gage_Ht))==trimws("NA")),NA,dt2$Gage_Ht)
suppressWarnings(dt2$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt2$Gage_Ht))
dt2$Gage_Ht <- ifelse((trimws(as.character(dt2$Gage_Ht))==trimws("BLANK")),NA,dt2$Gage_Ht)
suppressWarnings(dt2$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt2$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt2$Gage_Ht))
dt2$Temp <- ifelse((trimws(as.character(dt2$Temp))==trimws("NA")),NA,dt2$Temp)
suppressWarnings(dt2$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Temp))==as.character(as.numeric("NA"))),NA,dt2$Temp))
dt2$pH <- ifelse((trimws(as.character(dt2$pH))==trimws("NA")),NA,dt2$pH)
suppressWarnings(dt2$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$pH))==as.character(as.numeric("NA"))),NA,dt2$pH))
dt2$Cond <- ifelse((trimws(as.character(dt2$Cond))==trimws("NA")),NA,dt2$Cond)
suppressWarnings(dt2$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Cond))==as.character(as.numeric("NA"))),NA,dt2$Cond))
dt2$Cl <- ifelse((trimws(as.character(dt2$Cl))==trimws("NA")),NA,dt2$Cl)
suppressWarnings(dt2$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Cl))==as.character(as.numeric("NA"))),NA,dt2$Cl))
dt2$SO4.hyphen.S <- ifelse((trimws(as.character(dt2$SO4.hyphen.S))==trimws("NA")),NA,dt2$SO4.hyphen.S)
suppressWarnings(dt2$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt2$SO4.hyphen.S))
dt2$Na <- ifelse((trimws(as.character(dt2$Na))==trimws("NA")),NA,dt2$Na)
suppressWarnings(dt2$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Na))==as.character(as.numeric("NA"))),NA,dt2$Na))
dt2$K <- ifelse((trimws(as.character(dt2$K))==trimws("NA")),NA,dt2$K)
suppressWarnings(dt2$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$K))==as.character(as.numeric("NA"))),NA,dt2$K))
dt2$Mg <- ifelse((trimws(as.character(dt2$Mg))==trimws("NA")),NA,dt2$Mg)
suppressWarnings(dt2$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Mg))==as.character(as.numeric("NA"))),NA,dt2$Mg))
dt2$Ca <- ifelse((trimws(as.character(dt2$Ca))==trimws("NA")),NA,dt2$Ca)
suppressWarnings(dt2$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Ca))==as.character(as.numeric("NA"))),NA,dt2$Ca))
dt2$NH4.hyphen.N <- ifelse((trimws(as.character(dt2$NH4.hyphen.N))==trimws("NA")),NA,dt2$NH4.hyphen.N)
suppressWarnings(dt2$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt2$NH4.hyphen.N))
dt2$PO4.hyphen.P <- ifelse((trimws(as.character(dt2$PO4.hyphen.P))==trimws("NA")),NA,dt2$PO4.hyphen.P)
suppressWarnings(dt2$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt2$PO4.hyphen.P))
dt2$DIC <- ifelse((trimws(as.character(dt2$DIC))==trimws("NA")),NA,dt2$DIC)
suppressWarnings(dt2$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$DIC))==as.character(as.numeric("NA"))),NA,dt2$DIC))
dt2$TDN <- ifelse((trimws(as.character(dt2$TDN))==trimws("NA")),NA,dt2$TDN)
suppressWarnings(dt2$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$TDN))==as.character(as.numeric("NA"))),NA,dt2$TDN))
dt2$TDP <- ifelse((trimws(as.character(dt2$TDP))==trimws("NA")),NA,dt2$TDP)
suppressWarnings(dt2$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$TDP))==as.character(as.numeric("NA"))),NA,dt2$TDP))
dt2$SiO2 <- ifelse((trimws(as.character(dt2$SiO2))==trimws("NA")),NA,dt2$SiO2)
suppressWarnings(dt2$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$SiO2))==as.character(as.numeric("NA"))),NA,dt2$SiO2))
dt2$DON <- ifelse((trimws(as.character(dt2$DON))==trimws("NA")),NA,dt2$DON)
suppressWarnings(dt2$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$DON))==as.character(as.numeric("NA"))),NA,dt2$DON))
dt2$TSS <- ifelse((trimws(as.character(dt2$TSS))==trimws("NA")),NA,dt2$TSS)
suppressWarnings(dt2$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$TSS))==as.character(as.numeric("NA"))),NA,dt2$TSS))


# Here is the structure of the input data frame:
str(dt2)
attach(dt2)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt2$Sample_ID))
summary(as.factor(dt2$ChlorideCode))
summary(as.factor(dt2$NitrateCode))
summary(as.factor(dt2$SulfateCode))
summary(as.factor(dt2$SodiumCode))
summary(as.factor(dt2$PotassiumCode))
summary(as.factor(dt2$MagnesiumCode))
summary(as.factor(dt2$CalciumCode))
summary(as.factor(dt2$NH4Code))
summary(as.factor(dt2$PO4Code))
summary(as.factor(dt2$DOCCode))
summary(as.factor(dt2$DICCode))
summary(as.factor(dt2$TDNCode))
summary(as.factor(dt2$SiO2Code))
summary(as.factor(dt2$DONCode))
detach(dt2)


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/8d1e2d357a2dc2d56b9eedea56a46236"
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
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$Sample_ID)!="factor") dt3$Sample_ID<- as.factor(dt3$Sample_ID)
if (class(dt3$Code)=="factor") dt3$Code <-as.numeric(levels(dt3$Code))[as.integer(dt3$Code) ]
if (class(dt3$Code)=="character") dt3$Code <-as.numeric(dt3$Code)
# attempting to convert dt3$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%d-%m"
tmp3Sample_Date<-as.Date(dt3$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp3Sample_Date) == length(tmp3Sample_Date[!is.na(tmp3Sample_Date)])){dt3$Sample_Date <- tmp3Sample_Date } else {print("Date conversion failed for dt3$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp3Sample_Date)
if (class(dt3$Sample_Time)=="factor") dt3$Sample_Time <-as.numeric(levels(dt3$Sample_Time))[as.integer(dt3$Sample_Time) ]
if (class(dt3$Sample_Time)=="character") dt3$Sample_Time <-as.numeric(dt3$Sample_Time)
if (class(dt3$Gage_Ht)=="factor") dt3$Gage_Ht <-as.numeric(levels(dt3$Gage_Ht))[as.integer(dt3$Gage_Ht) ]
if (class(dt3$Gage_Ht)=="character") dt3$Gage_Ht <-as.numeric(dt3$Gage_Ht)
if (class(dt3$Temp)=="factor") dt3$Temp <-as.numeric(levels(dt3$Temp))[as.integer(dt3$Temp) ]
if (class(dt3$Temp)=="character") dt3$Temp <-as.numeric(dt3$Temp)
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
if (class(dt3$Na)=="factor") dt3$Na <-as.numeric(levels(dt3$Na))[as.integer(dt3$Na) ]
if (class(dt3$Na)=="character") dt3$Na <-as.numeric(dt3$Na)
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
if (class(dt3$DON)=="factor") dt3$DON <-as.numeric(levels(dt3$DON))[as.integer(dt3$DON) ]
if (class(dt3$DON)=="character") dt3$DON <-as.numeric(dt3$DON)
if (class(dt3$TSS)=="factor") dt3$TSS <-as.numeric(levels(dt3$TSS))[as.integer(dt3$TSS) ]
if (class(dt3$TSS)=="character") dt3$TSS <-as.numeric(dt3$TSS)
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
if (class(dt3$DONCode)!="factor") dt3$DONCode<- as.factor(dt3$DONCode)

# Convert Missing Values to NA for non-dates

dt3$Code <- ifelse((trimws(as.character(dt3$Code))==trimws("NA")),NA,dt3$Code)
suppressWarnings(dt3$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Code))==as.character(as.numeric("NA"))),NA,dt3$Code))
dt3$Sample_Time <- ifelse((trimws(as.character(dt3$Sample_Time))==trimws("NA")),NA,dt3$Sample_Time)
suppressWarnings(dt3$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Sample_Time))==as.character(as.numeric("NA"))),NA,dt3$Sample_Time))
dt3$Gage_Ht <- ifelse((trimws(as.character(dt3$Gage_Ht))==trimws("NA")),NA,dt3$Gage_Ht)
suppressWarnings(dt3$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt3$Gage_Ht))
dt3$Gage_Ht <- ifelse((trimws(as.character(dt3$Gage_Ht))==trimws("BLANK")),NA,dt3$Gage_Ht)
suppressWarnings(dt3$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt3$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt3$Gage_Ht))
dt3$Temp <- ifelse((trimws(as.character(dt3$Temp))==trimws("NA")),NA,dt3$Temp)
suppressWarnings(dt3$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Temp))==as.character(as.numeric("NA"))),NA,dt3$Temp))
dt3$pH <- ifelse((trimws(as.character(dt3$pH))==trimws("NA")),NA,dt3$pH)
suppressWarnings(dt3$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$pH))==as.character(as.numeric("NA"))),NA,dt3$pH))
dt3$Cond <- ifelse((trimws(as.character(dt3$Cond))==trimws("NA")),NA,dt3$Cond)
suppressWarnings(dt3$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Cond))==as.character(as.numeric("NA"))),NA,dt3$Cond))
dt3$Cl <- ifelse((trimws(as.character(dt3$Cl))==trimws("NA")),NA,dt3$Cl)
suppressWarnings(dt3$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Cl))==as.character(as.numeric("NA"))),NA,dt3$Cl))
dt3$SO4.hyphen.S <- ifelse((trimws(as.character(dt3$SO4.hyphen.S))==trimws("NA")),NA,dt3$SO4.hyphen.S)
suppressWarnings(dt3$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt3$SO4.hyphen.S))
dt3$Na <- ifelse((trimws(as.character(dt3$Na))==trimws("NA")),NA,dt3$Na)
suppressWarnings(dt3$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Na))==as.character(as.numeric("NA"))),NA,dt3$Na))
dt3$K <- ifelse((trimws(as.character(dt3$K))==trimws("NA")),NA,dt3$K)
suppressWarnings(dt3$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$K))==as.character(as.numeric("NA"))),NA,dt3$K))
dt3$Mg <- ifelse((trimws(as.character(dt3$Mg))==trimws("NA")),NA,dt3$Mg)
suppressWarnings(dt3$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Mg))==as.character(as.numeric("NA"))),NA,dt3$Mg))
dt3$Ca <- ifelse((trimws(as.character(dt3$Ca))==trimws("NA")),NA,dt3$Ca)
suppressWarnings(dt3$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Ca))==as.character(as.numeric("NA"))),NA,dt3$Ca))
dt3$NH4.hyphen.N <- ifelse((trimws(as.character(dt3$NH4.hyphen.N))==trimws("NA")),NA,dt3$NH4.hyphen.N)
suppressWarnings(dt3$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt3$NH4.hyphen.N))
dt3$PO4.hyphen.P <- ifelse((trimws(as.character(dt3$PO4.hyphen.P))==trimws("NA")),NA,dt3$PO4.hyphen.P)
suppressWarnings(dt3$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt3$PO4.hyphen.P))
dt3$DIC <- ifelse((trimws(as.character(dt3$DIC))==trimws("NA")),NA,dt3$DIC)
suppressWarnings(dt3$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$DIC))==as.character(as.numeric("NA"))),NA,dt3$DIC))
dt3$TDN <- ifelse((trimws(as.character(dt3$TDN))==trimws("NA")),NA,dt3$TDN)
suppressWarnings(dt3$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$TDN))==as.character(as.numeric("NA"))),NA,dt3$TDN))
dt3$TDP <- ifelse((trimws(as.character(dt3$TDP))==trimws("NA")),NA,dt3$TDP)
suppressWarnings(dt3$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$TDP))==as.character(as.numeric("NA"))),NA,dt3$TDP))
dt3$SiO2 <- ifelse((trimws(as.character(dt3$SiO2))==trimws("NA")),NA,dt3$SiO2)
suppressWarnings(dt3$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$SiO2))==as.character(as.numeric("NA"))),NA,dt3$SiO2))
dt3$DON <- ifelse((trimws(as.character(dt3$DON))==trimws("NA")),NA,dt3$DON)
suppressWarnings(dt3$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$DON))==as.character(as.numeric("NA"))),NA,dt3$DON))
dt3$TSS <- ifelse((trimws(as.character(dt3$TSS))==trimws("NA")),NA,dt3$TSS)
suppressWarnings(dt3$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$TSS))==as.character(as.numeric("NA"))),NA,dt3$TSS))


# Here is the structure of the input data frame:
str(dt3)
attach(dt3)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt3$Sample_ID))
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
summary(as.factor(dt3$DONCode))
detach(dt3)


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/665f37efee3109a7c3aff95e079e2de2"
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
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

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
if (class(dt4$Gage_Ht)=="factor") dt4$Gage_Ht <-as.numeric(levels(dt4$Gage_Ht))[as.integer(dt4$Gage_Ht) ]
if (class(dt4$Gage_Ht)=="character") dt4$Gage_Ht <-as.numeric(dt4$Gage_Ht)
if (class(dt4$Temp)=="factor") dt4$Temp <-as.numeric(levels(dt4$Temp))[as.integer(dt4$Temp) ]
if (class(dt4$Temp)=="character") dt4$Temp <-as.numeric(dt4$Temp)
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
if (class(dt4$Na)=="factor") dt4$Na <-as.numeric(levels(dt4$Na))[as.integer(dt4$Na) ]
if (class(dt4$Na)=="character") dt4$Na <-as.numeric(dt4$Na)
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
if (class(dt4$DON)=="factor") dt4$DON <-as.numeric(levels(dt4$DON))[as.integer(dt4$DON) ]
if (class(dt4$DON)=="character") dt4$DON <-as.numeric(dt4$DON)
if (class(dt4$TSS)=="factor") dt4$TSS <-as.numeric(levels(dt4$TSS))[as.integer(dt4$TSS) ]
if (class(dt4$TSS)=="character") dt4$TSS <-as.numeric(dt4$TSS)
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
if (class(dt4$DONCode)!="factor") dt4$DONCode<- as.factor(dt4$DONCode)

# Convert Missing Values to NA for non-dates

dt4$Code <- ifelse((trimws(as.character(dt4$Code))==trimws("NA")),NA,dt4$Code)
suppressWarnings(dt4$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Code))==as.character(as.numeric("NA"))),NA,dt4$Code))
dt4$Sample_Time <- ifelse((trimws(as.character(dt4$Sample_Time))==trimws("NA")),NA,dt4$Sample_Time)
suppressWarnings(dt4$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Sample_Time))==as.character(as.numeric("NA"))),NA,dt4$Sample_Time))
dt4$Gage_Ht <- ifelse((trimws(as.character(dt4$Gage_Ht))==trimws("NA")),NA,dt4$Gage_Ht)
suppressWarnings(dt4$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt4$Gage_Ht))
dt4$Gage_Ht <- ifelse((trimws(as.character(dt4$Gage_Ht))==trimws("BLANK")),NA,dt4$Gage_Ht)
suppressWarnings(dt4$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt4$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt4$Gage_Ht))
dt4$Temp <- ifelse((trimws(as.character(dt4$Temp))==trimws("NA")),NA,dt4$Temp)
suppressWarnings(dt4$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Temp))==as.character(as.numeric("NA"))),NA,dt4$Temp))
dt4$pH <- ifelse((trimws(as.character(dt4$pH))==trimws("NA")),NA,dt4$pH)
suppressWarnings(dt4$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$pH))==as.character(as.numeric("NA"))),NA,dt4$pH))
dt4$Cond <- ifelse((trimws(as.character(dt4$Cond))==trimws("NA")),NA,dt4$Cond)
suppressWarnings(dt4$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Cond))==as.character(as.numeric("NA"))),NA,dt4$Cond))
dt4$Cl <- ifelse((trimws(as.character(dt4$Cl))==trimws("NA")),NA,dt4$Cl)
suppressWarnings(dt4$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Cl))==as.character(as.numeric("NA"))),NA,dt4$Cl))
dt4$SO4.hyphen.S <- ifelse((trimws(as.character(dt4$SO4.hyphen.S))==trimws("NA")),NA,dt4$SO4.hyphen.S)
suppressWarnings(dt4$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt4$SO4.hyphen.S))
dt4$Na <- ifelse((trimws(as.character(dt4$Na))==trimws("NA")),NA,dt4$Na)
suppressWarnings(dt4$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Na))==as.character(as.numeric("NA"))),NA,dt4$Na))
dt4$K <- ifelse((trimws(as.character(dt4$K))==trimws("NA")),NA,dt4$K)
suppressWarnings(dt4$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$K))==as.character(as.numeric("NA"))),NA,dt4$K))
dt4$Mg <- ifelse((trimws(as.character(dt4$Mg))==trimws("NA")),NA,dt4$Mg)
suppressWarnings(dt4$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Mg))==as.character(as.numeric("NA"))),NA,dt4$Mg))
dt4$Ca <- ifelse((trimws(as.character(dt4$Ca))==trimws("NA")),NA,dt4$Ca)
suppressWarnings(dt4$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Ca))==as.character(as.numeric("NA"))),NA,dt4$Ca))
dt4$NH4.hyphen.N <- ifelse((trimws(as.character(dt4$NH4.hyphen.N))==trimws("NA")),NA,dt4$NH4.hyphen.N)
suppressWarnings(dt4$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt4$NH4.hyphen.N))
dt4$PO4.hyphen.P <- ifelse((trimws(as.character(dt4$PO4.hyphen.P))==trimws("NA")),NA,dt4$PO4.hyphen.P)
suppressWarnings(dt4$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt4$PO4.hyphen.P))
dt4$DIC <- ifelse((trimws(as.character(dt4$DIC))==trimws("NA")),NA,dt4$DIC)
suppressWarnings(dt4$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$DIC))==as.character(as.numeric("NA"))),NA,dt4$DIC))
dt4$TDN <- ifelse((trimws(as.character(dt4$TDN))==trimws("NA")),NA,dt4$TDN)
suppressWarnings(dt4$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$TDN))==as.character(as.numeric("NA"))),NA,dt4$TDN))
dt4$TDP <- ifelse((trimws(as.character(dt4$TDP))==trimws("NA")),NA,dt4$TDP)
suppressWarnings(dt4$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$TDP))==as.character(as.numeric("NA"))),NA,dt4$TDP))
dt4$SiO2 <- ifelse((trimws(as.character(dt4$SiO2))==trimws("NA")),NA,dt4$SiO2)
suppressWarnings(dt4$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$SiO2))==as.character(as.numeric("NA"))),NA,dt4$SiO2))
dt4$DON <- ifelse((trimws(as.character(dt4$DON))==trimws("NA")),NA,dt4$DON)
suppressWarnings(dt4$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$DON))==as.character(as.numeric("NA"))),NA,dt4$DON))
dt4$TSS <- ifelse((trimws(as.character(dt4$TSS))==trimws("NA")),NA,dt4$TSS)
suppressWarnings(dt4$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$TSS))==as.character(as.numeric("NA"))),NA,dt4$TSS))


# Here is the structure of the input data frame:
str(dt4)
attach(dt4)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt4$Sample_ID))
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
summary(as.factor(dt4$DONCode))
detach(dt4)


inUrl5  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/50e936c844f695818a9616534f2dfccd"
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
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

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
if (class(dt5$Gage_Ht)=="factor") dt5$Gage_Ht <-as.numeric(levels(dt5$Gage_Ht))[as.integer(dt5$Gage_Ht) ]
if (class(dt5$Gage_Ht)=="character") dt5$Gage_Ht <-as.numeric(dt5$Gage_Ht)
if (class(dt5$Temp)=="factor") dt5$Temp <-as.numeric(levels(dt5$Temp))[as.integer(dt5$Temp) ]
if (class(dt5$Temp)=="character") dt5$Temp <-as.numeric(dt5$Temp)
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
if (class(dt5$Na)=="factor") dt5$Na <-as.numeric(levels(dt5$Na))[as.integer(dt5$Na) ]
if (class(dt5$Na)=="character") dt5$Na <-as.numeric(dt5$Na)
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
if (class(dt5$DON)=="factor") dt5$DON <-as.numeric(levels(dt5$DON))[as.integer(dt5$DON) ]
if (class(dt5$DON)=="character") dt5$DON <-as.numeric(dt5$DON)
if (class(dt5$TSS)=="factor") dt5$TSS <-as.numeric(levels(dt5$TSS))[as.integer(dt5$TSS) ]
if (class(dt5$TSS)=="character") dt5$TSS <-as.numeric(dt5$TSS)
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
if (class(dt5$DONCode)!="factor") dt5$DONCode<- as.factor(dt5$DONCode)

# Convert Missing Values to NA for non-dates

dt5$Code <- ifelse((trimws(as.character(dt5$Code))==trimws("NA")),NA,dt5$Code)
suppressWarnings(dt5$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Code))==as.character(as.numeric("NA"))),NA,dt5$Code))
dt5$Sample_Time <- ifelse((trimws(as.character(dt5$Sample_Time))==trimws("NA")),NA,dt5$Sample_Time)
suppressWarnings(dt5$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Sample_Time))==as.character(as.numeric("NA"))),NA,dt5$Sample_Time))
dt5$Gage_Ht <- ifelse((trimws(as.character(dt5$Gage_Ht))==trimws("NA")),NA,dt5$Gage_Ht)
suppressWarnings(dt5$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt5$Gage_Ht))
dt5$Gage_Ht <- ifelse((trimws(as.character(dt5$Gage_Ht))==trimws("BLANK")),NA,dt5$Gage_Ht)
suppressWarnings(dt5$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt5$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt5$Gage_Ht))
dt5$Temp <- ifelse((trimws(as.character(dt5$Temp))==trimws("NA")),NA,dt5$Temp)
suppressWarnings(dt5$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Temp))==as.character(as.numeric("NA"))),NA,dt5$Temp))
dt5$pH <- ifelse((trimws(as.character(dt5$pH))==trimws("NA")),NA,dt5$pH)
suppressWarnings(dt5$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$pH))==as.character(as.numeric("NA"))),NA,dt5$pH))
dt5$Cond <- ifelse((trimws(as.character(dt5$Cond))==trimws("NA")),NA,dt5$Cond)
suppressWarnings(dt5$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Cond))==as.character(as.numeric("NA"))),NA,dt5$Cond))
dt5$Cl <- ifelse((trimws(as.character(dt5$Cl))==trimws("NA")),NA,dt5$Cl)
suppressWarnings(dt5$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Cl))==as.character(as.numeric("NA"))),NA,dt5$Cl))
dt5$SO4.hyphen.S <- ifelse((trimws(as.character(dt5$SO4.hyphen.S))==trimws("NA")),NA,dt5$SO4.hyphen.S)
suppressWarnings(dt5$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt5$SO4.hyphen.S))
dt5$Na <- ifelse((trimws(as.character(dt5$Na))==trimws("NA")),NA,dt5$Na)
suppressWarnings(dt5$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Na))==as.character(as.numeric("NA"))),NA,dt5$Na))
dt5$K <- ifelse((trimws(as.character(dt5$K))==trimws("NA")),NA,dt5$K)
suppressWarnings(dt5$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$K))==as.character(as.numeric("NA"))),NA,dt5$K))
dt5$Mg <- ifelse((trimws(as.character(dt5$Mg))==trimws("NA")),NA,dt5$Mg)
suppressWarnings(dt5$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Mg))==as.character(as.numeric("NA"))),NA,dt5$Mg))
dt5$Ca <- ifelse((trimws(as.character(dt5$Ca))==trimws("NA")),NA,dt5$Ca)
suppressWarnings(dt5$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Ca))==as.character(as.numeric("NA"))),NA,dt5$Ca))
dt5$NH4.hyphen.N <- ifelse((trimws(as.character(dt5$NH4.hyphen.N))==trimws("NA")),NA,dt5$NH4.hyphen.N)
suppressWarnings(dt5$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt5$NH4.hyphen.N))
dt5$PO4.hyphen.P <- ifelse((trimws(as.character(dt5$PO4.hyphen.P))==trimws("NA")),NA,dt5$PO4.hyphen.P)
suppressWarnings(dt5$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt5$PO4.hyphen.P))
dt5$DIC <- ifelse((trimws(as.character(dt5$DIC))==trimws("NA")),NA,dt5$DIC)
suppressWarnings(dt5$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$DIC))==as.character(as.numeric("NA"))),NA,dt5$DIC))
dt5$TDN <- ifelse((trimws(as.character(dt5$TDN))==trimws("NA")),NA,dt5$TDN)
suppressWarnings(dt5$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$TDN))==as.character(as.numeric("NA"))),NA,dt5$TDN))
dt5$TDP <- ifelse((trimws(as.character(dt5$TDP))==trimws("NA")),NA,dt5$TDP)
suppressWarnings(dt5$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$TDP))==as.character(as.numeric("NA"))),NA,dt5$TDP))
dt5$SiO2 <- ifelse((trimws(as.character(dt5$SiO2))==trimws("NA")),NA,dt5$SiO2)
suppressWarnings(dt5$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$SiO2))==as.character(as.numeric("NA"))),NA,dt5$SiO2))
dt5$DON <- ifelse((trimws(as.character(dt5$DON))==trimws("NA")),NA,dt5$DON)
suppressWarnings(dt5$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$DON))==as.character(as.numeric("NA"))),NA,dt5$DON))
dt5$TSS <- ifelse((trimws(as.character(dt5$TSS))==trimws("NA")),NA,dt5$TSS)
suppressWarnings(dt5$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$TSS))==as.character(as.numeric("NA"))),NA,dt5$TSS))


# Here is the structure of the input data frame:
str(dt5)
attach(dt5)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt5$Sample_ID))
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
summary(as.factor(dt5$DONCode))
detach(dt5)


inUrl6  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/8a08499c0de8a22e8a56305e81bf02ac"
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
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

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
if (class(dt6$Gage_Ht)=="factor") dt6$Gage_Ht <-as.numeric(levels(dt6$Gage_Ht))[as.integer(dt6$Gage_Ht) ]
if (class(dt6$Gage_Ht)=="character") dt6$Gage_Ht <-as.numeric(dt6$Gage_Ht)
if (class(dt6$Temp)=="factor") dt6$Temp <-as.numeric(levels(dt6$Temp))[as.integer(dt6$Temp) ]
if (class(dt6$Temp)=="character") dt6$Temp <-as.numeric(dt6$Temp)
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
if (class(dt6$Na)=="factor") dt6$Na <-as.numeric(levels(dt6$Na))[as.integer(dt6$Na) ]
if (class(dt6$Na)=="character") dt6$Na <-as.numeric(dt6$Na)
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
if (class(dt6$DON)=="factor") dt6$DON <-as.numeric(levels(dt6$DON))[as.integer(dt6$DON) ]
if (class(dt6$DON)=="character") dt6$DON <-as.numeric(dt6$DON)
if (class(dt6$TSS)=="factor") dt6$TSS <-as.numeric(levels(dt6$TSS))[as.integer(dt6$TSS) ]
if (class(dt6$TSS)=="character") dt6$TSS <-as.numeric(dt6$TSS)
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
if (class(dt6$DONCode)!="factor") dt6$DONCode<- as.factor(dt6$DONCode)

# Convert Missing Values to NA for non-dates

dt6$Code <- ifelse((trimws(as.character(dt6$Code))==trimws("NA")),NA,dt6$Code)
suppressWarnings(dt6$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Code))==as.character(as.numeric("NA"))),NA,dt6$Code))
dt6$Sample_Time <- ifelse((trimws(as.character(dt6$Sample_Time))==trimws("NA")),NA,dt6$Sample_Time)
suppressWarnings(dt6$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Sample_Time))==as.character(as.numeric("NA"))),NA,dt6$Sample_Time))
dt6$Gage_Ht <- ifelse((trimws(as.character(dt6$Gage_Ht))==trimws("NA")),NA,dt6$Gage_Ht)
suppressWarnings(dt6$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt6$Gage_Ht))
dt6$Gage_Ht <- ifelse((trimws(as.character(dt6$Gage_Ht))==trimws("BLANK")),NA,dt6$Gage_Ht)
suppressWarnings(dt6$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt6$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt6$Gage_Ht))
dt6$Temp <- ifelse((trimws(as.character(dt6$Temp))==trimws("NA")),NA,dt6$Temp)
suppressWarnings(dt6$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Temp))==as.character(as.numeric("NA"))),NA,dt6$Temp))
dt6$pH <- ifelse((trimws(as.character(dt6$pH))==trimws("NA")),NA,dt6$pH)
suppressWarnings(dt6$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$pH))==as.character(as.numeric("NA"))),NA,dt6$pH))
dt6$Cond <- ifelse((trimws(as.character(dt6$Cond))==trimws("NA")),NA,dt6$Cond)
suppressWarnings(dt6$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Cond))==as.character(as.numeric("NA"))),NA,dt6$Cond))
dt6$Cl <- ifelse((trimws(as.character(dt6$Cl))==trimws("NA")),NA,dt6$Cl)
suppressWarnings(dt6$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Cl))==as.character(as.numeric("NA"))),NA,dt6$Cl))
dt6$SO4.hyphen.S <- ifelse((trimws(as.character(dt6$SO4.hyphen.S))==trimws("NA")),NA,dt6$SO4.hyphen.S)
suppressWarnings(dt6$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt6$SO4.hyphen.S))
dt6$Na <- ifelse((trimws(as.character(dt6$Na))==trimws("NA")),NA,dt6$Na)
suppressWarnings(dt6$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Na))==as.character(as.numeric("NA"))),NA,dt6$Na))
dt6$K <- ifelse((trimws(as.character(dt6$K))==trimws("NA")),NA,dt6$K)
suppressWarnings(dt6$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$K))==as.character(as.numeric("NA"))),NA,dt6$K))
dt6$Mg <- ifelse((trimws(as.character(dt6$Mg))==trimws("NA")),NA,dt6$Mg)
suppressWarnings(dt6$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Mg))==as.character(as.numeric("NA"))),NA,dt6$Mg))
dt6$Ca <- ifelse((trimws(as.character(dt6$Ca))==trimws("NA")),NA,dt6$Ca)
suppressWarnings(dt6$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Ca))==as.character(as.numeric("NA"))),NA,dt6$Ca))
dt6$NH4.hyphen.N <- ifelse((trimws(as.character(dt6$NH4.hyphen.N))==trimws("NA")),NA,dt6$NH4.hyphen.N)
suppressWarnings(dt6$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt6$NH4.hyphen.N))
dt6$PO4.hyphen.P <- ifelse((trimws(as.character(dt6$PO4.hyphen.P))==trimws("NA")),NA,dt6$PO4.hyphen.P)
suppressWarnings(dt6$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt6$PO4.hyphen.P))
dt6$DIC <- ifelse((trimws(as.character(dt6$DIC))==trimws("NA")),NA,dt6$DIC)
suppressWarnings(dt6$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$DIC))==as.character(as.numeric("NA"))),NA,dt6$DIC))
dt6$TDN <- ifelse((trimws(as.character(dt6$TDN))==trimws("NA")),NA,dt6$TDN)
suppressWarnings(dt6$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$TDN))==as.character(as.numeric("NA"))),NA,dt6$TDN))
dt6$TDP <- ifelse((trimws(as.character(dt6$TDP))==trimws("NA")),NA,dt6$TDP)
suppressWarnings(dt6$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$TDP))==as.character(as.numeric("NA"))),NA,dt6$TDP))
dt6$SiO2 <- ifelse((trimws(as.character(dt6$SiO2))==trimws("NA")),NA,dt6$SiO2)
suppressWarnings(dt6$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$SiO2))==as.character(as.numeric("NA"))),NA,dt6$SiO2))
dt6$DON <- ifelse((trimws(as.character(dt6$DON))==trimws("NA")),NA,dt6$DON)
suppressWarnings(dt6$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$DON))==as.character(as.numeric("NA"))),NA,dt6$DON))
dt6$TSS <- ifelse((trimws(as.character(dt6$TSS))==trimws("NA")),NA,dt6$TSS)
suppressWarnings(dt6$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$TSS))==as.character(as.numeric("NA"))),NA,dt6$TSS))


# Here is the structure of the input data frame:
str(dt6)
attach(dt6)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt6$Sample_ID))
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
summary(as.factor(dt6$DONCode))
detach(dt6)


inUrl7  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/266905bbeebf3bb59caeee45222eec18"
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
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile7)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt7$Sample_ID)!="factor") dt7$Sample_ID<- as.factor(dt7$Sample_ID)
if (class(dt7$Code)=="factor") dt7$Code <-as.numeric(levels(dt7$Code))[as.integer(dt7$Code) ]
if (class(dt7$Code)=="character") dt7$Code <-as.numeric(dt7$Code)
# attempting to convert dt7$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp7Sample_Date<-as.Date(dt7$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp7Sample_Date) == length(tmp7Sample_Date[!is.na(tmp7Sample_Date)])){dt7$Sample_Date <- tmp7Sample_Date } else {print("Date conversion failed for dt7$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp7Sample_Date)
if (class(dt7$Sample_Time)=="factor") dt7$Sample_Time <-as.numeric(levels(dt7$Sample_Time))[as.integer(dt7$Sample_Time) ]
if (class(dt7$Sample_Time)=="character") dt7$Sample_Time <-as.numeric(dt7$Sample_Time)
if (class(dt7$Gage_Ht)=="factor") dt7$Gage_Ht <-as.numeric(levels(dt7$Gage_Ht))[as.integer(dt7$Gage_Ht) ]
if (class(dt7$Gage_Ht)=="character") dt7$Gage_Ht <-as.numeric(dt7$Gage_Ht)
if (class(dt7$Temp)=="factor") dt7$Temp <-as.numeric(levels(dt7$Temp))[as.integer(dt7$Temp) ]
if (class(dt7$Temp)=="character") dt7$Temp <-as.numeric(dt7$Temp)
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
if (class(dt7$DIC)=="factor") dt7$DIC <-as.numeric(levels(dt7$DIC))[as.integer(dt7$DIC) ]
if (class(dt7$DIC)=="character") dt7$DIC <-as.numeric(dt7$DIC)
if (class(dt7$TDN)=="factor") dt7$TDN <-as.numeric(levels(dt7$TDN))[as.integer(dt7$TDN) ]
if (class(dt7$TDN)=="character") dt7$TDN <-as.numeric(dt7$TDN)
if (class(dt7$TDP)=="factor") dt7$TDP <-as.numeric(levels(dt7$TDP))[as.integer(dt7$TDP) ]
if (class(dt7$TDP)=="character") dt7$TDP <-as.numeric(dt7$TDP)
if (class(dt7$SiO2)=="factor") dt7$SiO2 <-as.numeric(levels(dt7$SiO2))[as.integer(dt7$SiO2) ]
if (class(dt7$SiO2)=="character") dt7$SiO2 <-as.numeric(dt7$SiO2)
if (class(dt7$DON)=="factor") dt7$DON <-as.numeric(levels(dt7$DON))[as.integer(dt7$DON) ]
if (class(dt7$DON)=="character") dt7$DON <-as.numeric(dt7$DON)
if (class(dt7$TSS)=="factor") dt7$TSS <-as.numeric(levels(dt7$TSS))[as.integer(dt7$TSS) ]
if (class(dt7$TSS)=="character") dt7$TSS <-as.numeric(dt7$TSS)
if (class(dt7$ChlorideCode)!="factor") dt7$ChlorideCode<- as.factor(dt7$ChlorideCode)
if (class(dt7$NitrateCode)!="factor") dt7$NitrateCode<- as.factor(dt7$NitrateCode)
if (class(dt7$SulfateCode)!="factor") dt7$SulfateCode<- as.factor(dt7$SulfateCode)
if (class(dt7$SodiumCode)!="factor") dt7$SodiumCode<- as.factor(dt7$SodiumCode)
if (class(dt7$PotassiumCode)!="factor") dt7$PotassiumCode<- as.factor(dt7$PotassiumCode)
if (class(dt7$MagnesiumCode)!="factor") dt7$MagnesiumCode<- as.factor(dt7$MagnesiumCode)
if (class(dt7$CalciumCode)!="factor") dt7$CalciumCode<- as.factor(dt7$CalciumCode)
if (class(dt7$NH4Code)!="factor") dt7$NH4Code<- as.factor(dt7$NH4Code)
if (class(dt7$PO4Code)!="factor") dt7$PO4Code<- as.factor(dt7$PO4Code)
if (class(dt7$DOCCode)!="factor") dt7$DOCCode<- as.factor(dt7$DOCCode)
if (class(dt7$DICCode)!="factor") dt7$DICCode<- as.factor(dt7$DICCode)
if (class(dt7$TDNCode)!="factor") dt7$TDNCode<- as.factor(dt7$TDNCode)
if (class(dt7$SiO2Code)!="factor") dt7$SiO2Code<- as.factor(dt7$SiO2Code)
if (class(dt7$DONCode)!="factor") dt7$DONCode<- as.factor(dt7$DONCode)

# Convert Missing Values to NA for non-dates

dt7$Code <- ifelse((trimws(as.character(dt7$Code))==trimws("NA")),NA,dt7$Code)
suppressWarnings(dt7$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Code))==as.character(as.numeric("NA"))),NA,dt7$Code))
dt7$Sample_Time <- ifelse((trimws(as.character(dt7$Sample_Time))==trimws("NA")),NA,dt7$Sample_Time)
suppressWarnings(dt7$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Sample_Time))==as.character(as.numeric("NA"))),NA,dt7$Sample_Time))
dt7$Gage_Ht <- ifelse((trimws(as.character(dt7$Gage_Ht))==trimws("NA")),NA,dt7$Gage_Ht)
suppressWarnings(dt7$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt7$Gage_Ht))
dt7$Gage_Ht <- ifelse((trimws(as.character(dt7$Gage_Ht))==trimws("BLANK")),NA,dt7$Gage_Ht)
suppressWarnings(dt7$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt7$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt7$Gage_Ht))
dt7$Temp <- ifelse((trimws(as.character(dt7$Temp))==trimws("NA")),NA,dt7$Temp)
suppressWarnings(dt7$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Temp))==as.character(as.numeric("NA"))),NA,dt7$Temp))
dt7$pH <- ifelse((trimws(as.character(dt7$pH))==trimws("NA")),NA,dt7$pH)
suppressWarnings(dt7$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$pH))==as.character(as.numeric("NA"))),NA,dt7$pH))
dt7$Cond <- ifelse((trimws(as.character(dt7$Cond))==trimws("NA")),NA,dt7$Cond)
suppressWarnings(dt7$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Cond))==as.character(as.numeric("NA"))),NA,dt7$Cond))
dt7$Cl <- ifelse((trimws(as.character(dt7$Cl))==trimws("NA")),NA,dt7$Cl)
suppressWarnings(dt7$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Cl))==as.character(as.numeric("NA"))),NA,dt7$Cl))
dt7$SO4.hyphen.S <- ifelse((trimws(as.character(dt7$SO4.hyphen.S))==trimws("NA")),NA,dt7$SO4.hyphen.S)
suppressWarnings(dt7$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt7$SO4.hyphen.S))
dt7$Na <- ifelse((trimws(as.character(dt7$Na))==trimws("NA")),NA,dt7$Na)
suppressWarnings(dt7$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Na))==as.character(as.numeric("NA"))),NA,dt7$Na))
dt7$K <- ifelse((trimws(as.character(dt7$K))==trimws("NA")),NA,dt7$K)
suppressWarnings(dt7$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$K))==as.character(as.numeric("NA"))),NA,dt7$K))
dt7$Mg <- ifelse((trimws(as.character(dt7$Mg))==trimws("NA")),NA,dt7$Mg)
suppressWarnings(dt7$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Mg))==as.character(as.numeric("NA"))),NA,dt7$Mg))
dt7$Ca <- ifelse((trimws(as.character(dt7$Ca))==trimws("NA")),NA,dt7$Ca)
suppressWarnings(dt7$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Ca))==as.character(as.numeric("NA"))),NA,dt7$Ca))
dt7$NH4.hyphen.N <- ifelse((trimws(as.character(dt7$NH4.hyphen.N))==trimws("NA")),NA,dt7$NH4.hyphen.N)
suppressWarnings(dt7$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt7$NH4.hyphen.N))
dt7$PO4.hyphen.P <- ifelse((trimws(as.character(dt7$PO4.hyphen.P))==trimws("NA")),NA,dt7$PO4.hyphen.P)
suppressWarnings(dt7$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt7$PO4.hyphen.P))
dt7$DIC <- ifelse((trimws(as.character(dt7$DIC))==trimws("NA")),NA,dt7$DIC)
suppressWarnings(dt7$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$DIC))==as.character(as.numeric("NA"))),NA,dt7$DIC))
dt7$TDN <- ifelse((trimws(as.character(dt7$TDN))==trimws("NA")),NA,dt7$TDN)
suppressWarnings(dt7$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$TDN))==as.character(as.numeric("NA"))),NA,dt7$TDN))
dt7$TDP <- ifelse((trimws(as.character(dt7$TDP))==trimws("NA")),NA,dt7$TDP)
suppressWarnings(dt7$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$TDP))==as.character(as.numeric("NA"))),NA,dt7$TDP))
dt7$SiO2 <- ifelse((trimws(as.character(dt7$SiO2))==trimws("NA")),NA,dt7$SiO2)
suppressWarnings(dt7$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$SiO2))==as.character(as.numeric("NA"))),NA,dt7$SiO2))
dt7$DON <- ifelse((trimws(as.character(dt7$DON))==trimws("NA")),NA,dt7$DON)
suppressWarnings(dt7$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$DON))==as.character(as.numeric("NA"))),NA,dt7$DON))
dt7$TSS <- ifelse((trimws(as.character(dt7$TSS))==trimws("NA")),NA,dt7$TSS)
suppressWarnings(dt7$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$TSS))==as.character(as.numeric("NA"))),NA,dt7$TSS))


# Here is the structure of the input data frame:
str(dt7)
attach(dt7)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt7$Sample_ID))
summary(as.factor(dt7$ChlorideCode))
summary(as.factor(dt7$NitrateCode))
summary(as.factor(dt7$SulfateCode))
summary(as.factor(dt7$SodiumCode))
summary(as.factor(dt7$PotassiumCode))
summary(as.factor(dt7$MagnesiumCode))
summary(as.factor(dt7$CalciumCode))
summary(as.factor(dt7$NH4Code))
summary(as.factor(dt7$PO4Code))
summary(as.factor(dt7$DOCCode))
summary(as.factor(dt7$DICCode))
summary(as.factor(dt7$TDNCode))
summary(as.factor(dt7$SiO2Code))
summary(as.factor(dt7$DONCode))
detach(dt7)


inUrl8  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/317744e66a9ab8f48105d1436e3abfd2"
infile8 <- tempfile()
try(download.file(inUrl8,infile8,method="curl"))
if (is.na(file.size(infile8))) download.file(inUrl8,infile8,method="auto")


 dt8 <-read.csv(infile8,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile8)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt8$Sample_ID)!="factor") dt8$Sample_ID<- as.factor(dt8$Sample_ID)
if (class(dt8$Code)=="factor") dt8$Code <-as.numeric(levels(dt8$Code))[as.integer(dt8$Code) ]
if (class(dt8$Code)=="character") dt8$Code <-as.numeric(dt8$Code)
# attempting to convert dt8$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp8Sample_Date<-as.Date(dt8$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp8Sample_Date) == length(tmp8Sample_Date[!is.na(tmp8Sample_Date)])){dt8$Sample_Date <- tmp8Sample_Date } else {print("Date conversion failed for dt8$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp8Sample_Date)
if (class(dt8$Sample_Time)=="factor") dt8$Sample_Time <-as.numeric(levels(dt8$Sample_Time))[as.integer(dt8$Sample_Time) ]
if (class(dt8$Sample_Time)=="character") dt8$Sample_Time <-as.numeric(dt8$Sample_Time)
if (class(dt8$Gage_Ht)=="factor") dt8$Gage_Ht <-as.numeric(levels(dt8$Gage_Ht))[as.integer(dt8$Gage_Ht) ]
if (class(dt8$Gage_Ht)=="character") dt8$Gage_Ht <-as.numeric(dt8$Gage_Ht)
if (class(dt8$Temp)=="factor") dt8$Temp <-as.numeric(levels(dt8$Temp))[as.integer(dt8$Temp) ]
if (class(dt8$Temp)=="character") dt8$Temp <-as.numeric(dt8$Temp)
if (class(dt8$pH)=="factor") dt8$pH <-as.numeric(levels(dt8$pH))[as.integer(dt8$pH) ]
if (class(dt8$pH)=="character") dt8$pH <-as.numeric(dt8$pH)
if (class(dt8$Cond)=="factor") dt8$Cond <-as.numeric(levels(dt8$Cond))[as.integer(dt8$Cond) ]
if (class(dt8$Cond)=="character") dt8$Cond <-as.numeric(dt8$Cond)
if (class(dt8$Cl)=="factor") dt8$Cl <-as.numeric(levels(dt8$Cl))[as.integer(dt8$Cl) ]
if (class(dt8$Cl)=="character") dt8$Cl <-as.numeric(dt8$Cl)
if (class(dt8$NO3.hyphen.N)=="factor") dt8$NO3.hyphen.N <-as.numeric(levels(dt8$NO3.hyphen.N))[as.integer(dt8$NO3.hyphen.N) ]
if (class(dt8$NO3.hyphen.N)=="character") dt8$NO3.hyphen.N <-as.numeric(dt8$NO3.hyphen.N)
if (class(dt8$SO4.hyphen.S)=="factor") dt8$SO4.hyphen.S <-as.numeric(levels(dt8$SO4.hyphen.S))[as.integer(dt8$SO4.hyphen.S) ]
if (class(dt8$SO4.hyphen.S)=="character") dt8$SO4.hyphen.S <-as.numeric(dt8$SO4.hyphen.S)
if (class(dt8$Na)=="factor") dt8$Na <-as.numeric(levels(dt8$Na))[as.integer(dt8$Na) ]
if (class(dt8$Na)=="character") dt8$Na <-as.numeric(dt8$Na)
if (class(dt8$K)=="factor") dt8$K <-as.numeric(levels(dt8$K))[as.integer(dt8$K) ]
if (class(dt8$K)=="character") dt8$K <-as.numeric(dt8$K)
if (class(dt8$Mg)=="factor") dt8$Mg <-as.numeric(levels(dt8$Mg))[as.integer(dt8$Mg) ]
if (class(dt8$Mg)=="character") dt8$Mg <-as.numeric(dt8$Mg)
if (class(dt8$Ca)=="factor") dt8$Ca <-as.numeric(levels(dt8$Ca))[as.integer(dt8$Ca) ]
if (class(dt8$Ca)=="character") dt8$Ca <-as.numeric(dt8$Ca)
if (class(dt8$NH4.hyphen.N)=="factor") dt8$NH4.hyphen.N <-as.numeric(levels(dt8$NH4.hyphen.N))[as.integer(dt8$NH4.hyphen.N) ]
if (class(dt8$NH4.hyphen.N)=="character") dt8$NH4.hyphen.N <-as.numeric(dt8$NH4.hyphen.N)
if (class(dt8$PO4.hyphen.P)=="factor") dt8$PO4.hyphen.P <-as.numeric(levels(dt8$PO4.hyphen.P))[as.integer(dt8$PO4.hyphen.P) ]
if (class(dt8$PO4.hyphen.P)=="character") dt8$PO4.hyphen.P <-as.numeric(dt8$PO4.hyphen.P)
if (class(dt8$DOC)=="factor") dt8$DOC <-as.numeric(levels(dt8$DOC))[as.integer(dt8$DOC) ]
if (class(dt8$DOC)=="character") dt8$DOC <-as.numeric(dt8$DOC)
if (class(dt8$DIC)=="factor") dt8$DIC <-as.numeric(levels(dt8$DIC))[as.integer(dt8$DIC) ]
if (class(dt8$DIC)=="character") dt8$DIC <-as.numeric(dt8$DIC)
if (class(dt8$TDN)=="factor") dt8$TDN <-as.numeric(levels(dt8$TDN))[as.integer(dt8$TDN) ]
if (class(dt8$TDN)=="character") dt8$TDN <-as.numeric(dt8$TDN)
if (class(dt8$TDP)=="factor") dt8$TDP <-as.numeric(levels(dt8$TDP))[as.integer(dt8$TDP) ]
if (class(dt8$TDP)=="character") dt8$TDP <-as.numeric(dt8$TDP)
if (class(dt8$SiO2)=="factor") dt8$SiO2 <-as.numeric(levels(dt8$SiO2))[as.integer(dt8$SiO2) ]
if (class(dt8$SiO2)=="character") dt8$SiO2 <-as.numeric(dt8$SiO2)
if (class(dt8$DON)=="factor") dt8$DON <-as.numeric(levels(dt8$DON))[as.integer(dt8$DON) ]
if (class(dt8$DON)=="character") dt8$DON <-as.numeric(dt8$DON)
if (class(dt8$TSS)=="factor") dt8$TSS <-as.numeric(levels(dt8$TSS))[as.integer(dt8$TSS) ]
if (class(dt8$TSS)=="character") dt8$TSS <-as.numeric(dt8$TSS)
if (class(dt8$ChlorideCode)!="factor") dt8$ChlorideCode<- as.factor(dt8$ChlorideCode)
if (class(dt8$NitrateCode)!="factor") dt8$NitrateCode<- as.factor(dt8$NitrateCode)
if (class(dt8$SulfateCode)!="factor") dt8$SulfateCode<- as.factor(dt8$SulfateCode)
if (class(dt8$SodiumCode)!="factor") dt8$SodiumCode<- as.factor(dt8$SodiumCode)
if (class(dt8$PotassiumCode)!="factor") dt8$PotassiumCode<- as.factor(dt8$PotassiumCode)
if (class(dt8$MagnesiumCode)!="factor") dt8$MagnesiumCode<- as.factor(dt8$MagnesiumCode)
if (class(dt8$CalciumCode)!="factor") dt8$CalciumCode<- as.factor(dt8$CalciumCode)
if (class(dt8$NH4Code)!="factor") dt8$NH4Code<- as.factor(dt8$NH4Code)
if (class(dt8$PO4Code)!="factor") dt8$PO4Code<- as.factor(dt8$PO4Code)
if (class(dt8$DOCCode)!="factor") dt8$DOCCode<- as.factor(dt8$DOCCode)
if (class(dt8$DICCode)!="factor") dt8$DICCode<- as.factor(dt8$DICCode)
if (class(dt8$TDNCode)!="factor") dt8$TDNCode<- as.factor(dt8$TDNCode)
if (class(dt8$SiO2Code)!="factor") dt8$SiO2Code<- as.factor(dt8$SiO2Code)
if (class(dt8$DONCode)!="factor") dt8$DONCode<- as.factor(dt8$DONCode)

# Convert Missing Values to NA for non-dates

dt8$Code <- ifelse((trimws(as.character(dt8$Code))==trimws("NA")),NA,dt8$Code)
suppressWarnings(dt8$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Code))==as.character(as.numeric("NA"))),NA,dt8$Code))
dt8$Sample_Time <- ifelse((trimws(as.character(dt8$Sample_Time))==trimws("NA")),NA,dt8$Sample_Time)
suppressWarnings(dt8$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Sample_Time))==as.character(as.numeric("NA"))),NA,dt8$Sample_Time))
dt8$Gage_Ht <- ifelse((trimws(as.character(dt8$Gage_Ht))==trimws("NA")),NA,dt8$Gage_Ht)
suppressWarnings(dt8$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt8$Gage_Ht))
dt8$Gage_Ht <- ifelse((trimws(as.character(dt8$Gage_Ht))==trimws("BLANK")),NA,dt8$Gage_Ht)
suppressWarnings(dt8$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt8$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt8$Gage_Ht))
dt8$Temp <- ifelse((trimws(as.character(dt8$Temp))==trimws("NA")),NA,dt8$Temp)
suppressWarnings(dt8$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Temp))==as.character(as.numeric("NA"))),NA,dt8$Temp))
dt8$pH <- ifelse((trimws(as.character(dt8$pH))==trimws("NA")),NA,dt8$pH)
suppressWarnings(dt8$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$pH))==as.character(as.numeric("NA"))),NA,dt8$pH))
dt8$Cond <- ifelse((trimws(as.character(dt8$Cond))==trimws("NA")),NA,dt8$Cond)
suppressWarnings(dt8$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Cond))==as.character(as.numeric("NA"))),NA,dt8$Cond))
dt8$Cl <- ifelse((trimws(as.character(dt8$Cl))==trimws("NA")),NA,dt8$Cl)
suppressWarnings(dt8$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Cl))==as.character(as.numeric("NA"))),NA,dt8$Cl))
dt8$SO4.hyphen.S <- ifelse((trimws(as.character(dt8$SO4.hyphen.S))==trimws("NA")),NA,dt8$SO4.hyphen.S)
suppressWarnings(dt8$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt8$SO4.hyphen.S))
dt8$Na <- ifelse((trimws(as.character(dt8$Na))==trimws("NA")),NA,dt8$Na)
suppressWarnings(dt8$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Na))==as.character(as.numeric("NA"))),NA,dt8$Na))
dt8$K <- ifelse((trimws(as.character(dt8$K))==trimws("NA")),NA,dt8$K)
suppressWarnings(dt8$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$K))==as.character(as.numeric("NA"))),NA,dt8$K))
dt8$Mg <- ifelse((trimws(as.character(dt8$Mg))==trimws("NA")),NA,dt8$Mg)
suppressWarnings(dt8$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Mg))==as.character(as.numeric("NA"))),NA,dt8$Mg))
dt8$Ca <- ifelse((trimws(as.character(dt8$Ca))==trimws("NA")),NA,dt8$Ca)
suppressWarnings(dt8$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Ca))==as.character(as.numeric("NA"))),NA,dt8$Ca))
dt8$NH4.hyphen.N <- ifelse((trimws(as.character(dt8$NH4.hyphen.N))==trimws("NA")),NA,dt8$NH4.hyphen.N)
suppressWarnings(dt8$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt8$NH4.hyphen.N))
dt8$PO4.hyphen.P <- ifelse((trimws(as.character(dt8$PO4.hyphen.P))==trimws("NA")),NA,dt8$PO4.hyphen.P)
suppressWarnings(dt8$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt8$PO4.hyphen.P))
dt8$DIC <- ifelse((trimws(as.character(dt8$DIC))==trimws("NA")),NA,dt8$DIC)
suppressWarnings(dt8$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$DIC))==as.character(as.numeric("NA"))),NA,dt8$DIC))
dt8$TDN <- ifelse((trimws(as.character(dt8$TDN))==trimws("NA")),NA,dt8$TDN)
suppressWarnings(dt8$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$TDN))==as.character(as.numeric("NA"))),NA,dt8$TDN))
dt8$TDP <- ifelse((trimws(as.character(dt8$TDP))==trimws("NA")),NA,dt8$TDP)
suppressWarnings(dt8$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$TDP))==as.character(as.numeric("NA"))),NA,dt8$TDP))
dt8$SiO2 <- ifelse((trimws(as.character(dt8$SiO2))==trimws("NA")),NA,dt8$SiO2)
suppressWarnings(dt8$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$SiO2))==as.character(as.numeric("NA"))),NA,dt8$SiO2))
dt8$DON <- ifelse((trimws(as.character(dt8$DON))==trimws("NA")),NA,dt8$DON)
suppressWarnings(dt8$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$DON))==as.character(as.numeric("NA"))),NA,dt8$DON))
dt8$TSS <- ifelse((trimws(as.character(dt8$TSS))==trimws("NA")),NA,dt8$TSS)
suppressWarnings(dt8$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$TSS))==as.character(as.numeric("NA"))),NA,dt8$TSS))


# Here is the structure of the input data frame:
str(dt8)
attach(dt8)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt8$Sample_ID))
summary(as.factor(dt8$ChlorideCode))
summary(as.factor(dt8$NitrateCode))
summary(as.factor(dt8$SulfateCode))
summary(as.factor(dt8$SodiumCode))
summary(as.factor(dt8$PotassiumCode))
summary(as.factor(dt8$MagnesiumCode))
summary(as.factor(dt8$CalciumCode))
summary(as.factor(dt8$NH4Code))
summary(as.factor(dt8$PO4Code))
summary(as.factor(dt8$DOCCode))
summary(as.factor(dt8$DICCode))
summary(as.factor(dt8$TDNCode))
summary(as.factor(dt8$SiO2Code))
summary(as.factor(dt8$DONCode))
detach(dt8)


inUrl9  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/a05bda0a0af888cc037ff5dd00dafd7e"
infile9 <- tempfile()
try(download.file(inUrl9,infile9,method="curl"))
if (is.na(file.size(infile9))) download.file(inUrl9,infile9,method="auto")


 dt9 <-read.csv(infile9,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile9)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt9$Sample_ID)!="factor") dt9$Sample_ID<- as.factor(dt9$Sample_ID)
if (class(dt9$Code)=="factor") dt9$Code <-as.numeric(levels(dt9$Code))[as.integer(dt9$Code) ]
if (class(dt9$Code)=="character") dt9$Code <-as.numeric(dt9$Code)
# attempting to convert dt9$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp9Sample_Date<-as.Date(dt9$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp9Sample_Date) == length(tmp9Sample_Date[!is.na(tmp9Sample_Date)])){dt9$Sample_Date <- tmp9Sample_Date } else {print("Date conversion failed for dt9$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp9Sample_Date)
if (class(dt9$Sample_Time)=="factor") dt9$Sample_Time <-as.numeric(levels(dt9$Sample_Time))[as.integer(dt9$Sample_Time) ]
if (class(dt9$Sample_Time)=="character") dt9$Sample_Time <-as.numeric(dt9$Sample_Time)
if (class(dt9$Gage_Ht)=="factor") dt9$Gage_Ht <-as.numeric(levels(dt9$Gage_Ht))[as.integer(dt9$Gage_Ht) ]
if (class(dt9$Gage_Ht)=="character") dt9$Gage_Ht <-as.numeric(dt9$Gage_Ht)
if (class(dt9$Temp)=="factor") dt9$Temp <-as.numeric(levels(dt9$Temp))[as.integer(dt9$Temp) ]
if (class(dt9$Temp)=="character") dt9$Temp <-as.numeric(dt9$Temp)
if (class(dt9$pH)=="factor") dt9$pH <-as.numeric(levels(dt9$pH))[as.integer(dt9$pH) ]
if (class(dt9$pH)=="character") dt9$pH <-as.numeric(dt9$pH)
if (class(dt9$Cond)=="factor") dt9$Cond <-as.numeric(levels(dt9$Cond))[as.integer(dt9$Cond) ]
if (class(dt9$Cond)=="character") dt9$Cond <-as.numeric(dt9$Cond)
if (class(dt9$Cl)=="factor") dt9$Cl <-as.numeric(levels(dt9$Cl))[as.integer(dt9$Cl) ]
if (class(dt9$Cl)=="character") dt9$Cl <-as.numeric(dt9$Cl)
if (class(dt9$NO3.hyphen.N)=="factor") dt9$NO3.hyphen.N <-as.numeric(levels(dt9$NO3.hyphen.N))[as.integer(dt9$NO3.hyphen.N) ]
if (class(dt9$NO3.hyphen.N)=="character") dt9$NO3.hyphen.N <-as.numeric(dt9$NO3.hyphen.N)
if (class(dt9$SO4.hyphen.S)=="factor") dt9$SO4.hyphen.S <-as.numeric(levels(dt9$SO4.hyphen.S))[as.integer(dt9$SO4.hyphen.S) ]
if (class(dt9$SO4.hyphen.S)=="character") dt9$SO4.hyphen.S <-as.numeric(dt9$SO4.hyphen.S)
if (class(dt9$Na)=="factor") dt9$Na <-as.numeric(levels(dt9$Na))[as.integer(dt9$Na) ]
if (class(dt9$Na)=="character") dt9$Na <-as.numeric(dt9$Na)
if (class(dt9$K)=="factor") dt9$K <-as.numeric(levels(dt9$K))[as.integer(dt9$K) ]
if (class(dt9$K)=="character") dt9$K <-as.numeric(dt9$K)
if (class(dt9$Mg)=="factor") dt9$Mg <-as.numeric(levels(dt9$Mg))[as.integer(dt9$Mg) ]
if (class(dt9$Mg)=="character") dt9$Mg <-as.numeric(dt9$Mg)
if (class(dt9$Ca)=="factor") dt9$Ca <-as.numeric(levels(dt9$Ca))[as.integer(dt9$Ca) ]
if (class(dt9$Ca)=="character") dt9$Ca <-as.numeric(dt9$Ca)
if (class(dt9$NH4.hyphen.N)=="factor") dt9$NH4.hyphen.N <-as.numeric(levels(dt9$NH4.hyphen.N))[as.integer(dt9$NH4.hyphen.N) ]
if (class(dt9$NH4.hyphen.N)=="character") dt9$NH4.hyphen.N <-as.numeric(dt9$NH4.hyphen.N)
if (class(dt9$PO4.hyphen.P)=="factor") dt9$PO4.hyphen.P <-as.numeric(levels(dt9$PO4.hyphen.P))[as.integer(dt9$PO4.hyphen.P) ]
if (class(dt9$PO4.hyphen.P)=="character") dt9$PO4.hyphen.P <-as.numeric(dt9$PO4.hyphen.P)
if (class(dt9$DOC)=="factor") dt9$DOC <-as.numeric(levels(dt9$DOC))[as.integer(dt9$DOC) ]
if (class(dt9$DOC)=="character") dt9$DOC <-as.numeric(dt9$DOC)
if (class(dt9$DIC)=="factor") dt9$DIC <-as.numeric(levels(dt9$DIC))[as.integer(dt9$DIC) ]
if (class(dt9$DIC)=="character") dt9$DIC <-as.numeric(dt9$DIC)
if (class(dt9$TDN)=="factor") dt9$TDN <-as.numeric(levels(dt9$TDN))[as.integer(dt9$TDN) ]
if (class(dt9$TDN)=="character") dt9$TDN <-as.numeric(dt9$TDN)
if (class(dt9$TDP)=="factor") dt9$TDP <-as.numeric(levels(dt9$TDP))[as.integer(dt9$TDP) ]
if (class(dt9$TDP)=="character") dt9$TDP <-as.numeric(dt9$TDP)
if (class(dt9$SiO2)=="factor") dt9$SiO2 <-as.numeric(levels(dt9$SiO2))[as.integer(dt9$SiO2) ]
if (class(dt9$SiO2)=="character") dt9$SiO2 <-as.numeric(dt9$SiO2)
if (class(dt9$DON)=="factor") dt9$DON <-as.numeric(levels(dt9$DON))[as.integer(dt9$DON) ]
if (class(dt9$DON)=="character") dt9$DON <-as.numeric(dt9$DON)
if (class(dt9$TSS)=="factor") dt9$TSS <-as.numeric(levels(dt9$TSS))[as.integer(dt9$TSS) ]
if (class(dt9$TSS)=="character") dt9$TSS <-as.numeric(dt9$TSS)
if (class(dt9$ChlorideCode)!="factor") dt9$ChlorideCode<- as.factor(dt9$ChlorideCode)
if (class(dt9$NitrateCode)!="factor") dt9$NitrateCode<- as.factor(dt9$NitrateCode)
if (class(dt9$SulfateCode)!="factor") dt9$SulfateCode<- as.factor(dt9$SulfateCode)
if (class(dt9$SodiumCode)!="factor") dt9$SodiumCode<- as.factor(dt9$SodiumCode)
if (class(dt9$PotassiumCode)!="factor") dt9$PotassiumCode<- as.factor(dt9$PotassiumCode)
if (class(dt9$MagnesiumCode)!="factor") dt9$MagnesiumCode<- as.factor(dt9$MagnesiumCode)
if (class(dt9$CalciumCode)!="factor") dt9$CalciumCode<- as.factor(dt9$CalciumCode)
if (class(dt9$NH4Code)!="factor") dt9$NH4Code<- as.factor(dt9$NH4Code)
if (class(dt9$PO4Code)!="factor") dt9$PO4Code<- as.factor(dt9$PO4Code)
if (class(dt9$DOCCode)!="factor") dt9$DOCCode<- as.factor(dt9$DOCCode)
if (class(dt9$DICCode)!="factor") dt9$DICCode<- as.factor(dt9$DICCode)
if (class(dt9$TDNCode)!="factor") dt9$TDNCode<- as.factor(dt9$TDNCode)
if (class(dt9$SiO2Code)!="factor") dt9$SiO2Code<- as.factor(dt9$SiO2Code)
if (class(dt9$DONCode)!="factor") dt9$DONCode<- as.factor(dt9$DONCode)

# Convert Missing Values to NA for non-dates

dt9$Code <- ifelse((trimws(as.character(dt9$Code))==trimws("NA")),NA,dt9$Code)
suppressWarnings(dt9$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Code))==as.character(as.numeric("NA"))),NA,dt9$Code))
dt9$Sample_Time <- ifelse((trimws(as.character(dt9$Sample_Time))==trimws("NA")),NA,dt9$Sample_Time)
suppressWarnings(dt9$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Sample_Time))==as.character(as.numeric("NA"))),NA,dt9$Sample_Time))
dt9$Gage_Ht <- ifelse((trimws(as.character(dt9$Gage_Ht))==trimws("NA")),NA,dt9$Gage_Ht)
suppressWarnings(dt9$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt9$Gage_Ht))
dt9$Gage_Ht <- ifelse((trimws(as.character(dt9$Gage_Ht))==trimws("BLANK")),NA,dt9$Gage_Ht)
suppressWarnings(dt9$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt9$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt9$Gage_Ht))
dt9$Temp <- ifelse((trimws(as.character(dt9$Temp))==trimws("NA")),NA,dt9$Temp)
suppressWarnings(dt9$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Temp))==as.character(as.numeric("NA"))),NA,dt9$Temp))
dt9$pH <- ifelse((trimws(as.character(dt9$pH))==trimws("NA")),NA,dt9$pH)
suppressWarnings(dt9$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$pH))==as.character(as.numeric("NA"))),NA,dt9$pH))
dt9$Cond <- ifelse((trimws(as.character(dt9$Cond))==trimws("NA")),NA,dt9$Cond)
suppressWarnings(dt9$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Cond))==as.character(as.numeric("NA"))),NA,dt9$Cond))
dt9$Cl <- ifelse((trimws(as.character(dt9$Cl))==trimws("NA")),NA,dt9$Cl)
suppressWarnings(dt9$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Cl))==as.character(as.numeric("NA"))),NA,dt9$Cl))
dt9$SO4.hyphen.S <- ifelse((trimws(as.character(dt9$SO4.hyphen.S))==trimws("NA")),NA,dt9$SO4.hyphen.S)
suppressWarnings(dt9$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt9$SO4.hyphen.S))
dt9$Na <- ifelse((trimws(as.character(dt9$Na))==trimws("NA")),NA,dt9$Na)
suppressWarnings(dt9$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Na))==as.character(as.numeric("NA"))),NA,dt9$Na))
dt9$K <- ifelse((trimws(as.character(dt9$K))==trimws("NA")),NA,dt9$K)
suppressWarnings(dt9$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$K))==as.character(as.numeric("NA"))),NA,dt9$K))
dt9$Mg <- ifelse((trimws(as.character(dt9$Mg))==trimws("NA")),NA,dt9$Mg)
suppressWarnings(dt9$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Mg))==as.character(as.numeric("NA"))),NA,dt9$Mg))
dt9$Ca <- ifelse((trimws(as.character(dt9$Ca))==trimws("NA")),NA,dt9$Ca)
suppressWarnings(dt9$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Ca))==as.character(as.numeric("NA"))),NA,dt9$Ca))
dt9$NH4.hyphen.N <- ifelse((trimws(as.character(dt9$NH4.hyphen.N))==trimws("NA")),NA,dt9$NH4.hyphen.N)
suppressWarnings(dt9$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt9$NH4.hyphen.N))
dt9$PO4.hyphen.P <- ifelse((trimws(as.character(dt9$PO4.hyphen.P))==trimws("NA")),NA,dt9$PO4.hyphen.P)
suppressWarnings(dt9$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt9$PO4.hyphen.P))
dt9$DIC <- ifelse((trimws(as.character(dt9$DIC))==trimws("NA")),NA,dt9$DIC)
suppressWarnings(dt9$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$DIC))==as.character(as.numeric("NA"))),NA,dt9$DIC))
dt9$TDN <- ifelse((trimws(as.character(dt9$TDN))==trimws("NA")),NA,dt9$TDN)
suppressWarnings(dt9$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$TDN))==as.character(as.numeric("NA"))),NA,dt9$TDN))
dt9$TDP <- ifelse((trimws(as.character(dt9$TDP))==trimws("NA")),NA,dt9$TDP)
suppressWarnings(dt9$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$TDP))==as.character(as.numeric("NA"))),NA,dt9$TDP))
dt9$SiO2 <- ifelse((trimws(as.character(dt9$SiO2))==trimws("NA")),NA,dt9$SiO2)
suppressWarnings(dt9$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$SiO2))==as.character(as.numeric("NA"))),NA,dt9$SiO2))
dt9$DON <- ifelse((trimws(as.character(dt9$DON))==trimws("NA")),NA,dt9$DON)
suppressWarnings(dt9$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$DON))==as.character(as.numeric("NA"))),NA,dt9$DON))
dt9$TSS <- ifelse((trimws(as.character(dt9$TSS))==trimws("NA")),NA,dt9$TSS)
suppressWarnings(dt9$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$TSS))==as.character(as.numeric("NA"))),NA,dt9$TSS))


# Here is the structure of the input data frame:
str(dt9)
attach(dt9)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt9$Sample_ID))
summary(as.factor(dt9$ChlorideCode))
summary(as.factor(dt9$NitrateCode))
summary(as.factor(dt9$SulfateCode))
summary(as.factor(dt9$SodiumCode))
summary(as.factor(dt9$PotassiumCode))
summary(as.factor(dt9$MagnesiumCode))
summary(as.factor(dt9$CalciumCode))
summary(as.factor(dt9$NH4Code))
summary(as.factor(dt9$PO4Code))
summary(as.factor(dt9$DOCCode))
summary(as.factor(dt9$DICCode))
summary(as.factor(dt9$TDNCode))
summary(as.factor(dt9$SiO2Code))
summary(as.factor(dt9$DONCode))
detach(dt9)


inUrl10  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/1838a2fd958fc3b1dea9a8bbb1ce4e3b"
infile10 <- tempfile()
try(download.file(inUrl10,infile10,method="curl"))
if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


 dt10 <-read.csv(infile10,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile10)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt10$Sample_ID)!="factor") dt10$Sample_ID<- as.factor(dt10$Sample_ID)
if (class(dt10$Code)=="factor") dt10$Code <-as.numeric(levels(dt10$Code))[as.integer(dt10$Code) ]
if (class(dt10$Code)=="character") dt10$Code <-as.numeric(dt10$Code)
# attempting to convert dt10$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp10Sample_Date<-as.Date(dt10$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp10Sample_Date) == length(tmp10Sample_Date[!is.na(tmp10Sample_Date)])){dt10$Sample_Date <- tmp10Sample_Date } else {print("Date conversion failed for dt10$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp10Sample_Date)
if (class(dt10$Sample_Time)=="factor") dt10$Sample_Time <-as.numeric(levels(dt10$Sample_Time))[as.integer(dt10$Sample_Time) ]
if (class(dt10$Sample_Time)=="character") dt10$Sample_Time <-as.numeric(dt10$Sample_Time)
if (class(dt10$Gage_Ht)=="factor") dt10$Gage_Ht <-as.numeric(levels(dt10$Gage_Ht))[as.integer(dt10$Gage_Ht) ]
if (class(dt10$Gage_Ht)=="character") dt10$Gage_Ht <-as.numeric(dt10$Gage_Ht)
if (class(dt10$Temp)=="factor") dt10$Temp <-as.numeric(levels(dt10$Temp))[as.integer(dt10$Temp) ]
if (class(dt10$Temp)=="character") dt10$Temp <-as.numeric(dt10$Temp)
if (class(dt10$pH)=="factor") dt10$pH <-as.numeric(levels(dt10$pH))[as.integer(dt10$pH) ]
if (class(dt10$pH)=="character") dt10$pH <-as.numeric(dt10$pH)
if (class(dt10$Cond)=="factor") dt10$Cond <-as.numeric(levels(dt10$Cond))[as.integer(dt10$Cond) ]
if (class(dt10$Cond)=="character") dt10$Cond <-as.numeric(dt10$Cond)
if (class(dt10$Cl)=="factor") dt10$Cl <-as.numeric(levels(dt10$Cl))[as.integer(dt10$Cl) ]
if (class(dt10$Cl)=="character") dt10$Cl <-as.numeric(dt10$Cl)
if (class(dt10$NO3.hyphen.N)=="factor") dt10$NO3.hyphen.N <-as.numeric(levels(dt10$NO3.hyphen.N))[as.integer(dt10$NO3.hyphen.N) ]
if (class(dt10$NO3.hyphen.N)=="character") dt10$NO3.hyphen.N <-as.numeric(dt10$NO3.hyphen.N)
if (class(dt10$SO4.hyphen.S)=="factor") dt10$SO4.hyphen.S <-as.numeric(levels(dt10$SO4.hyphen.S))[as.integer(dt10$SO4.hyphen.S) ]
if (class(dt10$SO4.hyphen.S)=="character") dt10$SO4.hyphen.S <-as.numeric(dt10$SO4.hyphen.S)
if (class(dt10$Na)=="factor") dt10$Na <-as.numeric(levels(dt10$Na))[as.integer(dt10$Na) ]
if (class(dt10$Na)=="character") dt10$Na <-as.numeric(dt10$Na)
if (class(dt10$K)=="factor") dt10$K <-as.numeric(levels(dt10$K))[as.integer(dt10$K) ]
if (class(dt10$K)=="character") dt10$K <-as.numeric(dt10$K)
if (class(dt10$Mg)=="factor") dt10$Mg <-as.numeric(levels(dt10$Mg))[as.integer(dt10$Mg) ]
if (class(dt10$Mg)=="character") dt10$Mg <-as.numeric(dt10$Mg)
if (class(dt10$Ca)=="factor") dt10$Ca <-as.numeric(levels(dt10$Ca))[as.integer(dt10$Ca) ]
if (class(dt10$Ca)=="character") dt10$Ca <-as.numeric(dt10$Ca)
if (class(dt10$NH4.hyphen.N)=="factor") dt10$NH4.hyphen.N <-as.numeric(levels(dt10$NH4.hyphen.N))[as.integer(dt10$NH4.hyphen.N) ]
if (class(dt10$NH4.hyphen.N)=="character") dt10$NH4.hyphen.N <-as.numeric(dt10$NH4.hyphen.N)
if (class(dt10$PO4.hyphen.P)=="factor") dt10$PO4.hyphen.P <-as.numeric(levels(dt10$PO4.hyphen.P))[as.integer(dt10$PO4.hyphen.P) ]
if (class(dt10$PO4.hyphen.P)=="character") dt10$PO4.hyphen.P <-as.numeric(dt10$PO4.hyphen.P)
if (class(dt10$DOC)=="factor") dt10$DOC <-as.numeric(levels(dt10$DOC))[as.integer(dt10$DOC) ]
if (class(dt10$DOC)=="character") dt10$DOC <-as.numeric(dt10$DOC)
if (class(dt10$DIC)=="factor") dt10$DIC <-as.numeric(levels(dt10$DIC))[as.integer(dt10$DIC) ]
if (class(dt10$DIC)=="character") dt10$DIC <-as.numeric(dt10$DIC)
if (class(dt10$TDN)=="factor") dt10$TDN <-as.numeric(levels(dt10$TDN))[as.integer(dt10$TDN) ]
if (class(dt10$TDN)=="character") dt10$TDN <-as.numeric(dt10$TDN)
if (class(dt10$TDP)=="factor") dt10$TDP <-as.numeric(levels(dt10$TDP))[as.integer(dt10$TDP) ]
if (class(dt10$TDP)=="character") dt10$TDP <-as.numeric(dt10$TDP)
if (class(dt10$SiO2)=="factor") dt10$SiO2 <-as.numeric(levels(dt10$SiO2))[as.integer(dt10$SiO2) ]
if (class(dt10$SiO2)=="character") dt10$SiO2 <-as.numeric(dt10$SiO2)
if (class(dt10$DON)=="factor") dt10$DON <-as.numeric(levels(dt10$DON))[as.integer(dt10$DON) ]
if (class(dt10$DON)=="character") dt10$DON <-as.numeric(dt10$DON)
if (class(dt10$TSS)=="factor") dt10$TSS <-as.numeric(levels(dt10$TSS))[as.integer(dt10$TSS) ]
if (class(dt10$TSS)=="character") dt10$TSS <-as.numeric(dt10$TSS)
if (class(dt10$ChlorideCode)!="factor") dt10$ChlorideCode<- as.factor(dt10$ChlorideCode)
if (class(dt10$NitrateCode)!="factor") dt10$NitrateCode<- as.factor(dt10$NitrateCode)
if (class(dt10$SulfateCode)!="factor") dt10$SulfateCode<- as.factor(dt10$SulfateCode)
if (class(dt10$SodiumCode)!="factor") dt10$SodiumCode<- as.factor(dt10$SodiumCode)
if (class(dt10$PotassiumCode)!="factor") dt10$PotassiumCode<- as.factor(dt10$PotassiumCode)
if (class(dt10$MagnesiumCode)!="factor") dt10$MagnesiumCode<- as.factor(dt10$MagnesiumCode)
if (class(dt10$CalciumCode)!="factor") dt10$CalciumCode<- as.factor(dt10$CalciumCode)
if (class(dt10$NH4Code)!="factor") dt10$NH4Code<- as.factor(dt10$NH4Code)
if (class(dt10$PO4Code)!="factor") dt10$PO4Code<- as.factor(dt10$PO4Code)
if (class(dt10$DOCCode)!="factor") dt10$DOCCode<- as.factor(dt10$DOCCode)
if (class(dt10$DICCode)!="factor") dt10$DICCode<- as.factor(dt10$DICCode)
if (class(dt10$TDNCode)!="factor") dt10$TDNCode<- as.factor(dt10$TDNCode)
if (class(dt10$SiO2Code)!="factor") dt10$SiO2Code<- as.factor(dt10$SiO2Code)
if (class(dt10$DONCode)!="factor") dt10$DONCode<- as.factor(dt10$DONCode)

# Convert Missing Values to NA for non-dates

dt10$Code <- ifelse((trimws(as.character(dt10$Code))==trimws("NA")),NA,dt10$Code)
suppressWarnings(dt10$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Code))==as.character(as.numeric("NA"))),NA,dt10$Code))
dt10$Sample_Time <- ifelse((trimws(as.character(dt10$Sample_Time))==trimws("NA")),NA,dt10$Sample_Time)
suppressWarnings(dt10$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Sample_Time))==as.character(as.numeric("NA"))),NA,dt10$Sample_Time))
dt10$Gage_Ht <- ifelse((trimws(as.character(dt10$Gage_Ht))==trimws("NA")),NA,dt10$Gage_Ht)
suppressWarnings(dt10$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt10$Gage_Ht))
dt10$Gage_Ht <- ifelse((trimws(as.character(dt10$Gage_Ht))==trimws("BLANK")),NA,dt10$Gage_Ht)
suppressWarnings(dt10$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt10$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt10$Gage_Ht))
dt10$Temp <- ifelse((trimws(as.character(dt10$Temp))==trimws("NA")),NA,dt10$Temp)
suppressWarnings(dt10$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Temp))==as.character(as.numeric("NA"))),NA,dt10$Temp))
dt10$pH <- ifelse((trimws(as.character(dt10$pH))==trimws("NA")),NA,dt10$pH)
suppressWarnings(dt10$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$pH))==as.character(as.numeric("NA"))),NA,dt10$pH))
dt10$Cond <- ifelse((trimws(as.character(dt10$Cond))==trimws("NA")),NA,dt10$Cond)
suppressWarnings(dt10$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Cond))==as.character(as.numeric("NA"))),NA,dt10$Cond))
dt10$Cl <- ifelse((trimws(as.character(dt10$Cl))==trimws("NA")),NA,dt10$Cl)
suppressWarnings(dt10$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Cl))==as.character(as.numeric("NA"))),NA,dt10$Cl))
dt10$SO4.hyphen.S <- ifelse((trimws(as.character(dt10$SO4.hyphen.S))==trimws("NA")),NA,dt10$SO4.hyphen.S)
suppressWarnings(dt10$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt10$SO4.hyphen.S))
dt10$Na <- ifelse((trimws(as.character(dt10$Na))==trimws("NA")),NA,dt10$Na)
suppressWarnings(dt10$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Na))==as.character(as.numeric("NA"))),NA,dt10$Na))
dt10$K <- ifelse((trimws(as.character(dt10$K))==trimws("NA")),NA,dt10$K)
suppressWarnings(dt10$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$K))==as.character(as.numeric("NA"))),NA,dt10$K))
dt10$Mg <- ifelse((trimws(as.character(dt10$Mg))==trimws("NA")),NA,dt10$Mg)
suppressWarnings(dt10$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Mg))==as.character(as.numeric("NA"))),NA,dt10$Mg))
dt10$Ca <- ifelse((trimws(as.character(dt10$Ca))==trimws("NA")),NA,dt10$Ca)
suppressWarnings(dt10$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Ca))==as.character(as.numeric("NA"))),NA,dt10$Ca))
dt10$NH4.hyphen.N <- ifelse((trimws(as.character(dt10$NH4.hyphen.N))==trimws("NA")),NA,dt10$NH4.hyphen.N)
suppressWarnings(dt10$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt10$NH4.hyphen.N))
dt10$PO4.hyphen.P <- ifelse((trimws(as.character(dt10$PO4.hyphen.P))==trimws("NA")),NA,dt10$PO4.hyphen.P)
suppressWarnings(dt10$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt10$PO4.hyphen.P))
dt10$DIC <- ifelse((trimws(as.character(dt10$DIC))==trimws("NA")),NA,dt10$DIC)
suppressWarnings(dt10$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$DIC))==as.character(as.numeric("NA"))),NA,dt10$DIC))
dt10$TDN <- ifelse((trimws(as.character(dt10$TDN))==trimws("NA")),NA,dt10$TDN)
suppressWarnings(dt10$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$TDN))==as.character(as.numeric("NA"))),NA,dt10$TDN))
dt10$TDP <- ifelse((trimws(as.character(dt10$TDP))==trimws("NA")),NA,dt10$TDP)
suppressWarnings(dt10$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$TDP))==as.character(as.numeric("NA"))),NA,dt10$TDP))
dt10$SiO2 <- ifelse((trimws(as.character(dt10$SiO2))==trimws("NA")),NA,dt10$SiO2)
suppressWarnings(dt10$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$SiO2))==as.character(as.numeric("NA"))),NA,dt10$SiO2))
dt10$DON <- ifelse((trimws(as.character(dt10$DON))==trimws("NA")),NA,dt10$DON)
suppressWarnings(dt10$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$DON))==as.character(as.numeric("NA"))),NA,dt10$DON))
dt10$TSS <- ifelse((trimws(as.character(dt10$TSS))==trimws("NA")),NA,dt10$TSS)
suppressWarnings(dt10$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$TSS))==as.character(as.numeric("NA"))),NA,dt10$TSS))


# Here is the structure of the input data frame:
str(dt10)
attach(dt10)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt10$Sample_ID))
summary(as.factor(dt10$ChlorideCode))
summary(as.factor(dt10$NitrateCode))
summary(as.factor(dt10$SulfateCode))
summary(as.factor(dt10$SodiumCode))
summary(as.factor(dt10$PotassiumCode))
summary(as.factor(dt10$MagnesiumCode))
summary(as.factor(dt10$CalciumCode))
summary(as.factor(dt10$NH4Code))
summary(as.factor(dt10$PO4Code))
summary(as.factor(dt10$DOCCode))
summary(as.factor(dt10$DICCode))
summary(as.factor(dt10$TDNCode))
summary(as.factor(dt10$SiO2Code))
summary(as.factor(dt10$DONCode))
detach(dt10)


inUrl11  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/461b4cf812ba692383dff2401a234bdc"
infile11 <- tempfile()
try(download.file(inUrl11,infile11,method="curl"))
if (is.na(file.size(infile11))) download.file(inUrl11,infile11,method="auto")


 dt11 <-read.csv(infile11,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile11)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt11$Sample_ID)!="factor") dt11$Sample_ID<- as.factor(dt11$Sample_ID)
if (class(dt11$Code)=="factor") dt11$Code <-as.numeric(levels(dt11$Code))[as.integer(dt11$Code) ]
if (class(dt11$Code)=="character") dt11$Code <-as.numeric(dt11$Code)
# attempting to convert dt11$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp11Sample_Date<-as.Date(dt11$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp11Sample_Date) == length(tmp11Sample_Date[!is.na(tmp11Sample_Date)])){dt11$Sample_Date <- tmp11Sample_Date } else {print("Date conversion failed for dt11$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp11Sample_Date)
if (class(dt11$Sample_Time)=="factor") dt11$Sample_Time <-as.numeric(levels(dt11$Sample_Time))[as.integer(dt11$Sample_Time) ]
if (class(dt11$Sample_Time)=="character") dt11$Sample_Time <-as.numeric(dt11$Sample_Time)
if (class(dt11$Gage_Ht)=="factor") dt11$Gage_Ht <-as.numeric(levels(dt11$Gage_Ht))[as.integer(dt11$Gage_Ht) ]
if (class(dt11$Gage_Ht)=="character") dt11$Gage_Ht <-as.numeric(dt11$Gage_Ht)
if (class(dt11$Temp)=="factor") dt11$Temp <-as.numeric(levels(dt11$Temp))[as.integer(dt11$Temp) ]
if (class(dt11$Temp)=="character") dt11$Temp <-as.numeric(dt11$Temp)
if (class(dt11$pH)=="factor") dt11$pH <-as.numeric(levels(dt11$pH))[as.integer(dt11$pH) ]
if (class(dt11$pH)=="character") dt11$pH <-as.numeric(dt11$pH)
if (class(dt11$Cond)=="factor") dt11$Cond <-as.numeric(levels(dt11$Cond))[as.integer(dt11$Cond) ]
if (class(dt11$Cond)=="character") dt11$Cond <-as.numeric(dt11$Cond)
if (class(dt11$Cl)=="factor") dt11$Cl <-as.numeric(levels(dt11$Cl))[as.integer(dt11$Cl) ]
if (class(dt11$Cl)=="character") dt11$Cl <-as.numeric(dt11$Cl)
if (class(dt11$NO3.hyphen.N)=="factor") dt11$NO3.hyphen.N <-as.numeric(levels(dt11$NO3.hyphen.N))[as.integer(dt11$NO3.hyphen.N) ]
if (class(dt11$NO3.hyphen.N)=="character") dt11$NO3.hyphen.N <-as.numeric(dt11$NO3.hyphen.N)
if (class(dt11$SO4.hyphen.S)=="factor") dt11$SO4.hyphen.S <-as.numeric(levels(dt11$SO4.hyphen.S))[as.integer(dt11$SO4.hyphen.S) ]
if (class(dt11$SO4.hyphen.S)=="character") dt11$SO4.hyphen.S <-as.numeric(dt11$SO4.hyphen.S)
if (class(dt11$Na)=="factor") dt11$Na <-as.numeric(levels(dt11$Na))[as.integer(dt11$Na) ]
if (class(dt11$Na)=="character") dt11$Na <-as.numeric(dt11$Na)
if (class(dt11$K)=="factor") dt11$K <-as.numeric(levels(dt11$K))[as.integer(dt11$K) ]
if (class(dt11$K)=="character") dt11$K <-as.numeric(dt11$K)
if (class(dt11$Mg)=="factor") dt11$Mg <-as.numeric(levels(dt11$Mg))[as.integer(dt11$Mg) ]
if (class(dt11$Mg)=="character") dt11$Mg <-as.numeric(dt11$Mg)
if (class(dt11$Ca)=="factor") dt11$Ca <-as.numeric(levels(dt11$Ca))[as.integer(dt11$Ca) ]
if (class(dt11$Ca)=="character") dt11$Ca <-as.numeric(dt11$Ca)
if (class(dt11$NH4.hyphen.N)=="factor") dt11$NH4.hyphen.N <-as.numeric(levels(dt11$NH4.hyphen.N))[as.integer(dt11$NH4.hyphen.N) ]
if (class(dt11$NH4.hyphen.N)=="character") dt11$NH4.hyphen.N <-as.numeric(dt11$NH4.hyphen.N)
if (class(dt11$PO4.hyphen.P)=="factor") dt11$PO4.hyphen.P <-as.numeric(levels(dt11$PO4.hyphen.P))[as.integer(dt11$PO4.hyphen.P) ]
if (class(dt11$PO4.hyphen.P)=="character") dt11$PO4.hyphen.P <-as.numeric(dt11$PO4.hyphen.P)
if (class(dt11$DOC)=="factor") dt11$DOC <-as.numeric(levels(dt11$DOC))[as.integer(dt11$DOC) ]
if (class(dt11$DOC)=="character") dt11$DOC <-as.numeric(dt11$DOC)
if (class(dt11$DIC)=="factor") dt11$DIC <-as.numeric(levels(dt11$DIC))[as.integer(dt11$DIC) ]
if (class(dt11$DIC)=="character") dt11$DIC <-as.numeric(dt11$DIC)
if (class(dt11$TDN)=="factor") dt11$TDN <-as.numeric(levels(dt11$TDN))[as.integer(dt11$TDN) ]
if (class(dt11$TDN)=="character") dt11$TDN <-as.numeric(dt11$TDN)
if (class(dt11$TDP)=="factor") dt11$TDP <-as.numeric(levels(dt11$TDP))[as.integer(dt11$TDP) ]
if (class(dt11$TDP)=="character") dt11$TDP <-as.numeric(dt11$TDP)
if (class(dt11$SiO2)=="factor") dt11$SiO2 <-as.numeric(levels(dt11$SiO2))[as.integer(dt11$SiO2) ]
if (class(dt11$SiO2)=="character") dt11$SiO2 <-as.numeric(dt11$SiO2)
if (class(dt11$DON)=="factor") dt11$DON <-as.numeric(levels(dt11$DON))[as.integer(dt11$DON) ]
if (class(dt11$DON)=="character") dt11$DON <-as.numeric(dt11$DON)
if (class(dt11$TSS)=="factor") dt11$TSS <-as.numeric(levels(dt11$TSS))[as.integer(dt11$TSS) ]
if (class(dt11$TSS)=="character") dt11$TSS <-as.numeric(dt11$TSS)
if (class(dt11$ChlorideCode)!="factor") dt11$ChlorideCode<- as.factor(dt11$ChlorideCode)
if (class(dt11$NitrateCode)!="factor") dt11$NitrateCode<- as.factor(dt11$NitrateCode)
if (class(dt11$SulfateCode)!="factor") dt11$SulfateCode<- as.factor(dt11$SulfateCode)
if (class(dt11$SodiumCode)!="factor") dt11$SodiumCode<- as.factor(dt11$SodiumCode)
if (class(dt11$PotassiumCode)!="factor") dt11$PotassiumCode<- as.factor(dt11$PotassiumCode)
if (class(dt11$MagnesiumCode)!="factor") dt11$MagnesiumCode<- as.factor(dt11$MagnesiumCode)
if (class(dt11$CalciumCode)!="factor") dt11$CalciumCode<- as.factor(dt11$CalciumCode)
if (class(dt11$NH4Code)!="factor") dt11$NH4Code<- as.factor(dt11$NH4Code)
if (class(dt11$PO4Code)!="factor") dt11$PO4Code<- as.factor(dt11$PO4Code)
if (class(dt11$DOCCode)!="factor") dt11$DOCCode<- as.factor(dt11$DOCCode)
if (class(dt11$DICCode)!="factor") dt11$DICCode<- as.factor(dt11$DICCode)
if (class(dt11$TDNCode)!="factor") dt11$TDNCode<- as.factor(dt11$TDNCode)
if (class(dt11$SiO2Code)!="factor") dt11$SiO2Code<- as.factor(dt11$SiO2Code)
if (class(dt11$DONCode)!="factor") dt11$DONCode<- as.factor(dt11$DONCode)

# Convert Missing Values to NA for non-dates

dt11$Code <- ifelse((trimws(as.character(dt11$Code))==trimws("NA")),NA,dt11$Code)
suppressWarnings(dt11$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Code))==as.character(as.numeric("NA"))),NA,dt11$Code))
dt11$Sample_Time <- ifelse((trimws(as.character(dt11$Sample_Time))==trimws("NA")),NA,dt11$Sample_Time)
suppressWarnings(dt11$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Sample_Time))==as.character(as.numeric("NA"))),NA,dt11$Sample_Time))
dt11$Gage_Ht <- ifelse((trimws(as.character(dt11$Gage_Ht))==trimws("NA")),NA,dt11$Gage_Ht)
suppressWarnings(dt11$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt11$Gage_Ht))
dt11$Gage_Ht <- ifelse((trimws(as.character(dt11$Gage_Ht))==trimws("BLANK")),NA,dt11$Gage_Ht)
suppressWarnings(dt11$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt11$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt11$Gage_Ht))
dt11$Temp <- ifelse((trimws(as.character(dt11$Temp))==trimws("NA")),NA,dt11$Temp)
suppressWarnings(dt11$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Temp))==as.character(as.numeric("NA"))),NA,dt11$Temp))
dt11$pH <- ifelse((trimws(as.character(dt11$pH))==trimws("NA")),NA,dt11$pH)
suppressWarnings(dt11$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$pH))==as.character(as.numeric("NA"))),NA,dt11$pH))
dt11$Cond <- ifelse((trimws(as.character(dt11$Cond))==trimws("NA")),NA,dt11$Cond)
suppressWarnings(dt11$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Cond))==as.character(as.numeric("NA"))),NA,dt11$Cond))
dt11$Cl <- ifelse((trimws(as.character(dt11$Cl))==trimws("NA")),NA,dt11$Cl)
suppressWarnings(dt11$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Cl))==as.character(as.numeric("NA"))),NA,dt11$Cl))
dt11$SO4.hyphen.S <- ifelse((trimws(as.character(dt11$SO4.hyphen.S))==trimws("NA")),NA,dt11$SO4.hyphen.S)
suppressWarnings(dt11$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt11$SO4.hyphen.S))
dt11$Na <- ifelse((trimws(as.character(dt11$Na))==trimws("NA")),NA,dt11$Na)
suppressWarnings(dt11$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Na))==as.character(as.numeric("NA"))),NA,dt11$Na))
dt11$K <- ifelse((trimws(as.character(dt11$K))==trimws("NA")),NA,dt11$K)
suppressWarnings(dt11$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$K))==as.character(as.numeric("NA"))),NA,dt11$K))
dt11$Mg <- ifelse((trimws(as.character(dt11$Mg))==trimws("NA")),NA,dt11$Mg)
suppressWarnings(dt11$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Mg))==as.character(as.numeric("NA"))),NA,dt11$Mg))
dt11$Ca <- ifelse((trimws(as.character(dt11$Ca))==trimws("NA")),NA,dt11$Ca)
suppressWarnings(dt11$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Ca))==as.character(as.numeric("NA"))),NA,dt11$Ca))
dt11$NH4.hyphen.N <- ifelse((trimws(as.character(dt11$NH4.hyphen.N))==trimws("NA")),NA,dt11$NH4.hyphen.N)
suppressWarnings(dt11$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt11$NH4.hyphen.N))
dt11$PO4.hyphen.P <- ifelse((trimws(as.character(dt11$PO4.hyphen.P))==trimws("NA")),NA,dt11$PO4.hyphen.P)
suppressWarnings(dt11$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt11$PO4.hyphen.P))
dt11$DIC <- ifelse((trimws(as.character(dt11$DIC))==trimws("NA")),NA,dt11$DIC)
suppressWarnings(dt11$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$DIC))==as.character(as.numeric("NA"))),NA,dt11$DIC))
dt11$TDN <- ifelse((trimws(as.character(dt11$TDN))==trimws("NA")),NA,dt11$TDN)
suppressWarnings(dt11$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$TDN))==as.character(as.numeric("NA"))),NA,dt11$TDN))
dt11$TDP <- ifelse((trimws(as.character(dt11$TDP))==trimws("NA")),NA,dt11$TDP)
suppressWarnings(dt11$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$TDP))==as.character(as.numeric("NA"))),NA,dt11$TDP))
dt11$SiO2 <- ifelse((trimws(as.character(dt11$SiO2))==trimws("NA")),NA,dt11$SiO2)
suppressWarnings(dt11$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$SiO2))==as.character(as.numeric("NA"))),NA,dt11$SiO2))
dt11$DON <- ifelse((trimws(as.character(dt11$DON))==trimws("NA")),NA,dt11$DON)
suppressWarnings(dt11$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$DON))==as.character(as.numeric("NA"))),NA,dt11$DON))
dt11$TSS <- ifelse((trimws(as.character(dt11$TSS))==trimws("NA")),NA,dt11$TSS)
suppressWarnings(dt11$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$TSS))==as.character(as.numeric("NA"))),NA,dt11$TSS))


# Here is the structure of the input data frame:
str(dt11)
attach(dt11)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt11$Sample_ID))
summary(as.factor(dt11$ChlorideCode))
summary(as.factor(dt11$NitrateCode))
summary(as.factor(dt11$SulfateCode))
summary(as.factor(dt11$SodiumCode))
summary(as.factor(dt11$PotassiumCode))
summary(as.factor(dt11$MagnesiumCode))
summary(as.factor(dt11$CalciumCode))
summary(as.factor(dt11$NH4Code))
summary(as.factor(dt11$PO4Code))
summary(as.factor(dt11$DOCCode))
summary(as.factor(dt11$DICCode))
summary(as.factor(dt11$TDNCode))
summary(as.factor(dt11$SiO2Code))
summary(as.factor(dt11$DONCode))
detach(dt11)


inUrl12  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/2cb48616b931ea4e821648759e9808f0"
infile12 <- tempfile()
try(download.file(inUrl12,infile12,method="curl"))
if (is.na(file.size(infile12))) download.file(inUrl12,infile12,method="auto")


 dt12 <-read.csv(infile12,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile12)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt12$Sample_ID)!="factor") dt12$Sample_ID<- as.factor(dt12$Sample_ID)
if (class(dt12$Code)=="factor") dt12$Code <-as.numeric(levels(dt12$Code))[as.integer(dt12$Code) ]
if (class(dt12$Code)=="character") dt12$Code <-as.numeric(dt12$Code)
# attempting to convert dt12$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp12Sample_Date<-as.Date(dt12$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp12Sample_Date) == length(tmp12Sample_Date[!is.na(tmp12Sample_Date)])){dt12$Sample_Date <- tmp12Sample_Date } else {print("Date conversion failed for dt12$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp12Sample_Date)
if (class(dt12$Sample_Time)=="factor") dt12$Sample_Time <-as.numeric(levels(dt12$Sample_Time))[as.integer(dt12$Sample_Time) ]
if (class(dt12$Sample_Time)=="character") dt12$Sample_Time <-as.numeric(dt12$Sample_Time)
if (class(dt12$Gage_Ht)=="factor") dt12$Gage_Ht <-as.numeric(levels(dt12$Gage_Ht))[as.integer(dt12$Gage_Ht) ]
if (class(dt12$Gage_Ht)=="character") dt12$Gage_Ht <-as.numeric(dt12$Gage_Ht)
if (class(dt12$Temp)=="factor") dt12$Temp <-as.numeric(levels(dt12$Temp))[as.integer(dt12$Temp) ]
if (class(dt12$Temp)=="character") dt12$Temp <-as.numeric(dt12$Temp)
if (class(dt12$pH)=="factor") dt12$pH <-as.numeric(levels(dt12$pH))[as.integer(dt12$pH) ]
if (class(dt12$pH)=="character") dt12$pH <-as.numeric(dt12$pH)
if (class(dt12$Cond)=="factor") dt12$Cond <-as.numeric(levels(dt12$Cond))[as.integer(dt12$Cond) ]
if (class(dt12$Cond)=="character") dt12$Cond <-as.numeric(dt12$Cond)
if (class(dt12$Cl)=="factor") dt12$Cl <-as.numeric(levels(dt12$Cl))[as.integer(dt12$Cl) ]
if (class(dt12$Cl)=="character") dt12$Cl <-as.numeric(dt12$Cl)
if (class(dt12$NO3.hyphen.N)=="factor") dt12$NO3.hyphen.N <-as.numeric(levels(dt12$NO3.hyphen.N))[as.integer(dt12$NO3.hyphen.N) ]
if (class(dt12$NO3.hyphen.N)=="character") dt12$NO3.hyphen.N <-as.numeric(dt12$NO3.hyphen.N)
if (class(dt12$SO4.hyphen.S)=="factor") dt12$SO4.hyphen.S <-as.numeric(levels(dt12$SO4.hyphen.S))[as.integer(dt12$SO4.hyphen.S) ]
if (class(dt12$SO4.hyphen.S)=="character") dt12$SO4.hyphen.S <-as.numeric(dt12$SO4.hyphen.S)
if (class(dt12$Na)=="factor") dt12$Na <-as.numeric(levels(dt12$Na))[as.integer(dt12$Na) ]
if (class(dt12$Na)=="character") dt12$Na <-as.numeric(dt12$Na)
if (class(dt12$K)=="factor") dt12$K <-as.numeric(levels(dt12$K))[as.integer(dt12$K) ]
if (class(dt12$K)=="character") dt12$K <-as.numeric(dt12$K)
if (class(dt12$Mg)=="factor") dt12$Mg <-as.numeric(levels(dt12$Mg))[as.integer(dt12$Mg) ]
if (class(dt12$Mg)=="character") dt12$Mg <-as.numeric(dt12$Mg)
if (class(dt12$Ca)=="factor") dt12$Ca <-as.numeric(levels(dt12$Ca))[as.integer(dt12$Ca) ]
if (class(dt12$Ca)=="character") dt12$Ca <-as.numeric(dt12$Ca)
if (class(dt12$NH4.hyphen.N)=="factor") dt12$NH4.hyphen.N <-as.numeric(levels(dt12$NH4.hyphen.N))[as.integer(dt12$NH4.hyphen.N) ]
if (class(dt12$NH4.hyphen.N)=="character") dt12$NH4.hyphen.N <-as.numeric(dt12$NH4.hyphen.N)
if (class(dt12$PO4.hyphen.P)=="factor") dt12$PO4.hyphen.P <-as.numeric(levels(dt12$PO4.hyphen.P))[as.integer(dt12$PO4.hyphen.P) ]
if (class(dt12$PO4.hyphen.P)=="character") dt12$PO4.hyphen.P <-as.numeric(dt12$PO4.hyphen.P)
if (class(dt12$DOC)=="factor") dt12$DOC <-as.numeric(levels(dt12$DOC))[as.integer(dt12$DOC) ]
if (class(dt12$DOC)=="character") dt12$DOC <-as.numeric(dt12$DOC)
if (class(dt12$DIC)=="factor") dt12$DIC <-as.numeric(levels(dt12$DIC))[as.integer(dt12$DIC) ]
if (class(dt12$DIC)=="character") dt12$DIC <-as.numeric(dt12$DIC)
if (class(dt12$TDN)=="factor") dt12$TDN <-as.numeric(levels(dt12$TDN))[as.integer(dt12$TDN) ]
if (class(dt12$TDN)=="character") dt12$TDN <-as.numeric(dt12$TDN)
if (class(dt12$TDP)=="factor") dt12$TDP <-as.numeric(levels(dt12$TDP))[as.integer(dt12$TDP) ]
if (class(dt12$TDP)=="character") dt12$TDP <-as.numeric(dt12$TDP)
if (class(dt12$SiO2)=="factor") dt12$SiO2 <-as.numeric(levels(dt12$SiO2))[as.integer(dt12$SiO2) ]
if (class(dt12$SiO2)=="character") dt12$SiO2 <-as.numeric(dt12$SiO2)
if (class(dt12$DON)=="factor") dt12$DON <-as.numeric(levels(dt12$DON))[as.integer(dt12$DON) ]
if (class(dt12$DON)=="character") dt12$DON <-as.numeric(dt12$DON)
if (class(dt12$TSS)=="factor") dt12$TSS <-as.numeric(levels(dt12$TSS))[as.integer(dt12$TSS) ]
if (class(dt12$TSS)=="character") dt12$TSS <-as.numeric(dt12$TSS)
if (class(dt12$ChlorideCode)!="factor") dt12$ChlorideCode<- as.factor(dt12$ChlorideCode)
if (class(dt12$NitrateCode)!="factor") dt12$NitrateCode<- as.factor(dt12$NitrateCode)
if (class(dt12$SulfateCode)!="factor") dt12$SulfateCode<- as.factor(dt12$SulfateCode)
if (class(dt12$SodiumCode)!="factor") dt12$SodiumCode<- as.factor(dt12$SodiumCode)
if (class(dt12$PotassiumCode)!="factor") dt12$PotassiumCode<- as.factor(dt12$PotassiumCode)
if (class(dt12$MagnesiumCode)!="factor") dt12$MagnesiumCode<- as.factor(dt12$MagnesiumCode)
if (class(dt12$CalciumCode)!="factor") dt12$CalciumCode<- as.factor(dt12$CalciumCode)
if (class(dt12$NH4Code)!="factor") dt12$NH4Code<- as.factor(dt12$NH4Code)
if (class(dt12$PO4Code)!="factor") dt12$PO4Code<- as.factor(dt12$PO4Code)
if (class(dt12$DOCCode)!="factor") dt12$DOCCode<- as.factor(dt12$DOCCode)
if (class(dt12$DICCode)!="factor") dt12$DICCode<- as.factor(dt12$DICCode)
if (class(dt12$TDNCode)!="factor") dt12$TDNCode<- as.factor(dt12$TDNCode)
if (class(dt12$SiO2Code)!="factor") dt12$SiO2Code<- as.factor(dt12$SiO2Code)
if (class(dt12$DONCode)!="factor") dt12$DONCode<- as.factor(dt12$DONCode)

# Convert Missing Values to NA for non-dates

dt12$Code <- ifelse((trimws(as.character(dt12$Code))==trimws("NA")),NA,dt12$Code)
suppressWarnings(dt12$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Code))==as.character(as.numeric("NA"))),NA,dt12$Code))
dt12$Sample_Time <- ifelse((trimws(as.character(dt12$Sample_Time))==trimws("NA")),NA,dt12$Sample_Time)
suppressWarnings(dt12$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Sample_Time))==as.character(as.numeric("NA"))),NA,dt12$Sample_Time))
dt12$Gage_Ht <- ifelse((trimws(as.character(dt12$Gage_Ht))==trimws("NA")),NA,dt12$Gage_Ht)
suppressWarnings(dt12$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt12$Gage_Ht))
dt12$Gage_Ht <- ifelse((trimws(as.character(dt12$Gage_Ht))==trimws("BLANK")),NA,dt12$Gage_Ht)
suppressWarnings(dt12$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt12$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt12$Gage_Ht))
dt12$Temp <- ifelse((trimws(as.character(dt12$Temp))==trimws("NA")),NA,dt12$Temp)
suppressWarnings(dt12$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Temp))==as.character(as.numeric("NA"))),NA,dt12$Temp))
dt12$pH <- ifelse((trimws(as.character(dt12$pH))==trimws("NA")),NA,dt12$pH)
suppressWarnings(dt12$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$pH))==as.character(as.numeric("NA"))),NA,dt12$pH))
dt12$Cond <- ifelse((trimws(as.character(dt12$Cond))==trimws("NA")),NA,dt12$Cond)
suppressWarnings(dt12$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Cond))==as.character(as.numeric("NA"))),NA,dt12$Cond))
dt12$Cl <- ifelse((trimws(as.character(dt12$Cl))==trimws("NA")),NA,dt12$Cl)
suppressWarnings(dt12$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Cl))==as.character(as.numeric("NA"))),NA,dt12$Cl))
dt12$SO4.hyphen.S <- ifelse((trimws(as.character(dt12$SO4.hyphen.S))==trimws("NA")),NA,dt12$SO4.hyphen.S)
suppressWarnings(dt12$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt12$SO4.hyphen.S))
dt12$Na <- ifelse((trimws(as.character(dt12$Na))==trimws("NA")),NA,dt12$Na)
suppressWarnings(dt12$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Na))==as.character(as.numeric("NA"))),NA,dt12$Na))
dt12$K <- ifelse((trimws(as.character(dt12$K))==trimws("NA")),NA,dt12$K)
suppressWarnings(dt12$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$K))==as.character(as.numeric("NA"))),NA,dt12$K))
dt12$Mg <- ifelse((trimws(as.character(dt12$Mg))==trimws("NA")),NA,dt12$Mg)
suppressWarnings(dt12$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Mg))==as.character(as.numeric("NA"))),NA,dt12$Mg))
dt12$Ca <- ifelse((trimws(as.character(dt12$Ca))==trimws("NA")),NA,dt12$Ca)
suppressWarnings(dt12$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Ca))==as.character(as.numeric("NA"))),NA,dt12$Ca))
dt12$NH4.hyphen.N <- ifelse((trimws(as.character(dt12$NH4.hyphen.N))==trimws("NA")),NA,dt12$NH4.hyphen.N)
suppressWarnings(dt12$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt12$NH4.hyphen.N))
dt12$PO4.hyphen.P <- ifelse((trimws(as.character(dt12$PO4.hyphen.P))==trimws("NA")),NA,dt12$PO4.hyphen.P)
suppressWarnings(dt12$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt12$PO4.hyphen.P))
dt12$DIC <- ifelse((trimws(as.character(dt12$DIC))==trimws("NA")),NA,dt12$DIC)
suppressWarnings(dt12$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$DIC))==as.character(as.numeric("NA"))),NA,dt12$DIC))
dt12$TDN <- ifelse((trimws(as.character(dt12$TDN))==trimws("NA")),NA,dt12$TDN)
suppressWarnings(dt12$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$TDN))==as.character(as.numeric("NA"))),NA,dt12$TDN))
dt12$TDP <- ifelse((trimws(as.character(dt12$TDP))==trimws("NA")),NA,dt12$TDP)
suppressWarnings(dt12$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$TDP))==as.character(as.numeric("NA"))),NA,dt12$TDP))
dt12$SiO2 <- ifelse((trimws(as.character(dt12$SiO2))==trimws("NA")),NA,dt12$SiO2)
suppressWarnings(dt12$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$SiO2))==as.character(as.numeric("NA"))),NA,dt12$SiO2))
dt12$DON <- ifelse((trimws(as.character(dt12$DON))==trimws("NA")),NA,dt12$DON)
suppressWarnings(dt12$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$DON))==as.character(as.numeric("NA"))),NA,dt12$DON))
dt12$TSS <- ifelse((trimws(as.character(dt12$TSS))==trimws("NA")),NA,dt12$TSS)
suppressWarnings(dt12$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$TSS))==as.character(as.numeric("NA"))),NA,dt12$TSS))


# Here is the structure of the input data frame:
str(dt12)
attach(dt12)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt12$Sample_ID))
summary(as.factor(dt12$ChlorideCode))
summary(as.factor(dt12$NitrateCode))
summary(as.factor(dt12$SulfateCode))
summary(as.factor(dt12$SodiumCode))
summary(as.factor(dt12$PotassiumCode))
summary(as.factor(dt12$MagnesiumCode))
summary(as.factor(dt12$CalciumCode))
summary(as.factor(dt12$NH4Code))
summary(as.factor(dt12$PO4Code))
summary(as.factor(dt12$DOCCode))
summary(as.factor(dt12$DICCode))
summary(as.factor(dt12$TDNCode))
summary(as.factor(dt12$SiO2Code))
summary(as.factor(dt12$DONCode))
detach(dt12)


inUrl13  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/fe455bb2a31d2980b3fd26662251e64e"
infile13 <- tempfile()
try(download.file(inUrl13,infile13,method="curl"))
if (is.na(file.size(infile13))) download.file(inUrl13,infile13,method="auto")


 dt13 <-read.csv(infile13,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile13)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt13$Sample_ID)!="factor") dt13$Sample_ID<- as.factor(dt13$Sample_ID)
if (class(dt13$Code)=="factor") dt13$Code <-as.numeric(levels(dt13$Code))[as.integer(dt13$Code) ]
if (class(dt13$Code)=="character") dt13$Code <-as.numeric(dt13$Code)
# attempting to convert dt13$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp13Sample_Date<-as.Date(dt13$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp13Sample_Date) == length(tmp13Sample_Date[!is.na(tmp13Sample_Date)])){dt13$Sample_Date <- tmp13Sample_Date } else {print("Date conversion failed for dt13$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp13Sample_Date)
if (class(dt13$Sample_Time)=="factor") dt13$Sample_Time <-as.numeric(levels(dt13$Sample_Time))[as.integer(dt13$Sample_Time) ]
if (class(dt13$Sample_Time)=="character") dt13$Sample_Time <-as.numeric(dt13$Sample_Time)
if (class(dt13$Gage_Ht)=="factor") dt13$Gage_Ht <-as.numeric(levels(dt13$Gage_Ht))[as.integer(dt13$Gage_Ht) ]
if (class(dt13$Gage_Ht)=="character") dt13$Gage_Ht <-as.numeric(dt13$Gage_Ht)
if (class(dt13$Temp)=="factor") dt13$Temp <-as.numeric(levels(dt13$Temp))[as.integer(dt13$Temp) ]
if (class(dt13$Temp)=="character") dt13$Temp <-as.numeric(dt13$Temp)
if (class(dt13$pH)=="factor") dt13$pH <-as.numeric(levels(dt13$pH))[as.integer(dt13$pH) ]
if (class(dt13$pH)=="character") dt13$pH <-as.numeric(dt13$pH)
if (class(dt13$Cond)=="factor") dt13$Cond <-as.numeric(levels(dt13$Cond))[as.integer(dt13$Cond) ]
if (class(dt13$Cond)=="character") dt13$Cond <-as.numeric(dt13$Cond)
if (class(dt13$Cl)=="factor") dt13$Cl <-as.numeric(levels(dt13$Cl))[as.integer(dt13$Cl) ]
if (class(dt13$Cl)=="character") dt13$Cl <-as.numeric(dt13$Cl)
if (class(dt13$NO3.hyphen.N)=="factor") dt13$NO3.hyphen.N <-as.numeric(levels(dt13$NO3.hyphen.N))[as.integer(dt13$NO3.hyphen.N) ]
if (class(dt13$NO3.hyphen.N)=="character") dt13$NO3.hyphen.N <-as.numeric(dt13$NO3.hyphen.N)
if (class(dt13$SO4.hyphen.S)=="factor") dt13$SO4.hyphen.S <-as.numeric(levels(dt13$SO4.hyphen.S))[as.integer(dt13$SO4.hyphen.S) ]
if (class(dt13$SO4.hyphen.S)=="character") dt13$SO4.hyphen.S <-as.numeric(dt13$SO4.hyphen.S)
if (class(dt13$Na)=="factor") dt13$Na <-as.numeric(levels(dt13$Na))[as.integer(dt13$Na) ]
if (class(dt13$Na)=="character") dt13$Na <-as.numeric(dt13$Na)
if (class(dt13$K)=="factor") dt13$K <-as.numeric(levels(dt13$K))[as.integer(dt13$K) ]
if (class(dt13$K)=="character") dt13$K <-as.numeric(dt13$K)
if (class(dt13$Mg)=="factor") dt13$Mg <-as.numeric(levels(dt13$Mg))[as.integer(dt13$Mg) ]
if (class(dt13$Mg)=="character") dt13$Mg <-as.numeric(dt13$Mg)
if (class(dt13$Ca)=="factor") dt13$Ca <-as.numeric(levels(dt13$Ca))[as.integer(dt13$Ca) ]
if (class(dt13$Ca)=="character") dt13$Ca <-as.numeric(dt13$Ca)
if (class(dt13$NH4.hyphen.N)=="factor") dt13$NH4.hyphen.N <-as.numeric(levels(dt13$NH4.hyphen.N))[as.integer(dt13$NH4.hyphen.N) ]
if (class(dt13$NH4.hyphen.N)=="character") dt13$NH4.hyphen.N <-as.numeric(dt13$NH4.hyphen.N)
if (class(dt13$PO4.hyphen.P)=="factor") dt13$PO4.hyphen.P <-as.numeric(levels(dt13$PO4.hyphen.P))[as.integer(dt13$PO4.hyphen.P) ]
if (class(dt13$PO4.hyphen.P)=="character") dt13$PO4.hyphen.P <-as.numeric(dt13$PO4.hyphen.P)
if (class(dt13$DOC)=="factor") dt13$DOC <-as.numeric(levels(dt13$DOC))[as.integer(dt13$DOC) ]
if (class(dt13$DOC)=="character") dt13$DOC <-as.numeric(dt13$DOC)
if (class(dt13$DIC)=="factor") dt13$DIC <-as.numeric(levels(dt13$DIC))[as.integer(dt13$DIC) ]
if (class(dt13$DIC)=="character") dt13$DIC <-as.numeric(dt13$DIC)
if (class(dt13$TDN)=="factor") dt13$TDN <-as.numeric(levels(dt13$TDN))[as.integer(dt13$TDN) ]
if (class(dt13$TDN)=="character") dt13$TDN <-as.numeric(dt13$TDN)
if (class(dt13$TDP)=="factor") dt13$TDP <-as.numeric(levels(dt13$TDP))[as.integer(dt13$TDP) ]
if (class(dt13$TDP)=="character") dt13$TDP <-as.numeric(dt13$TDP)
if (class(dt13$SiO2)=="factor") dt13$SiO2 <-as.numeric(levels(dt13$SiO2))[as.integer(dt13$SiO2) ]
if (class(dt13$SiO2)=="character") dt13$SiO2 <-as.numeric(dt13$SiO2)
if (class(dt13$DON)=="factor") dt13$DON <-as.numeric(levels(dt13$DON))[as.integer(dt13$DON) ]
if (class(dt13$DON)=="character") dt13$DON <-as.numeric(dt13$DON)
if (class(dt13$TSS)=="factor") dt13$TSS <-as.numeric(levels(dt13$TSS))[as.integer(dt13$TSS) ]
if (class(dt13$TSS)=="character") dt13$TSS <-as.numeric(dt13$TSS)
if (class(dt13$ChlorideCode)!="factor") dt13$ChlorideCode<- as.factor(dt13$ChlorideCode)
if (class(dt13$NitrateCode)!="factor") dt13$NitrateCode<- as.factor(dt13$NitrateCode)
if (class(dt13$SulfateCode)!="factor") dt13$SulfateCode<- as.factor(dt13$SulfateCode)
if (class(dt13$SodiumCode)!="factor") dt13$SodiumCode<- as.factor(dt13$SodiumCode)
if (class(dt13$PotassiumCode)!="factor") dt13$PotassiumCode<- as.factor(dt13$PotassiumCode)
if (class(dt13$MagnesiumCode)!="factor") dt13$MagnesiumCode<- as.factor(dt13$MagnesiumCode)
if (class(dt13$CalciumCode)!="factor") dt13$CalciumCode<- as.factor(dt13$CalciumCode)
if (class(dt13$NH4Code)!="factor") dt13$NH4Code<- as.factor(dt13$NH4Code)
if (class(dt13$PO4Code)!="factor") dt13$PO4Code<- as.factor(dt13$PO4Code)
if (class(dt13$DOCCode)!="factor") dt13$DOCCode<- as.factor(dt13$DOCCode)
if (class(dt13$DICCode)!="factor") dt13$DICCode<- as.factor(dt13$DICCode)
if (class(dt13$TDNCode)!="factor") dt13$TDNCode<- as.factor(dt13$TDNCode)
if (class(dt13$SiO2Code)!="factor") dt13$SiO2Code<- as.factor(dt13$SiO2Code)
if (class(dt13$DONCode)!="factor") dt13$DONCode<- as.factor(dt13$DONCode)

# Convert Missing Values to NA for non-dates

dt13$Code <- ifelse((trimws(as.character(dt13$Code))==trimws("NA")),NA,dt13$Code)
suppressWarnings(dt13$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Code))==as.character(as.numeric("NA"))),NA,dt13$Code))
dt13$Sample_Time <- ifelse((trimws(as.character(dt13$Sample_Time))==trimws("NA")),NA,dt13$Sample_Time)
suppressWarnings(dt13$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Sample_Time))==as.character(as.numeric("NA"))),NA,dt13$Sample_Time))
dt13$Gage_Ht <- ifelse((trimws(as.character(dt13$Gage_Ht))==trimws("NA")),NA,dt13$Gage_Ht)
suppressWarnings(dt13$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt13$Gage_Ht))
dt13$Gage_Ht <- ifelse((trimws(as.character(dt13$Gage_Ht))==trimws("BLANK")),NA,dt13$Gage_Ht)
suppressWarnings(dt13$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt13$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt13$Gage_Ht))
dt13$Temp <- ifelse((trimws(as.character(dt13$Temp))==trimws("NA")),NA,dt13$Temp)
suppressWarnings(dt13$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Temp))==as.character(as.numeric("NA"))),NA,dt13$Temp))
dt13$pH <- ifelse((trimws(as.character(dt13$pH))==trimws("NA")),NA,dt13$pH)
suppressWarnings(dt13$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$pH))==as.character(as.numeric("NA"))),NA,dt13$pH))
dt13$Cond <- ifelse((trimws(as.character(dt13$Cond))==trimws("NA")),NA,dt13$Cond)
suppressWarnings(dt13$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Cond))==as.character(as.numeric("NA"))),NA,dt13$Cond))
dt13$Cl <- ifelse((trimws(as.character(dt13$Cl))==trimws("NA")),NA,dt13$Cl)
suppressWarnings(dt13$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Cl))==as.character(as.numeric("NA"))),NA,dt13$Cl))
dt13$SO4.hyphen.S <- ifelse((trimws(as.character(dt13$SO4.hyphen.S))==trimws("NA")),NA,dt13$SO4.hyphen.S)
suppressWarnings(dt13$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt13$SO4.hyphen.S))
dt13$Na <- ifelse((trimws(as.character(dt13$Na))==trimws("NA")),NA,dt13$Na)
suppressWarnings(dt13$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Na))==as.character(as.numeric("NA"))),NA,dt13$Na))
dt13$K <- ifelse((trimws(as.character(dt13$K))==trimws("NA")),NA,dt13$K)
suppressWarnings(dt13$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$K))==as.character(as.numeric("NA"))),NA,dt13$K))
dt13$Mg <- ifelse((trimws(as.character(dt13$Mg))==trimws("NA")),NA,dt13$Mg)
suppressWarnings(dt13$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Mg))==as.character(as.numeric("NA"))),NA,dt13$Mg))
dt13$Ca <- ifelse((trimws(as.character(dt13$Ca))==trimws("NA")),NA,dt13$Ca)
suppressWarnings(dt13$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Ca))==as.character(as.numeric("NA"))),NA,dt13$Ca))
dt13$NH4.hyphen.N <- ifelse((trimws(as.character(dt13$NH4.hyphen.N))==trimws("NA")),NA,dt13$NH4.hyphen.N)
suppressWarnings(dt13$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt13$NH4.hyphen.N))
dt13$PO4.hyphen.P <- ifelse((trimws(as.character(dt13$PO4.hyphen.P))==trimws("NA")),NA,dt13$PO4.hyphen.P)
suppressWarnings(dt13$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt13$PO4.hyphen.P))
dt13$DIC <- ifelse((trimws(as.character(dt13$DIC))==trimws("NA")),NA,dt13$DIC)
suppressWarnings(dt13$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$DIC))==as.character(as.numeric("NA"))),NA,dt13$DIC))
dt13$TDN <- ifelse((trimws(as.character(dt13$TDN))==trimws("NA")),NA,dt13$TDN)
suppressWarnings(dt13$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$TDN))==as.character(as.numeric("NA"))),NA,dt13$TDN))
dt13$TDP <- ifelse((trimws(as.character(dt13$TDP))==trimws("NA")),NA,dt13$TDP)
suppressWarnings(dt13$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$TDP))==as.character(as.numeric("NA"))),NA,dt13$TDP))
dt13$SiO2 <- ifelse((trimws(as.character(dt13$SiO2))==trimws("NA")),NA,dt13$SiO2)
suppressWarnings(dt13$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$SiO2))==as.character(as.numeric("NA"))),NA,dt13$SiO2))
dt13$DON <- ifelse((trimws(as.character(dt13$DON))==trimws("NA")),NA,dt13$DON)
suppressWarnings(dt13$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$DON))==as.character(as.numeric("NA"))),NA,dt13$DON))
dt13$TSS <- ifelse((trimws(as.character(dt13$TSS))==trimws("NA")),NA,dt13$TSS)
suppressWarnings(dt13$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$TSS))==as.character(as.numeric("NA"))),NA,dt13$TSS))


# Here is the structure of the input data frame:
str(dt13)
attach(dt13)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt13$Sample_ID))
summary(as.factor(dt13$ChlorideCode))
summary(as.factor(dt13$NitrateCode))
summary(as.factor(dt13$SulfateCode))
summary(as.factor(dt13$SodiumCode))
summary(as.factor(dt13$PotassiumCode))
summary(as.factor(dt13$MagnesiumCode))
summary(as.factor(dt13$CalciumCode))
summary(as.factor(dt13$NH4Code))
summary(as.factor(dt13$PO4Code))
summary(as.factor(dt13$DOCCode))
summary(as.factor(dt13$DICCode))
summary(as.factor(dt13$TDNCode))
summary(as.factor(dt13$SiO2Code))
summary(as.factor(dt13$DONCode))
detach(dt13)


inUrl14  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/acb18d969cf36e7efda2604a1449e816"
infile14 <- tempfile()
try(download.file(inUrl14,infile14,method="curl"))
if (is.na(file.size(infile14))) download.file(inUrl14,infile14,method="auto")


 dt14 <-read.csv(infile14,header=F
          ,skip=5
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile14)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt14$Sample_ID)!="factor") dt14$Sample_ID<- as.factor(dt14$Sample_ID)
if (class(dt14$Code)=="factor") dt14$Code <-as.numeric(levels(dt14$Code))[as.integer(dt14$Code) ]
if (class(dt14$Code)=="character") dt14$Code <-as.numeric(dt14$Code)
# attempting to convert dt14$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp14Sample_Date<-as.Date(dt14$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp14Sample_Date) == length(tmp14Sample_Date[!is.na(tmp14Sample_Date)])){dt14$Sample_Date <- tmp14Sample_Date } else {print("Date conversion failed for dt14$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp14Sample_Date)
if (class(dt14$Sample_Time)=="factor") dt14$Sample_Time <-as.numeric(levels(dt14$Sample_Time))[as.integer(dt14$Sample_Time) ]
if (class(dt14$Sample_Time)=="character") dt14$Sample_Time <-as.numeric(dt14$Sample_Time)
if (class(dt14$Gage_Ht)=="factor") dt14$Gage_Ht <-as.numeric(levels(dt14$Gage_Ht))[as.integer(dt14$Gage_Ht) ]
if (class(dt14$Gage_Ht)=="character") dt14$Gage_Ht <-as.numeric(dt14$Gage_Ht)
if (class(dt14$Temp)=="factor") dt14$Temp <-as.numeric(levels(dt14$Temp))[as.integer(dt14$Temp) ]
if (class(dt14$Temp)=="character") dt14$Temp <-as.numeric(dt14$Temp)
if (class(dt14$pH)=="factor") dt14$pH <-as.numeric(levels(dt14$pH))[as.integer(dt14$pH) ]
if (class(dt14$pH)=="character") dt14$pH <-as.numeric(dt14$pH)
if (class(dt14$Cond)=="factor") dt14$Cond <-as.numeric(levels(dt14$Cond))[as.integer(dt14$Cond) ]
if (class(dt14$Cond)=="character") dt14$Cond <-as.numeric(dt14$Cond)
if (class(dt14$Cl)=="factor") dt14$Cl <-as.numeric(levels(dt14$Cl))[as.integer(dt14$Cl) ]
if (class(dt14$Cl)=="character") dt14$Cl <-as.numeric(dt14$Cl)
if (class(dt14$NO3.hyphen.N)=="factor") dt14$NO3.hyphen.N <-as.numeric(levels(dt14$NO3.hyphen.N))[as.integer(dt14$NO3.hyphen.N) ]
if (class(dt14$NO3.hyphen.N)=="character") dt14$NO3.hyphen.N <-as.numeric(dt14$NO3.hyphen.N)
if (class(dt14$SO4.hyphen.S)=="factor") dt14$SO4.hyphen.S <-as.numeric(levels(dt14$SO4.hyphen.S))[as.integer(dt14$SO4.hyphen.S) ]
if (class(dt14$SO4.hyphen.S)=="character") dt14$SO4.hyphen.S <-as.numeric(dt14$SO4.hyphen.S)
if (class(dt14$Na)=="factor") dt14$Na <-as.numeric(levels(dt14$Na))[as.integer(dt14$Na) ]
if (class(dt14$Na)=="character") dt14$Na <-as.numeric(dt14$Na)
if (class(dt14$K)=="factor") dt14$K <-as.numeric(levels(dt14$K))[as.integer(dt14$K) ]
if (class(dt14$K)=="character") dt14$K <-as.numeric(dt14$K)
if (class(dt14$Mg)=="factor") dt14$Mg <-as.numeric(levels(dt14$Mg))[as.integer(dt14$Mg) ]
if (class(dt14$Mg)=="character") dt14$Mg <-as.numeric(dt14$Mg)
if (class(dt14$Ca)=="factor") dt14$Ca <-as.numeric(levels(dt14$Ca))[as.integer(dt14$Ca) ]
if (class(dt14$Ca)=="character") dt14$Ca <-as.numeric(dt14$Ca)
if (class(dt14$NH4.hyphen.N)=="factor") dt14$NH4.hyphen.N <-as.numeric(levels(dt14$NH4.hyphen.N))[as.integer(dt14$NH4.hyphen.N) ]
if (class(dt14$NH4.hyphen.N)=="character") dt14$NH4.hyphen.N <-as.numeric(dt14$NH4.hyphen.N)
if (class(dt14$PO4.hyphen.P)=="factor") dt14$PO4.hyphen.P <-as.numeric(levels(dt14$PO4.hyphen.P))[as.integer(dt14$PO4.hyphen.P) ]
if (class(dt14$PO4.hyphen.P)=="character") dt14$PO4.hyphen.P <-as.numeric(dt14$PO4.hyphen.P)
if (class(dt14$DOC)=="factor") dt14$DOC <-as.numeric(levels(dt14$DOC))[as.integer(dt14$DOC) ]
if (class(dt14$DOC)=="character") dt14$DOC <-as.numeric(dt14$DOC)
if (class(dt14$DIC)=="factor") dt14$DIC <-as.numeric(levels(dt14$DIC))[as.integer(dt14$DIC) ]
if (class(dt14$DIC)=="character") dt14$DIC <-as.numeric(dt14$DIC)
if (class(dt14$TDN)=="factor") dt14$TDN <-as.numeric(levels(dt14$TDN))[as.integer(dt14$TDN) ]
if (class(dt14$TDN)=="character") dt14$TDN <-as.numeric(dt14$TDN)
if (class(dt14$TDP)=="factor") dt14$TDP <-as.numeric(levels(dt14$TDP))[as.integer(dt14$TDP) ]
if (class(dt14$TDP)=="character") dt14$TDP <-as.numeric(dt14$TDP)
if (class(dt14$SiO2)=="factor") dt14$SiO2 <-as.numeric(levels(dt14$SiO2))[as.integer(dt14$SiO2) ]
if (class(dt14$SiO2)=="character") dt14$SiO2 <-as.numeric(dt14$SiO2)
if (class(dt14$DON)=="factor") dt14$DON <-as.numeric(levels(dt14$DON))[as.integer(dt14$DON) ]
if (class(dt14$DON)=="character") dt14$DON <-as.numeric(dt14$DON)
if (class(dt14$TSS)=="factor") dt14$TSS <-as.numeric(levels(dt14$TSS))[as.integer(dt14$TSS) ]
if (class(dt14$TSS)=="character") dt14$TSS <-as.numeric(dt14$TSS)
if (class(dt14$ChlorideCode)!="factor") dt14$ChlorideCode<- as.factor(dt14$ChlorideCode)
if (class(dt14$NitrateCode)!="factor") dt14$NitrateCode<- as.factor(dt14$NitrateCode)
if (class(dt14$SulfateCode)!="factor") dt14$SulfateCode<- as.factor(dt14$SulfateCode)
if (class(dt14$SodiumCode)!="factor") dt14$SodiumCode<- as.factor(dt14$SodiumCode)
if (class(dt14$PotassiumCode)!="factor") dt14$PotassiumCode<- as.factor(dt14$PotassiumCode)
if (class(dt14$MagnesiumCode)!="factor") dt14$MagnesiumCode<- as.factor(dt14$MagnesiumCode)
if (class(dt14$CalciumCode)!="factor") dt14$CalciumCode<- as.factor(dt14$CalciumCode)
if (class(dt14$NH4Code)!="factor") dt14$NH4Code<- as.factor(dt14$NH4Code)
if (class(dt14$PO4Code)!="factor") dt14$PO4Code<- as.factor(dt14$PO4Code)
if (class(dt14$DOCCode)!="factor") dt14$DOCCode<- as.factor(dt14$DOCCode)
if (class(dt14$DICCode)!="factor") dt14$DICCode<- as.factor(dt14$DICCode)
if (class(dt14$TDNCode)!="factor") dt14$TDNCode<- as.factor(dt14$TDNCode)
if (class(dt14$SiO2Code)!="factor") dt14$SiO2Code<- as.factor(dt14$SiO2Code)
if (class(dt14$DONCode)!="factor") dt14$DONCode<- as.factor(dt14$DONCode)

# Convert Missing Values to NA for non-dates

dt14$Code <- ifelse((trimws(as.character(dt14$Code))==trimws("NA")),NA,dt14$Code)
suppressWarnings(dt14$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Code))==as.character(as.numeric("NA"))),NA,dt14$Code))
dt14$Sample_Time <- ifelse((trimws(as.character(dt14$Sample_Time))==trimws("NA")),NA,dt14$Sample_Time)
suppressWarnings(dt14$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Sample_Time))==as.character(as.numeric("NA"))),NA,dt14$Sample_Time))
dt14$Gage_Ht <- ifelse((trimws(as.character(dt14$Gage_Ht))==trimws("NA")),NA,dt14$Gage_Ht)
suppressWarnings(dt14$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt14$Gage_Ht))
dt14$Gage_Ht <- ifelse((trimws(as.character(dt14$Gage_Ht))==trimws("BLANK")),NA,dt14$Gage_Ht)
suppressWarnings(dt14$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt14$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt14$Gage_Ht))
dt14$Temp <- ifelse((trimws(as.character(dt14$Temp))==trimws("NA")),NA,dt14$Temp)
suppressWarnings(dt14$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Temp))==as.character(as.numeric("NA"))),NA,dt14$Temp))
dt14$pH <- ifelse((trimws(as.character(dt14$pH))==trimws("NA")),NA,dt14$pH)
suppressWarnings(dt14$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$pH))==as.character(as.numeric("NA"))),NA,dt14$pH))
dt14$Cond <- ifelse((trimws(as.character(dt14$Cond))==trimws("NA")),NA,dt14$Cond)
suppressWarnings(dt14$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Cond))==as.character(as.numeric("NA"))),NA,dt14$Cond))
dt14$Cl <- ifelse((trimws(as.character(dt14$Cl))==trimws("NA")),NA,dt14$Cl)
suppressWarnings(dt14$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Cl))==as.character(as.numeric("NA"))),NA,dt14$Cl))
dt14$SO4.hyphen.S <- ifelse((trimws(as.character(dt14$SO4.hyphen.S))==trimws("NA")),NA,dt14$SO4.hyphen.S)
suppressWarnings(dt14$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt14$SO4.hyphen.S))
dt14$Na <- ifelse((trimws(as.character(dt14$Na))==trimws("NA")),NA,dt14$Na)
suppressWarnings(dt14$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Na))==as.character(as.numeric("NA"))),NA,dt14$Na))
dt14$K <- ifelse((trimws(as.character(dt14$K))==trimws("NA")),NA,dt14$K)
suppressWarnings(dt14$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$K))==as.character(as.numeric("NA"))),NA,dt14$K))
dt14$Mg <- ifelse((trimws(as.character(dt14$Mg))==trimws("NA")),NA,dt14$Mg)
suppressWarnings(dt14$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Mg))==as.character(as.numeric("NA"))),NA,dt14$Mg))
dt14$Ca <- ifelse((trimws(as.character(dt14$Ca))==trimws("NA")),NA,dt14$Ca)
suppressWarnings(dt14$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Ca))==as.character(as.numeric("NA"))),NA,dt14$Ca))
dt14$NH4.hyphen.N <- ifelse((trimws(as.character(dt14$NH4.hyphen.N))==trimws("NA")),NA,dt14$NH4.hyphen.N)
suppressWarnings(dt14$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt14$NH4.hyphen.N))
dt14$PO4.hyphen.P <- ifelse((trimws(as.character(dt14$PO4.hyphen.P))==trimws("NA")),NA,dt14$PO4.hyphen.P)
suppressWarnings(dt14$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt14$PO4.hyphen.P))
dt14$DIC <- ifelse((trimws(as.character(dt14$DIC))==trimws("NA")),NA,dt14$DIC)
suppressWarnings(dt14$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$DIC))==as.character(as.numeric("NA"))),NA,dt14$DIC))
dt14$TDN <- ifelse((trimws(as.character(dt14$TDN))==trimws("NA")),NA,dt14$TDN)
suppressWarnings(dt14$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$TDN))==as.character(as.numeric("NA"))),NA,dt14$TDN))
dt14$TDP <- ifelse((trimws(as.character(dt14$TDP))==trimws("NA")),NA,dt14$TDP)
suppressWarnings(dt14$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$TDP))==as.character(as.numeric("NA"))),NA,dt14$TDP))
dt14$SiO2 <- ifelse((trimws(as.character(dt14$SiO2))==trimws("NA")),NA,dt14$SiO2)
suppressWarnings(dt14$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$SiO2))==as.character(as.numeric("NA"))),NA,dt14$SiO2))
dt14$DON <- ifelse((trimws(as.character(dt14$DON))==trimws("NA")),NA,dt14$DON)
suppressWarnings(dt14$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$DON))==as.character(as.numeric("NA"))),NA,dt14$DON))
dt14$TSS <- ifelse((trimws(as.character(dt14$TSS))==trimws("NA")),NA,dt14$TSS)
suppressWarnings(dt14$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$TSS))==as.character(as.numeric("NA"))),NA,dt14$TSS))


# Here is the structure of the input data frame:
str(dt14)
attach(dt14)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt14$Sample_ID))
summary(as.factor(dt14$ChlorideCode))
summary(as.factor(dt14$NitrateCode))
summary(as.factor(dt14$SulfateCode))
summary(as.factor(dt14$SodiumCode))
summary(as.factor(dt14$PotassiumCode))
summary(as.factor(dt14$MagnesiumCode))
summary(as.factor(dt14$CalciumCode))
summary(as.factor(dt14$NH4Code))
summary(as.factor(dt14$PO4Code))
summary(as.factor(dt14$DOCCode))
summary(as.factor(dt14$DICCode))
summary(as.factor(dt14$TDNCode))
summary(as.factor(dt14$SiO2Code))
summary(as.factor(dt14$DONCode))
detach(dt14)


inUrl15  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/19a68f6d25354f80bb0dfb6eff28bdbf"
infile15 <- tempfile()
try(download.file(inUrl15,infile15,method="curl"))
if (is.na(file.size(infile15))) download.file(inUrl15,infile15,method="auto")


 dt15 <-read.csv(infile15,header=F
          ,skip=5
            ,sep=","
        , col.names=c(
                    "Sample_ID",
                    "Code",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
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
                    "DON",
                    "TSS",
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
                    "SiO2Code",
                    "DONCode"    ), check.names=TRUE)

unlink(infile15)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt15$Sample_ID)!="factor") dt15$Sample_ID<- as.factor(dt15$Sample_ID)
if (class(dt15$Code)=="factor") dt15$Code <-as.numeric(levels(dt15$Code))[as.integer(dt15$Code) ]
if (class(dt15$Code)=="character") dt15$Code <-as.numeric(dt15$Code)
# attempting to convert dt15$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp15Sample_Date<-as.Date(dt15$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp15Sample_Date) == length(tmp15Sample_Date[!is.na(tmp15Sample_Date)])){dt15$Sample_Date <- tmp15Sample_Date } else {print("Date conversion failed for dt15$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp15Sample_Date)
if (class(dt15$Sample_Time)=="factor") dt15$Sample_Time <-as.numeric(levels(dt15$Sample_Time))[as.integer(dt15$Sample_Time) ]
if (class(dt15$Sample_Time)=="character") dt15$Sample_Time <-as.numeric(dt15$Sample_Time)
if (class(dt15$Gage_Ht)=="factor") dt15$Gage_Ht <-as.numeric(levels(dt15$Gage_Ht))[as.integer(dt15$Gage_Ht) ]
if (class(dt15$Gage_Ht)=="character") dt15$Gage_Ht <-as.numeric(dt15$Gage_Ht)
if (class(dt15$Temp)=="factor") dt15$Temp <-as.numeric(levels(dt15$Temp))[as.integer(dt15$Temp) ]
if (class(dt15$Temp)=="character") dt15$Temp <-as.numeric(dt15$Temp)
if (class(dt15$pH)=="factor") dt15$pH <-as.numeric(levels(dt15$pH))[as.integer(dt15$pH) ]
if (class(dt15$pH)=="character") dt15$pH <-as.numeric(dt15$pH)
if (class(dt15$Cond)=="factor") dt15$Cond <-as.numeric(levels(dt15$Cond))[as.integer(dt15$Cond) ]
if (class(dt15$Cond)=="character") dt15$Cond <-as.numeric(dt15$Cond)
if (class(dt15$Cl)=="factor") dt15$Cl <-as.numeric(levels(dt15$Cl))[as.integer(dt15$Cl) ]
if (class(dt15$Cl)=="character") dt15$Cl <-as.numeric(dt15$Cl)
if (class(dt15$NO3.hyphen.N)=="factor") dt15$NO3.hyphen.N <-as.numeric(levels(dt15$NO3.hyphen.N))[as.integer(dt15$NO3.hyphen.N) ]
if (class(dt15$NO3.hyphen.N)=="character") dt15$NO3.hyphen.N <-as.numeric(dt15$NO3.hyphen.N)
if (class(dt15$SO4.hyphen.S)=="factor") dt15$SO4.hyphen.S <-as.numeric(levels(dt15$SO4.hyphen.S))[as.integer(dt15$SO4.hyphen.S) ]
if (class(dt15$SO4.hyphen.S)=="character") dt15$SO4.hyphen.S <-as.numeric(dt15$SO4.hyphen.S)
if (class(dt15$Na)=="factor") dt15$Na <-as.numeric(levels(dt15$Na))[as.integer(dt15$Na) ]
if (class(dt15$Na)=="character") dt15$Na <-as.numeric(dt15$Na)
if (class(dt15$K)=="factor") dt15$K <-as.numeric(levels(dt15$K))[as.integer(dt15$K) ]
if (class(dt15$K)=="character") dt15$K <-as.numeric(dt15$K)
if (class(dt15$Mg)=="factor") dt15$Mg <-as.numeric(levels(dt15$Mg))[as.integer(dt15$Mg) ]
if (class(dt15$Mg)=="character") dt15$Mg <-as.numeric(dt15$Mg)
if (class(dt15$Ca)=="factor") dt15$Ca <-as.numeric(levels(dt15$Ca))[as.integer(dt15$Ca) ]
if (class(dt15$Ca)=="character") dt15$Ca <-as.numeric(dt15$Ca)
if (class(dt15$NH4.hyphen.N)=="factor") dt15$NH4.hyphen.N <-as.numeric(levels(dt15$NH4.hyphen.N))[as.integer(dt15$NH4.hyphen.N) ]
if (class(dt15$NH4.hyphen.N)=="character") dt15$NH4.hyphen.N <-as.numeric(dt15$NH4.hyphen.N)
if (class(dt15$PO4.hyphen.P)=="factor") dt15$PO4.hyphen.P <-as.numeric(levels(dt15$PO4.hyphen.P))[as.integer(dt15$PO4.hyphen.P) ]
if (class(dt15$PO4.hyphen.P)=="character") dt15$PO4.hyphen.P <-as.numeric(dt15$PO4.hyphen.P)
if (class(dt15$DOC)=="factor") dt15$DOC <-as.numeric(levels(dt15$DOC))[as.integer(dt15$DOC) ]
if (class(dt15$DOC)=="character") dt15$DOC <-as.numeric(dt15$DOC)
if (class(dt15$DIC)=="factor") dt15$DIC <-as.numeric(levels(dt15$DIC))[as.integer(dt15$DIC) ]
if (class(dt15$DIC)=="character") dt15$DIC <-as.numeric(dt15$DIC)
if (class(dt15$TDN)=="factor") dt15$TDN <-as.numeric(levels(dt15$TDN))[as.integer(dt15$TDN) ]
if (class(dt15$TDN)=="character") dt15$TDN <-as.numeric(dt15$TDN)
if (class(dt15$TDP)=="factor") dt15$TDP <-as.numeric(levels(dt15$TDP))[as.integer(dt15$TDP) ]
if (class(dt15$TDP)=="character") dt15$TDP <-as.numeric(dt15$TDP)
if (class(dt15$SiO2)=="factor") dt15$SiO2 <-as.numeric(levels(dt15$SiO2))[as.integer(dt15$SiO2) ]
if (class(dt15$SiO2)=="character") dt15$SiO2 <-as.numeric(dt15$SiO2)
if (class(dt15$DON)=="factor") dt15$DON <-as.numeric(levels(dt15$DON))[as.integer(dt15$DON) ]
if (class(dt15$DON)=="character") dt15$DON <-as.numeric(dt15$DON)
if (class(dt15$TSS)=="factor") dt15$TSS <-as.numeric(levels(dt15$TSS))[as.integer(dt15$TSS) ]
if (class(dt15$TSS)=="character") dt15$TSS <-as.numeric(dt15$TSS)
if (class(dt15$ChlorideCode)!="factor") dt15$ChlorideCode<- as.factor(dt15$ChlorideCode)
if (class(dt15$NitrateCode)!="factor") dt15$NitrateCode<- as.factor(dt15$NitrateCode)
if (class(dt15$SulfateCode)!="factor") dt15$SulfateCode<- as.factor(dt15$SulfateCode)
if (class(dt15$SodiumCode)!="factor") dt15$SodiumCode<- as.factor(dt15$SodiumCode)
if (class(dt15$PotassiumCode)!="factor") dt15$PotassiumCode<- as.factor(dt15$PotassiumCode)
if (class(dt15$MagnesiumCode)!="factor") dt15$MagnesiumCode<- as.factor(dt15$MagnesiumCode)
if (class(dt15$CalciumCode)!="factor") dt15$CalciumCode<- as.factor(dt15$CalciumCode)
if (class(dt15$NH4Code)!="factor") dt15$NH4Code<- as.factor(dt15$NH4Code)
if (class(dt15$PO4Code)!="factor") dt15$PO4Code<- as.factor(dt15$PO4Code)
if (class(dt15$DOCCode)!="factor") dt15$DOCCode<- as.factor(dt15$DOCCode)
if (class(dt15$DICCode)!="factor") dt15$DICCode<- as.factor(dt15$DICCode)
if (class(dt15$TDNCode)!="factor") dt15$TDNCode<- as.factor(dt15$TDNCode)
if (class(dt15$SiO2Code)!="factor") dt15$SiO2Code<- as.factor(dt15$SiO2Code)
if (class(dt15$DONCode)!="factor") dt15$DONCode<- as.factor(dt15$DONCode)

# Convert Missing Values to NA for non-dates

dt15$Code <- ifelse((trimws(as.character(dt15$Code))==trimws("NA")),NA,dt15$Code)
suppressWarnings(dt15$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Code))==as.character(as.numeric("NA"))),NA,dt15$Code))
dt15$Sample_Time <- ifelse((trimws(as.character(dt15$Sample_Time))==trimws("NA")),NA,dt15$Sample_Time)
suppressWarnings(dt15$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Sample_Time))==as.character(as.numeric("NA"))),NA,dt15$Sample_Time))
dt15$Gage_Ht <- ifelse((trimws(as.character(dt15$Gage_Ht))==trimws("NA")),NA,dt15$Gage_Ht)
suppressWarnings(dt15$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt15$Gage_Ht))
dt15$Gage_Ht <- ifelse((trimws(as.character(dt15$Gage_Ht))==trimws("BLANK")),NA,dt15$Gage_Ht)
suppressWarnings(dt15$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt15$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt15$Gage_Ht))
dt15$Temp <- ifelse((trimws(as.character(dt15$Temp))==trimws("NA")),NA,dt15$Temp)
suppressWarnings(dt15$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Temp))==as.character(as.numeric("NA"))),NA,dt15$Temp))
dt15$pH <- ifelse((trimws(as.character(dt15$pH))==trimws("NA")),NA,dt15$pH)
suppressWarnings(dt15$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$pH))==as.character(as.numeric("NA"))),NA,dt15$pH))
dt15$Cond <- ifelse((trimws(as.character(dt15$Cond))==trimws("NA")),NA,dt15$Cond)
suppressWarnings(dt15$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Cond))==as.character(as.numeric("NA"))),NA,dt15$Cond))
dt15$Cl <- ifelse((trimws(as.character(dt15$Cl))==trimws("NA")),NA,dt15$Cl)
suppressWarnings(dt15$Cl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Cl))==as.character(as.numeric("NA"))),NA,dt15$Cl))
dt15$SO4.hyphen.S <- ifelse((trimws(as.character(dt15$SO4.hyphen.S))==trimws("NA")),NA,dt15$SO4.hyphen.S)
suppressWarnings(dt15$SO4.hyphen.S <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$SO4.hyphen.S))==as.character(as.numeric("NA"))),NA,dt15$SO4.hyphen.S))
dt15$Na <- ifelse((trimws(as.character(dt15$Na))==trimws("NA")),NA,dt15$Na)
suppressWarnings(dt15$Na <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Na))==as.character(as.numeric("NA"))),NA,dt15$Na))
dt15$K <- ifelse((trimws(as.character(dt15$K))==trimws("NA")),NA,dt15$K)
suppressWarnings(dt15$K <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$K))==as.character(as.numeric("NA"))),NA,dt15$K))
dt15$Mg <- ifelse((trimws(as.character(dt15$Mg))==trimws("NA")),NA,dt15$Mg)
suppressWarnings(dt15$Mg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Mg))==as.character(as.numeric("NA"))),NA,dt15$Mg))
dt15$Ca <- ifelse((trimws(as.character(dt15$Ca))==trimws("NA")),NA,dt15$Ca)
suppressWarnings(dt15$Ca <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Ca))==as.character(as.numeric("NA"))),NA,dt15$Ca))
dt15$NH4.hyphen.N <- ifelse((trimws(as.character(dt15$NH4.hyphen.N))==trimws("NA")),NA,dt15$NH4.hyphen.N)
suppressWarnings(dt15$NH4.hyphen.N <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$NH4.hyphen.N))==as.character(as.numeric("NA"))),NA,dt15$NH4.hyphen.N))
dt15$PO4.hyphen.P <- ifelse((trimws(as.character(dt15$PO4.hyphen.P))==trimws("NA")),NA,dt15$PO4.hyphen.P)
suppressWarnings(dt15$PO4.hyphen.P <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$PO4.hyphen.P))==as.character(as.numeric("NA"))),NA,dt15$PO4.hyphen.P))
dt15$DIC <- ifelse((trimws(as.character(dt15$DIC))==trimws("NA")),NA,dt15$DIC)
suppressWarnings(dt15$DIC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$DIC))==as.character(as.numeric("NA"))),NA,dt15$DIC))
dt15$TDN <- ifelse((trimws(as.character(dt15$TDN))==trimws("NA")),NA,dt15$TDN)
suppressWarnings(dt15$TDN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$TDN))==as.character(as.numeric("NA"))),NA,dt15$TDN))
dt15$TDP <- ifelse((trimws(as.character(dt15$TDP))==trimws("NA")),NA,dt15$TDP)
suppressWarnings(dt15$TDP <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$TDP))==as.character(as.numeric("NA"))),NA,dt15$TDP))
dt15$SiO2 <- ifelse((trimws(as.character(dt15$SiO2))==trimws("NA")),NA,dt15$SiO2)
suppressWarnings(dt15$SiO2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$SiO2))==as.character(as.numeric("NA"))),NA,dt15$SiO2))
dt15$DON <- ifelse((trimws(as.character(dt15$DON))==trimws("NA")),NA,dt15$DON)
suppressWarnings(dt15$DON <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$DON))==as.character(as.numeric("NA"))),NA,dt15$DON))
dt15$TSS <- ifelse((trimws(as.character(dt15$TSS))==trimws("NA")),NA,dt15$TSS)
suppressWarnings(dt15$TSS <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$TSS))==as.character(as.numeric("NA"))),NA,dt15$TSS))


# Here is the structure of the input data frame:
str(dt15)
attach(dt15)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Sample_ID)
summary(Code)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
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
summary(DON)
summary(TSS)
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
summary(DONCode)
                # Get more details on character variables

summary(as.factor(dt15$Sample_ID))
summary(as.factor(dt15$ChlorideCode))
summary(as.factor(dt15$NitrateCode))
summary(as.factor(dt15$SulfateCode))
summary(as.factor(dt15$SodiumCode))
summary(as.factor(dt15$PotassiumCode))
summary(as.factor(dt15$MagnesiumCode))
summary(as.factor(dt15$CalciumCode))
summary(as.factor(dt15$NH4Code))
summary(as.factor(dt15$PO4Code))
summary(as.factor(dt15$DOCCode))
summary(as.factor(dt15$DICCode))
summary(as.factor(dt15$TDNCode))
summary(as.factor(dt15$SiO2Code))
summary(as.factor(dt15$DONCode))
detach(dt15)


inUrl16  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923061/ef01a691d7915bb3a8d6b0b69dc2b4ba"
infile16 <- tempfile()
try(download.file(inUrl16,infile16,method="curl"))
if (is.na(file.size(infile16))) download.file(inUrl16,infile16,method="auto")


 dt16 <-read.csv(infile16,header=F
          ,skip=1
            ,sep=","
        , col.names=c(
                    "Code",
                    "Sample_ID",
                    "Sample_Date",
                    "Sample_Time",
                    "Gage_Ht",
                    "Temp",
                    "pH",
                    "Cond",
                    "Comments.at.the.field"    ), check.names=TRUE)

unlink(infile16)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt16$Code)=="factor") dt16$Code <-as.numeric(levels(dt16$Code))[as.integer(dt16$Code) ]
if (class(dt16$Code)=="character") dt16$Code <-as.numeric(dt16$Code)
if (class(dt16$Sample_ID)!="factor") dt16$Sample_ID<- as.factor(dt16$Sample_ID)
# attempting to convert dt16$Sample_Date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp16Sample_Date<-as.Date(dt16$Sample_Date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp16Sample_Date) == length(tmp16Sample_Date[!is.na(tmp16Sample_Date)])){dt16$Sample_Date <- tmp16Sample_Date } else {print("Date conversion failed for dt16$Sample_Date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp16Sample_Date)
if (class(dt16$Sample_Time)=="factor") dt16$Sample_Time <-as.numeric(levels(dt16$Sample_Time))[as.integer(dt16$Sample_Time) ]
if (class(dt16$Sample_Time)=="character") dt16$Sample_Time <-as.numeric(dt16$Sample_Time)
if (class(dt16$Gage_Ht)=="factor") dt16$Gage_Ht <-as.numeric(levels(dt16$Gage_Ht))[as.integer(dt16$Gage_Ht) ]
if (class(dt16$Gage_Ht)=="character") dt16$Gage_Ht <-as.numeric(dt16$Gage_Ht)
if (class(dt16$Temp)=="factor") dt16$Temp <-as.numeric(levels(dt16$Temp))[as.integer(dt16$Temp) ]
if (class(dt16$Temp)=="character") dt16$Temp <-as.numeric(dt16$Temp)
if (class(dt16$pH)=="factor") dt16$pH <-as.numeric(levels(dt16$pH))[as.integer(dt16$pH) ]
if (class(dt16$pH)=="character") dt16$pH <-as.numeric(dt16$pH)
if (class(dt16$Cond)=="factor") dt16$Cond <-as.numeric(levels(dt16$Cond))[as.integer(dt16$Cond) ]
if (class(dt16$Cond)=="character") dt16$Cond <-as.numeric(dt16$Cond)
if (class(dt16$Comments.at.the.field)!="factor") dt16$Comments.at.the.field<- as.factor(dt16$Comments.at.the.field)

# Convert Missing Values to NA for non-dates

dt16$Code <- ifelse((trimws(as.character(dt16$Code))==trimws("NA")),NA,dt16$Code)
suppressWarnings(dt16$Code <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$Code))==as.character(as.numeric("NA"))),NA,dt16$Code))
dt16$Sample_Time <- ifelse((trimws(as.character(dt16$Sample_Time))==trimws("NA")),NA,dt16$Sample_Time)
suppressWarnings(dt16$Sample_Time <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$Sample_Time))==as.character(as.numeric("NA"))),NA,dt16$Sample_Time))
dt16$Gage_Ht <- ifelse((trimws(as.character(dt16$Gage_Ht))==trimws("NA")),NA,dt16$Gage_Ht)
suppressWarnings(dt16$Gage_Ht <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$Gage_Ht))==as.character(as.numeric("NA"))),NA,dt16$Gage_Ht))
dt16$Gage_Ht <- ifelse((trimws(as.character(dt16$Gage_Ht))==trimws("BLANK")),NA,dt16$Gage_Ht)
suppressWarnings(dt16$Gage_Ht <- ifelse(!is.na(as.numeric("BLANK")) & (trimws(as.character(dt16$Gage_Ht))==as.character(as.numeric("BLANK"))),NA,dt16$Gage_Ht))
dt16$Temp <- ifelse((trimws(as.character(dt16$Temp))==trimws("NA")),NA,dt16$Temp)
suppressWarnings(dt16$Temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$Temp))==as.character(as.numeric("NA"))),NA,dt16$Temp))
dt16$pH <- ifelse((trimws(as.character(dt16$pH))==trimws("NA")),NA,dt16$pH)
suppressWarnings(dt16$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$pH))==as.character(as.numeric("NA"))),NA,dt16$pH))
dt16$Cond <- ifelse((trimws(as.character(dt16$Cond))==trimws("NA")),NA,dt16$Cond)
suppressWarnings(dt16$Cond <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$Cond))==as.character(as.numeric("NA"))),NA,dt16$Cond))


# Here is the structure of the input data frame:
str(dt16)
attach(dt16)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Code)
summary(Sample_ID)
summary(Sample_Date)
summary(Sample_Time)
summary(Gage_Ht)
summary(Temp)
summary(pH)
summary(Cond)
summary(Comments.at.the.field)
                # Get more details on character variables

summary(as.factor(dt16$Sample_ID))
summary(as.factor(dt16$Comments.at.the.field))
detach(dt16)





