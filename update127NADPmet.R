library(readxl)
setwd("../../data for pub/Alonso/el verde NADP daily and hourly met 127/")
met_nadp_daily_new_headers <- read_excel("2022-24h.xlsx",
                                sheet="Data", col_names = TRUE)
met_nadp_daily_new <- read_excel("2022-24h.xlsx",
                                sheet="Data", skip=2)
cols <- names(met_nadp_daily_new)
cols
colsgood <- names(met_nadp_daily_new_headers)
colsgood
met_nadp_daily_new <- met_nadp_daily_new %>%
  rename_with(~colsgood, cols)
summary(met_nadp_daily_new)
new_nadp_daily <- read.csv("EVFSTowerMetDaily_2022.csv")

list.files("./")

summary(met_nadp_daily_new)

oldlabels =  c("TIMESTAMP",   "RECORD", "BattV_Min",   "PTemp_C_Avg", "PAR_Tot_Tot", "SlrMJ_Tot",   "AirTC_Max",
               "AirTC_TMx",   "AirTC_Min",   "AirTC_TMn", "RH_Max",      "RH_TMx",     "RH_Min",      "RH_TMn",
               "WS_ms_Avg","WS_ms_Max","WS_ms_TMx","WindDir","Rain_mm_Tot","DewPtC_Avg","DewPtC_Std","DewPtC_Min",
               "DewPtC_TMn",  "DewPtC_Max",  "DewPtC_TMx",  "NR_Wm2_Max",  "NR_Wm2_TMx",  "NR_Wm2_Min",  "NR_Wm2_TMn")

labels = c("DATE", "YEAR", "JULIAN", "RAIN_MM", "RELHUMMAX",
           "RELHUMMAXTIME_HHMM", "TEMPMAX_DEGREESCELSIUS", "TEMPMAXTIME_HHMM", "RELHUMMIN", "RELHUMMINTIME_HHMM",
           "TEMPMIN_DEGREESCELSIUS", "MINTEMPTIME_HHMM", "SOLARRAD_KJOULES_M2", "PPFD_MILLIMOLES_M2",
           "WINDSPEEDAVER_M_S", "WINDDIR_DEGREES", "SDWINDDIR", "WINDROSE1-45_M_S", "WINDROSE46-90_M_S",
            "WINDROSE91-135_M_S", "WINDROSE136-180_M_S","WINDROSE181-225_M_S","WINDROSE226-270_M_S",
           "WINDROSE271-315_M_S","WINDROSE316-360_M_S", "Comments")

met_nadp_daily_new$YEAR <- as.numeric(format(met_nadp_daily_new$TIMESTAMP, "%Y"))
met_nadp_daily_new$JULIAN <- as.numeric(format(met_nadp_daily_new$TIMESTAMP, "%j"))
met_nadp_daily_new$SOLARRAD_KJOULES_M2 <-  as.numeric(met_nadp_daily_new$SlrMJ_Tot) * 1000
met_nadp_daily_new <- met_nadp_daily_new %>% rename("DATE" = "TIMESTAMP", "YEAR" = "YEAR", "JULIAN" = "JULIAN",
                                                    "RAIN_MM" = "Rain_mm_Tot", "RELHUMMAX" = "RH_Max",
                                                    "RELHUMMAXTIME_HHMM" = "RH_TMx",
                                                    "TEMPMAX_DEGREESCELSIUS" = "AirTC_Max",
                                                    "TEMPMAXTIME_HHMM" = "AirTC_TMx",
                                                    "RELHUMMIN" = "RH_Min",
                                                    "RELHUMMINTIME_HHMM" = "RH_TMn",
                                                    "TEMPMIN_DEGREESCELSIUS" = "AirTC_Min",
                                                    "MINTEMPTIME_HHMM" = "AirTC_TMn",
                                                    "PPFD_MILLIMOLES_M2" = "PAR_Tot_Tot",
                                                    "WINDSPEEDAVER_M_S" = "WS_ms_Avg",
                                                    "WINDDIR_DEGREES" = "WindDir",
                                                    "SOLARRAD_KJOULES_M2" = "SOLARRAD_KJOULES_M2")
met_nadp_daily_new$SDWINDDIR <- NA
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(YEAR, .after = "DATE")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(JULIAN, .after = "YEAR")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(RAIN_MM, .after = "JULIAN")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(RELHUMMAX, .after = "RAIN_MM")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(RELHUMMAXTIME_HHMM, .after = "RELHUMMAX")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(TEMPMAX_DEGREESCELSIUS, .after = "RELHUMMAXTIME_HHMM")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(TEMPMAXTIME_HHMM, .after = "TEMPMAX_DEGREESCELSIUS")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(RELHUMMIN, .after = "TEMPMAXTIME_HHMM")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(RELHUMMINTIME_HHMM, .after = "RELHUMMIN")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(TEMPMIN_DEGREESCELSIUS, .after = "RELHUMMINTIME_HHMM")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(MINTEMPTIME_HHMM, .after = "TEMPMIN_DEGREESCELSIUS")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(SOLARRAD_KJOULES_M2, .after = "MINTEMPTIME_HHMM")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(PPFD_MILLIMOLES_M2, .after = "SOLARRAD_KJOULES_M2")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(WINDSPEEDAVER_M_S, .after = "PPFD_MILLIMOLES_M2")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(WINDDIR_DEGREES, .after = "WINDSPEEDAVER_M_S")
met_nadp_daily_new <- met_nadp_daily_new %>% relocate(SDWINDDIR, .after = "WINDDIR_DEGREES")
# met_nadp_daily_new <- met_nadp_daily_new %>% relocate(`WINDROSE1-45_M_S`, .after = "SDWINDDIR")
# met_nadp_daily_new <- met_nadp_daily_new %>% relocate(`WINDROSE46-90_M_S`, .after = "WINDROSE1-45_M_S")



met_nadp_daily_new$`WINDROSE1-45_M_S` <- NA
met_nadp_daily_new$`WINDROSE46-90_M_S` <- NA
met_nadp_daily_new$`WINDROSE91-135_M_S` <- NA
met_nadp_daily_new$`WINDROSE136-180_M_S` <- NA
met_nadp_daily_new$`WINDROSE181-225_M_S` <- NA
met_nadp_daily_new$`WINDROSE226-270_M_S` <- NA
met_nadp_daily_new$`WINDROSE271-315_M_S` <- NA
met_nadp_daily_new$`WINDROSE316-360_M_S` <- NA
met_nadp_daily_new$Comments <- ''
met_nadp_daily_new <- met_nadp_daily_new %>% select(DATE, YEAR, JULIAN, RAIN_MM, RELHUMMAX,
                                                    RELHUMMAXTIME_HHMM, TEMPMAX_DEGREESCELSIUS, TEMPMAXTIME_HHMM,
                                                    RELHUMMIN, RELHUMMINTIME_HHMM, TEMPMIN_DEGREESCELSIUS,
                                                    MINTEMPTIME_HHMM, SOLARRAD_KJOULES_M2, PPFD_MILLIMOLES_M2,
                                                    WINDSPEEDAVER_M_S, WINDDIR_DEGREES, SDWINDDIR,
                                                    `WINDROSE1-45_M_S`, `WINDROSE46-90_M_S`, `WINDROSE91-135_M_S`,
                                                    `WINDROSE136-180_M_S`, `WINDROSE181-225_M_S`,
                                                    `WINDROSE226-270_M_S`, `WINDROSE271-315_M_S`,
                                                    `WINDROSE316-360_M_S`, Comments)

met_nadp_daily_new <- met_nadp_daily_new %>%
  group_by(DATE) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

summary(met_nadp_daily_new)
write.csv(met_nadp_daily_new, "EVFSTowerMetDaily_2022_formatted.csv", row.names = FALSE)