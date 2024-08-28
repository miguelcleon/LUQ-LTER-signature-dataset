

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
dtprecip <- rbind(dt2, dt4)






source("./LUQ16EDIMaxTemp.R")
dt2 <- rbind(dt1, dt2)
dt2$Field.Comments <- ''
dt2 <- dt2 %>% select(DATE, YEAR, JULIAN, MAXTEMP.paren.C.paren., Field.Comments)
dt3 <- dt3 %>% select(DATE, YEAR, JULIAN, MAXTEMP.paren.C.paren., Field.Comments)
dtmaxtemp <- rbind(dt2, dt3)
source("./LUQ17EDIMinTemp.R")

dt2 <- rbind(dt1, dt2)
dt2 <- rbind(dt2, dt3)
dt2$Field.Comments <- ''
# dt4 <- dt4 %>% rename("DATE" = "Date")
dt4 <- dt4 %>% select(Date, YEAR, JULIAN, MINTEMP.paren.F.paren.,MINTEMP.paren.C.paren., Field.Comments)
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
                                      minDailyTempC_belowCanopy = MINTEMP.paren.C.paren.,
                                          maxDailyTempC_belowCanopy = MAXTEMP.paren.C.paren.)

summary(pheno_met_sub)


source("./LUQ127EDINADPMet.R")

# dtmet<- dt1 %>%
#   mutate(Date = as_date(strptime(Date.of.measurements, "%Y-%m-%d")))
# dtmet <- dt1 %>%
#   mutate(
#     Date = as.Date(Date.of.measurements, format = "%Y-%d-%m")
#   )

# date formats are screwed up
#############################################################
df <- dt1 %>%
  slice(which(Date.of.measurements < "2021-01-01"))

df2 <- dt1 %>%
  slice(which(Date.of.measurements >= "2021-01-01"))

dtmetp1 <- df %>% mutate(
  Date = as.Date(Date.of.measurements, format = "%Y-%d-%m"))

dtmetp2 <- df2 %>% mutate(
  Date = as.Date(Date.of.measurements, format = "%Y-%m-%d"))
#################################################################
# dtmet <- dt3
# SOLARRAD_(WATTS/M2) = shortwave from Murphy Uriarte
# SOLARRAD_(WATTS/M2) = shortwave from Murphy Uriarte
# SOLARRAD_(WATTS/M2) = shortwave from Murphy Uriarte


dtmet <- rbind(dtmetp1, dtmetp2)
# date formats are screwed up

summary(dtmet)


dtmet <- dtmet %>% select( Date.and.time.of.measurements, Rain_mm_Tot, AirTC_Avg, TEMPMAX_DEGREESCELSIUS,
                          SOLARRAD_.paren.WATTS.per.M2.paren.,PPFD_MILLIMOLES_M2,RELHUMMAX, RELHUMMIN,
                          WINDSPEEDAVER_M_S, WINDDIR_DEGREES)
#   maxDailyTempC_nadp = TEMPMAX_DEGREESCELSIUS,
#                           humidity_min_nadp=RELHUMMIN,
#                           humidity_max_nadp=RELHUMMAX,
dtmet <- dtmet %>% rename(Date=Date.and.time.of.measurements, rainfall_mm_nadp= Rain_mm_Tot,
                          AirTC_Avg_nadp = AirTC_Avg,
                          solarrad_w_m2_nadp=SOLARRAD_.paren.WATTS.per.M2.paren.,
                          ppfd_millimoles_m2_nadp=PAR_Tot,
                          windspeed_ms_nadp_mean=WINDSPEEDAVER.paren.M_S.paren.,
                          winddir_degrees_nadp= WINDDIR.paren.DEGREES.paren.)
summary(dtmet)
summary(pheno_met_sub)
pheno_met_sub2 <- merge(x=pheno_met_sub, y= dtmet,
                                  by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
#summary of number of records annually per column
# example yearly summary
distinct_dates <- dtmet %>% distinct(Date)
print("number of days phenology observed")
print(nrow(distinct_dates))
year_counts_obs_met <- dtmet %>%
  group_by(year(Date)) %>%
  summarise(count_met_observations = n_distinct(Date))
print("number per year")
print(year_counts_obs_met)
# year_counts_obs_comb <- merge(year_counts_obs_pheno, year_counts_obs_comb, by='year(Date)', all.y = TRUE)


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

# write.csv(pheno_met_sub2, file = "met_data_daily_withEVRainAndQSChem.csv", row.names = FALSE)

# Add Met from Murphy


met_hourly <- read.csv("../Met_1995-2018.csv")
# convert Year Julian Day and Hour to POSIXct
met_hourly <- met_hourly %>%
  mutate(datetime = as.POSIXct(paste(Year, Day, Hour/100, sep = " "), format = "%Y %j %H"))

# aggregate hourly to daily for met_hourly
met_daily <- met_hourly %>%
  group_by(Date = as.Date(datetime)) %>%
  summarise(
    windsp_mean = mean(windsp, na.rm = TRUE),
    winddir_mean = mean(winddir, na.rm = TRUE),
     windsp_min = min(windsp, na.rm = TRUE),
    winddir_min = min(winddir, na.rm = TRUE),
     windsp_max = max(windsp, na.rm = TRUE),
    winddir_max = max(winddir, na.rm = TRUE),
    temp.C_mean  = mean(temp.K-273.15, na.rm = TRUE),
     temp.C_min  = min(temp.K-273.15, na.rm = TRUE),
     temp.C_max  = max(temp.K-273.15, na.rm = TRUE),
    humidity = mean(((humidity * 100)/0.02), na.rm = TRUE),
    humidity_min = min(((humidity * 100)/0.02), na.rm = TRUE),
    humidity_max = max(((humidity * 100)/0.02), na.rm = TRUE),
    precip = sum(precip*86400, na.rm = TRUE),
    SLP = sum(SLP, na.rm = TRUE),
    longwave = sum(longwave, na.rm = TRUE),
    shortwave = sum(shortwave, na.rm = TRUE))

pheno_met_sub2 <- merge(x=pheno_met_sub2, y= met_daily,
                        by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)

# write.csv(pheno_met_sub2, file = "met_data_daily.csv", row.names = FALSE)

pheno_met_sub2 <- pheno_met_sub2 %>%
  mutate(min_temp = case_when(
    !is.na(minDailyTempC_belowCanopy) ~ minDailyTempC_belowCanopy,
    !is.na(temp.C_min) ~ temp.C_min,
    !is.na(minDailyTempC_nadp) ~ minDailyTempC_nadp,
    TRUE ~ NA_real_
  ))
pheno_met_sub2 <- pheno_met_sub2 %>%
  mutate(max_temp = case_when(
    !is.na(maxDailyTempC_belowCanopy) ~ maxDailyTempC_belowCanopy,
    !is.na(temp.C_max) ~ temp.C_max,
    !is.na(maxDailyTempC_nadp) ~ maxDailyTempC_nadp,
    TRUE ~ NA_real_
  ))
pheno_met_sub2 <- pheno_met_sub2 %>%
  mutate(rain_mm = case_when(
    !is.na(rainfall_mm) ~ rainfall_mm,
    !is.na(precip) ~ precip,
    !is.na(rainfall_mm_nadp) ~ rainfall_mm_nadp,
    TRUE ~ NA_real_
  ))
pheno_met_sub2 <- pheno_met_sub2 %>%
  mutate(humidity_precent_max = case_when(
    !is.na(humidity_max) ~ humidity_max,
    !is.na(humidity_max_nadp) ~ humidity_max_nadp,
    TRUE ~ NA_real_
  ))
pheno_met_sub2 <- pheno_met_sub2 %>%
  mutate(windsp_mean = case_when(
    !is.na(windspeed_ms_nadp) ~ windspeed_ms_nadp, # windspeed_ms_nadp
    !is.na(windsp_mean) ~ windsp_mean,
    TRUE ~ NA_real_
  ))



pheno_met_sub2 <- pheno_met_sub2 %>%
  mutate(winddir_degrees_mean = case_when(
    !is.na(winddir_degrees_nadp) ~ winddir_degrees_nadp,
    !is.na(winddir_mean) ~ winddir_mean,
    TRUE ~ NA_real_
  ))
met_simp_all <- pheno_met_sub2 %>%
  select(Date, min_temp, max_temp, rain_mm, humidity_precent_max, humidity_precent_min, windsp_mean)

write.csv(pheno_met_sub2, file = "met_data_daily__daily_LM_MU_withEVRainAndQSChem.csv", row.names = FALSE)


