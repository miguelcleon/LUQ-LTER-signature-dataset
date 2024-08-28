

source('./LUQ174rainAndThroughfallChemAndAmounts.R')
library(lubridate)
library(tidyverse)
#
rainfallthroughfalBasic <- dt2
summary(rainfallthroughfalBasic)
# Weekly.amount.collected
head(rainfallthroughfalBasic)

rainfallthroughfalBasic$Date <- as.Date(rainfallthroughfalBasic$Sample.Date, format="%m/%d/%Y 0:00:00")
rainfallthroughfalBasic$time <- format(rainfallthroughfalBasic$time, format = "%I:%M %p")
rainfallthroughfalBasic$Weekly.amount.collected <- as.numeric(rainfallthroughfalBasic$Weekly.amount.collected) 
tail(rainfallthroughfalBasic)
unique(rainfallthroughfalBasic$Sample.Code)
# TCB is throughfall bisley 
# RCB is bluk rainfall collector Bisley
# RCEV is bulk Rain collector el verde  
# WDEV is closes when it is not raining - Wet-Dry El Verde 
# RCEP is bulk rain collector east peak
rcev <- rainfallthroughfalBasic %>% filter(Sample.Code == "RCEV") %>%
  select(Date, Weekly.amount.collected,Amount_Unit)%>% 
  rename(Date=Date, rain_rcev= Weekly.amount.collected, Amount_Unit=Amount_Unit)

tcb <- rainfallthroughfalBasic %>% filter(Sample.Code == "TCB") %>%
  select(Date, Weekly.amount.collected,Amount_Unit)%>% 
  rename(Date=Date, rain_tcb= Weekly.amount.collected, Amount_Unit=Amount_Unit)

rcb <- rainfallthroughfalBasic %>% filter(Sample.Code == "RCB") %>%
  select(Date, Weekly.amount.collected,Amount_Unit) %>% 
  rename(Date=Date, rain_rcb= Weekly.amount.collected, Amount_Unit=Amount_Unit)

# convert rcev rainfall to mm
rcev <- rcev %>%
  mutate(rain_rcev  = ifelse(Amount_Unit == "inch", rain_rcev * 2.54, rain_rcev)) %>%
  select(Date, rain_rcev,Amount_Unit)

rcev <- rcev %>%
  filter(Amount_Unit %in% c("cm","inch")  | is.na(Amount_Unit)) %>%
  select(Date, rain_rcev) %>%
  rename(Date=Date, rain_rcev_mm= rain_rcev)

tcb <- tcb %>%
  filter(Amount_Unit == "mm"  | is.na(Amount_Unit)) %>%
  select(Date, rain_tcb) %>%
  rename(Date=Date, rain_tcb_mm= rain_tcb)


rcb <- rcb %>%
  filter(Amount_Unit == "mm"  | is.na(Amount_Unit))  %>%
  select(Date, rain_rcb)%>%
  rename(Date=Date, rain_rcb_mm= rain_rcb)

summary(rcb)
# summary rain amounts look wrong
summary(rcev)
#this one is really wrong
tcb$Year <- 
# tcb_year <- tcb %>% 

tcb$year <- year(tcb$Date)
tcb_year <- tcb %>% group_by(year) %>% 
  summarise(annual_rain_tcb_mm=sum(rain_tcb_mm, na.rm = TRUE))

rcb$year <- year(rcb$Date)
rcb_year <- rcb %>% group_by(year) %>% 
  summarise(annual_rain_rcb_mm=sum(rain_rcb_mm, na.rm = TRUE))

#these rainfall amounts can't be correct???


bulkrainev <- dt4
wetdryev <- dt5

summary(bulkrainev)
bulkrainev$Na <- as.numeric(bulkrainev$Na)

names(bulkrainev)
# if PotassiumCode is BDL then K is NA
bulkrainev$K <- as.numeric(bulkrainev$K)
bulkrainev$K[bulkrainev$PotassiumCode == "BDL"] <- NA
# if MagnesiumCode is BDL then Mg is NA
bulkrainev$Mg <- as.numeric(bulkrainev$Mg)
bulkrainev$Mg[bulkrainev$MagnesiumCode == "BDL"] <- NA
# if CalciumCode is BDL then Ca is NA
bulkrainev$Ca <- as.numeric(bulkrainev$Ca)
bulkrainev$Ca[bulkrainev$CalciumCode == "BDL"] <- NA
# if NH4Code is BDL then NH4N is NA
bulkrainev$NH4.hyphen.N <- as.numeric(bulkrainev$NH4.hyphen.N)
bulkrainev$NH4.hyphen.N[bulkrainev$NH4Code == "BDL"] <- NA
# if PO4Code is BDL then PO4P is NA
bulkrainev$PO4.hyphen.P <- as.numeric(bulkrainev$PO4.hyphen.P)
bulkrainev$PO4.hyphen.P[bulkrainev$PO4Code == "BDL"] <- NA
# if DOCCode is BDL then DOC is NA
bulkrainev$DOC <- as.numeric(bulkrainev$DOC)
bulkrainev$DOC[bulkrainev$DOCCode == "BDL"] <- NA
# if DICCode is BDL then DIC is NA
bulkrainev$DIC <- as.numeric(bulkrainev$DIC)
bulkrainev$DIC[bulkrainev$DICCode == "BDL"] <- NA
# if TDNCode is BDL then TDN is NA
bulkrainev$TDN <- as.numeric(bulkrainev$TDN)
bulkrainev$TDN[bulkrainev$TDNCode == "BDL"] <- NA
# if SiO2Code is BDL then SiO2 is NA
bulkrainev$SiO2 <- as.numeric(bulkrainev$SiO2)
bulkrainev$SiO2[bulkrainev$SiO2Code == "BDL"] <- NA


bulkrainevv2 <- bulkrainev %>%
  select(Sample_Date, Cond, Cl,pH, K, Na, Mg, Ca, NO3.hyphen.N,
         "NH4.hyphen.N", "PO4.hyphen.P",
  DOC, DIC, TDN, TDP, DIC) %>%
  rename(Date=Sample_Date,
         Cond_blkrainev=Cond,
         pH_blkrainev=pH,
         Cl_blkrainev=Cl,
         Na_blkrainev=Na,
         K_blkrainev=K,
         Mg_blkrainev=Mg,
         Ca_blkrainev=Ca,
         NO3N_blkrainev=NO3.hyphen.N,
  NH4N_blkrainev=NH4.hyphen.N,
         PO4P_blkrainev=PO4.hyphen.P,
  DOC_blkrainev=DOC,
         DIC_blkrainev=DIC,
         TDN_blkrainev=TDN,
    TDP_blkrainev=TDP,
    DIC_blkrainev=DIC)



names(wetdryev)
# if PotassiumCode is BDL then K is NA
wetdryev$K <- as.numeric(wetdryev$K)
wetdryev$K[wetdryev$PotassiumCode == "BDL"] <- NA
# if MagnesiumCode is BDL then Mg is NA
wetdryev$Mg <- as.numeric(wetdryev$Mg)
wetdryev$Mg[wetdryev$MagnesiumCode == "BDL"] <- NA
# if CalciumCode is BDL then Ca is NA
wetdryev$Ca <- as.numeric(wetdryev$Ca)
wetdryev$Ca[wetdryev$CalciumCode == "BDL"] <- NA
# if NH4Code is BDL then NH4N is NA
wetdryev$NH4.hyphen.N <- as.numeric(wetdryev$NH4.hyphen.N)
wetdryev$NH4.hyphen.N[wetdryev$NH4Code == "BDL"] <- NA
# if PO4Code is BDL then PO4P is NA
wetdryev$PO4.hyphen.P <- as.numeric(wetdryev$PO4.hyphen.P)
wetdryev$PO4.hyphen.P[wetdryev$PO4Code == "BDL"] <- NA
# if DOCCode is BDL then DOC is NA
wetdryev$DOC <- as.numeric(wetdryev$DOC)
wetdryev$DOC[wetdryev$DOCCode == "BDL"] <- NA
# if DICCode is BDL then DIC is NA
wetdryev$DIC <- as.numeric(wetdryev$DIC)
wetdryev$DIC[wetdryev$DICCode == "BDL"] <- NA
# if TDNCode is BDL then TDN is NA
wetdryev$TDN <- as.numeric(wetdryev$TDN)
wetdryev$TDN[wetdryev$TDNCode == "BDL"] <- NA
# if SiO2Code is BDL then SiO2 is NA
wetdryev$SiO2 <- as.numeric(wetdryev$SiO2)
wetdryev$SiO2[wetdryev$SiO2Code == "BDL"] <- NA

wetdryev$TDP <- as.numeric(wetdryev$TDP)
wetdryevv2 <- wetdryev %>%
  select(Sample_Date, Cond,pH, Cl, K, Na, Mg, Ca, NO3.hyphen.N,
         "NH4.hyphen.N", "PO4.hyphen.P",
  DOC, DIC, TDN, TDP, DIC) %>%
  rename(Date=Sample_Date,
         Cond_rainev=Cond,
            pH_rainev=pH,
         Cl_rainev=Cl,
         Na_rainev=Na,
         K_rainev=K,
         Mg_rainev=Mg,
         Ca_rainev=Ca,
         NO3N_rainev=NO3.hyphen.N,
  NH4N_rainev=NH4.hyphen.N,
         PO4P_rainev=PO4.hyphen.P,
  DOC_rainev=DOC,
         DIC_rainev=DIC,
         TDN_rainev=TDN,
    TDP_rainev=TDP,
    DIC_rainev=DIC)

wetdryevv2 <- wetdryevv2 %>%
  group_by(Date) %>%
  summarise(across(everything(), mean, na.rm = TRUE))