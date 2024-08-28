#LFDP birds 

# Package ID: knb-lter-luq.23.4630182 Cataloging System:https://pasta.edirepository.org.
# Data set title: Bird abundance - point counts.
# Data set creator:  Robert Waide -  
# Contact:  Robert Waide -    - rbwaide@unm.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/23/4630183/afeb6253a54eca9e546d88822b5fa111"
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "JULIAN",     
                 "DATE",     
                 "PLACE",     
                 "WEATHER",     
                 "PLOT1",     
                 "PLOT2",     
                 "WIND",     
                 "RAIN",     
                 "TIME",     
                 "AMRED",     
                 "BFGRQ",     
                 "BHEUP",     
                 "BLAWA",     
                 "BQUIT",     
                 "BTBLW",     
                 "BTGNW",     
                 "BWINH",     
                 "BWVIR",     
                 "BWWAR",     
                 "CAREL",     
                 "GKNGB",     
                 "GNHER",     
                 "GRMAN",     
                 "KENWA",     
                 "LAPEW",     
                 "MAGWA",     
                 "NOWAT",     
                 "ORIOL",     
                 "PARUW",     
                 "PETER",     
                 "PLPIG",     
                 "PRAIW",     
                 "PRBUL",     
                 "PRCUC",     
                 "PREME",     
                 "PRFLY",     
                 "PRTAN",     
                 "PRTOD",     
                 "PRWPR",     
                 "RLTSH",     
                 "RQDOV",     
                 "RTHAW",     
                 "SBANI",     
                 "SCOWL",     
                 "SHTAN",     
                 "SNPIG",     
                 "UNKNO",     
                 "UNWAR",     
                 "WATTH",     
                 "WEVIR",     
                 "WWDOV",     
                 "YFGRQ",     
                 "TOTAL"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$YEAR)!="factor") dt1$YEAR<- as.factor(dt1$YEAR)
if (class(dt1$JULIAN)!="factor") dt1$JULIAN<- as.factor(dt1$JULIAN)
if (class(dt1$DATE)=="factor") dt1$DATE <-as.numeric(levels(dt1$DATE))[as.integer(dt1$DATE) ]               
if (class(dt1$DATE)=="character") dt1$DATE <-as.numeric(dt1$DATE)
if (class(dt1$PLACE)!="factor") dt1$PLACE<- as.factor(dt1$PLACE)
if (class(dt1$WEATHER)!="factor") dt1$WEATHER<- as.factor(dt1$WEATHER)
if (class(dt1$PLOT1)!="factor") dt1$PLOT1<- as.factor(dt1$PLOT1)
if (class(dt1$PLOT2)!="factor") dt1$PLOT2<- as.factor(dt1$PLOT2)
if (class(dt1$WIND)!="factor") dt1$WIND<- as.factor(dt1$WIND)
if (class(dt1$RAIN)!="factor") dt1$RAIN<- as.factor(dt1$RAIN)
if (class(dt1$AMRED)=="factor") dt1$AMRED <-as.numeric(levels(dt1$AMRED))[as.integer(dt1$AMRED) ]               
if (class(dt1$AMRED)=="character") dt1$AMRED <-as.numeric(dt1$AMRED)
if (class(dt1$BFGRQ)=="factor") dt1$BFGRQ <-as.numeric(levels(dt1$BFGRQ))[as.integer(dt1$BFGRQ) ]               
if (class(dt1$BFGRQ)=="character") dt1$BFGRQ <-as.numeric(dt1$BFGRQ)
if (class(dt1$BHEUP)=="factor") dt1$BHEUP <-as.numeric(levels(dt1$BHEUP))[as.integer(dt1$BHEUP) ]               
if (class(dt1$BHEUP)=="character") dt1$BHEUP <-as.numeric(dt1$BHEUP)
if (class(dt1$BLAWA)=="factor") dt1$BLAWA <-as.numeric(levels(dt1$BLAWA))[as.integer(dt1$BLAWA) ]               
if (class(dt1$BLAWA)=="character") dt1$BLAWA <-as.numeric(dt1$BLAWA)
if (class(dt1$BQUIT)=="factor") dt1$BQUIT <-as.numeric(levels(dt1$BQUIT))[as.integer(dt1$BQUIT) ]               
if (class(dt1$BQUIT)=="character") dt1$BQUIT <-as.numeric(dt1$BQUIT)
if (class(dt1$BTBLW)=="factor") dt1$BTBLW <-as.numeric(levels(dt1$BTBLW))[as.integer(dt1$BTBLW) ]               
if (class(dt1$BTBLW)=="character") dt1$BTBLW <-as.numeric(dt1$BTBLW)
if (class(dt1$BTGNW)=="factor") dt1$BTGNW <-as.numeric(levels(dt1$BTGNW))[as.integer(dt1$BTGNW) ]               
if (class(dt1$BTGNW)=="character") dt1$BTGNW <-as.numeric(dt1$BTGNW)
if (class(dt1$BWINH)=="factor") dt1$BWINH <-as.numeric(levels(dt1$BWINH))[as.integer(dt1$BWINH) ]               
if (class(dt1$BWINH)=="character") dt1$BWINH <-as.numeric(dt1$BWINH)
if (class(dt1$BWVIR)=="factor") dt1$BWVIR <-as.numeric(levels(dt1$BWVIR))[as.integer(dt1$BWVIR) ]               
if (class(dt1$BWVIR)=="character") dt1$BWVIR <-as.numeric(dt1$BWVIR)
if (class(dt1$BWWAR)=="factor") dt1$BWWAR <-as.numeric(levels(dt1$BWWAR))[as.integer(dt1$BWWAR) ]               
if (class(dt1$BWWAR)=="character") dt1$BWWAR <-as.numeric(dt1$BWWAR)
if (class(dt1$CAREL)=="factor") dt1$CAREL <-as.numeric(levels(dt1$CAREL))[as.integer(dt1$CAREL) ]               
if (class(dt1$CAREL)=="character") dt1$CAREL <-as.numeric(dt1$CAREL)
if (class(dt1$GKNGB)=="factor") dt1$GKNGB <-as.numeric(levels(dt1$GKNGB))[as.integer(dt1$GKNGB) ]               
if (class(dt1$GKNGB)=="character") dt1$GKNGB <-as.numeric(dt1$GKNGB)
if (class(dt1$GNHER)=="factor") dt1$GNHER <-as.numeric(levels(dt1$GNHER))[as.integer(dt1$GNHER) ]               
if (class(dt1$GNHER)=="character") dt1$GNHER <-as.numeric(dt1$GNHER)
if (class(dt1$GRMAN)=="factor") dt1$GRMAN <-as.numeric(levels(dt1$GRMAN))[as.integer(dt1$GRMAN) ]               
if (class(dt1$GRMAN)=="character") dt1$GRMAN <-as.numeric(dt1$GRMAN)
if (class(dt1$KENWA)=="factor") dt1$KENWA <-as.numeric(levels(dt1$KENWA))[as.integer(dt1$KENWA) ]               
if (class(dt1$KENWA)=="character") dt1$KENWA <-as.numeric(dt1$KENWA)
if (class(dt1$LAPEW)!="factor") dt1$LAPEW<- as.factor(dt1$LAPEW)
if (class(dt1$MAGWA)=="factor") dt1$MAGWA <-as.numeric(levels(dt1$MAGWA))[as.integer(dt1$MAGWA) ]               
if (class(dt1$MAGWA)=="character") dt1$MAGWA <-as.numeric(dt1$MAGWA)
if (class(dt1$NOWAT)=="factor") dt1$NOWAT <-as.numeric(levels(dt1$NOWAT))[as.integer(dt1$NOWAT) ]               
if (class(dt1$NOWAT)=="character") dt1$NOWAT <-as.numeric(dt1$NOWAT)
if (class(dt1$ORIOL)=="factor") dt1$ORIOL <-as.numeric(levels(dt1$ORIOL))[as.integer(dt1$ORIOL) ]               
if (class(dt1$ORIOL)=="character") dt1$ORIOL <-as.numeric(dt1$ORIOL)
if (class(dt1$PARUW)=="factor") dt1$PARUW <-as.numeric(levels(dt1$PARUW))[as.integer(dt1$PARUW) ]               
if (class(dt1$PARUW)=="character") dt1$PARUW <-as.numeric(dt1$PARUW)
if (class(dt1$PETER)=="factor") dt1$PETER <-as.numeric(levels(dt1$PETER))[as.integer(dt1$PETER) ]               
if (class(dt1$PETER)=="character") dt1$PETER <-as.numeric(dt1$PETER)
if (class(dt1$PLPIG)!="factor") dt1$PLPIG<- as.factor(dt1$PLPIG)
if (class(dt1$PRAIW)=="factor") dt1$PRAIW <-as.numeric(levels(dt1$PRAIW))[as.integer(dt1$PRAIW) ]               
if (class(dt1$PRAIW)=="character") dt1$PRAIW <-as.numeric(dt1$PRAIW)
if (class(dt1$PRBUL)=="factor") dt1$PRBUL <-as.numeric(levels(dt1$PRBUL))[as.integer(dt1$PRBUL) ]               
if (class(dt1$PRBUL)=="character") dt1$PRBUL <-as.numeric(dt1$PRBUL)
if (class(dt1$PRCUC)=="factor") dt1$PRCUC <-as.numeric(levels(dt1$PRCUC))[as.integer(dt1$PRCUC) ]               
if (class(dt1$PRCUC)=="character") dt1$PRCUC <-as.numeric(dt1$PRCUC)
if (class(dt1$PREME)=="factor") dt1$PREME <-as.numeric(levels(dt1$PREME))[as.integer(dt1$PREME) ]               
if (class(dt1$PREME)=="character") dt1$PREME <-as.numeric(dt1$PREME)
if (class(dt1$PRFLY)=="factor") dt1$PRFLY <-as.numeric(levels(dt1$PRFLY))[as.integer(dt1$PRFLY) ]               
if (class(dt1$PRFLY)=="character") dt1$PRFLY <-as.numeric(dt1$PRFLY)
if (class(dt1$PRTAN)=="factor") dt1$PRTAN <-as.numeric(levels(dt1$PRTAN))[as.integer(dt1$PRTAN) ]               
if (class(dt1$PRTAN)=="character") dt1$PRTAN <-as.numeric(dt1$PRTAN)
if (class(dt1$PRTOD)=="factor") dt1$PRTOD <-as.numeric(levels(dt1$PRTOD))[as.integer(dt1$PRTOD) ]               
if (class(dt1$PRTOD)=="character") dt1$PRTOD <-as.numeric(dt1$PRTOD)
if (class(dt1$PRWPR)=="factor") dt1$PRWPR <-as.numeric(levels(dt1$PRWPR))[as.integer(dt1$PRWPR) ]               
if (class(dt1$PRWPR)=="character") dt1$PRWPR <-as.numeric(dt1$PRWPR)
if (class(dt1$RLTSH)=="factor") dt1$RLTSH <-as.numeric(levels(dt1$RLTSH))[as.integer(dt1$RLTSH) ]               
if (class(dt1$RLTSH)=="character") dt1$RLTSH <-as.numeric(dt1$RLTSH)
if (class(dt1$RQDOV)=="factor") dt1$RQDOV <-as.numeric(levels(dt1$RQDOV))[as.integer(dt1$RQDOV) ]               
if (class(dt1$RQDOV)=="character") dt1$RQDOV <-as.numeric(dt1$RQDOV)
if (class(dt1$RTHAW)=="factor") dt1$RTHAW <-as.numeric(levels(dt1$RTHAW))[as.integer(dt1$RTHAW) ]               
if (class(dt1$RTHAW)=="character") dt1$RTHAW <-as.numeric(dt1$RTHAW)
if (class(dt1$SBANI)!="factor") dt1$SBANI<- as.factor(dt1$SBANI)
if (class(dt1$SCOWL)!="factor") dt1$SCOWL<- as.factor(dt1$SCOWL)
if (class(dt1$SHTAN)=="factor") dt1$SHTAN <-as.numeric(levels(dt1$SHTAN))[as.integer(dt1$SHTAN) ]               
if (class(dt1$SHTAN)=="character") dt1$SHTAN <-as.numeric(dt1$SHTAN)
if (class(dt1$SNPIG)=="factor") dt1$SNPIG <-as.numeric(levels(dt1$SNPIG))[as.integer(dt1$SNPIG) ]               
if (class(dt1$SNPIG)=="character") dt1$SNPIG <-as.numeric(dt1$SNPIG)
if (class(dt1$UNKNO)=="factor") dt1$UNKNO <-as.numeric(levels(dt1$UNKNO))[as.integer(dt1$UNKNO) ]               
if (class(dt1$UNKNO)=="character") dt1$UNKNO <-as.numeric(dt1$UNKNO)
if (class(dt1$UNWAR)=="factor") dt1$UNWAR <-as.numeric(levels(dt1$UNWAR))[as.integer(dt1$UNWAR) ]               
if (class(dt1$UNWAR)=="character") dt1$UNWAR <-as.numeric(dt1$UNWAR)
if (class(dt1$WATTH)=="factor") dt1$WATTH <-as.numeric(levels(dt1$WATTH))[as.integer(dt1$WATTH) ]               
if (class(dt1$WATTH)=="character") dt1$WATTH <-as.numeric(dt1$WATTH)
if (class(dt1$WEVIR)=="factor") dt1$WEVIR <-as.numeric(levels(dt1$WEVIR))[as.integer(dt1$WEVIR) ]               
if (class(dt1$WEVIR)=="character") dt1$WEVIR <-as.numeric(dt1$WEVIR)
if (class(dt1$WWDOV)=="factor") dt1$WWDOV <-as.numeric(levels(dt1$WWDOV))[as.integer(dt1$WWDOV) ]               
if (class(dt1$WWDOV)=="character") dt1$WWDOV <-as.numeric(dt1$WWDOV)
if (class(dt1$YFGRQ)!="factor") dt1$YFGRQ<- as.factor(dt1$YFGRQ)
if (class(dt1$TOTAL)=="factor") dt1$TOTAL <-as.numeric(levels(dt1$TOTAL))[as.integer(dt1$TOTAL) ]               
if (class(dt1$TOTAL)=="character") dt1$TOTAL <-as.numeric(dt1$TOTAL)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(JULIAN)
summary(DATE)
summary(PLACE)
summary(WEATHER)
summary(PLOT1)
summary(PLOT2)
summary(WIND)
summary(RAIN)
summary(TIME)
summary(AMRED)
summary(BFGRQ)
summary(BHEUP)
summary(BLAWA)
summary(BQUIT)
summary(BTBLW)
summary(BTGNW)
summary(BWINH)
summary(BWVIR)
summary(BWWAR)
summary(CAREL)
summary(GKNGB)
summary(GNHER)
summary(GRMAN)
summary(KENWA)
summary(LAPEW)
summary(MAGWA)
summary(NOWAT)
summary(ORIOL)
summary(PARUW)
summary(PETER)
summary(PLPIG)
summary(PRAIW)
summary(PRBUL)
summary(PRCUC)
summary(PREME)
summary(PRFLY)
summary(PRTAN)
summary(PRTOD)
summary(PRWPR)
summary(RLTSH)
summary(RQDOV)
summary(RTHAW)
summary(SBANI)
summary(SCOWL)
summary(SHTAN)
summary(SNPIG)
summary(UNKNO)
summary(UNWAR)
summary(WATTH)
summary(WEVIR)
summary(WWDOV)
summary(YFGRQ)
summary(TOTAL) 
# Get more details on character variables

summary(as.factor(dt1$YEAR)) 
summary(as.factor(dt1$JULIAN)) 
summary(as.factor(dt1$PLACE)) 
summary(as.factor(dt1$WEATHER)) 
summary(as.factor(dt1$PLOT1)) 
summary(as.factor(dt1$PLOT2)) 
summary(as.factor(dt1$WIND)) 
summary(as.factor(dt1$RAIN)) 
summary(as.factor(dt1$LAPEW)) 
summary(as.factor(dt1$PLPIG)) 
summary(as.factor(dt1$SBANI)) 
summary(as.factor(dt1$SCOWL)) 
summary(as.factor(dt1$YFGRQ))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/23/4630183/65f697ff7e862f0a2aef92c82598db41"
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "JULIAN",     
                 "DATE",     
                 "PLACE",     
                 "WEATHER",     
                 "PLOT1",     
                 "PLOT2",     
                 "WIND",     
                 "RAIN",     
                 "TIME",     
                 "AMRED",     
                 "BFGRQ",     
                 "BHEUP",     
                 "BLAWA",     
                 "BQUIT",     
                 "BTBLW",     
                 "BTGNW",     
                 "BWINH",     
                 "BWVIR",     
                 "BWWAR",     
                 "CAREL",     
                 "GKNGB",     
                 "GNHER",     
                 "GRMAN",     
                 "KENWA",     
                 "LAPEW",     
                 "MAGWA",     
                 "NOWAT",     
                 "ORIOL",     
                 "PARUW",     
                 "PETER",     
                 "PLPIG",     
                 "PRAIW",     
                 "PRBUL",     
                 "PRCUC",     
                 "PREME",     
                 "PRFLY",     
                 "PRTAN",     
                 "PRTOD",     
                 "PRWPR",     
                 "RLTSH",     
                 "RQDOV",     
                 "RTHAW",     
                 "SBANI",     
                 "SCOWL",     
                 "SHTAN",     
                 "SNPIG",     
                 "UNKNO",     
                 "UNWAR",     
                 "WATTH",     
                 "WEVIR",     
                 "WWDOV",     
                 "YFGRQ",     
                 "TOTAL"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$YEAR)!="factor") dt2$YEAR<- as.factor(dt2$YEAR)
if (class(dt2$JULIAN)!="factor") dt2$JULIAN<- as.factor(dt2$JULIAN)
if (class(dt2$DATE)=="factor") dt2$DATE <-as.numeric(levels(dt2$DATE))[as.integer(dt2$DATE) ]               
if (class(dt2$DATE)=="character") dt2$DATE <-as.numeric(dt2$DATE)
if (class(dt2$PLACE)!="factor") dt2$PLACE<- as.factor(dt2$PLACE)
if (class(dt2$WEATHER)!="factor") dt2$WEATHER<- as.factor(dt2$WEATHER)
if (class(dt2$PLOT1)!="factor") dt2$PLOT1<- as.factor(dt2$PLOT1)
if (class(dt2$PLOT2)!="factor") dt2$PLOT2<- as.factor(dt2$PLOT2)
if (class(dt2$WIND)!="factor") dt2$WIND<- as.factor(dt2$WIND)
if (class(dt2$RAIN)!="factor") dt2$RAIN<- as.factor(dt2$RAIN)
if (class(dt2$AMRED)=="factor") dt2$AMRED <-as.numeric(levels(dt2$AMRED))[as.integer(dt2$AMRED) ]               
if (class(dt2$AMRED)=="character") dt2$AMRED <-as.numeric(dt2$AMRED)
if (class(dt2$BFGRQ)=="factor") dt2$BFGRQ <-as.numeric(levels(dt2$BFGRQ))[as.integer(dt2$BFGRQ) ]               
if (class(dt2$BFGRQ)=="character") dt2$BFGRQ <-as.numeric(dt2$BFGRQ)
if (class(dt2$BHEUP)=="factor") dt2$BHEUP <-as.numeric(levels(dt2$BHEUP))[as.integer(dt2$BHEUP) ]               
if (class(dt2$BHEUP)=="character") dt2$BHEUP <-as.numeric(dt2$BHEUP)
if (class(dt2$BLAWA)=="factor") dt2$BLAWA <-as.numeric(levels(dt2$BLAWA))[as.integer(dt2$BLAWA) ]               
if (class(dt2$BLAWA)=="character") dt2$BLAWA <-as.numeric(dt2$BLAWA)
if (class(dt2$BQUIT)=="factor") dt2$BQUIT <-as.numeric(levels(dt2$BQUIT))[as.integer(dt2$BQUIT) ]               
if (class(dt2$BQUIT)=="character") dt2$BQUIT <-as.numeric(dt2$BQUIT)
if (class(dt2$BTBLW)=="factor") dt2$BTBLW <-as.numeric(levels(dt2$BTBLW))[as.integer(dt2$BTBLW) ]               
if (class(dt2$BTBLW)=="character") dt2$BTBLW <-as.numeric(dt2$BTBLW)
if (class(dt2$BTGNW)=="factor") dt2$BTGNW <-as.numeric(levels(dt2$BTGNW))[as.integer(dt2$BTGNW) ]               
if (class(dt2$BTGNW)=="character") dt2$BTGNW <-as.numeric(dt2$BTGNW)
if (class(dt2$BWINH)=="factor") dt2$BWINH <-as.numeric(levels(dt2$BWINH))[as.integer(dt2$BWINH) ]               
if (class(dt2$BWINH)=="character") dt2$BWINH <-as.numeric(dt2$BWINH)
if (class(dt2$BWVIR)=="factor") dt2$BWVIR <-as.numeric(levels(dt2$BWVIR))[as.integer(dt2$BWVIR) ]               
if (class(dt2$BWVIR)=="character") dt2$BWVIR <-as.numeric(dt2$BWVIR)
if (class(dt2$BWWAR)=="factor") dt2$BWWAR <-as.numeric(levels(dt2$BWWAR))[as.integer(dt2$BWWAR) ]               
if (class(dt2$BWWAR)=="character") dt2$BWWAR <-as.numeric(dt2$BWWAR)
if (class(dt2$CAREL)=="factor") dt2$CAREL <-as.numeric(levels(dt2$CAREL))[as.integer(dt2$CAREL) ]               
if (class(dt2$CAREL)=="character") dt2$CAREL <-as.numeric(dt2$CAREL)
if (class(dt2$GKNGB)=="factor") dt2$GKNGB <-as.numeric(levels(dt2$GKNGB))[as.integer(dt2$GKNGB) ]               
if (class(dt2$GKNGB)=="character") dt2$GKNGB <-as.numeric(dt2$GKNGB)
if (class(dt2$GNHER)=="factor") dt2$GNHER <-as.numeric(levels(dt2$GNHER))[as.integer(dt2$GNHER) ]               
if (class(dt2$GNHER)=="character") dt2$GNHER <-as.numeric(dt2$GNHER)
if (class(dt2$GRMAN)=="factor") dt2$GRMAN <-as.numeric(levels(dt2$GRMAN))[as.integer(dt2$GRMAN) ]               
if (class(dt2$GRMAN)=="character") dt2$GRMAN <-as.numeric(dt2$GRMAN)
if (class(dt2$KENWA)=="factor") dt2$KENWA <-as.numeric(levels(dt2$KENWA))[as.integer(dt2$KENWA) ]               
if (class(dt2$KENWA)=="character") dt2$KENWA <-as.numeric(dt2$KENWA)
if (class(dt2$LAPEW)!="factor") dt2$LAPEW<- as.factor(dt2$LAPEW)
if (class(dt2$MAGWA)=="factor") dt2$MAGWA <-as.numeric(levels(dt2$MAGWA))[as.integer(dt2$MAGWA) ]               
if (class(dt2$MAGWA)=="character") dt2$MAGWA <-as.numeric(dt2$MAGWA)
if (class(dt2$NOWAT)=="factor") dt2$NOWAT <-as.numeric(levels(dt2$NOWAT))[as.integer(dt2$NOWAT) ]               
if (class(dt2$NOWAT)=="character") dt2$NOWAT <-as.numeric(dt2$NOWAT)
if (class(dt2$ORIOL)=="factor") dt2$ORIOL <-as.numeric(levels(dt2$ORIOL))[as.integer(dt2$ORIOL) ]               
if (class(dt2$ORIOL)=="character") dt2$ORIOL <-as.numeric(dt2$ORIOL)
if (class(dt2$PARUW)=="factor") dt2$PARUW <-as.numeric(levels(dt2$PARUW))[as.integer(dt2$PARUW) ]               
if (class(dt2$PARUW)=="character") dt2$PARUW <-as.numeric(dt2$PARUW)
if (class(dt2$PETER)=="factor") dt2$PETER <-as.numeric(levels(dt2$PETER))[as.integer(dt2$PETER) ]               
if (class(dt2$PETER)=="character") dt2$PETER <-as.numeric(dt2$PETER)
if (class(dt2$PLPIG)!="factor") dt2$PLPIG<- as.factor(dt2$PLPIG)
if (class(dt2$PRAIW)=="factor") dt2$PRAIW <-as.numeric(levels(dt2$PRAIW))[as.integer(dt2$PRAIW) ]               
if (class(dt2$PRAIW)=="character") dt2$PRAIW <-as.numeric(dt2$PRAIW)
if (class(dt2$PRBUL)=="factor") dt2$PRBUL <-as.numeric(levels(dt2$PRBUL))[as.integer(dt2$PRBUL) ]               
if (class(dt2$PRBUL)=="character") dt2$PRBUL <-as.numeric(dt2$PRBUL)
if (class(dt2$PRCUC)=="factor") dt2$PRCUC <-as.numeric(levels(dt2$PRCUC))[as.integer(dt2$PRCUC) ]               
if (class(dt2$PRCUC)=="character") dt2$PRCUC <-as.numeric(dt2$PRCUC)
if (class(dt2$PREME)=="factor") dt2$PREME <-as.numeric(levels(dt2$PREME))[as.integer(dt2$PREME) ]               
if (class(dt2$PREME)=="character") dt2$PREME <-as.numeric(dt2$PREME)
if (class(dt2$PRFLY)=="factor") dt2$PRFLY <-as.numeric(levels(dt2$PRFLY))[as.integer(dt2$PRFLY) ]               
if (class(dt2$PRFLY)=="character") dt2$PRFLY <-as.numeric(dt2$PRFLY)
if (class(dt2$PRTAN)=="factor") dt2$PRTAN <-as.numeric(levels(dt2$PRTAN))[as.integer(dt2$PRTAN) ]               
if (class(dt2$PRTAN)=="character") dt2$PRTAN <-as.numeric(dt2$PRTAN)
if (class(dt2$PRTOD)=="factor") dt2$PRTOD <-as.numeric(levels(dt2$PRTOD))[as.integer(dt2$PRTOD) ]               
if (class(dt2$PRTOD)=="character") dt2$PRTOD <-as.numeric(dt2$PRTOD)
if (class(dt2$PRWPR)=="factor") dt2$PRWPR <-as.numeric(levels(dt2$PRWPR))[as.integer(dt2$PRWPR) ]               
if (class(dt2$PRWPR)=="character") dt2$PRWPR <-as.numeric(dt2$PRWPR)
if (class(dt2$RLTSH)=="factor") dt2$RLTSH <-as.numeric(levels(dt2$RLTSH))[as.integer(dt2$RLTSH) ]               
if (class(dt2$RLTSH)=="character") dt2$RLTSH <-as.numeric(dt2$RLTSH)
if (class(dt2$RQDOV)=="factor") dt2$RQDOV <-as.numeric(levels(dt2$RQDOV))[as.integer(dt2$RQDOV) ]               
if (class(dt2$RQDOV)=="character") dt2$RQDOV <-as.numeric(dt2$RQDOV)
if (class(dt2$RTHAW)=="factor") dt2$RTHAW <-as.numeric(levels(dt2$RTHAW))[as.integer(dt2$RTHAW) ]               
if (class(dt2$RTHAW)=="character") dt2$RTHAW <-as.numeric(dt2$RTHAW)
if (class(dt2$SBANI)!="factor") dt2$SBANI<- as.factor(dt2$SBANI)
if (class(dt2$SCOWL)!="factor") dt2$SCOWL<- as.factor(dt2$SCOWL)
if (class(dt2$SHTAN)=="factor") dt2$SHTAN <-as.numeric(levels(dt2$SHTAN))[as.integer(dt2$SHTAN) ]               
if (class(dt2$SHTAN)=="character") dt2$SHTAN <-as.numeric(dt2$SHTAN)
if (class(dt2$SNPIG)=="factor") dt2$SNPIG <-as.numeric(levels(dt2$SNPIG))[as.integer(dt2$SNPIG) ]               
if (class(dt2$SNPIG)=="character") dt2$SNPIG <-as.numeric(dt2$SNPIG)
if (class(dt2$UNKNO)=="factor") dt2$UNKNO <-as.numeric(levels(dt2$UNKNO))[as.integer(dt2$UNKNO) ]               
if (class(dt2$UNKNO)=="character") dt2$UNKNO <-as.numeric(dt2$UNKNO)
if (class(dt2$UNWAR)=="factor") dt2$UNWAR <-as.numeric(levels(dt2$UNWAR))[as.integer(dt2$UNWAR) ]               
if (class(dt2$UNWAR)=="character") dt2$UNWAR <-as.numeric(dt2$UNWAR)
if (class(dt2$WATTH)=="factor") dt2$WATTH <-as.numeric(levels(dt2$WATTH))[as.integer(dt2$WATTH) ]               
if (class(dt2$WATTH)=="character") dt2$WATTH <-as.numeric(dt2$WATTH)
if (class(dt2$WEVIR)=="factor") dt2$WEVIR <-as.numeric(levels(dt2$WEVIR))[as.integer(dt2$WEVIR) ]               
if (class(dt2$WEVIR)=="character") dt2$WEVIR <-as.numeric(dt2$WEVIR)
if (class(dt2$WWDOV)=="factor") dt2$WWDOV <-as.numeric(levels(dt2$WWDOV))[as.integer(dt2$WWDOV) ]               
if (class(dt2$WWDOV)=="character") dt2$WWDOV <-as.numeric(dt2$WWDOV)
if (class(dt2$YFGRQ)!="factor") dt2$YFGRQ<- as.factor(dt2$YFGRQ)
if (class(dt2$TOTAL)=="factor") dt2$TOTAL <-as.numeric(levels(dt2$TOTAL))[as.integer(dt2$TOTAL) ]               
if (class(dt2$TOTAL)=="character") dt2$TOTAL <-as.numeric(dt2$TOTAL)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(JULIAN)
summary(DATE)
summary(PLACE)
summary(WEATHER)
summary(PLOT1)
summary(PLOT2)
summary(WIND)
summary(RAIN)
summary(TIME)
summary(AMRED)
summary(BFGRQ)
summary(BHEUP)
summary(BLAWA)
summary(BQUIT)
summary(BTBLW)
summary(BTGNW)
summary(BWINH)
summary(BWVIR)
summary(BWWAR)
summary(CAREL)
summary(GKNGB)
summary(GNHER)
summary(GRMAN)
summary(KENWA)
summary(LAPEW)
summary(MAGWA)
summary(NOWAT)
summary(ORIOL)
summary(PARUW)
summary(PETER)
summary(PLPIG)
summary(PRAIW)
summary(PRBUL)
summary(PRCUC)
summary(PREME)
summary(PRFLY)
summary(PRTAN)
summary(PRTOD)
summary(PRWPR)
summary(RLTSH)
summary(RQDOV)
summary(RTHAW)
summary(SBANI)
summary(SCOWL)
summary(SHTAN)
summary(SNPIG)
summary(UNKNO)
summary(UNWAR)
summary(WATTH)
summary(WEVIR)
summary(WWDOV)
summary(YFGRQ)
summary(TOTAL) 
# Get more details on character variables

summary(as.factor(dt2$YEAR)) 
summary(as.factor(dt2$JULIAN)) 
summary(as.factor(dt2$PLACE)) 
summary(as.factor(dt2$WEATHER)) 
summary(as.factor(dt2$PLOT1)) 
summary(as.factor(dt2$PLOT2)) 
summary(as.factor(dt2$WIND)) 
summary(as.factor(dt2$RAIN)) 
summary(as.factor(dt2$LAPEW)) 
summary(as.factor(dt2$PLPIG)) 
summary(as.factor(dt2$SBANI)) 
summary(as.factor(dt2$SCOWL)) 
summary(as.factor(dt2$YFGRQ))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/23/4630183/720bbc47c24d202365922a68a125f1f1"
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "YEAR",     
                 "JULIAN",     
                 "DATE",     
                 "PLACE",     
                 "WEATHER",     
                 "PLOT1",     
                 "PLOT2",     
                 "WIND",     
                 "RAIN",     
                 "TIME",     
                 "AMRED",     
                 "BFGRQ",     
                 "BHEUP",     
                 "BLAWA",     
                 "BQUIT",     
                 "BTBLW",     
                 "BTGNW",     
                 "BWINH",     
                 "BWVIR",     
                 "BWWAR",     
                 "CAREL",     
                 "GKNGB",     
                 "GNHER",     
                 "GRMAN",     
                 "HOWAR",     
                 "KENWA",     
                 "LAPEW",     
                 "MAGWA",     
                 "NOWAT",     
                 "ORIOL",     
                 "PARUW",     
                 "PETER",     
                 "PLPIG",     
                 "PRAIW",     
                 "PRBUL",     
                 "PRCUC",     
                 "PREME",     
                 "PRFLY",     
                 "PRTAN",     
                 "PRTOD",     
                 "PRWPR",     
                 "RLTSH",     
                 "RQDOV",     
                 "RTHAW",     
                 "SBANI",     
                 "SCOWL",     
                 "SHTAN",     
                 "SNPIG",     
                 "UNKNO",     
                 "UNWAR",     
                 "WATTH",     
                 "WEVIR",     
                 "WWDOV",     
                 "YFGRQ",     
                 "YTWAR",     
                 "TOTAL",     
                 "Field.Observer"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$JULIAN)!="factor") dt3$JULIAN<- as.factor(dt3$JULIAN)
if (class(dt3$DATE)=="factor") dt3$DATE <-as.numeric(levels(dt3$DATE))[as.integer(dt3$DATE) ]               
if (class(dt3$DATE)=="character") dt3$DATE <-as.numeric(dt3$DATE)
if (class(dt3$PLACE)!="factor") dt3$PLACE<- as.factor(dt3$PLACE)
if (class(dt3$WEATHER)!="factor") dt3$WEATHER<- as.factor(dt3$WEATHER)
if (class(dt3$PLOT1)!="factor") dt3$PLOT1<- as.factor(dt3$PLOT1)
if (class(dt3$PLOT2)!="factor") dt3$PLOT2<- as.factor(dt3$PLOT2)
if (class(dt3$WIND)!="factor") dt3$WIND<- as.factor(dt3$WIND)
if (class(dt3$RAIN)!="factor") dt3$RAIN<- as.factor(dt3$RAIN)
if (class(dt3$AMRED)=="factor") dt3$AMRED <-as.numeric(levels(dt3$AMRED))[as.integer(dt3$AMRED) ]               
if (class(dt3$AMRED)=="character") dt3$AMRED <-as.numeric(dt3$AMRED)
if (class(dt3$BFGRQ)=="factor") dt3$BFGRQ <-as.numeric(levels(dt3$BFGRQ))[as.integer(dt3$BFGRQ) ]               
if (class(dt3$BFGRQ)=="character") dt3$BFGRQ <-as.numeric(dt3$BFGRQ)
if (class(dt3$BHEUP)=="factor") dt3$BHEUP <-as.numeric(levels(dt3$BHEUP))[as.integer(dt3$BHEUP) ]               
if (class(dt3$BHEUP)=="character") dt3$BHEUP <-as.numeric(dt3$BHEUP)
if (class(dt3$BLAWA)=="factor") dt3$BLAWA <-as.numeric(levels(dt3$BLAWA))[as.integer(dt3$BLAWA) ]               
if (class(dt3$BLAWA)=="character") dt3$BLAWA <-as.numeric(dt3$BLAWA)
if (class(dt3$BQUIT)=="factor") dt3$BQUIT <-as.numeric(levels(dt3$BQUIT))[as.integer(dt3$BQUIT) ]               
if (class(dt3$BQUIT)=="character") dt3$BQUIT <-as.numeric(dt3$BQUIT)
if (class(dt3$BTBLW)=="factor") dt3$BTBLW <-as.numeric(levels(dt3$BTBLW))[as.integer(dt3$BTBLW) ]               
if (class(dt3$BTBLW)=="character") dt3$BTBLW <-as.numeric(dt3$BTBLW)
if (class(dt3$BTGNW)=="factor") dt3$BTGNW <-as.numeric(levels(dt3$BTGNW))[as.integer(dt3$BTGNW) ]               
if (class(dt3$BTGNW)=="character") dt3$BTGNW <-as.numeric(dt3$BTGNW)
if (class(dt3$BWINH)=="factor") dt3$BWINH <-as.numeric(levels(dt3$BWINH))[as.integer(dt3$BWINH) ]               
if (class(dt3$BWINH)=="character") dt3$BWINH <-as.numeric(dt3$BWINH)
if (class(dt3$BWVIR)=="factor") dt3$BWVIR <-as.numeric(levels(dt3$BWVIR))[as.integer(dt3$BWVIR) ]               
if (class(dt3$BWVIR)=="character") dt3$BWVIR <-as.numeric(dt3$BWVIR)
if (class(dt3$BWWAR)=="factor") dt3$BWWAR <-as.numeric(levels(dt3$BWWAR))[as.integer(dt3$BWWAR) ]               
if (class(dt3$BWWAR)=="character") dt3$BWWAR <-as.numeric(dt3$BWWAR)
if (class(dt3$CAREL)=="factor") dt3$CAREL <-as.numeric(levels(dt3$CAREL))[as.integer(dt3$CAREL) ]               
if (class(dt3$CAREL)=="character") dt3$CAREL <-as.numeric(dt3$CAREL)
if (class(dt3$GKNGB)=="factor") dt3$GKNGB <-as.numeric(levels(dt3$GKNGB))[as.integer(dt3$GKNGB) ]               
if (class(dt3$GKNGB)=="character") dt3$GKNGB <-as.numeric(dt3$GKNGB)
if (class(dt3$GNHER)=="factor") dt3$GNHER <-as.numeric(levels(dt3$GNHER))[as.integer(dt3$GNHER) ]               
if (class(dt3$GNHER)=="character") dt3$GNHER <-as.numeric(dt3$GNHER)
if (class(dt3$GRMAN)=="factor") dt3$GRMAN <-as.numeric(levels(dt3$GRMAN))[as.integer(dt3$GRMAN) ]               
if (class(dt3$GRMAN)=="character") dt3$GRMAN <-as.numeric(dt3$GRMAN)
if (class(dt3$HOWAR)=="factor") dt3$HOWAR <-as.numeric(levels(dt3$HOWAR))[as.integer(dt3$HOWAR) ]               
if (class(dt3$HOWAR)=="character") dt3$HOWAR <-as.numeric(dt3$HOWAR)
if (class(dt3$KENWA)=="factor") dt3$KENWA <-as.numeric(levels(dt3$KENWA))[as.integer(dt3$KENWA) ]               
if (class(dt3$KENWA)=="character") dt3$KENWA <-as.numeric(dt3$KENWA)
if (class(dt3$LAPEW)!="factor") dt3$LAPEW<- as.factor(dt3$LAPEW)
if (class(dt3$MAGWA)=="factor") dt3$MAGWA <-as.numeric(levels(dt3$MAGWA))[as.integer(dt3$MAGWA) ]               
if (class(dt3$MAGWA)=="character") dt3$MAGWA <-as.numeric(dt3$MAGWA)
if (class(dt3$NOWAT)=="factor") dt3$NOWAT <-as.numeric(levels(dt3$NOWAT))[as.integer(dt3$NOWAT) ]               
if (class(dt3$NOWAT)=="character") dt3$NOWAT <-as.numeric(dt3$NOWAT)
if (class(dt3$ORIOL)=="factor") dt3$ORIOL <-as.numeric(levels(dt3$ORIOL))[as.integer(dt3$ORIOL) ]               
if (class(dt3$ORIOL)=="character") dt3$ORIOL <-as.numeric(dt3$ORIOL)
if (class(dt3$PARUW)=="factor") dt3$PARUW <-as.numeric(levels(dt3$PARUW))[as.integer(dt3$PARUW) ]               
if (class(dt3$PARUW)=="character") dt3$PARUW <-as.numeric(dt3$PARUW)
if (class(dt3$PETER)=="factor") dt3$PETER <-as.numeric(levels(dt3$PETER))[as.integer(dt3$PETER) ]               
if (class(dt3$PETER)=="character") dt3$PETER <-as.numeric(dt3$PETER)
if (class(dt3$PLPIG)!="factor") dt3$PLPIG<- as.factor(dt3$PLPIG)
if (class(dt3$PRAIW)=="factor") dt3$PRAIW <-as.numeric(levels(dt3$PRAIW))[as.integer(dt3$PRAIW) ]               
if (class(dt3$PRAIW)=="character") dt3$PRAIW <-as.numeric(dt3$PRAIW)
if (class(dt3$PRBUL)=="factor") dt3$PRBUL <-as.numeric(levels(dt3$PRBUL))[as.integer(dt3$PRBUL) ]               
if (class(dt3$PRBUL)=="character") dt3$PRBUL <-as.numeric(dt3$PRBUL)
if (class(dt3$PRCUC)=="factor") dt3$PRCUC <-as.numeric(levels(dt3$PRCUC))[as.integer(dt3$PRCUC) ]               
if (class(dt3$PRCUC)=="character") dt3$PRCUC <-as.numeric(dt3$PRCUC)
if (class(dt3$PREME)=="factor") dt3$PREME <-as.numeric(levels(dt3$PREME))[as.integer(dt3$PREME) ]               
if (class(dt3$PREME)=="character") dt3$PREME <-as.numeric(dt3$PREME)
if (class(dt3$PRFLY)=="factor") dt3$PRFLY <-as.numeric(levels(dt3$PRFLY))[as.integer(dt3$PRFLY) ]               
if (class(dt3$PRFLY)=="character") dt3$PRFLY <-as.numeric(dt3$PRFLY)
if (class(dt3$PRTAN)=="factor") dt3$PRTAN <-as.numeric(levels(dt3$PRTAN))[as.integer(dt3$PRTAN) ]               
if (class(dt3$PRTAN)=="character") dt3$PRTAN <-as.numeric(dt3$PRTAN)
if (class(dt3$PRTOD)=="factor") dt3$PRTOD <-as.numeric(levels(dt3$PRTOD))[as.integer(dt3$PRTOD) ]               
if (class(dt3$PRTOD)=="character") dt3$PRTOD <-as.numeric(dt3$PRTOD)
if (class(dt3$PRWPR)=="factor") dt3$PRWPR <-as.numeric(levels(dt3$PRWPR))[as.integer(dt3$PRWPR) ]               
if (class(dt3$PRWPR)=="character") dt3$PRWPR <-as.numeric(dt3$PRWPR)
if (class(dt3$RLTSH)=="factor") dt3$RLTSH <-as.numeric(levels(dt3$RLTSH))[as.integer(dt3$RLTSH) ]               
if (class(dt3$RLTSH)=="character") dt3$RLTSH <-as.numeric(dt3$RLTSH)
if (class(dt3$RQDOV)=="factor") dt3$RQDOV <-as.numeric(levels(dt3$RQDOV))[as.integer(dt3$RQDOV) ]               
if (class(dt3$RQDOV)=="character") dt3$RQDOV <-as.numeric(dt3$RQDOV)
if (class(dt3$RTHAW)=="factor") dt3$RTHAW <-as.numeric(levels(dt3$RTHAW))[as.integer(dt3$RTHAW) ]               
if (class(dt3$RTHAW)=="character") dt3$RTHAW <-as.numeric(dt3$RTHAW)
if (class(dt3$SBANI)!="factor") dt3$SBANI<- as.factor(dt3$SBANI)
if (class(dt3$SCOWL)!="factor") dt3$SCOWL<- as.factor(dt3$SCOWL)
if (class(dt3$SHTAN)=="factor") dt3$SHTAN <-as.numeric(levels(dt3$SHTAN))[as.integer(dt3$SHTAN) ]               
if (class(dt3$SHTAN)=="character") dt3$SHTAN <-as.numeric(dt3$SHTAN)
if (class(dt3$SNPIG)=="factor") dt3$SNPIG <-as.numeric(levels(dt3$SNPIG))[as.integer(dt3$SNPIG) ]               
if (class(dt3$SNPIG)=="character") dt3$SNPIG <-as.numeric(dt3$SNPIG)
if (class(dt3$UNKNO)=="factor") dt3$UNKNO <-as.numeric(levels(dt3$UNKNO))[as.integer(dt3$UNKNO) ]               
if (class(dt3$UNKNO)=="character") dt3$UNKNO <-as.numeric(dt3$UNKNO)
if (class(dt3$UNWAR)=="factor") dt3$UNWAR <-as.numeric(levels(dt3$UNWAR))[as.integer(dt3$UNWAR) ]               
if (class(dt3$UNWAR)=="character") dt3$UNWAR <-as.numeric(dt3$UNWAR)
if (class(dt3$WATTH)=="factor") dt3$WATTH <-as.numeric(levels(dt3$WATTH))[as.integer(dt3$WATTH) ]               
if (class(dt3$WATTH)=="character") dt3$WATTH <-as.numeric(dt3$WATTH)
if (class(dt3$WEVIR)=="factor") dt3$WEVIR <-as.numeric(levels(dt3$WEVIR))[as.integer(dt3$WEVIR) ]               
if (class(dt3$WEVIR)=="character") dt3$WEVIR <-as.numeric(dt3$WEVIR)
if (class(dt3$WWDOV)=="factor") dt3$WWDOV <-as.numeric(levels(dt3$WWDOV))[as.integer(dt3$WWDOV) ]               
if (class(dt3$WWDOV)=="character") dt3$WWDOV <-as.numeric(dt3$WWDOV)
if (class(dt3$YFGRQ)!="factor") dt3$YFGRQ<- as.factor(dt3$YFGRQ)
if (class(dt3$YTWAR)!="factor") dt3$YTWAR<- as.factor(dt3$YTWAR)
if (class(dt3$TOTAL)=="factor") dt3$TOTAL <-as.numeric(levels(dt3$TOTAL))[as.integer(dt3$TOTAL) ]               
if (class(dt3$TOTAL)=="character") dt3$TOTAL <-as.numeric(dt3$TOTAL)
if (class(dt3$Field.Observer)!="factor") dt3$Field.Observer<- as.factor(dt3$Field.Observer)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(JULIAN)
summary(DATE)
summary(PLACE)
summary(WEATHER)
summary(PLOT1)
summary(PLOT2)
summary(WIND)
summary(RAIN)
summary(TIME)
summary(AMRED)
summary(BFGRQ)
summary(BHEUP)
summary(BLAWA)
summary(BQUIT)
summary(BTBLW)
summary(BTGNW)
summary(BWINH)
summary(BWVIR)
summary(BWWAR)
summary(CAREL)
summary(GKNGB)
summary(GNHER)
summary(GRMAN)
summary(HOWAR)
summary(KENWA)
summary(LAPEW)
summary(MAGWA)
summary(NOWAT)
summary(ORIOL)
summary(PARUW)
summary(PETER)
summary(PLPIG)
summary(PRAIW)
summary(PRBUL)
summary(PRCUC)
summary(PREME)
summary(PRFLY)
summary(PRTAN)
summary(PRTOD)
summary(PRWPR)
summary(RLTSH)
summary(RQDOV)
summary(RTHAW)
summary(SBANI)
summary(SCOWL)
summary(SHTAN)
summary(SNPIG)
summary(UNKNO)
summary(UNWAR)
summary(WATTH)
summary(WEVIR)
summary(WWDOV)
summary(YFGRQ)
summary(YTWAR)
summary(TOTAL)
summary(Field.Observer) 
# Get more details on character variables

summary(as.factor(dt3$JULIAN)) 
summary(as.factor(dt3$PLACE)) 
summary(as.factor(dt3$WEATHER)) 
summary(as.factor(dt3$PLOT1)) 
summary(as.factor(dt3$PLOT2)) 
summary(as.factor(dt3$WIND)) 
summary(as.factor(dt3$RAIN)) 
summary(as.factor(dt3$LAPEW)) 
summary(as.factor(dt3$PLPIG)) 
summary(as.factor(dt3$SBANI)) 
summary(as.factor(dt3$SCOWL)) 
summary(as.factor(dt3$YFGRQ)) 
summary(as.factor(dt3$YTWAR)) 
summary(as.factor(dt3$Field.Observer))
detach(dt3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/23/4630183/a625f4726e527e70e93ba75e9bc9359e"
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "YEAR",     
                 "JULIAN",     
                 "DATE",     
                 "PLACE",     
                 "WEATHER",     
                 "PLOT1",     
                 "PLOT2",     
                 "WIND",     
                 "RAIN",     
                 "TIME",     
                 "AMRED",     
                 "BFGRQ",     
                 "BHEUP",     
                 "BLAWA",     
                 "BQUIT",     
                 "BTBLW",     
                 "BTGNW",     
                 "BWINH",     
                 "BWVIR",     
                 "BWWAR",     
                 "CAREL",     
                 "GKNGB",     
                 "GNHER",     
                 "GRMAN",     
                 "HOWAR",     
                 "KENWA",     
                 "LAPEW",     
                 "MAGWA",     
                 "NOWAT",     
                 "ORIOL",     
                 "PARUW",     
                 "PETER",     
                 "PLPIG",     
                 "PRAIW",     
                 "PRBUL",     
                 "PRCUC",     
                 "PREME",     
                 "PRFLY",     
                 "PRTAN",     
                 "PRTOD",     
                 "PRWPR",     
                 "RLTSH",     
                 "RQDOV",     
                 "RTHAW",     
                 "SBANI",     
                 "SCOWL",     
                 "SHTAN",     
                 "SNPIG",     
                 "UNKNO",     
                 "UNWAR",     
                 "WATTH",     
                 "WEVIR",     
                 "WWDOV",     
                 "YFGRQ",     
                 "YTWAR",     
                 "TOTAL",     
                 "Field.Observer"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt4$JULIAN)!="factor") dt4$JULIAN<- as.factor(dt4$JULIAN)
if (class(dt4$DATE)=="factor") dt4$DATE <-as.numeric(levels(dt4$DATE))[as.integer(dt4$DATE) ]               
if (class(dt4$DATE)=="character") dt4$DATE <-as.numeric(dt4$DATE)
if (class(dt4$PLACE)!="factor") dt4$PLACE<- as.factor(dt4$PLACE)
if (class(dt4$WEATHER)!="factor") dt4$WEATHER<- as.factor(dt4$WEATHER)
if (class(dt4$PLOT1)!="factor") dt4$PLOT1<- as.factor(dt4$PLOT1)
if (class(dt4$PLOT2)!="factor") dt4$PLOT2<- as.factor(dt4$PLOT2)
if (class(dt4$WIND)!="factor") dt4$WIND<- as.factor(dt4$WIND)
if (class(dt4$RAIN)!="factor") dt4$RAIN<- as.factor(dt4$RAIN)
if (class(dt4$AMRED)=="factor") dt4$AMRED <-as.numeric(levels(dt4$AMRED))[as.integer(dt4$AMRED) ]               
if (class(dt4$AMRED)=="character") dt4$AMRED <-as.numeric(dt4$AMRED)
if (class(dt4$BFGRQ)=="factor") dt4$BFGRQ <-as.numeric(levels(dt4$BFGRQ))[as.integer(dt4$BFGRQ) ]               
if (class(dt4$BFGRQ)=="character") dt4$BFGRQ <-as.numeric(dt4$BFGRQ)
if (class(dt4$BHEUP)=="factor") dt4$BHEUP <-as.numeric(levels(dt4$BHEUP))[as.integer(dt4$BHEUP) ]               
if (class(dt4$BHEUP)=="character") dt4$BHEUP <-as.numeric(dt4$BHEUP)
if (class(dt4$BLAWA)=="factor") dt4$BLAWA <-as.numeric(levels(dt4$BLAWA))[as.integer(dt4$BLAWA) ]               
if (class(dt4$BLAWA)=="character") dt4$BLAWA <-as.numeric(dt4$BLAWA)
if (class(dt4$BQUIT)=="factor") dt4$BQUIT <-as.numeric(levels(dt4$BQUIT))[as.integer(dt4$BQUIT) ]               
if (class(dt4$BQUIT)=="character") dt4$BQUIT <-as.numeric(dt4$BQUIT)
if (class(dt4$BTBLW)=="factor") dt4$BTBLW <-as.numeric(levels(dt4$BTBLW))[as.integer(dt4$BTBLW) ]               
if (class(dt4$BTBLW)=="character") dt4$BTBLW <-as.numeric(dt4$BTBLW)
if (class(dt4$BTGNW)=="factor") dt4$BTGNW <-as.numeric(levels(dt4$BTGNW))[as.integer(dt4$BTGNW) ]               
if (class(dt4$BTGNW)=="character") dt4$BTGNW <-as.numeric(dt4$BTGNW)
if (class(dt4$BWINH)=="factor") dt4$BWINH <-as.numeric(levels(dt4$BWINH))[as.integer(dt4$BWINH) ]               
if (class(dt4$BWINH)=="character") dt4$BWINH <-as.numeric(dt4$BWINH)
if (class(dt4$BWVIR)=="factor") dt4$BWVIR <-as.numeric(levels(dt4$BWVIR))[as.integer(dt4$BWVIR) ]               
if (class(dt4$BWVIR)=="character") dt4$BWVIR <-as.numeric(dt4$BWVIR)
if (class(dt4$BWWAR)=="factor") dt4$BWWAR <-as.numeric(levels(dt4$BWWAR))[as.integer(dt4$BWWAR) ]               
if (class(dt4$BWWAR)=="character") dt4$BWWAR <-as.numeric(dt4$BWWAR)
if (class(dt4$CAREL)=="factor") dt4$CAREL <-as.numeric(levels(dt4$CAREL))[as.integer(dt4$CAREL) ]               
if (class(dt4$CAREL)=="character") dt4$CAREL <-as.numeric(dt4$CAREL)
if (class(dt4$GKNGB)=="factor") dt4$GKNGB <-as.numeric(levels(dt4$GKNGB))[as.integer(dt4$GKNGB) ]               
if (class(dt4$GKNGB)=="character") dt4$GKNGB <-as.numeric(dt4$GKNGB)
if (class(dt4$GNHER)=="factor") dt4$GNHER <-as.numeric(levels(dt4$GNHER))[as.integer(dt4$GNHER) ]               
if (class(dt4$GNHER)=="character") dt4$GNHER <-as.numeric(dt4$GNHER)
if (class(dt4$GRMAN)=="factor") dt4$GRMAN <-as.numeric(levels(dt4$GRMAN))[as.integer(dt4$GRMAN) ]               
if (class(dt4$GRMAN)=="character") dt4$GRMAN <-as.numeric(dt4$GRMAN)
if (class(dt4$HOWAR)=="factor") dt4$HOWAR <-as.numeric(levels(dt4$HOWAR))[as.integer(dt4$HOWAR) ]               
if (class(dt4$HOWAR)=="character") dt4$HOWAR <-as.numeric(dt4$HOWAR)
if (class(dt4$KENWA)=="factor") dt4$KENWA <-as.numeric(levels(dt4$KENWA))[as.integer(dt4$KENWA) ]               
if (class(dt4$KENWA)=="character") dt4$KENWA <-as.numeric(dt4$KENWA)
if (class(dt4$LAPEW)!="factor") dt4$LAPEW<- as.factor(dt4$LAPEW)
if (class(dt4$MAGWA)=="factor") dt4$MAGWA <-as.numeric(levels(dt4$MAGWA))[as.integer(dt4$MAGWA) ]               
if (class(dt4$MAGWA)=="character") dt4$MAGWA <-as.numeric(dt4$MAGWA)
if (class(dt4$NOWAT)=="factor") dt4$NOWAT <-as.numeric(levels(dt4$NOWAT))[as.integer(dt4$NOWAT) ]               
if (class(dt4$NOWAT)=="character") dt4$NOWAT <-as.numeric(dt4$NOWAT)
if (class(dt4$ORIOL)=="factor") dt4$ORIOL <-as.numeric(levels(dt4$ORIOL))[as.integer(dt4$ORIOL) ]               
if (class(dt4$ORIOL)=="character") dt4$ORIOL <-as.numeric(dt4$ORIOL)
if (class(dt4$PARUW)=="factor") dt4$PARUW <-as.numeric(levels(dt4$PARUW))[as.integer(dt4$PARUW) ]               
if (class(dt4$PARUW)=="character") dt4$PARUW <-as.numeric(dt4$PARUW)
if (class(dt4$PETER)=="factor") dt4$PETER <-as.numeric(levels(dt4$PETER))[as.integer(dt4$PETER) ]               
if (class(dt4$PETER)=="character") dt4$PETER <-as.numeric(dt4$PETER)
if (class(dt4$PLPIG)!="factor") dt4$PLPIG<- as.factor(dt4$PLPIG)
if (class(dt4$PRAIW)=="factor") dt4$PRAIW <-as.numeric(levels(dt4$PRAIW))[as.integer(dt4$PRAIW) ]               
if (class(dt4$PRAIW)=="character") dt4$PRAIW <-as.numeric(dt4$PRAIW)
if (class(dt4$PRBUL)=="factor") dt4$PRBUL <-as.numeric(levels(dt4$PRBUL))[as.integer(dt4$PRBUL) ]               
if (class(dt4$PRBUL)=="character") dt4$PRBUL <-as.numeric(dt4$PRBUL)
if (class(dt4$PRCUC)=="factor") dt4$PRCUC <-as.numeric(levels(dt4$PRCUC))[as.integer(dt4$PRCUC) ]               
if (class(dt4$PRCUC)=="character") dt4$PRCUC <-as.numeric(dt4$PRCUC)
if (class(dt4$PREME)=="factor") dt4$PREME <-as.numeric(levels(dt4$PREME))[as.integer(dt4$PREME) ]               
if (class(dt4$PREME)=="character") dt4$PREME <-as.numeric(dt4$PREME)
if (class(dt4$PRFLY)=="factor") dt4$PRFLY <-as.numeric(levels(dt4$PRFLY))[as.integer(dt4$PRFLY) ]               
if (class(dt4$PRFLY)=="character") dt4$PRFLY <-as.numeric(dt4$PRFLY)
if (class(dt4$PRTAN)=="factor") dt4$PRTAN <-as.numeric(levels(dt4$PRTAN))[as.integer(dt4$PRTAN) ]               
if (class(dt4$PRTAN)=="character") dt4$PRTAN <-as.numeric(dt4$PRTAN)
if (class(dt4$PRTOD)=="factor") dt4$PRTOD <-as.numeric(levels(dt4$PRTOD))[as.integer(dt4$PRTOD) ]               
if (class(dt4$PRTOD)=="character") dt4$PRTOD <-as.numeric(dt4$PRTOD)
if (class(dt4$PRWPR)=="factor") dt4$PRWPR <-as.numeric(levels(dt4$PRWPR))[as.integer(dt4$PRWPR) ]               
if (class(dt4$PRWPR)=="character") dt4$PRWPR <-as.numeric(dt4$PRWPR)
if (class(dt4$RLTSH)=="factor") dt4$RLTSH <-as.numeric(levels(dt4$RLTSH))[as.integer(dt4$RLTSH) ]               
if (class(dt4$RLTSH)=="character") dt4$RLTSH <-as.numeric(dt4$RLTSH)
if (class(dt4$RQDOV)=="factor") dt4$RQDOV <-as.numeric(levels(dt4$RQDOV))[as.integer(dt4$RQDOV) ]               
if (class(dt4$RQDOV)=="character") dt4$RQDOV <-as.numeric(dt4$RQDOV)
if (class(dt4$RTHAW)=="factor") dt4$RTHAW <-as.numeric(levels(dt4$RTHAW))[as.integer(dt4$RTHAW) ]               
if (class(dt4$RTHAW)=="character") dt4$RTHAW <-as.numeric(dt4$RTHAW)
if (class(dt4$SBANI)!="factor") dt4$SBANI<- as.factor(dt4$SBANI)
if (class(dt4$SCOWL)!="factor") dt4$SCOWL<- as.factor(dt4$SCOWL)
if (class(dt4$SHTAN)=="factor") dt4$SHTAN <-as.numeric(levels(dt4$SHTAN))[as.integer(dt4$SHTAN) ]               
if (class(dt4$SHTAN)=="character") dt4$SHTAN <-as.numeric(dt4$SHTAN)
if (class(dt4$SNPIG)=="factor") dt4$SNPIG <-as.numeric(levels(dt4$SNPIG))[as.integer(dt4$SNPIG) ]               
if (class(dt4$SNPIG)=="character") dt4$SNPIG <-as.numeric(dt4$SNPIG)
if (class(dt4$UNKNO)=="factor") dt4$UNKNO <-as.numeric(levels(dt4$UNKNO))[as.integer(dt4$UNKNO) ]               
if (class(dt4$UNKNO)=="character") dt4$UNKNO <-as.numeric(dt4$UNKNO)
if (class(dt4$UNWAR)=="factor") dt4$UNWAR <-as.numeric(levels(dt4$UNWAR))[as.integer(dt4$UNWAR) ]               
if (class(dt4$UNWAR)=="character") dt4$UNWAR <-as.numeric(dt4$UNWAR)
if (class(dt4$WATTH)=="factor") dt4$WATTH <-as.numeric(levels(dt4$WATTH))[as.integer(dt4$WATTH) ]               
if (class(dt4$WATTH)=="character") dt4$WATTH <-as.numeric(dt4$WATTH)
if (class(dt4$WEVIR)=="factor") dt4$WEVIR <-as.numeric(levels(dt4$WEVIR))[as.integer(dt4$WEVIR) ]               
if (class(dt4$WEVIR)=="character") dt4$WEVIR <-as.numeric(dt4$WEVIR)
if (class(dt4$WWDOV)=="factor") dt4$WWDOV <-as.numeric(levels(dt4$WWDOV))[as.integer(dt4$WWDOV) ]               
if (class(dt4$WWDOV)=="character") dt4$WWDOV <-as.numeric(dt4$WWDOV)
if (class(dt4$YFGRQ)!="factor") dt4$YFGRQ<- as.factor(dt4$YFGRQ)
if (class(dt4$YTWAR)!="factor") dt4$YTWAR<- as.factor(dt4$YTWAR)
if (class(dt4$TOTAL)=="factor") dt4$TOTAL <-as.numeric(levels(dt4$TOTAL))[as.integer(dt4$TOTAL) ]               
if (class(dt4$TOTAL)=="character") dt4$TOTAL <-as.numeric(dt4$TOTAL)
if (class(dt4$Field.Observer)!="factor") dt4$Field.Observer<- as.factor(dt4$Field.Observer)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(JULIAN)
summary(DATE)
summary(PLACE)
summary(WEATHER)
summary(PLOT1)
summary(PLOT2)
summary(WIND)
summary(RAIN)
summary(TIME)
summary(AMRED)
summary(BFGRQ)
summary(BHEUP)
summary(BLAWA)
summary(BQUIT)
summary(BTBLW)
summary(BTGNW)
summary(BWINH)
summary(BWVIR)
summary(BWWAR)
summary(CAREL)
summary(GKNGB)
summary(GNHER)
summary(GRMAN)
summary(HOWAR)
summary(KENWA)
summary(LAPEW)
summary(MAGWA)
summary(NOWAT)
summary(ORIOL)
summary(PARUW)
summary(PETER)
summary(PLPIG)
summary(PRAIW)
summary(PRBUL)
summary(PRCUC)
summary(PREME)
summary(PRFLY)
summary(PRTAN)
summary(PRTOD)
summary(PRWPR)
summary(RLTSH)
summary(RQDOV)
summary(RTHAW)
summary(SBANI)
summary(SCOWL)
summary(SHTAN)
summary(SNPIG)
summary(UNKNO)
summary(UNWAR)
summary(WATTH)
summary(WEVIR)
summary(WWDOV)
summary(YFGRQ)
summary(YTWAR)
summary(TOTAL)
summary(Field.Observer) 
# Get more details on character variables

summary(as.factor(dt4$JULIAN)) 
summary(as.factor(dt4$PLACE)) 
summary(as.factor(dt4$WEATHER)) 
summary(as.factor(dt4$PLOT1)) 
summary(as.factor(dt4$PLOT2)) 
summary(as.factor(dt4$WIND)) 
summary(as.factor(dt4$RAIN)) 
summary(as.factor(dt4$LAPEW)) 
summary(as.factor(dt4$PLPIG)) 
summary(as.factor(dt4$SBANI)) 
summary(as.factor(dt4$SCOWL)) 
summary(as.factor(dt4$YFGRQ)) 
summary(as.factor(dt4$YTWAR)) 
summary(as.factor(dt4$Field.Observer))
detach(dt4)               


inUrl5  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/23/4630183/cd4b7bd7c44fbda022b1e2ef97715816"
infile5 <- tempfile()
try(download.file(inUrl5,infile5,method="curl"))
if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")


dt5 <-read.csv(infile5,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "JULIAN",     
                 "DATE",     
                 "WEATHER",     
                 "PLOT1",     
                 "PLOT2",     
                 "WIND",     
                 "RAIN",     
                 "TIME",     
                 "AMRED",     
                 "BFGRQ",     
                 "BHEUP",     
                 "BLAWA",     
                 "BQUIT",     
                 "BTBLW",     
                 "BTGNW",     
                 "BWINH",     
                 "BWVIR",     
                 "BWWAR",     
                 "CAREL",     
                 "GKNGB",     
                 "GNHER",     
                 "GRMAN",     
                 "KENWA",     
                 "LAPEW",     
                 "MAGWA",     
                 "NOWAT",     
                 "PLACE",     
                 "ORIOL",     
                 "PARUW",     
                 "PETER",     
                 "PLPIG",     
                 "PRAIW",     
                 "PRBUL",     
                 "PRCUC",     
                 "PREME",     
                 "PRFLY",     
                 "PRTAN",     
                 "PRTOD",     
                 "PRWPR",     
                 "RLTSH",     
                 "RQDOV",     
                 "RTHAW",     
                 "SBANI",     
                 "SCOWL",     
                 "SHTAN",     
                 "SNPIG",     
                 "UNKNO",     
                 "UNWAR",     
                 "WATTH",     
                 "WEVIR",     
                 "WWDOV",     
                 "YFGRQ",     
                 "TOTAL"    ), check.names=TRUE)

unlink(infile5)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt5$YEAR)!="factor") dt5$YEAR<- as.factor(dt5$YEAR)
if (class(dt5$JULIAN)!="factor") dt5$JULIAN<- as.factor(dt5$JULIAN)
if (class(dt5$DATE)=="factor") dt5$DATE <-as.numeric(levels(dt5$DATE))[as.integer(dt5$DATE) ]               
if (class(dt5$DATE)=="character") dt5$DATE <-as.numeric(dt5$DATE)
if (class(dt5$WEATHER)!="factor") dt5$WEATHER<- as.factor(dt5$WEATHER)
if (class(dt5$PLOT1)!="factor") dt5$PLOT1<- as.factor(dt5$PLOT1)
if (class(dt5$PLOT2)!="factor") dt5$PLOT2<- as.factor(dt5$PLOT2)
if (class(dt5$WIND)!="factor") dt5$WIND<- as.factor(dt5$WIND)
if (class(dt5$RAIN)!="factor") dt5$RAIN<- as.factor(dt5$RAIN)
if (class(dt5$AMRED)=="factor") dt5$AMRED <-as.numeric(levels(dt5$AMRED))[as.integer(dt5$AMRED) ]               
if (class(dt5$AMRED)=="character") dt5$AMRED <-as.numeric(dt5$AMRED)
if (class(dt5$BFGRQ)=="factor") dt5$BFGRQ <-as.numeric(levels(dt5$BFGRQ))[as.integer(dt5$BFGRQ) ]               
if (class(dt5$BFGRQ)=="character") dt5$BFGRQ <-as.numeric(dt5$BFGRQ)
if (class(dt5$BHEUP)=="factor") dt5$BHEUP <-as.numeric(levels(dt5$BHEUP))[as.integer(dt5$BHEUP) ]               
if (class(dt5$BHEUP)=="character") dt5$BHEUP <-as.numeric(dt5$BHEUP)
if (class(dt5$BLAWA)=="factor") dt5$BLAWA <-as.numeric(levels(dt5$BLAWA))[as.integer(dt5$BLAWA) ]               
if (class(dt5$BLAWA)=="character") dt5$BLAWA <-as.numeric(dt5$BLAWA)
if (class(dt5$BQUIT)=="factor") dt5$BQUIT <-as.numeric(levels(dt5$BQUIT))[as.integer(dt5$BQUIT) ]               
if (class(dt5$BQUIT)=="character") dt5$BQUIT <-as.numeric(dt5$BQUIT)
if (class(dt5$BTBLW)=="factor") dt5$BTBLW <-as.numeric(levels(dt5$BTBLW))[as.integer(dt5$BTBLW) ]               
if (class(dt5$BTBLW)=="character") dt5$BTBLW <-as.numeric(dt5$BTBLW)
if (class(dt5$BTGNW)=="factor") dt5$BTGNW <-as.numeric(levels(dt5$BTGNW))[as.integer(dt5$BTGNW) ]               
if (class(dt5$BTGNW)=="character") dt5$BTGNW <-as.numeric(dt5$BTGNW)
if (class(dt5$BWINH)=="factor") dt5$BWINH <-as.numeric(levels(dt5$BWINH))[as.integer(dt5$BWINH) ]               
if (class(dt5$BWINH)=="character") dt5$BWINH <-as.numeric(dt5$BWINH)
if (class(dt5$BWVIR)=="factor") dt5$BWVIR <-as.numeric(levels(dt5$BWVIR))[as.integer(dt5$BWVIR) ]               
if (class(dt5$BWVIR)=="character") dt5$BWVIR <-as.numeric(dt5$BWVIR)
if (class(dt5$BWWAR)=="factor") dt5$BWWAR <-as.numeric(levels(dt5$BWWAR))[as.integer(dt5$BWWAR) ]               
if (class(dt5$BWWAR)=="character") dt5$BWWAR <-as.numeric(dt5$BWWAR)
if (class(dt5$CAREL)=="factor") dt5$CAREL <-as.numeric(levels(dt5$CAREL))[as.integer(dt5$CAREL) ]               
if (class(dt5$CAREL)=="character") dt5$CAREL <-as.numeric(dt5$CAREL)
if (class(dt5$GKNGB)=="factor") dt5$GKNGB <-as.numeric(levels(dt5$GKNGB))[as.integer(dt5$GKNGB) ]               
if (class(dt5$GKNGB)=="character") dt5$GKNGB <-as.numeric(dt5$GKNGB)
if (class(dt5$GNHER)=="factor") dt5$GNHER <-as.numeric(levels(dt5$GNHER))[as.integer(dt5$GNHER) ]               
if (class(dt5$GNHER)=="character") dt5$GNHER <-as.numeric(dt5$GNHER)
if (class(dt5$GRMAN)=="factor") dt5$GRMAN <-as.numeric(levels(dt5$GRMAN))[as.integer(dt5$GRMAN) ]               
if (class(dt5$GRMAN)=="character") dt5$GRMAN <-as.numeric(dt5$GRMAN)
if (class(dt5$KENWA)=="factor") dt5$KENWA <-as.numeric(levels(dt5$KENWA))[as.integer(dt5$KENWA) ]               
if (class(dt5$KENWA)=="character") dt5$KENWA <-as.numeric(dt5$KENWA)
if (class(dt5$LAPEW)!="factor") dt5$LAPEW<- as.factor(dt5$LAPEW)
if (class(dt5$MAGWA)=="factor") dt5$MAGWA <-as.numeric(levels(dt5$MAGWA))[as.integer(dt5$MAGWA) ]               
if (class(dt5$MAGWA)=="character") dt5$MAGWA <-as.numeric(dt5$MAGWA)
if (class(dt5$NOWAT)=="factor") dt5$NOWAT <-as.numeric(levels(dt5$NOWAT))[as.integer(dt5$NOWAT) ]               
if (class(dt5$NOWAT)=="character") dt5$NOWAT <-as.numeric(dt5$NOWAT)
if (class(dt5$PLACE)!="factor") dt5$PLACE<- as.factor(dt5$PLACE)
if (class(dt5$ORIOL)=="factor") dt5$ORIOL <-as.numeric(levels(dt5$ORIOL))[as.integer(dt5$ORIOL) ]               
if (class(dt5$ORIOL)=="character") dt5$ORIOL <-as.numeric(dt5$ORIOL)
if (class(dt5$PARUW)=="factor") dt5$PARUW <-as.numeric(levels(dt5$PARUW))[as.integer(dt5$PARUW) ]               
if (class(dt5$PARUW)=="character") dt5$PARUW <-as.numeric(dt5$PARUW)
if (class(dt5$PETER)=="factor") dt5$PETER <-as.numeric(levels(dt5$PETER))[as.integer(dt5$PETER) ]               
if (class(dt5$PETER)=="character") dt5$PETER <-as.numeric(dt5$PETER)
if (class(dt5$PLPIG)!="factor") dt5$PLPIG<- as.factor(dt5$PLPIG)
if (class(dt5$PRAIW)=="factor") dt5$PRAIW <-as.numeric(levels(dt5$PRAIW))[as.integer(dt5$PRAIW) ]               
if (class(dt5$PRAIW)=="character") dt5$PRAIW <-as.numeric(dt5$PRAIW)
if (class(dt5$PRBUL)=="factor") dt5$PRBUL <-as.numeric(levels(dt5$PRBUL))[as.integer(dt5$PRBUL) ]               
if (class(dt5$PRBUL)=="character") dt5$PRBUL <-as.numeric(dt5$PRBUL)
if (class(dt5$PRCUC)=="factor") dt5$PRCUC <-as.numeric(levels(dt5$PRCUC))[as.integer(dt5$PRCUC) ]               
if (class(dt5$PRCUC)=="character") dt5$PRCUC <-as.numeric(dt5$PRCUC)
if (class(dt5$PREME)=="factor") dt5$PREME <-as.numeric(levels(dt5$PREME))[as.integer(dt5$PREME) ]               
if (class(dt5$PREME)=="character") dt5$PREME <-as.numeric(dt5$PREME)
if (class(dt5$PRFLY)=="factor") dt5$PRFLY <-as.numeric(levels(dt5$PRFLY))[as.integer(dt5$PRFLY) ]               
if (class(dt5$PRFLY)=="character") dt5$PRFLY <-as.numeric(dt5$PRFLY)
if (class(dt5$PRTAN)=="factor") dt5$PRTAN <-as.numeric(levels(dt5$PRTAN))[as.integer(dt5$PRTAN) ]               
if (class(dt5$PRTAN)=="character") dt5$PRTAN <-as.numeric(dt5$PRTAN)
if (class(dt5$PRTOD)=="factor") dt5$PRTOD <-as.numeric(levels(dt5$PRTOD))[as.integer(dt5$PRTOD) ]               
if (class(dt5$PRTOD)=="character") dt5$PRTOD <-as.numeric(dt5$PRTOD)
if (class(dt5$PRWPR)=="factor") dt5$PRWPR <-as.numeric(levels(dt5$PRWPR))[as.integer(dt5$PRWPR) ]               
if (class(dt5$PRWPR)=="character") dt5$PRWPR <-as.numeric(dt5$PRWPR)
if (class(dt5$RLTSH)=="factor") dt5$RLTSH <-as.numeric(levels(dt5$RLTSH))[as.integer(dt5$RLTSH) ]               
if (class(dt5$RLTSH)=="character") dt5$RLTSH <-as.numeric(dt5$RLTSH)
if (class(dt5$RQDOV)=="factor") dt5$RQDOV <-as.numeric(levels(dt5$RQDOV))[as.integer(dt5$RQDOV) ]               
if (class(dt5$RQDOV)=="character") dt5$RQDOV <-as.numeric(dt5$RQDOV)
if (class(dt5$RTHAW)=="factor") dt5$RTHAW <-as.numeric(levels(dt5$RTHAW))[as.integer(dt5$RTHAW) ]               
if (class(dt5$RTHAW)=="character") dt5$RTHAW <-as.numeric(dt5$RTHAW)
if (class(dt5$SBANI)!="factor") dt5$SBANI<- as.factor(dt5$SBANI)
if (class(dt5$SCOWL)!="factor") dt5$SCOWL<- as.factor(dt5$SCOWL)
if (class(dt5$SHTAN)=="factor") dt5$SHTAN <-as.numeric(levels(dt5$SHTAN))[as.integer(dt5$SHTAN) ]               
if (class(dt5$SHTAN)=="character") dt5$SHTAN <-as.numeric(dt5$SHTAN)
if (class(dt5$SNPIG)=="factor") dt5$SNPIG <-as.numeric(levels(dt5$SNPIG))[as.integer(dt5$SNPIG) ]               
if (class(dt5$SNPIG)=="character") dt5$SNPIG <-as.numeric(dt5$SNPIG)
if (class(dt5$UNKNO)=="factor") dt5$UNKNO <-as.numeric(levels(dt5$UNKNO))[as.integer(dt5$UNKNO) ]               
if (class(dt5$UNKNO)=="character") dt5$UNKNO <-as.numeric(dt5$UNKNO)
if (class(dt5$UNWAR)=="factor") dt5$UNWAR <-as.numeric(levels(dt5$UNWAR))[as.integer(dt5$UNWAR) ]               
if (class(dt5$UNWAR)=="character") dt5$UNWAR <-as.numeric(dt5$UNWAR)
if (class(dt5$WATTH)=="factor") dt5$WATTH <-as.numeric(levels(dt5$WATTH))[as.integer(dt5$WATTH) ]               
if (class(dt5$WATTH)=="character") dt5$WATTH <-as.numeric(dt5$WATTH)
if (class(dt5$WEVIR)=="factor") dt5$WEVIR <-as.numeric(levels(dt5$WEVIR))[as.integer(dt5$WEVIR) ]               
if (class(dt5$WEVIR)=="character") dt5$WEVIR <-as.numeric(dt5$WEVIR)
if (class(dt5$WWDOV)=="factor") dt5$WWDOV <-as.numeric(levels(dt5$WWDOV))[as.integer(dt5$WWDOV) ]               
if (class(dt5$WWDOV)=="character") dt5$WWDOV <-as.numeric(dt5$WWDOV)
if (class(dt5$YFGRQ)!="factor") dt5$YFGRQ<- as.factor(dt5$YFGRQ)
if (class(dt5$TOTAL)=="factor") dt5$TOTAL <-as.numeric(levels(dt5$TOTAL))[as.integer(dt5$TOTAL) ]               
if (class(dt5$TOTAL)=="character") dt5$TOTAL <-as.numeric(dt5$TOTAL)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt5)                            
attach(dt5)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(JULIAN)
summary(DATE)
summary(WEATHER)
summary(PLOT1)
summary(PLOT2)
summary(WIND)
summary(RAIN)
summary(TIME)
summary(AMRED)
summary(BFGRQ)
summary(BHEUP)
summary(BLAWA)
summary(BQUIT)
summary(BTBLW)
summary(BTGNW)
summary(BWINH)
summary(BWVIR)
summary(BWWAR)
summary(CAREL)
summary(GKNGB)
summary(GNHER)
summary(GRMAN)
summary(KENWA)
summary(LAPEW)
summary(MAGWA)
summary(NOWAT)
summary(PLACE)
summary(ORIOL)
summary(PARUW)
summary(PETER)
summary(PLPIG)
summary(PRAIW)
summary(PRBUL)
summary(PRCUC)
summary(PREME)
summary(PRFLY)
summary(PRTAN)
summary(PRTOD)
summary(PRWPR)
summary(RLTSH)
summary(RQDOV)
summary(RTHAW)
summary(SBANI)
summary(SCOWL)
summary(SHTAN)
summary(SNPIG)
summary(UNKNO)
summary(UNWAR)
summary(WATTH)
summary(WEVIR)
summary(WWDOV)
summary(YFGRQ)
summary(TOTAL) 
# Get more details on character variables

summary(as.factor(dt5$YEAR)) 
summary(as.factor(dt5$JULIAN)) 
summary(as.factor(dt5$WEATHER)) 
summary(as.factor(dt5$PLOT1)) 
summary(as.factor(dt5$PLOT2)) 
summary(as.factor(dt5$WIND)) 
summary(as.factor(dt5$RAIN)) 
summary(as.factor(dt5$LAPEW)) 
summary(as.factor(dt5$PLACE)) 
summary(as.factor(dt5$PLPIG)) 
summary(as.factor(dt5$SBANI)) 
summary(as.factor(dt5$SCOWL)) 
summary(as.factor(dt5$YFGRQ))
detach(dt5)               


inUrl6  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/23/4630183/33c4db6433d7f7f376666e10d4b6c8b0"
infile6 <- tempfile()
try(download.file(inUrl6,infile6,method="curl"))
if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")


dt6 <-read.csv(infile6,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "YEAR",     
                 "JULIAN",     
                 "DATE",     
                 "WEATHER",     
                 "PLOT1",     
                 "PLOT2",     
                 "WIND",     
                 "RAIN",     
                 "TIME",     
                 "AMRED",     
                 "BFGRQ",     
                 "BHEUP",     
                 "BLAWA",     
                 "BQUIT",     
                 "BTBLW",     
                 "BTGNW",     
                 "BWINH",     
                 "BWVIR",     
                 "BWWAR",     
                 "CAREL",     
                 "GKNGB",     
                 "GNHER",     
                 "GRMAN",     
                 "KENWA",     
                 "LAPEW",     
                 "MAGWA",     
                 "NOWAT",     
                 "PLACE",     
                 "ORIOL",     
                 "PARUW",     
                 "PETER",     
                 "PLPIG",     
                 "PRAIW",     
                 "PRBUL",     
                 "PRCUC",     
                 "PREME",     
                 "PRFLY",     
                 "PRTAN",     
                 "PRTOD",     
                 "PRWPR",     
                 "RLTSH",     
                 "RQDOV",     
                 "RTHAW",     
                 "SBANI",     
                 "SCOWL",     
                 "SHTAN",     
                 "SNPIG",     
                 "UNKNO",     
                 "UNWAR",     
                 "WATTH",     
                 "WEVIR",     
                 "WWDOV",     
                 "YFGRQ",     
                 "TOTAL"    ), check.names=TRUE)

unlink(infile6)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt6$YEAR)!="factor") dt6$YEAR<- as.factor(dt6$YEAR)
if (class(dt6$JULIAN)!="factor") dt6$JULIAN<- as.factor(dt6$JULIAN)
if (class(dt6$DATE)=="factor") dt6$DATE <-as.numeric(levels(dt6$DATE))[as.integer(dt6$DATE) ]               
if (class(dt6$DATE)=="character") dt6$DATE <-as.numeric(dt6$DATE)
if (class(dt6$WEATHER)!="factor") dt6$WEATHER<- as.factor(dt6$WEATHER)
if (class(dt6$PLOT1)!="factor") dt6$PLOT1<- as.factor(dt6$PLOT1)
if (class(dt6$PLOT2)!="factor") dt6$PLOT2<- as.factor(dt6$PLOT2)
if (class(dt6$WIND)!="factor") dt6$WIND<- as.factor(dt6$WIND)
if (class(dt6$RAIN)!="factor") dt6$RAIN<- as.factor(dt6$RAIN)
if (class(dt6$AMRED)=="factor") dt6$AMRED <-as.numeric(levels(dt6$AMRED))[as.integer(dt6$AMRED) ]               
if (class(dt6$AMRED)=="character") dt6$AMRED <-as.numeric(dt6$AMRED)
if (class(dt6$BFGRQ)=="factor") dt6$BFGRQ <-as.numeric(levels(dt6$BFGRQ))[as.integer(dt6$BFGRQ) ]               
if (class(dt6$BFGRQ)=="character") dt6$BFGRQ <-as.numeric(dt6$BFGRQ)
if (class(dt6$BHEUP)=="factor") dt6$BHEUP <-as.numeric(levels(dt6$BHEUP))[as.integer(dt6$BHEUP) ]               
if (class(dt6$BHEUP)=="character") dt6$BHEUP <-as.numeric(dt6$BHEUP)
if (class(dt6$BLAWA)=="factor") dt6$BLAWA <-as.numeric(levels(dt6$BLAWA))[as.integer(dt6$BLAWA) ]               
if (class(dt6$BLAWA)=="character") dt6$BLAWA <-as.numeric(dt6$BLAWA)
if (class(dt6$BQUIT)=="factor") dt6$BQUIT <-as.numeric(levels(dt6$BQUIT))[as.integer(dt6$BQUIT) ]               
if (class(dt6$BQUIT)=="character") dt6$BQUIT <-as.numeric(dt6$BQUIT)
if (class(dt6$BTBLW)=="factor") dt6$BTBLW <-as.numeric(levels(dt6$BTBLW))[as.integer(dt6$BTBLW) ]               
if (class(dt6$BTBLW)=="character") dt6$BTBLW <-as.numeric(dt6$BTBLW)
if (class(dt6$BTGNW)=="factor") dt6$BTGNW <-as.numeric(levels(dt6$BTGNW))[as.integer(dt6$BTGNW) ]               
if (class(dt6$BTGNW)=="character") dt6$BTGNW <-as.numeric(dt6$BTGNW)
if (class(dt6$BWINH)=="factor") dt6$BWINH <-as.numeric(levels(dt6$BWINH))[as.integer(dt6$BWINH) ]               
if (class(dt6$BWINH)=="character") dt6$BWINH <-as.numeric(dt6$BWINH)
if (class(dt6$BWVIR)=="factor") dt6$BWVIR <-as.numeric(levels(dt6$BWVIR))[as.integer(dt6$BWVIR) ]               
if (class(dt6$BWVIR)=="character") dt6$BWVIR <-as.numeric(dt6$BWVIR)
if (class(dt6$BWWAR)=="factor") dt6$BWWAR <-as.numeric(levels(dt6$BWWAR))[as.integer(dt6$BWWAR) ]               
if (class(dt6$BWWAR)=="character") dt6$BWWAR <-as.numeric(dt6$BWWAR)
if (class(dt6$CAREL)=="factor") dt6$CAREL <-as.numeric(levels(dt6$CAREL))[as.integer(dt6$CAREL) ]               
if (class(dt6$CAREL)=="character") dt6$CAREL <-as.numeric(dt6$CAREL)
if (class(dt6$GKNGB)=="factor") dt6$GKNGB <-as.numeric(levels(dt6$GKNGB))[as.integer(dt6$GKNGB) ]               
if (class(dt6$GKNGB)=="character") dt6$GKNGB <-as.numeric(dt6$GKNGB)
if (class(dt6$GNHER)=="factor") dt6$GNHER <-as.numeric(levels(dt6$GNHER))[as.integer(dt6$GNHER) ]               
if (class(dt6$GNHER)=="character") dt6$GNHER <-as.numeric(dt6$GNHER)
if (class(dt6$GRMAN)=="factor") dt6$GRMAN <-as.numeric(levels(dt6$GRMAN))[as.integer(dt6$GRMAN) ]               
if (class(dt6$GRMAN)=="character") dt6$GRMAN <-as.numeric(dt6$GRMAN)
if (class(dt6$KENWA)=="factor") dt6$KENWA <-as.numeric(levels(dt6$KENWA))[as.integer(dt6$KENWA) ]               
if (class(dt6$KENWA)=="character") dt6$KENWA <-as.numeric(dt6$KENWA)
if (class(dt6$LAPEW)!="factor") dt6$LAPEW<- as.factor(dt6$LAPEW)
if (class(dt6$MAGWA)=="factor") dt6$MAGWA <-as.numeric(levels(dt6$MAGWA))[as.integer(dt6$MAGWA) ]               
if (class(dt6$MAGWA)=="character") dt6$MAGWA <-as.numeric(dt6$MAGWA)
if (class(dt6$NOWAT)=="factor") dt6$NOWAT <-as.numeric(levels(dt6$NOWAT))[as.integer(dt6$NOWAT) ]               
if (class(dt6$NOWAT)=="character") dt6$NOWAT <-as.numeric(dt6$NOWAT)
if (class(dt6$PLACE)!="factor") dt6$PLACE<- as.factor(dt6$PLACE)
if (class(dt6$ORIOL)=="factor") dt6$ORIOL <-as.numeric(levels(dt6$ORIOL))[as.integer(dt6$ORIOL) ]               
if (class(dt6$ORIOL)=="character") dt6$ORIOL <-as.numeric(dt6$ORIOL)
if (class(dt6$PARUW)=="factor") dt6$PARUW <-as.numeric(levels(dt6$PARUW))[as.integer(dt6$PARUW) ]               
if (class(dt6$PARUW)=="character") dt6$PARUW <-as.numeric(dt6$PARUW)
if (class(dt6$PETER)=="factor") dt6$PETER <-as.numeric(levels(dt6$PETER))[as.integer(dt6$PETER) ]               
if (class(dt6$PETER)=="character") dt6$PETER <-as.numeric(dt6$PETER)
if (class(dt6$PLPIG)!="factor") dt6$PLPIG<- as.factor(dt6$PLPIG)
if (class(dt6$PRAIW)=="factor") dt6$PRAIW <-as.numeric(levels(dt6$PRAIW))[as.integer(dt6$PRAIW) ]               
if (class(dt6$PRAIW)=="character") dt6$PRAIW <-as.numeric(dt6$PRAIW)
if (class(dt6$PRBUL)=="factor") dt6$PRBUL <-as.numeric(levels(dt6$PRBUL))[as.integer(dt6$PRBUL) ]               
if (class(dt6$PRBUL)=="character") dt6$PRBUL <-as.numeric(dt6$PRBUL)
if (class(dt6$PRCUC)=="factor") dt6$PRCUC <-as.numeric(levels(dt6$PRCUC))[as.integer(dt6$PRCUC) ]               
if (class(dt6$PRCUC)=="character") dt6$PRCUC <-as.numeric(dt6$PRCUC)
if (class(dt6$PREME)=="factor") dt6$PREME <-as.numeric(levels(dt6$PREME))[as.integer(dt6$PREME) ]               
if (class(dt6$PREME)=="character") dt6$PREME <-as.numeric(dt6$PREME)
if (class(dt6$PRFLY)=="factor") dt6$PRFLY <-as.numeric(levels(dt6$PRFLY))[as.integer(dt6$PRFLY) ]               
if (class(dt6$PRFLY)=="character") dt6$PRFLY <-as.numeric(dt6$PRFLY)
if (class(dt6$PRTAN)=="factor") dt6$PRTAN <-as.numeric(levels(dt6$PRTAN))[as.integer(dt6$PRTAN) ]               
if (class(dt6$PRTAN)=="character") dt6$PRTAN <-as.numeric(dt6$PRTAN)
if (class(dt6$PRTOD)=="factor") dt6$PRTOD <-as.numeric(levels(dt6$PRTOD))[as.integer(dt6$PRTOD) ]               
if (class(dt6$PRTOD)=="character") dt6$PRTOD <-as.numeric(dt6$PRTOD)
if (class(dt6$PRWPR)=="factor") dt6$PRWPR <-as.numeric(levels(dt6$PRWPR))[as.integer(dt6$PRWPR) ]               
if (class(dt6$PRWPR)=="character") dt6$PRWPR <-as.numeric(dt6$PRWPR)
if (class(dt6$RLTSH)=="factor") dt6$RLTSH <-as.numeric(levels(dt6$RLTSH))[as.integer(dt6$RLTSH) ]               
if (class(dt6$RLTSH)=="character") dt6$RLTSH <-as.numeric(dt6$RLTSH)
if (class(dt6$RQDOV)=="factor") dt6$RQDOV <-as.numeric(levels(dt6$RQDOV))[as.integer(dt6$RQDOV) ]               
if (class(dt6$RQDOV)=="character") dt6$RQDOV <-as.numeric(dt6$RQDOV)
if (class(dt6$RTHAW)=="factor") dt6$RTHAW <-as.numeric(levels(dt6$RTHAW))[as.integer(dt6$RTHAW) ]               
if (class(dt6$RTHAW)=="character") dt6$RTHAW <-as.numeric(dt6$RTHAW)
if (class(dt6$SBANI)!="factor") dt6$SBANI<- as.factor(dt6$SBANI)
if (class(dt6$SCOWL)!="factor") dt6$SCOWL<- as.factor(dt6$SCOWL)
if (class(dt6$SHTAN)=="factor") dt6$SHTAN <-as.numeric(levels(dt6$SHTAN))[as.integer(dt6$SHTAN) ]               
if (class(dt6$SHTAN)=="character") dt6$SHTAN <-as.numeric(dt6$SHTAN)
if (class(dt6$SNPIG)=="factor") dt6$SNPIG <-as.numeric(levels(dt6$SNPIG))[as.integer(dt6$SNPIG) ]               
if (class(dt6$SNPIG)=="character") dt6$SNPIG <-as.numeric(dt6$SNPIG)
if (class(dt6$UNKNO)=="factor") dt6$UNKNO <-as.numeric(levels(dt6$UNKNO))[as.integer(dt6$UNKNO) ]               
if (class(dt6$UNKNO)=="character") dt6$UNKNO <-as.numeric(dt6$UNKNO)
if (class(dt6$UNWAR)=="factor") dt6$UNWAR <-as.numeric(levels(dt6$UNWAR))[as.integer(dt6$UNWAR) ]               
if (class(dt6$UNWAR)=="character") dt6$UNWAR <-as.numeric(dt6$UNWAR)
if (class(dt6$WATTH)=="factor") dt6$WATTH <-as.numeric(levels(dt6$WATTH))[as.integer(dt6$WATTH) ]               
if (class(dt6$WATTH)=="character") dt6$WATTH <-as.numeric(dt6$WATTH)
if (class(dt6$WEVIR)=="factor") dt6$WEVIR <-as.numeric(levels(dt6$WEVIR))[as.integer(dt6$WEVIR) ]               
if (class(dt6$WEVIR)=="character") dt6$WEVIR <-as.numeric(dt6$WEVIR)
if (class(dt6$WWDOV)=="factor") dt6$WWDOV <-as.numeric(levels(dt6$WWDOV))[as.integer(dt6$WWDOV) ]               
if (class(dt6$WWDOV)=="character") dt6$WWDOV <-as.numeric(dt6$WWDOV)
if (class(dt6$YFGRQ)!="factor") dt6$YFGRQ<- as.factor(dt6$YFGRQ)
if (class(dt6$TOTAL)=="factor") dt6$TOTAL <-as.numeric(levels(dt6$TOTAL))[as.integer(dt6$TOTAL) ]               
if (class(dt6$TOTAL)=="character") dt6$TOTAL <-as.numeric(dt6$TOTAL)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt6)                            
attach(dt6)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(YEAR)
summary(JULIAN)
summary(DATE)
summary(WEATHER)
summary(PLOT1)
summary(PLOT2)
summary(WIND)
summary(RAIN)
summary(TIME)
summary(AMRED)
summary(BFGRQ)
summary(BHEUP)
summary(BLAWA)
summary(BQUIT)
summary(BTBLW)
summary(BTGNW)
summary(BWINH)
summary(BWVIR)
summary(BWWAR)
summary(CAREL)
summary(GKNGB)
summary(GNHER)
summary(GRMAN)
summary(KENWA)
summary(LAPEW)
summary(MAGWA)
summary(NOWAT)
summary(PLACE)
summary(ORIOL)
summary(PARUW)
summary(PETER)
summary(PLPIG)
summary(PRAIW)
summary(PRBUL)
summary(PRCUC)
summary(PREME)
summary(PRFLY)
summary(PRTAN)
summary(PRTOD)
summary(PRWPR)
summary(RLTSH)
summary(RQDOV)
summary(RTHAW)
summary(SBANI)
summary(SCOWL)
summary(SHTAN)
summary(SNPIG)
summary(UNKNO)
summary(UNWAR)
summary(WATTH)
summary(WEVIR)
summary(WWDOV)
summary(YFGRQ)
summary(TOTAL) 
# Get more details on character variables

summary(as.factor(dt6$YEAR)) 
summary(as.factor(dt6$JULIAN)) 
summary(as.factor(dt6$WEATHER)) 
summary(as.factor(dt6$PLOT1)) 
summary(as.factor(dt6$PLOT2)) 
summary(as.factor(dt6$WIND)) 
summary(as.factor(dt6$RAIN)) 
summary(as.factor(dt6$LAPEW)) 
summary(as.factor(dt6$PLACE)) 
summary(as.factor(dt6$PLPIG)) 
summary(as.factor(dt6$SBANI)) 
summary(as.factor(dt6$SCOWL)) 
summary(as.factor(dt6$YFGRQ))
detach(dt6)               





