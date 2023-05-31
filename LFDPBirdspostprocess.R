# birds

setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/")

source("./LUQ23LFDPBirds.R")
library("lubridate") 

summary(dt3)
# this is QP-0
LFDPBirdsGreaterThan25m <- dt3
head(LFDPBirdsGreaterThan25m)
summary(dt4)
# this is QP-0
LFDPBirdsLessThan25m <- dt4
head(LFDPBirdsLessThan25m)
# pivot longer 
# make dates 
LFDPBirdsGreaterThan25m$firstdoy <-as.Date(paste0(as.character(LFDPBirdsGreaterThan25m$YEAR), "-01-01"), 
                                          format="%Y-%d-%m")
LFDPBirdsGreaterThan25m$JULIAN <- as.numeric(LFDPBirdsGreaterThan25m$JULIAN)

LFDPBirdsGreaterThan25m$Date <- as.Date(LFDPBirdsGreaterThan25m$JULIAN,
                                        origin = LFDPBirdsGreaterThan25m$firstdoy)
summary(LFDPBirdsGreaterThan25m)

LFDPBirdsLessThan25m$firstdoy <-as.Date(paste0(as.character(LFDPBirdsLessThan25m$YEAR), "-01-01"), 
                                           format="%Y-%d-%m")
LFDPBirdsLessThan25m$JULIAN <- as.numeric(LFDPBirdsLessThan25m$JULIAN)

LFDPBirdsLessThan25m$Date <- as.Date(LFDPBirdsLessThan25m$JULIAN,
                                        origin = LFDPBirdsLessThan25m$firstdoy)
summary(LFDPBirdsLessThan25m)

# convert columns that are logical to numeric 
LFDPBirdsGreaterThan25m <- LFDPBirdsGreaterThan25m %>% mutate_at(vars(BFGRQ, ORIOL, PLPIG, 
                                                       LAPEW, MAGWA, NOWAT, PRAIW, SBANI, SCOWL, UNKNO,
                                                       UNWAR, WATTH, WEVIR, WWDOV, YFGRQ, YTWAR), as.numeric)
LFDPBirdsLessThan25m <- LFDPBirdsLessThan25m %>% mutate_at(vars(BFGRQ, ORIOL, PLPIG, 
                                                                      LAPEW, MAGWA, NOWAT, PRAIW, SBANI, SCOWL, UNKNO,
                                                                      UNWAR, WATTH, WEVIR, WWDOV, YFGRQ, YTWAR), as.numeric)
#remove some columns 

LFDPBirdsGreaterThan25m <- LFDPBirdsGreaterThan25m %>% select(-YEAR, -JULIAN,-PLACE, -DATE,-WEATHER, -PLOT1, -PLOT2, 
                                                              -WIND, -RAIN,-PLACE, -TIME, -firstdoy, -Field.Observer)

LFDPBirdsLessThan25m <- LFDPBirdsLessThan25m %>% select(-YEAR, -JULIAN,-PLACE, -DATE,-WEATHER, -PLOT1, -PLOT2, 
                                                        -WIND, -RAIN,-PLACE, -TIME, -firstdoy, -Field.Observer)

LFDPBirdsGreaterThan25m <-LFDPBirdsGreaterThan25m %>% pivot_longer(cols =-Date, names_to= "variable", 
                                               values_to="value")
LFDPBirdsLessThan25m <-LFDPBirdsLessThan25m %>% pivot_longer(cols =-Date, names_to= "variable", 
                                                                   values_to="value")
# LFDPBirds <- merge(x=LFDPBirdsGreaterThan25m, y=LFDPBirdsLessThan25m, 
#                    by.x= "Date", by.y="Date", all.x=TRUE, )
LFDPBirds <- rbind(LFDPBirdsGreaterThan25m,LFDPBirdsGreaterThan25m)

# LFDPBirdsslice <- LFDPBirds %>%
#   slice(which(Date >= "1992-03-06"))

LFDPBirds <- LFDPBirds %>% group_by(Date, variable) %>% summarise(value = sum(value, na.rm = TRUE))

summary(LFDPBirds)

LFDPBirds <- LFDPBirds %>% rename(bird_species_LFDP=variable, bird_count_LFDP=value)
# my_date <- as.Date(JULIAN,origin = as.Date(paste0(YEAR, "-01-01")))

