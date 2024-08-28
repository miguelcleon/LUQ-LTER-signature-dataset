library(readxl)
setwd("../../data for pub/Alonso/el verde NADP hourly and hourly met 127/")
met_nadp_hourly_new_headers <- read_excel("2022-1h.xlsx",
                                sheet="2021 hourly LTER", col_names = TRUE)
met_nadp_hourly_new <- read_excel("2022-1h.xlsx",
                                sheet="2021 hourly LTER", skip=2)
cols <- names(met_nadp_hourly_new)
cols
colsgood <- names(met_nadp_hourly_new_headers)
colsgood
met_nadp_hourly_new <- met_nadp_hourly_new %>%
  rename_with(~colsgood, cols)

oldlabels <- c("TIMESTAMP",	"Hour",	"RECORD",	"BattV_Avg",
               "PTemp_C_Avg",	"Rain_mm_Tot",	"WS_ms_Avg",	"WindDir",
               "AirTC_Avg",	"RH",	"PAR_Den",	"PAR_Tot_Tot",	"SlrkW",
               "SlrMJ_Tot",	"DewPtC",	"NR_Wm2_Avg")
newlabels <- c("datetime",	"Rain_mm_Tot",	"WINDSPEEDAVER(M_S)",
               "WINDDIR(DEGREES)",	"SlrmJ_Tot",	"AirTC_Avg",
               "RH_percent",	"SOLARRAD_(WATTS/M2)",	"PAR_Den",
               "PAR_Tot",	"NR_Wm2_Avg",	"DewPtC")
met_nadp_hourly_new$Hour <- as.numeric(format(met_nadp_hourly_new$Hour, "%H"))

met_nadp_hourly_new$datetime <- met_nadp_hourly_new$TIMESTAMP + hours(met_nadp_hourly_new$Hour)
summary(met_nadp_hourly_new)
met_nadp_hourly_new$`SOLARRAD_(WATTS/M2)` <- met_nadp_hourly_new$SlrkW * 1000.0
met_nadp_hourly_new <- met_nadp_hourly_new %>% rename("datetime" = "datetime", "Rain_mm_Tot" = "Rain_mm_Tot",
                                                      "WINDSPEEDAVER(M_S)" = "WS_ms_Avg",
                                                      "WINDDIR(DEGREES)" = "WindDir",
                                                      "SlrmJ_Tot" = "SlrMJ_Tot",
                                                      "AirTC_Avg" = "AirTC_Avg",
                                                      "RH_percent" = "RH",
                                                      "SOLARRAD_(WATTS/M2)" = "SOLARRAD_(WATTS/M2)",
                                                      "PAR_Den" = "PAR_Den",
                                                      "PAR_Tot" = "PAR_Tot_Tot",
                                                      "NR_Wm2_Avg" = "NR_Wm2_Avg",
                                                      "DewPtC" = "DewPtC")

met_nadp_hourly_new <- met_nadp_hourly_new %>% select("datetime",	"Rain_mm_Tot",	"WINDSPEEDAVER(M_S)",
               "WINDDIR(DEGREES)",	"SlrmJ_Tot",	"AirTC_Avg",
               "RH_percent",	"SOLARRAD_(WATTS/M2)",	"PAR_Den",
               "PAR_Tot",	"NR_Wm2_Avg",	"DewPtC")

write.csv(met_nadp_hourly_new, "met_nadp_hourly_new.csv", row.names = FALSE)
