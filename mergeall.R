# Miguel Leon 5-18-23
# combine meterological data with pheno data. 
# C:\Users\ml1451\OneDrive - USNH\signature datasets



setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/")

source("./pheno88postprocess.R")
source("./LUQ14EDIPrecip.R")
library(lubridate)
# add precip to pheno
summary(dt2)
summary(dt3)
summary(dt4)
summary(phenoedi_seeds)
dt2 <- rbind(dt2, dt3)
dt2$Field.Comments <- ''
dtprecip <- rbind(dt2, dt4)




source("./LUQ16EDIMaxTemp.R")
dt2 <- rbind(dt1, dt2)
dt2$Field.Comments <- ''
dtmaxtemp <- rbind(dt2, dt3)
source("./LUQ17EDIMinTemp.R")

dt2 <- rbind(dt1, dt2)
dt2 <- rbind(dt2, dt3)
dt2$Field.Comments <- ''
dtmintemp <- rbind(dt2, dt4)

dtmintemp<- dtmintemp %>%
  mutate(DATE = as_date(strptime(Date, "%m/%d/%Y")))

pheno_met <- merge(x=dtmintemp, y=dtprecip, 
                   by.x= "DATE", by.y="DATE", all.x=TRUE)

pheno_met <- merge(x=pheno_met, y=dtmaxtemp, 
                             by.x= "DATE", by.y="DATE", all.x=TRUE, )
# columens are bad? 
#pheno_met <- select(pheno_met, -c(YEAR.y,JULIAN.y, Field.Comments.y) )
# tail(pheno_met)



# ADD solar radiation - 
summary(pheno_met)
print("are all values dates in DATE?") 
all(is.Date(pheno_met$DATE))
print("are all values numeric in YEAR.x")
all(is.numeric(pheno_met$YEAR.x))
print("no they aren't so let's extract that from the date later")
# thes are daily rainfall, maxtemp, mintemp
names(pheno_met)
# get just the columns we want
pheno_met_sub <- pheno_met %>% select(DATE, RAINFALL..paren.MM.paren., MINTEMP.paren.C.paren., 
                                  MAXTEMP.paren.C.paren.)
pheno_met_sub <- pheno_met_sub %>% rename(Date = DATE, rainfall_mm= RAINFALL..paren.MM.paren., 
                                      minDailyTempC_belowCanopy = MINTEMP.paren.C.paren.,  maxDailyTempC_belowCanopy = MAXTEMP.paren.C.paren.)

summary(pheno_met_sub)


source("./LUQ127EDINADPMet.R")

# dtmet<- dt1 %>%
#   mutate(Date = as_date(strptime(Date.of.measurements, "%Y-%m-%d")))
# dtmet <- dt1 %>%
#   mutate(
#     Date = as.Date(Date.of.measurements, format = "%Y-%d-%m")
#   )

# date formats are screwed up
df <- dt1 %>%
  slice(which(Date.of.measurements < "2021-01-01"))

df2 <- dt1 %>%
  slice(which(Date.of.measurements >= "2021-01-01"))

dtmetp1 <- df %>% mutate(
  Date = as.Date(Date.of.measurements, format = "%Y-%d-%m"))

dtmetp2 <- df2 %>% mutate(
  Date = as.Date(Date.of.measurements, format = "%Y-%m-%d"))

dtmet <- rbind(dtmetp1, dtmetp2)
# date formats are screwed up

summary(dtmet)


dtmet <- dtmet %>% select(Date, RAIN_MM, TEMPMIN_DEGREESCELSIUS, TEMPMAX_DEGREESCELSIUS, SOLARRAD_KJOULES_M2,PPFD_MILLIMOLES_M2,
                          WINDSPEEDAVER_M_S, WINDDIR_DEGREES)

dtmet <- dtmet %>% rename(Date=Date, rainfall_mm_nadp= RAIN_MM, 
                          minDailyTempC_nadp = TEMPMIN_DEGREESCELSIUS,  
                          maxDailyTempC_nadp = TEMPMAX_DEGREESCELSIUS,
                          solarrad_kj_m2_nadp=SOLARRAD_KJOULES_M2, 
                          ppfd_millimoles_m2_nadp=PPFD_MILLIMOLES_M2,
                          windspeed_ms_nadp=WINDSPEEDAVER_M_S, 
                          winddir_degrees_nadp=WINDDIR_DEGREES)
summary(dtmet)
summary(pheno_met_sub)
pheno_met_sub2 <- merge(x=pheno_met_sub, y= dtmet, 
                                  by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)

summary(pheno_met_sub2)
# add discharge at QP0
# qp0discharge_day
source("./QPDIschargePostprocess.R")

pheno_met_sub2 <- merge(x=pheno_met_sub2, y= qp0discharge_day, 
                        by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
summary(pheno_met_sub2)

source("./rainthroughchemAndAmountPostprocess.R")

pheno_met_sub2 <- merge(x=pheno_met_sub2, y= wetdryevv2,
                        by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
summary(pheno_met_sub2)

source("./streamChemPostProcess.R")

pheno_met_sub2 <- merge(x=pheno_met_sub2, y= QSChemv2,
                        by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
# QPChemv2
pheno_met_sub2 <- merge(x=pheno_met_sub2, y= QPChemv2,
                        by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)

# write.csv(pheno_met_sub2, file = "met_data_daily.csv", row.names = FALSE)

write.csv(pheno_met_sub2, file = "met_data_daily_withEVRainAndQSChem.csv", row.names = FALSE)


nadpmet_nonena <- dtmet %>%
  summarise_all(funs(sum(!is.na(.))))
met_nonena <- pheno_met_sub2 %>%
  summarise_all(funs(sum(!is.na(.))))
nadpmet_nonena
met_nonena
# why did 1/2 of the nadp values get dropped? - because some dates where badly formatted see # date formats are screwed up

source("./Shrimp54PostProcess.R")


df_met_shrimp <- pheno_met_sub2 %>%
  left_join(shrimpdata, by = "Date")

df_met_shrimp$XIPHCPUE <- as.numeric(df_met_shrimp$XIPHCPUE)
df_met_shrimp$ATYACPUE <- as.numeric(df_met_shrimp$ATYACPUE)
df_met_shrimp$MACCPUE <- as.numeric(df_met_shrimp$MACCPUE)

summary(df_met_shrimp)

#Add birds

source("./LFDPBirdspostprocess.R")
df_met_shrimp <- left_join(df_met_shrimp, LFDPBirds, by=c("Date"))

summary(df_met_shrimp)
write.csv(df_met_shrimp, file = "met_shrimp_birds_data_daily.csv", row.names = FALSE)


# unique(df_met_shrimp$ATYACPUE)
df_met_shrimp$month <-floor_date(df_met_shrimp$Date, "month")

# df_met_shrimp$Month <- month(df_met_shrimp$Date)
# df_met_shrimp$Year <- year(df_met_shrimp$Date)
# 
summary(df_met_shrimp)
df_monthly_met_shrimp <- df_met_shrimp %>%
  group_by(month,bird_species_LFDP) %>%
  summarise(
    bird_count_LFDP  = sum(bird_count_LFDP, na.rm=TRUE),
    XIPHCPUE = sum(XIPHCPUE,na.rm = TRUE),
    ATYACPUE = sum(ATYACPUE,na.rm = TRUE),
    MACCPUE  = sum(MACCPUE,na.rm = TRUE),
    minAvgMonthlyTempC = mean(minDailyTempC_belowCanopy ,na.rm = TRUE),
    MaxAvgDailyTempC = mean(maxDailyTempC_belowCanopy ,na.rm = TRUE),
    totrainfall_mm = sum(rainfall_mm,na.rm = TRUE),
    totrainfall_mm_nadp  =sum(rainfall_mm_nadp,na.rm = TRUE), 
    MinAvgDailyTempC_nadp = mean(minDailyTempC_nadp ,na.rm = TRUE),
    MaxAvgDailyTempC_nadp = mean(maxDailyTempC_nadp  ,na.rm = TRUE),
    meandailysolarrad_kj_m2_nadp = mean(solarrad_kj_m2_nadp  ,na.rm = TRUE),
    mean_discharge__qp0_m3_s = mean(mean_discharge__qp0_m3_s, na.rm = TRUE),
    max_discharge__qp0_m3_s = max(max_discharge__qp0_m3_s, na.rm=TRUE ),
    min_discharge_qp0_m3_s = min(min_discharge_qp0_m3_s, na.rm=TRUE),
    mean_rainev_COND = mean(Cond_rainev, na.rm=TRUE),
    mean_rainev_pH = mean(pH_rainev, na.rm=TRUE),
    mean_rainev_Cl= mean(Cl_rainev, na.rm=TRUE),
    mean_rainev_Na= mean(Na_rainev, na.rm=TRUE),
    mean_rainev_K= mean(K_rainev, na.rm=TRUE),
    mean_rainev_Mg= mean(Mg_rainev, na.rm=TRUE),
    mean_rainev_Ca= mean(Ca_rainev, na.rm=TRUE),
    mean_rainev_NO3N= mean(NO3N_rainev, na.rm=TRUE),
    mean_rainev_NH4N= mean(NH4N_rainev, na.rm=TRUE),
    mean_rainev_PO4P= mean(PO4P_rainev, na.rm=TRUE),
    mean_rainev_DOC= mean(DOC_rainev, na.rm=TRUE),
    mean_rainev_DIC= mean(DIC_rainev, na.rm=TRUE),
    mean_rainev_TDN= mean(TDN_rainev, na.rm=TRUE),
    mean_rainev_TDP= mean(TDP_rainev, na.rm=TRUE),
    mean_rainev_DIC= mean(DIC_rainev, na.rm=TRUE),
    mean_streamqs_COND = mean(Cond_QS, na.rm=TRUE),
    mean_streamqs_pH = mean(pH_QS, na.rm=TRUE),
    mean_streamqs_Cl= mean(Cl_QS, na.rm=TRUE),
    mean_streamqs_Na= mean(Na_QS, na.rm=TRUE),
    mean_streamqs_K= mean(K_QS, na.rm=TRUE),
    mean_streamqs_Mg= mean(Mg_QS, na.rm=TRUE),
    mean_streamqs_Ca= mean(Ca_QS, na.rm=TRUE),
    mean_streamqs_NO3N= mean(NO3N_QS, na.rm=TRUE),
    mean_streamqs_NH4N= mean(NH4N_QS, na.rm=TRUE),
    mean_streamqs_PO4P= mean(PO4P_QS, na.rm=TRUE),
    mean_streamqs_DOC= mean(DOC_QS, na.rm=TRUE),
    mean_streamqs_DIC= mean(DIC_QS, na.rm=TRUE),
    mean_streamqs_TDN= mean(TDN_QS, na.rm=TRUE),
    mean_streamqs_TDP= mean(TDP_QS, na.rm=TRUE),
    mean_streamqs_DIC= mean(DIC_QS, na.rm=TRUE),
    mean_streamqs_TSS= mean(TSS_QS, na.rm=TRUE),
    mean_streamqs_SO4= mean(SO4_QS, na.rm=TRUE),
    mean_streamqs_DON= mean(DON_QS, na.rm=TRUE),
    mean_streamqp_COND = mean(Cond_QP, na.rm=TRUE),
    mean_streamqp_pH = mean(pH_QP, na.rm=TRUE),
    mean_streamqp_Cl= mean(Cl_QP, na.rm=TRUE),
    mean_streamqp_Na= mean(Na_QP, na.rm=TRUE),
    mean_streamqp_K= mean(K_QP, na.rm=TRUE),
    mean_streamqp_Mg= mean(Mg_QP, na.rm=TRUE),
    mean_streamqp_Ca= mean(Ca_QP, na.rm=TRUE),
    mean_streamqp_NO3N= mean(NO3N_QP, na.rm=TRUE),
    mean_streamqp_NH4N= mean(NH4N_QP, na.rm=TRUE),
    mean_streamqp_PO4P= mean(PO4P_QP, na.rm=TRUE),
    mean_streamqp_DOC= mean(DOC_QP, na.rm=TRUE),
    mean_streamqp_DIC= mean(DIC_QP, na.rm=TRUE),
    mean_streamqp_TDN= mean(TDN_QP, na.rm=TRUE),
    mean_streamqp_TDP= mean(TDP_QP, na.rm=TRUE),
    mean_streamqp_DIC= mean(DIC_QP, na.rm=TRUE),
    mean_streamqp_TSS= mean(TSS_QP, na.rm=TRUE),
    mean_streamqp_SO4= mean(SO4_QP, na.rm=TRUE),
    mean_streamqp_DON= mean(DON_QP, na.rm=TRUE),
  )
# unique(df_monthly_met_shrimp$ATYACPUE)
summary(df_monthly_met_shrimp)
is_inf <- is.infinite(df_monthly_met_shrimp$max_discharge__qp0_m3_s)
df_monthly_met_shrimp$max_discharge__qp0_m3_s[is_inf] <- NA

is_inf <- is.infinite(df_monthly_met_shrimp$min_discharge_qp0_m3_s)
df_monthly_met_shrimp$min_discharge_qp0_m3_s[is_inf] <- NA
summary(df_monthly_met_shrimp)


# qp0discharge_month <- qp0discharge_month %>% select(month, mean_discharge__qp0_m3_s, 
#                                                     max_discharge__qp0_m3_s, min_discharge_qp0_m3_s)
# df_monthly_met_shrimp <- df_monthly_met_shrimp %>%
#   left_join(qp0discharge_month, by = "month")
# summary(df_monthly_met_shrimp)
#### ADD QP0 discharge


source("./pheno88postprocess.R")
summary(phenoseedsAndFlowers)

phenoseedsAndFlowers$Date = as.Date(phenoseedsAndFlowers$Date, format = "%Y-%m-%d")
phenoseedsAndFlowers$month <-floor_date(phenoseedsAndFlowers$Date, "month")



df_monthly_seeds_flowers <- phenoseedsAndFlowers %>%
  group_by(month, Plant.ID) %>%
  summarise( mean_monthly_seeds.per.m2 = mean(seeds.per.m2,na.rm = TRUE),
             mean_monthly_flowers.per.m2 = mean(flowers.per.m2,na.rm = TRUE))


df_met_shrimp_pheno <- left_join(df_met_shrimp, phenoseedsAndFlowers, by=c("Date"))

df_met_shrimp_phenmonthly <- left_join(df_monthly_met_shrimp, df_monthly_seeds_flowers, by=c("month"))


df_met_shrimp_phenmonthly <- df_met_shrimp_phenmonthly %>%
  mutate_at(vars(XIPHCPUE, ATYACPUE, MACCPUE,
                 totrainfall_mm_nadp,totrainfall_mm,bird_count_LFDP), ~replace(., . == 0, NA))


df_met_shrimp_pheno <- df_met_shrimp_pheno %>% arrange(Date)
# shrimp are shrimp per trap 

write.csv(df_met_shrimp_pheno, file = "met__shrimp_birds_pheno_data_daily.csv", row.names = FALSE)



#make monthly summary

summary(df_met_shrimp_pheno)
#EDI thinks shrimp are factors convert them to numbers 



# 
# df_monthly <- df_met_shrimp_pheno %>%
#   group_by(month, Plant.ID) %>%
#   summarise(
#     XIPHCPUE = sum(XIPHCPUE,na.rm = TRUE),
#     ATYACPUE = sum(ATYACPUE,na.rm = TRUE),
#     MACCPUE  = sum(MACCPUE,na.rm = TRUE),
#     seedsum = sum(seedsum,na.rm = TRUE),
#     flowersum = sum(flowersum,na.rm = TRUE),
#     minAvgMonthlyTempC = mean(minDailyTempC,na.rm = TRUE),
#     maxAvgMonthlyTempC = mean(maxDailyTempC,na.rm = TRUE),
#     solarrad_kj_m2_mean_daily_nadp = mean(solarrad_kj_m2_nadp,na.rm = TRUE  ),
#     totrainfall_mm_nadp = mean(rainfall_mm_nadp,na.rm = TRUE  ),
#     totrainfall_mm = sum(rainfall_mm,na.rm = TRUE),
#     windspeed_ms_mean_nadp = mean(windspeed_ms_nadp, na.rm=TRUE),  
#     ppfd_millimoles_m2_mean_daily_nadp     = mean(ppfd_millimoles_m2_nadp , na.rm=TRUE), 
#   )
# unique(df_monthly$MACCPUE)
write.csv(df_met_shrimp_phenmonthly, file = "met__shrimp_pheno_birds_data_monthly.csv", row.names = FALSE)
summary(pheno_met_sub2)
pheno_met_sub2$Year <- as.integer(year(strptime(pheno_met_sub2$Date, "%Y-%m-%d")))


df_yearly_rainfall <- pheno_met_sub2 %>%
  group_by(Year) %>%
  summarise( totrainfall_mm = sum(rainfall_mm,na.rm = TRUE)) %>%
  filter(Year>1989)

write.csv(df_yearly_rainfall, file = "df_yearly_rainfall.csv", row.names = FALSE)