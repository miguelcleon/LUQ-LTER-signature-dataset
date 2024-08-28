# setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/")
library(future)
setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/LUQ-LTER-signature-dataset/")

source("./QPDischarge182.R")

summary(dt1)
# this is QP-0
qp0discharge <- dt1
qp0discharge$site <- 'QP0'
head(qp0discharge)

qpadischarge <- dt2
qpadischarge$site <- 'QPA'
head(qp0discharge)


qpbdischarge <- dt3
qpbdischarge$site <- 'QPB'

#calculate daily min, max, mean
checkqp0 <- qp0discharge %>% filter(Notes == 'Bad')
summary(checkqp0)
# all values for qa code = 'Bad' are NA but let's set them to NA in case this 
# changes in the future 
qp0discharge <- qp0discharge %>% mutate(Discharge = ifelse(Notes == "Bad", NA, Discharge))


qp0discharge$Date <- as.Date(qp0discharge$datetime, origin = "1970-01-01")
head(qp0discharge)
qp0discharge_day <- qp0discharge %>% group_by(Date, site) %>%
  summarize(mean_discharge__qp0_m3_s=mean(Discharge, na.rm=TRUE), 
            max_discharge__qp0_m3_s = max(Discharge, na.rm=TRUE),
            min_discharge_qp0_m3_s= min(Discharge, na.rm=TRUE),     .groups = 'drop'  # Drop the grouping for efficiency
  ) %>%
  future::future() %>%
  future::value()

head(qp0discharge_day)
is_inf <- is.infinite(qp0discharge_day$max_discharge__qp0_m3_s)
qp0discharge_day$max_discharge__qp0_m3_s[is_inf] <- NA

is_inf <- is.infinite(qp0discharge_day$min_discharge_qp0_m3_s)
qp0discharge_day$min_discharge_qp0_m3_s[is_inf] <- NA



summary(qp0discharge_day)
# use QP0 for larger monthly summary
qp0discharge$month <-floor_date(qp0discharge$Date, "month")
summary(qp0discharge)

checkqp0 <- qp0discharge %>% filter(Date > '2012-11-01' & Date <='2013-04-01') 
summary(checkqp0)

checkqp0_day <- qp0discharge_day %>% filter(Date > '2012-11-01' & Date <='2013-04-01') 
summary(checkqp0_day)
# bad values for most of this period



qp0discharge_month <- qp0discharge %>% group_by(month, site) %>%
  summarize(mean_discharge__qp0_m3_s=mean(Discharge, na.rm=TRUE), 
            max_discharge__qp0_m3_s = max(Discharge, na.rm=TRUE),
            min_discharge_qp0_m3_s= min(Discharge, na.rm=TRUE), .groups = 'drop'  # Drop the grouping for efficiency
  ) %>%
  future::future() %>%
  future::value()
#QPA and QPB - water level can be used for an expanded water focused dataset
is_inf <- is.infinite(qp0discharge_month$max_discharge__qp0_m3_s)
qp0discharge_month$max_discharge__qp0_m3_s[is_inf] <- NA

is_inf <- is.infinite(qp0discharge_month$min_discharge_qp0_m3_s)
qp0discharge_month$min_discharge_qp0_m3_s[is_inf] <- NA


summary(qp0discharge_month)

qpadischarge$Date <- as.Date(qpadischarge$datetime, origin = "1970-01-01")


head(qpadischarge)

qpadischarge_day <- qpadischarge %>%
  group_by(Date, site) %>%
  summarize(
    mean_discharge_qpa_m = mean(Discharge..paren.m.carat.3.per.s.paren., na.rm = TRUE),
    max_discharge_qpa_m = max( Discharge..paren.m.carat.3.per.s.paren., na.rm = TRUE),
    min_discharge_qpa_m = min( Discharge..paren.m.carat.3.per.s.paren., na.rm = TRUE),
    .groups = 'drop'  # Drop the grouping for efficiency
  ) %>%
  future::future() %>%
  future::value()
head(qpadischarge_day)


qpbdischarge$Date <- as.Date(qpbdischarge$datetime, origin = "1970-01-01")
head(qpbdischarge)
qpbdischarge_day <- qpbdischarge %>% group_by(Date, site) %>%
  summarize(mean_discharge_qpb_m=mean(Discharge, na.rm=TRUE),
            max_discharge__qpb_m = max(Discharge, na.rm=TRUE),
            min_discharge_qpb_m= min(Discharge, na.rm=TRUE),
  .groups = 'drop'  # Drop the grouping for efficiency
  ) %>%
  future::future() %>%
  future::value()
head(qpbdischarge_day)

