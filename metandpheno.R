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

dtmetp1 <- dt1 %>%

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

pheno_met_sub2 <- merge(x=pheno_met_sub, y= dtmet, 
                                  by.x= "Date", by.y="Date", all.x=TRUE, all.y = TRUE)
summary(pheno_met_sub2)

write.csv(pheno_met_sub2, file = "met_data_daily.csv", row.names = FALSE)
          
nadpmet_nonena <- dtmet %>%
  summarise_all(funs(sum(!is.na(.))))
met_nonena <- pheno_met_sub2 %>%
  summarise_all(funs(sum(!is.na(.))))
nadpmet_nonena
met_nonena
# why did 1/2 of the nadp values get dropped?


pheno_met <- select(pheno_met, -c(Year.y,Julian.y) )

pheno_met_yr <- pheno_met %>%
  group_by(YEAR.x) %>%
  summarise(rainfall_annualmm = sum(RAINFALL..paren.MM.paren., na.rm=TRUE), # this will be only for pheno sampled days 
   mean_max_temp= mean(MAXTEMP.paren.C.paren., na.rm=TRUE),
  mean_min_temp= mean(MINTEMP.paren.C.paren., na.rm=TRUE),
  tot_solarrad= sum(SOLARRAD_KJOULES_M2, na.rm=TRUE))

# mean and total rainfall temp here

# dplyr::summarise(Total = sum(NUMBER, na.rm = TRUE), 
#                  rainfall_annualmm = sum(RAINFALL..paren.MM.paren., na.rm=TRUE), # this will be only for pheno sampled days 
#                  mean_max_temp= mean(MAXTEMP.paren.C.paren., na.rm=TRUE),
#                  mean_min_temp= mean(MINTEMP.paren.C.paren., na.rm=TRUE),
#                  tot_solarrad= sum(SOLARRAD_KJOULES_M2, na.rm=TRUE))

phenoedi_seeds_rain <- merge(x=phenoedi_seeds, y=phenoedi_seeds_rainmxmnt, 
                             by.x= "DATE", by.y="DATE", all.x=TRUE)

pheno_met <- phenoedi_seeds_rainmxmnt %>% select(DATE, Plant.ID, Plot.ID, Trap.ID, Year, Month, DT, 
                    Seed_Trap_Area_m2,NUMBER, CODE, 
                    RAINFALL..paren.MM.paren., MAXTEMP.paren.C.paren., 
                    MINTEMP.paren.C.paren., SOLARRAD_KJOULES_M2)


phenomet_seeds_annual <- pheno_met %>%
  filter(CODE >=4 & CODE<6) %>%
  group_by(Plot.ID,  Trap.ID, Plant.ID, Year, CODE, Seed_Trap_Area_m2) %>%
  dplyr::summarise(Total = sum(NUMBER, na.rm = TRUE), 
                   rainfall_annualmm = sum(RAINFALL..paren.MM.paren., na.rm=TRUE), # this will be only for pheno sampled days 
                   mean_max_temp= mean(MAXTEMP.paren.C.paren., na.rm=TRUE),
                   mean_min_temp= mean(MINTEMP.paren.C.paren., na.rm=TRUE),
                   tot_solarrad= sum(SOLARRAD_KJOULES_M2, na.rm=TRUE))

phenomet_seeds_annual <- phenomet_seeds_annual %>%
  arrange(Trap.ID,Year)


seeds_met_annual_graph <- phenomet_seeds_annual %>%
  filter(Plant.ID %in% "ALCFLO") %>%
  mutate(totalTrapArea = Seed_Trap_Area_m2*120)%>%
  group_by(Year, Plant.ID, CODE,totalTrapArea, rainfall_annualmm, 
           mean_max_temp, mean_min_temp,tot_solarrad)%>%
  dplyr::summarise(total = sum(Total, na.rm=TRUE),
                   traps = n(),
                   seeds.per.m2 = total/totalTrapArea,
                   )

# sample <- c("ALCFLO","ALCLAT","MARREC","CHIDOM")
#  
# seedsplot<- ggplot(seeds_met_annual_graph, aes(x = Year, y = seeds.per.m2, colour = factor(CODE), group = factor(CODE))) + 
#   geom_jitter(height = 0, width = 0.1, shape =1)+
#   geom_line()+
#   geom_line(aes(y=rainfall_annualmm, color="blue")) + 
#   scale_color_manual("CODE", values = c("black", "red", "purple", "green", "blue", "orange"),labels = c("4=Mature fruit", "5=Seeds"))+
#   facet_wrap(~Plant.ID, scales = "free_y")+
#   theme_bw()+
#   theme(axis.text.x = element_text(angle=90))
# 
# seedsplot


seedsplot<- ggplot(seeds_met_annual_graph, aes(x = Year, y = seeds.per.m2)) + 
  geom_jitter(height = 0, width = 0.1, shape =1)+
  geom_line()+
  geom_line(aes(y=rainfall_annualmm, color="rainfall")) + 
  theme_bw()+
  theme(axis.text.x = element_text(angle=90))

seedsplot

