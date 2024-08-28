
met_hourly <- read.csv("../Met_1995-2018.csv")
# convert Year Julian Day and Hour to POSIXct
met_hourly <- met_hourly %>%
  mutate(Date = as.POSIXct(paste(as.character(Year), as.character(Day), as.character(Hour/100.0), sep = " "),
                           format = "%Y %j %H", tz = "America/Puerto_Rico"))


met_hourly_formatted <- met_hourly %>%
  # group_by(Date = as.Date(datetime)) %>%
  mutate(
    temp.C_mean  = temp.K-273.15,
    humidity_percent = ((humidity * 100)/0.02),
    precip = precip*86400)

source("./LUQ127EDINADPMet.R")
dtmet <- dt3

dtmet <- dtmet %>% mutate(
  Date = as.POSIXct(Date.and.time.of.measurements , format = "%Y-%m-%d %H:%M", tz = "America/Puerto_Rico"))

na_rows <- dtmet[is.na(dtmet$Date), ]

dtmet <- dtmet %>% select( Date, Rain_mm_Tot, AirTC_Avg,RH_percent,
                          SOLARRAD_.paren.WATTS.per.M2.paren.,PAR_Tot,
                          WINDSPEEDAVER.paren.M_S.paren., WINDDIR.paren.DEGREES.paren.)
#   maxDailyTempC_nadp = TEMPMAX_DEGREESCELSIUS,
#                           humidity_min_nadp=RELHUMMIN,
#                           humidity_max_nadp=RELHUMMAX,
dtmet <- dtmet %>% rename(Date=Date, rainfall_mm_nadp= Rain_mm_Tot,
                          AirTC_Avg_nadp = AirTC_Avg, RH_percent_nadp = RH_percent,
                          solarrad_w_m2_nadp=SOLARRAD_.paren.WATTS.per.M2.paren.,
                          PAR_Tot_millimoles_m2_nadp=PAR_Tot,
                          windspeed_ms_nadp_mean=WINDSPEEDAVER.paren.M_S.paren.,
                          winddir_degrees_nadp= WINDDIR.paren.DEGREES.paren.)

met_hourly_combo <- merge(x=met_hourly_formatted, y= dtmet,
                        by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)


met_hourly_combo <- met_hourly_combo %>%
  mutate(windsp_mean = case_when(
    !is.na(windspeed_ms_nadp_mean) ~ windspeed_ms_nadp_mean,
    !is.na(windsp) ~ windsp,
    TRUE ~ NA_real_
  ))


met_hourly_combo <- met_hourly_combo %>%
  mutate(winddir_mean = case_when(
    !is.na(winddir_degrees_nadp) ~ winddir_degrees_nadp,
    !is.na(winddir) ~ winddir,
    TRUE ~ NA_real_
  ))

met_hourly_combo <- met_hourly_combo %>%
  mutate(temp_c = case_when(
    !is.na(AirTC_Avg_nadp) ~ AirTC_Avg_nadp,
    !is.na(temp.C_mean) ~ temp.C_mean,
    TRUE ~ NA_real_
  ))
met_hourly_combo <- met_hourly_combo %>%
  mutate(humidity_mean = case_when(
    !is.na(RH_percent_nadp) ~ RH_percent_nadp,
    !is.na(humidity) ~ humidity,
    TRUE ~ NA_real_
  ))

met_hourly_combo <- met_hourly_combo %>%
  mutate(rainfall_mm = case_when(
    !is.na(rainfall_mm_nadp) ~ rainfall_mm_nadp,
    !is.na(precip) ~ precip,
    TRUE ~ NA_real_
  ))

# SOLARRAD_(WATTS/M2) = shortwave from Murphy Uriarte
# SOLARRAD_(WATTS/M2) = shortwave from Murphy Uriarte
# SOLARRAD_(WATTS/M2) = shortwave from Murphy Uriarte
met_hourly_combo <- met_hourly_combo %>%
  mutate(solarrad_w_m2 = case_when(
    !is.na(solarrad_w_m2_nadp) ~ solarrad_w_m2_nadp,
    !is.na(shortwave) ~ shortwave,
    TRUE ~ NA_real_
  ))

met_simp_hourly <- met_hourly_combo %>%
  select(Date, windsp_mean, winddir_mean, temp_c, humidity_mean, rainfall_mm, solarrad_w_m2)
# met_simp_hourly = met_simp_hourly(how="all")
# met_simp_hourly <- subset(met_simp_hourly, !all(is.na(met_simp_hourly)))

write.csv(met_simp_hourly, file = "met_data_hourly_LM_MU_NADP.csv", row.names = FALSE)

met_simp_daily <- met_simp_hourly %>%
  group_by(Date = as.Date(Date)) %>%
  summarise(
    windsp_mean = mean(windsp_mean, na.rm = TRUE),
    winddir_mean = mean(winddir_mean, na.rm = TRUE),
     windsp_min = min(windsp_mean, na.rm = TRUE),
    winddir_min = min(winddir_mean, na.rm = TRUE),
     windsp_max = max(windsp_mean, na.rm = TRUE),
    winddir_max = max(winddir_mean, na.rm = TRUE),
    temp.C_mean  = mean(temp_c, na.rm = TRUE),
     temp.C_min  = min(temp_c, na.rm = TRUE),
     temp.C_max  = max(temp_c, na.rm = TRUE),
    humidity_mean = mean(humidity_mean, na.rm = TRUE),
    humidity_min = min(humidity_mean, na.rm = TRUE),
    humidity_max = max(humidity_mean, na.rm = TRUE),
    precip_mm_total = sum(rainfall_mm, na.rm = TRUE),
    solarrad_w_m2_total = sum(solarrad_w_m2, na.rm = TRUE))

met_simp_hourly <- met_simp_daily %>% mutate(
  windsp_mean = replace(windsp_mean, is.infinite(windsp_mean), NA),
  windsp_min = replace(windsp_min, is.infinite(windsp_min), NA),
    windsp_max = replace(windsp_max, is.infinite(windsp_max), NA),
    winddir_mean = replace(winddir_mean, is.infinite(winddir_mean), NA),
    winddir_min = replace(winddir_min, is.infinite(winddir_min), NA),
    winddir_max = replace(winddir_max, is.infinite(winddir_max), NA),
)

write.csv(met_simp_daily, file = "met_data_daily_LM_MU_NADP.csv", row.names = FALSE)
