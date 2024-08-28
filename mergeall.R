# Miguel Leon 5-18-23
# combine meterological data with pheno data. 
# C:\Users\ml1451\OneDrive - USNH\signature datasets



setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/LUQ-LTER-signature-dataset/")

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
dt4 <- dt4 %>% select(DATE, YEAR, JULIAN, RAINFALL..paren.MM.paren., Field.Comments)
dt2 <- dt2 %>%
  rename(Date = DATE)
dt2<- dt2 %>%
  mutate(Date = as.Date(Date,  "%Y-%m-%d" )) #
dt4 <- dt4 %>%
  rename(Date = DATE)

dtprecip <- rbind(dt2, dt4)



duplicates <- dtprecip %>%
  group_by(Date) %>%
  filter(n() > 1)

# View duplicates
print(duplicates)


source("./LUQ16EDIMaxTemp.R")
dt2 <- rbind(dt1, dt2)
dt2$Field.Comments <- ''
dt2 <- dt2 %>% select(DATE, YEAR, JULIAN, MAXTEMP.paren.C.paren., Field.Comments)
dt3 <- dt3 %>% select(DATE, YEAR, JULIAN, MAXTEMP.paren.C.paren., Field.Comments)
dtmaxtemp <- rbind(dt2, dt3)
# dtmaxtemp <- dtmaxtemp %>%
#   mutate(
#     YEAR = as.numeric(as.character(YEAR)),
#     JULIAN = as.numeric(as.character(JULIAN)),
#     Date = as.Date(JULIAN - 1, origin = paste0(YEAR, "-01-01"))
#   )
dtmaxtemp <- dtmaxtemp %>%
  rename(Date = DATE)

duplicates <- dtmaxtemp %>%
  group_by(Date) %>%
  filter(n() > 1)

# View duplicates
print(duplicates)

source("./LUQ17EDIMinTemp.R")

dt2 <- rbind(dt1, dt2)
dt2 <- rbind(dt2, dt3)
dt2$Field.Comments <- ''
# dt2 <- dt2 %>% rename("DATE" = "Date")
# dt4 <- dt4 %>% rename("DATE" = "Date")
dt4 <- dt4 %>% select(Date, YEAR, JULIAN, MINTEMP.paren.F.paren.,MINTEMP.paren.C.paren., Field.Comments)
dtmintemp <- rbind(dt2, dt4)

dtmintemp <- dtmintemp %>%
  mutate(Date = ifelse(is.na(as_date(strptime(Date, "%m/%d/%Y"))),
                       as_date(strptime(Date, "%Y-%m-%d")),
                       as_date(strptime(Date, "%m/%d/%Y"))))



# pheno_met <- merge(x=dtmintemp, y=dtprecip,
#                    by.x= "DATE", by.y="DATE", all.x=TRUE)
dtmintemp <- dtmintemp %>%
  mutate(Date = as.Date(Date, origin = "1970-01-01"))

dtmaxtemp <- dtmaxtemp %>%
  mutate(Date = as.Date(Date, origin = "1970-01-01"))

# Now perform the left join
pheno_met <- dtmintemp %>%
  left_join(dtmaxtemp, by = "Date")
pheno_met <- pheno_met %>%
  left_join(dtprecip, by = "Date")
# pheno_met <- merge(x=pheno_met, y=dtmaxtemp,
#                              by.x= "DATE", by.y="DATE", all.x=TRUE, )
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
pheno_met_sub <- pheno_met %>% select(Date, RAINFALL..paren.MM.paren., MINTEMP.paren.C.paren.,
                                  MAXTEMP.paren.C.paren.)
pheno_met_sub <- pheno_met_sub %>% rename(rainfall_mm= RAINFALL..paren.MM.paren.,
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

# dt1 is hourly
# dtmetp1 <- dt1 %>% mutate(
#   Date = as.Date(Date.of.measurements, format ="%m/%d/%Y" )) #  "%Y-%m-%d"

# just use daily which is dt2
dtmetp2 <- dt2 %>% mutate(
  Date =datetime) # "%Y-%m-%d"

# df <- dtmetp1 %>%
#   filter(Date < as.Date("2021-01-01"))

# df2 <- dtmetp2 %>%
#   filter(Date >= as.Date("2021-01-01"))

dtmet <- dtmetp2
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
# pheno_met_sub2 <- merge(x=pheno_met_sub, y= dtmet,
#                                   by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
print(sum(duplicated(summary(dtmet$Date))))


pheno_met_sub2 <- pheno_met_sub %>%
  left_join(dtmet, by = "Date")


summary(pheno_met_sub2)
# add discharge at QP0
# qp0discharge_day
source("./QPDIschargePostprocess.R")

# pheno_met_sub2 <- merge(x=pheno_met_sub2, y= qp0discharge_day,
#                         by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
pheno_met_sub2 <- pheno_met_sub2 %>%
  left_join(qp0discharge_day, by = "Date")
summary(pheno_met_sub2)

source("./rainthroughchemAndAmountPostprocess.R")

# pheno_met_sub2 <- merge(x=pheno_met_sub2, y= wetdryevv2,
#                         by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
pheno_met_sub2 <- pheno_met_sub2 %>%
  left_join(wetdryevv2, by = "Date")

summary(pheno_met_sub2)

source("./streamChemPostProcess.R")

# pheno_met_sub2 <- merge(x=pheno_met_sub2, y= QSChemv2,
#                         by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)

# a few dates contain multiple rows
QSChemv2 <- QSChemv2 %>%
  group_by(Date) %>%
  summarise(across(everything(), mean, na.rm = TRUE))


pheno_met_sub3 <- pheno_met_sub2 %>%
  left_join(QSChemv2, by = "Date")

# QPChemv2
QPChemv2 <- QPChemv2 %>%
  group_by(Date) %>%
  summarise(across(everything(), mean, na.rm = TRUE))


pheno_met_sub3 <- pheno_met_sub3 %>%
  left_join(QPChemv2, by = "Date")

# write.csv(pheno_met_sub2, file = "met_data_daily.csv", row.names = FALSE)

write.csv(pheno_met_sub3, file = "met_data_daily_withEVRainAndQSandQPChem.csv", row.names = FALSE, na = "")

save.image("signaturedatasetAbiotic.RData")

nadpmet_nonena <- dtmet %>%
  summarise_all(funs(sum(!is.na(.))))
met_nonena <- pheno_met_sub3 %>%
  summarise_all(funs(sum(!is.na(.))))
nadpmet_nonena
met_nonena
# why did 1/2 of the nadp values get dropped? - because some dates where badly formatted see # date formats are screwed up

source("./Shrimp54PostProcessKeepPools.R")

#THERE IS SOMETHING WRONG WITH THE SHIRMP DATA, I'm getting three times the number of rows I should be getting
df_met_shrimp <- pheno_met_sub3 %>%
  left_join(shrimpdata, by = "Date")

# df_met_shrimp$XIPHCPUE <- as.numeric(df_met_shrimp$XIPHCPUE)
# df_met_shrimp$ATYACPUE <- as.numeric(df_met_shrimp$ATYACPUE)
# df_met_shrimp$MACCPUE <- as.numeric(df_met_shrimp$MACCPUE)

summary(df_met_shrimp)
print(sum(duplicated(summary(df_met_shrimp$Date))))


summary(df_met_shrimp)
print(sum(duplicated(summary(df_met_shrimp$Date))))
write.csv(df_met_shrimp, file = "met_shrimp_data_dailywithEVRainAndQSChem.csv", row.names = FALSE, na = "")


print(sum(duplicated(summary(df_daily_seeds_flowers_plantid$Date))))

df_met_shrimp_pheno <- df_met_shrimp %>%
  left_join(phenoseedsAndFlowers, by = "Date")

print(sum(duplicated(summary(df_met_shrimp_pheno$Date))))

write.csv(df_met_shrimp_pheno, file = "met_data_daily_pheno_shrimp_withEVRainAndQSChem.csv", row.names = FALSE, na = "")

#Add birds

source("./LFDPBirdspostprocess.R")
print(sum(duplicated(summary(LFDPBirds$Date))))
LFDPBirds <- LFDPBirds %>%
  group_by(Date) %>%
  summarise_all(sum, na.rm = TRUE)

LFDPBirds <- LFDPBirds %>%
  rename(total_bird_count = TOTAL)

df_met_shrimp_pheno_birds_chem <- left_join(df_met_shrimp_pheno, LFDPBirds, by=c("Date"))

print(sum(duplicated(summary(df_met_shrimp_pheno_birds_chem$Date))))

#DUP DATES EXIST!!!!!
#DUP DATES EXIST!!!!! not any more

write.csv(df_met_shrimp_pheno_birds_chem, file = "met_data_daily_pheno_shrimp_birds_withEVRainAndQSChem.csv", row.names = FALSE, na = "")


# unique(df_met_shrimp$ATYACPUE)
df_met_shrimp_pheno_birds_chem$month <-floor_date(df_met_shrimp_pheno_birds_chem$Date, "month")

# df_met_shrimp$Month <- month(df_met_shrimp$Date)
# df_met_shrimp$Year <- year(df_met_shrimp$Date)
# 
summary(df_met_shrimp_pheno_birds_chem)
df_met_shrimp_pheno_birds_chem_month <- df_met_shrimp_pheno_birds_chem %>%
  group_by(month) %>%
  summarise(
    LFDP_bird_count  = sum(total_bird_count, na.rm=TRUE),
    AMRED_count = sum(AMRED, na.rm=TRUE),
    BFGRQ_count = sum(BFGRQ, na.rm=TRUE),
    BHEUP_count = sum(BHEUP, na.rm=TRUE),
    BLAWA_count = sum(BLAWA, na.rm=TRUE),
    BQUIT_count = sum(BQUIT, na.rm=TRUE),
    BTBLW_count = sum(BTBLW, na.rm=TRUE),
    BTGNW_count = sum(BTGNW, na.rm=TRUE),
    BWINH_count = sum(BWINH, na.rm=TRUE),
    BWVIR_count = sum(BWVIR, na.rm=TRUE),
    BWWAR_count = sum(BWWAR, na.rm=TRUE),
    CAREL_count = sum(CAREL, na.rm=TRUE),
    GKNGB_count = sum(GKNGB, na.rm=TRUE),
    GNHER_count = sum(GNHER, na.rm=TRUE),
    GRMAN_count = sum(GRMAN, na.rm=TRUE),
    HOWAR_count = sum(HOWAR, na.rm=TRUE),
    KENWA_count = sum(KENWA, na.rm=TRUE),
    LAPEW_count = sum(LAPEW, na.rm=TRUE),
    MAGWA_count = sum(MAGWA, na.rm=TRUE),
    NOWAT_count = sum(NOWAT, na.rm=TRUE),
    ORIOL_count = sum(ORIOL, na.rm=TRUE),
    PARUW_count = sum(PARUW, na.rm=TRUE),
    PETER_count = sum(PETER, na.rm=TRUE),
    PLPIG_count = sum(PLPIG, na.rm=TRUE),
    PRAIW_count = sum(PRAIW, na.rm=TRUE),
    PRBUL_count = sum(PRBUL, na.rm=TRUE),
    PRCUC_count = sum(PRCUC, na.rm=TRUE),
    PREME_count = sum(PREME, na.rm=TRUE),
    PRFLY_count = sum(PRFLY, na.rm=TRUE),
    PRTAN_count = sum(PRTAN, na.rm=TRUE),
    PRTOD_count = sum(PRTOD, na.rm=TRUE),
    PRWPR_count = sum(PRWPR, na.rm=TRUE),
    RLTSH_count = sum(RLTSH, na.rm=TRUE),
    RQDOV_count = sum(RQDOV, na.rm=TRUE),
    RTHAW_count = sum(RTHAW, na.rm=TRUE),
    SBANI_count = sum(SBANI, na.rm=TRUE),
    SCOWL_count = sum(SCOWL, na.rm=TRUE),
    SHTAN_count = sum(SHTAN, na.rm=TRUE),
    SNPIG_count = sum(SNPIG, na.rm=TRUE),
    UNKNO_count = sum(UNKNO, na.rm=TRUE),
    UNWAR_count = sum(UNWAR, na.rm=TRUE),
    WATTH_count = sum(WATTH, na.rm=TRUE),
    WEVIR_count = sum(WEVIR, na.rm=TRUE),
    WWDOV_count = sum(WWDOV, na.rm=TRUE),
    YFGRQ_count = sum(YFGRQ, na.rm=TRUE),
    YTWAR_count = sum(YTWAR, na.rm=TRUE),
    ATYACPUE_POOL0 = sum(ATYACPUE_POOL0, na.rm = TRUE),
    XIPHCPUE_POOL0 = sum(XIPHCPUE_POOL0, na.rm = TRUE),
    MACCPUE_POOL0 = sum(MACCPUE_POOL0, na.rm = TRUE),
    ATYACPUE_POOL8 = sum(ATYACPUE_POOL8, na.rm = TRUE),
    XIPHCPUE_POOL8 = sum(XIPHCPUE_POOL8, na.rm = TRUE),
    MACCPUE_POOL8 = sum(MACCPUE_POOL8, na.rm = TRUE),
    ATYACPUE_POOL9 = sum(ATYACPUE_POOL9, na.rm = TRUE),
    XIPHCPUE_POOL9 = sum(XIPHCPUE_POOL9, na.rm = TRUE),
    MACCPUE_POOL9 = sum(MACCPUE_POOL9, na.rm = TRUE),
    ATYACPUE_POOL15 = sum(ATYACPUE_POOL15, na.rm = TRUE),
    XIPHCPUE_POOL15 = sum(XIPHCPUE_POOL15, na.rm = TRUE),
    MACCPUE_POOL15 = sum(MACCPUE_POOL15, na.rm = TRUE),
    minMonthlyTempC_belowCanopy = min(minDailyTempC_belowCanopy ,na.rm = TRUE),
    MaxMonthlyTempC_belowCanopy = max(maxDailyTempC_belowCanopy ,na.rm = TRUE),
    totrainfall_mm = sum(rainfall_mm,na.rm = TRUE),
    totrainfall_mm_nadp  =sum(rainfall_mm_nadp,na.rm = TRUE),
    MinMonthlyTempC_nadp = min(minDailyTempC_nadp ,na.rm = TRUE),
    MaxMonthlyTempC_nadp = max(maxDailyTempC_nadp  ,na.rm = TRUE),
    meanmonthlysolarrad_kj_m2_nadp = mean(solarrad_kj_m2_nadp  ,na.rm = TRUE),
    meanppfd_millimoles_m2_nadp = mean(ppfd_millimoles_m2_nadp  ,na.rm = TRUE),
    meanwindspeed_ms_nadp = mean(windspeed_ms_nadp  ,na.rm = TRUE),
    meanwinddir_degrees_nadp = mean(winddir_degrees_nadp  ,na.rm = TRUE),
    # meanstreamqs_Temp = mean(Temp_QS, na.rm = TRUE),
    # meanstreamqs_Gage_Ht = mean(Gage_Ht_QS, na.rm = TRUE),
    # meanstreamqs_COND = mean(Cond_QS, na.rm = TRUE),
    # meanstreamqs_pH = mean(pH_QS, na.rm = TRUE),
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
    mean_streamqs_Temp = mean(Temp_QS, na.rm=TRUE),
    mean_streamqs_Gage_Ht = mean(Gage_Ht_QS, na.rm=TRUE),
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
    mean_streamqp_Temp = mean(Temp_QP, na.rm=TRUE),
    mean_streamqp_Gage_Ht = mean(Gage_Ht_QP, na.rm=TRUE),
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
    # Monthly mean for columns starting with flower.per.m2_ or seeds.per.m2_
    across(starts_with("flowers.per.m2_"), mean, na.rm = TRUE),
    across(starts_with("seeds.per.m2_"), mean, na.rm = TRUE),
    across(starts_with("seedsum"), sum, na.rm = TRUE),
    across(starts_with("flowersum"), sum, na.rm = TRUE)
  ) %>%
  mutate(across(ends_with("_count"), ~replace(., . == 0, NA)))

df_met_shrimp_pheno_birds_chem <- df_met_shrimp_pheno_birds_chem %>%
  rename_with(~ paste0(., "_count"),
              c( "AMRED", "BFGRQ", "BHEUP", "BLAWA", "BQUIT",
                "BTBLW", "BTGNW", "BWINH", "BWVIR", "BWWAR", "CAREL",
                "GKNGB", "GNHER", "GRMAN", "HOWAR", "KENWA", "LAPEW",
                "MAGWA", "NOWAT", "ORIOL", "PARUW", "PETER", "PLPIG",
                "PRAIW", "PRBUL", "PRCUC", "PREME", "PRFLY", "PRTAN",
                "PRTOD", "PRWPR", "RLTSH", "RQDOV", "RTHAW", "SBANI",
                "SCOWL", "SHTAN", "SNPIG", "UNKNO", "UNWAR", "WATTH",
                "WEVIR", "WWDOV", "YFGRQ", "YTWAR"))

# unique(df_monthly_met_shrimp$ATYACPUE)
summary(df_met_shrimp_pheno_birds_chem_month)
is_inf <- is.infinite(df_met_shrimp_pheno_birds_chem_month$max_discharge__qp0_m3_s)
df_met_shrimp_pheno_birds_chem_month$max_discharge__qp0_m3_s[is_inf] <- NA

is_inf <- is.infinite(df_met_shrimp_pheno_birds_chem_month$min_discharge_qp0_m3_s)
df_met_shrimp_pheno_birds_chem_month$min_discharge_qp0_m3_s[is_inf] <- NA
summary(df_met_shrimp_pheno_birds_chem_month)
# write.csv(df_met_shrimp_pheno_birds_chem_month, file = "met_data_monthly_pheno_shrimp_birds_withEVRainAndQSChem.csv", row.names = FALSE, na = "")


# qp0discharge_month <- qp0discharge_month %>% select(month, mean_discharge__qp0_m3_s, 
#                                                     max_discharge__qp0_m3_s, min_discharge_qp0_m3_s)
# df_monthly_met_shrimp <- df_monthly_met_shrimp %>%
#   left_join(qp0discharge_month, by = "month")
# summary(df_monthly_met_shrimp)
#### ADD QP0 discharge



# df_met_shrimp_phenmonthly <- df_met_shrimp_phenmonthly %>%
#   mutate_at(vars(XIPHCPUE, ATYACPUE, MACCPUE,
#                  totrainfall_mm_nadp,totrainfall_mm,bird_count_LFDP), ~replace(., . == 0, NA))


df_met_shrimp_pheno_birds_chem <- df_met_shrimp_pheno_birds_chem %>% arrange(Date)
df_met_shrimp_pheno_birds_chem_month <- df_met_shrimp_pheno_birds_chem_month %>% arrange(month)
# shrimp are shrimp per trap

# Summarize the duplicates
df_met_shrimp_pheno_birds_chem <- df_met_shrimp_pheno_birds_chem %>%
  group_by(Date) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

renamed_columns <- c(
  "minAvgMonthlyTempC", "MaxAvgDailyTempC", "totrainfall_mm", "totrainfall_mm_nadp",
  "MinMonthlyTempC_nadp", "MaxMonthlyTempC_nadp", "meanmonthlysolarrad_kj_m2_nadp",
  "mean_discharge__qp0_m3_s", "max_discharge__qp0_m3_s", "min_discharge_qp0_m3_s",
  "mean_rainev_COND", "mean_rainev_pH", "mean_rainev_Cl", "mean_rainev_Na",
  "mean_rainev_K", "mean_rainev_Mg", "mean_rainev_Ca", "mean_rainev_NO3N",
  "mean_rainev_NH4N", "mean_rainev_PO4P", "mean_rainev_DOC", "mean_rainev_DIC",
  "mean_rainev_TDN", "mean_rainev_TDP", "mean_streamqs_Temp", "mean_streamqs_Gage_Ht",
  "mean_streamqs_COND", "mean_streamqs_pH", "mean_streamqs_Cl", "mean_streamqs_Na",
  "mean_streamqs_K", "mean_streamqs_Mg", "mean_streamqs_Ca", "mean_streamqs_NO3N",
  "mean_streamqs_NH4N", "mean_streamqs_PO4P", "mean_streamqs_DOC", "mean_streamqs_DIC",
  "mean_streamqs_TDN", "mean_streamqs_TDP", "mean_streamqs_TSS", "mean_streamqs_SO4",
  "mean_streamqs_DON", "mean_streamqp_Temp", "mean_streamqp_Gage_Ht", "mean_streamqp_COND",
  "mean_streamqp_pH", "mean_streamqp_Cl", "mean_streamqp_Na", "mean_streamqp_K",
  "mean_streamqp_Mg", "mean_streamqp_Ca", "mean_streamqp_NO3N", "mean_streamqp_NH4N",
  "mean_streamqp_PO4P", "mean_streamqp_DOC", "mean_streamqp_DIC", "mean_streamqp_TDN",
  "mean_streamqp_TDP", "mean_streamqp_TSS", "mean_streamqp_SO4", "mean_streamqp_DON"
)

# Step 2: Find the columns that are missing in df2 compared to df1
missing_in_df2 <- setdiff(colnames(df_met_shrimp_pheno_birds_chem), colnames(df_met_shrimp_pheno_birds_chem_month))

# Step 3: Exclude the renamed columns from the list of missing columns
final_missing_columns <- setdiff(missing_in_df2, renamed_columns)

# Print the final list of missing columns
print(final_missing_columns)

missing_in_df2 <- setdiff(colnames(df_met_shrimp_pheno_birds_chem), colnames(df_met_shrimp_pheno_birds_chem_month))

# Print the missing columns
print(missing_in_df2)

write.csv(df_met_shrimp_pheno_birds_chem, file = "met_shrimp_data_pheno_daily.csv", row.names = FALSE)


write.csv(df_met_shrimp_pheno_birds_chem_month, file = "met_shrimp_data_pheno_monthly.csv", row.names = FALSE)


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
# write.csv(df_met_shrimp_phenmonthly, file = "met__shrimp_pheno_birds_data_monthly.csv", row.names = FALSE)
summary(pheno_met_sub3)
pheno_met_sub3$Year <- as.integer(year(strptime(pheno_met_sub3$Date, "%Y-%m-%d")))



df_yearly_rainfall <- pheno_met_sub3 %>%
  group_by(Year) %>%
  summarise( totrainfall_mm = sum(rainfall_mm,na.rm = TRUE)) %>%
  filter(Year>1989)

write.csv(df_yearly_rainfall, file = "df_yearly_rainfall.csv", row.names = FALSE)
save.image("signaturedatasetAll.RData")

# long format for plotting and apps Monthly
#
# df_met_shrimp_phenmonthly_long <- df_met_shrimp_phenmonthly %>%
#   pivot_longer(
#     cols = ends_with("_count"),
#     names_to = "bird_species",
#     values_to = "count"
#   ) %>%
#   mutate(bird_species = sub("_count$", "", bird_species))  # Remove the '_count' suffix from bird species names
#
# # Optional: Reorder columns if needed
# df_met_shrimp_phenmonthly_long <- df_met_shrimp_phenmonthly_long %>%
#   select(month, Plant.ID, bird_species, count, everything())
#
# df_met_shrimp_phenmonthly_long <- df_met_shrimp_phenmonthly_long %>% mutate(Plant.ID = ifelse(
#   !is.na(Plant.ID) & variable != "mean_monthly_seeds.per.m2" & variable != "mean_monthly_flowers.per.m2",
# NA, Plant.ID))
#
# df_met_shrimp_phenmonthly_long <- df_met_shrimp_phenmonthly_long %>% mutate(bird_species_LFDP = ifelse(
#   !is.na(bird_species_LFDP) & variable != "bird_count_LFDP",
# NA, bird_species_LFDP))
#
# df_met_shrimp_phenmonthly_long <- distinct(df_met_shrimp_phenmonthly_long, month, Plant.ID,bird_species_LFDP, variable, value, .keep_all = TRUE)
# df_met_shrimp_phenmonthly_long <- df_met_shrimp_phenmonthly_long %>% filter(!is.na(value))
df_met_shrimp_phenmonthly_long <- df_met_shrimp_pheno_birds_chem_month %>%
  pivot_longer(
    cols = -month,  # Pivot all columns except for 'month'
    names_to = "variable",  # The names of the original columns will go into 'variable'
    values_to = "value"  # The values will go into 'value'
  ) %>%
  drop_na() %>%  # Remove rows with NA values
  filter(value != 0)

write.csv(df_met_shrimp_phenmonthly_long, file = "df_met_shrimp_pheno_monthly_long.csv", row.names = FALSE)

subsig2 <- df_met_shrimp_phenmonthly_long %>% filter(variable %in% c('minAvgMonthlyTempC', 'mean_rainev_Cl'))
subsigdata <- subsig2 %>% pivot_wider(
  names_from = variable,
  values_from = value,
  values_fn = list(value = mean))

# subsig2 <- subsig2 %>% mutate(if(variable=="minAvgMonthlyTempC", value = (value - min(value)) / (max(value) - min(value))))
subsig2 <- subsig2 %>%
  mutate(value = case_when(
    variable == "minAvgMonthlyTempC" ~ (value - min(value)) / (max(value) - min(value)),
    variable == "mean_rainev_Cl" ~ (value - min(value)) / (max(value) - min(value)),
    TRUE ~ value
  ))
# subsig2 <- subsig2 %>% mutate_at(vars(matches('minAvgMonthlyTempC')), function(x) (x - min(x)) / (max(x) - min(x)))
# subsig2 <- subsig2 %>% mutate_at(vars(matches('mean_rainev_Cl')), function(x) (x - min(x)) / (max(x) - min(x)))
summary(subsigdata)