library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(tidyverse)
# install.packages(readrl)

library(readr)
source("LUQDS88fromEDIv2.R")
seeds16 <- pheno1edi
seeds50 <- pheno2edi
seeds16<- seeds16 %>%
  mutate(DT = strptime(Date, "%Y-%m-%d"))
seeds50<- seeds50 %>%
  mutate(DT = strptime(Date, "%Y-%m-%d"))
seeds50$Date <- as.character((seeds50$DT))
pheno1edi20062007 <- seeds16 %>% filter(DT>='2006-08-24') 
pheno2edi20062007<- seeds50 %>% filter(DT<='2007-08-09')

# use the larger traps where they overlap, remove smaller traps during the overlap
seeds16 <- seeds16 %>% filter(DT<'2006-08-24') 


seeds_tidy_16 <- seeds16 %>% mutate(NUMBER = ifelse((CODE >=4 & CODE<6), NUMBER*1.61, NUMBER))

# adjust values for fruiting in smaller traps based on conversion fater from https://doi.org/10.1002/ecy.2236 
seeds_tidy_16 <- seeds_tidy_16 %>% mutate(NUMBER = ifelse((CODE ==1), 1.26, NUMBER))
seeds50 <- seeds50 %>% mutate(NUMBER = ifelse((CODE ==1), 1, NUMBER))


# add trap area
seeds_tidy_16$Seed_Trap_Area_m2 <-  0.16
seeds50$Seed_Trap_Area_m2 <- 0.5
# this appends the two datasets (files) together 
phenoedi_seeds <- rbind(seeds50, seeds_tidy_16)
phenoedi_seeds <- phenoedi_seeds %>%
  rename(Plant.ID = SPECIES)


seedsperfruit <- read_csv('./Luquillo_seed_multipliers.csv')
phenoedi_seeds <- merge(x=phenoedi_seeds, y=seedsperfruit, 
                        by= "Plant.ID", all.x=TRUE)
print("drop species without a seed multiplier? - yes for now")
speciescodes <- unique(seedsperfruit$Plant.ID)

phenoedi_seeds <- phenoedi_seeds %>%
  filter(Plant.ID %in% speciescodes) %>%
  drop()
print("convert fruit into seeds")

phenoedi_seeds <- phenoedi_seeds %>%
  mutate(NUMBER=ifelse(CODE==4, NUMBER*Multiplier, NUMBER))
# keep only rows with flowers or seeds
phenoedi_seeds <- phenoedi_seeds %>%
  filter(CODE %in% c(1, 4, 5))

# NUMBER is number of flowers or seeds, let's move them into seperate columns
phenoedi_seeds$flowers <- ifelse(phenoedi_seeds$CODE == 1, phenoedi_seeds$NUMBER, NA)

# code 4 indicates mature fruit, code 5 = count of seeds
phenoedi_seeds$seeds <- ifelse(phenoedi_seeds$CODE %in% c(4,5), phenoedi_seeds$NUMBER, NA)



print("aggregate per-species per day over all baskets") 

phenoedi_seeds_test <- phenoedi_seeds %>% filter(Plant.ID=="BUCTET") %>%
                        filter(Date=='1995-04-04')

phenoseedsAndFlowers <- phenoedi_seeds %>%
  mutate(totalTrapArea = Seed_Trap_Area_m2*120)%>%
  group_by( Plant.ID, Date) %>%
  reframe(seedsum = sum(seeds, na.rm = TRUE), 
                   flowersum = sum(flowers, na.rm = TRUE),
                   seeds.per.m2 = seedsum/totalTrapArea,
                   flowers.per.m2=flowersum/totalTrapArea) 

phenoseedsAndFlowers <- phenoseedsAndFlowers %>% distinct(Plant.ID, Date, .keep_all = TRUE)

phenoseedsAndFlowers$Date <- as.Date(phenoseedsAndFlowers$Date, "%Y-%m-%d")

print('we now have a dataframe phenoseedsAndFlowers with counts of seeds and flowers per species per day')

summary(phenoseedsAndFlowers)