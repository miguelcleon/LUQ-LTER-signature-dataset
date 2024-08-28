# Package ID: knb-lter-luq.20.4923061 Cataloging System:https://pasta.edirepository.org.
# Data set title: Chemistry of stream water from the Luquillo Mountains.
# Data set creator:  William H. McDowell -
# Data set creator:    - International Institute of Tropical Forestry(IITF), USDA Forest Service.
# Contact:  William H. McDowell -    - Bill.McDowell@unh.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/b22fd5ed1c470cf6d433d88856b4aaa5"
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

infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/96e0ef7b3f2bc92485a559645d545845")
infile2 <-sub("^https","http",infile2)
# This creates a tibble named: dt2
	dt2 <-read_delim(infile2
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt2$Turbidity <- ifelse((trimws(as.character(dt2$Turbidity))==trimws("NA")),NA,dt2$Turbidity)
suppressWarnings(dt2$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Turbidity))==as.character(as.numeric("NA"))),NA,dt2$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt2)
# Here is the structure of the input data tibble:
glimpse(dt2)
# And some statistical summaries of the data
summary(dt2)
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
infile3 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/8d1e2d357a2dc2d56b9eedea56a46236")
infile3 <-sub("^https","http",infile3)
# This creates a tibble named: dt3
	dt3 <-read_delim(infile3
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt3$Turbidity <- ifelse((trimws(as.character(dt3$Turbidity))==trimws("NA")),NA,dt3$Turbidity)
suppressWarnings(dt3$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Turbidity))==as.character(as.numeric("NA"))),NA,dt3$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt3)
# Here is the structure of the input data tibble:
glimpse(dt3)
# And some statistical summaries of the data
summary(dt3)
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
infile4 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/665f37efee3109a7c3aff95e079e2de2")
infile4 <-sub("^https","http",infile4)
# This creates a tibble named: dt4
	dt4 <-read_delim(infile4
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt4$Turbidity <- ifelse((trimws(as.character(dt4$Turbidity))==trimws("NA")),NA,dt4$Turbidity)
suppressWarnings(dt4$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Turbidity))==as.character(as.numeric("NA"))),NA,dt4$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt4)
# Here is the structure of the input data tibble:
glimpse(dt4)
# And some statistical summaries of the data
summary(dt4)
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
infile5 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/50e936c844f695818a9616534f2dfccd")
infile5 <-sub("^https","http",infile5)
# This creates a tibble named: dt5
	dt5 <-read_delim(infile5
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt5$Turbidity <- ifelse((trimws(as.character(dt5$Turbidity))==trimws("NA")),NA,dt5$Turbidity)
suppressWarnings(dt5$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$Turbidity))==as.character(as.numeric("NA"))),NA,dt5$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt5)
# Here is the structure of the input data tibble:
glimpse(dt5)
# And some statistical summaries of the data
summary(dt5)
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
infile6 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/7635c4ba775bd23f134e46b2129d7c07")
infile6 <-sub("^https","http",infile6)
# This creates a tibble named: dt6
	dt6 <-read_delim(infile6
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt6$Turbidity <- ifelse((trimws(as.character(dt6$Turbidity))==trimws("NA")),NA,dt6$Turbidity)
suppressWarnings(dt6$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Turbidity))==as.character(as.numeric("NA"))),NA,dt6$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt6)
# Here is the structure of the input data tibble:
glimpse(dt6)
# And some statistical summaries of the data
summary(dt6)
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
infile7 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/266905bbeebf3bb59caeee45222eec18")
infile7 <-sub("^https","http",infile7)
# This creates a tibble named: dt7
	dt7 <-read_delim(infile7
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt7$Turbidity <- ifelse((trimws(as.character(dt7$Turbidity))==trimws("NA")),NA,dt7$Turbidity)
suppressWarnings(dt7$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$Turbidity))==as.character(as.numeric("NA"))),NA,dt7$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt7)
# Here is the structure of the input data tibble:
glimpse(dt7)
# And some statistical summaries of the data
summary(dt7)
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
infile8 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/317744e66a9ab8f48105d1436e3abfd2")
infile8 <-sub("^https","http",infile8)
# This creates a tibble named: dt8
	dt8 <-read_delim(infile8
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt8$Turbidity <- ifelse((trimws(as.character(dt8$Turbidity))==trimws("NA")),NA,dt8$Turbidity)
suppressWarnings(dt8$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Turbidity))==as.character(as.numeric("NA"))),NA,dt8$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt8)
# Here is the structure of the input data tibble:
glimpse(dt8)
# And some statistical summaries of the data
summary(dt8)
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
infile9 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/a05bda0a0af888cc037ff5dd00dafd7e")
infile9 <-sub("^https","http",infile9)
# This creates a tibble named: dt9
	dt9 <-read_delim(infile9
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt9$Turbidity <- ifelse((trimws(as.character(dt9$Turbidity))==trimws("NA")),NA,dt9$Turbidity)
suppressWarnings(dt9$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$Turbidity))==as.character(as.numeric("NA"))),NA,dt9$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt9)
# Here is the structure of the input data tibble:
glimpse(dt9)
# And some statistical summaries of the data
summary(dt9)
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
infile10 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/1838a2fd958fc3b1dea9a8bbb1ce4e3b")
infile10 <-sub("^https","http",infile10)
# This creates a tibble named: dt10
	dt10 <-read_delim(infile10
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt10$Turbidity <- ifelse((trimws(as.character(dt10$Turbidity))==trimws("NA")),NA,dt10$Turbidity)
suppressWarnings(dt10$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Turbidity))==as.character(as.numeric("NA"))),NA,dt10$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt10)
# Here is the structure of the input data tibble:
glimpse(dt10)
# And some statistical summaries of the data
summary(dt10)
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
infile11 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/461b4cf812ba692383dff2401a234bdc")
infile11 <-sub("^https","http",infile11)
# This creates a tibble named: dt11
	dt11 <-read_delim(infile11
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt11$Turbidity <- ifelse((trimws(as.character(dt11$Turbidity))==trimws("NA")),NA,dt11$Turbidity)
suppressWarnings(dt11$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$Turbidity))==as.character(as.numeric("NA"))),NA,dt11$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt11)
# Here is the structure of the input data tibble:
glimpse(dt11)
# And some statistical summaries of the data
summary(dt11)
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
infile12 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/2cb48616b931ea4e821648759e9808f0")
infile12 <-sub("^https","http",infile12)
# This creates a tibble named: dt12
	dt12 <-read_delim(infile12
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt12$Turbidity <- ifelse((trimws(as.character(dt12$Turbidity))==trimws("NA")),NA,dt12$Turbidity)
suppressWarnings(dt12$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$Turbidity))==as.character(as.numeric("NA"))),NA,dt12$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt12)
# Here is the structure of the input data tibble:
glimpse(dt12)
# And some statistical summaries of the data
summary(dt12)
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
infile13 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/fe455bb2a31d2980b3fd26662251e64e")
infile13 <-sub("^https","http",infile13)
# This creates a tibble named: dt13
	dt13 <-read_delim(infile13
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt13$Turbidity <- ifelse((trimws(as.character(dt13$Turbidity))==trimws("NA")),NA,dt13$Turbidity)
suppressWarnings(dt13$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$Turbidity))==as.character(as.numeric("NA"))),NA,dt13$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt13)
# Here is the structure of the input data tibble:
glimpse(dt13)
# And some statistical summaries of the data
summary(dt13)
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
infile14 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/acb18d969cf36e7efda2604a1449e816")
infile14 <-sub("^https","http",infile14)
# This creates a tibble named: dt14
	dt14 <-read_delim(infile14
                ,delim=","
                ,skip=5
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt14$Turbidity <- ifelse((trimws(as.character(dt14$Turbidity))==trimws("NA")),NA,dt14$Turbidity)
suppressWarnings(dt14$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$Turbidity))==as.character(as.numeric("NA"))),NA,dt14$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt14)
# Here is the structure of the input data tibble:
glimpse(dt14)
# And some statistical summaries of the data
summary(dt14)
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
infile15 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/19a68f6d25354f80bb0dfb6eff28bdbf")
infile15 <-sub("^https","http",infile15)
# This creates a tibble named: dt15
	dt15 <-read_delim(infile15
                ,delim=","
                ,skip=5
                    ,quote='"'
                    , col_names=c(
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
                        "DONCode",
                        "Turbidity"   ),
                    col_types=list(
                        col_character(),
                        col_number() ,
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt15$Turbidity <- ifelse((trimws(as.character(dt15$Turbidity))==trimws("NA")),NA,dt15$Turbidity)
suppressWarnings(dt15$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$Turbidity))==as.character(as.numeric("NA"))),NA,dt15$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt15)
# Here is the structure of the input data tibble:
glimpse(dt15)
# And some statistical summaries of the data
summary(dt15)
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
infile16 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/20/4923064/ef01a691d7915bb3a8d6b0b69dc2b4ba")
infile16 <-sub("^https","http",infile16)
# This creates a tibble named: dt16
	dt16 <-read_delim(infile16
                ,delim=","
                ,skip=1
                    ,quote='"'
                    , col_names=c(
                        "Code",
                        "Sample_ID",
                        "Sample_Date",
                        "Sample_Time",
                        "Gage_Ht",
                        "Temp",
                        "pH",
                        "Cond",
                        "Comments.at.the.field",
                        "Turbidity"   ),
                    col_types=list(
                        col_number() ,
                        col_character(),
                        col_date("%Y-%m-%d"),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character(),
                        col_number() ),
                        na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors
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
dt16$Turbidity <- ifelse((trimws(as.character(dt16$Turbidity))==trimws("NA")),NA,dt16$Turbidity)
suppressWarnings(dt16$Turbidity <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$Turbidity))==as.character(as.numeric("NA"))),NA,dt16$Turbidity))


# Observed issues when reading the data. An empty list is good!
problems(dt16)
# Here is the structure of the input data tibble:
glimpse(dt16)
# And some statistical summaries of the data
summary(dt16)
# Get more details on character variables

summary(as.factor(dt16$Sample_ID))
summary(as.factor(dt16$Comments.at.the.field))









