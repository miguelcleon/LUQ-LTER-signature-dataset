# annual summaries:


setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/")

source("./mergeall.R")

year_counts_obs_comb<- ''
distinct_dates <- shrimpdata %>% distinct(Date)
print("number of days birds observed")
print(nrow(distinct_dates))
year_counts_obs_shrimp <- shrimpdata %>%
  group_by(year(Date)) %>%
  summarise(count_shrimp_observations = n_distinct(Date))


summary(LFDPBirds)
distinct_dates <- LFDPBirds %>% distinct(Date)
print("number of days birds observed")
print(nrow(distinct_dates))
year_counts_obs <- LFDPBirds %>%
  group_by(year(Date)) %>%
  summarise(count_bird_observations = n_distinct(Date))
print("number per year")
print(year_counts_obs)
year_counts_obs_comb <- merge(year_counts_obs_shrimp, year_counts_obs, by='year(Date)', all.y = TRUE)

distinct_dates <- qp0discharge_day %>% distinct(Date)
print("number of days phenology observed")
print(nrow(distinct_dates))
year_counts_obs_discharge <- qp0discharge_day %>%
  group_by(year(Date)) %>%
  summarise(count_qp0discharge_observations = n_distinct(Date))
print("number per year")
print(year_counts_obs_discharge)
year_counts_obs_comb <- merge(year_counts_obs_discharge, year_counts_obs_comb, by='year(Date)', all.y = TRUE)



distinct_dates <- phenoseedsAndFlowers %>% distinct(Date)
print("number of days phenology observed")
print(nrow(distinct_dates))
year_counts_obs_pheno <- phenoseedsAndFlowers %>%
  group_by(year(Date)) %>%
  summarise(count_pheno_observations = n_distinct(Date))
print("number per year")
print(year_counts_obs_pheno)
year_counts_obs_comb <- merge(year_counts_obs_pheno, year_counts_obs_comb, by='year(Date)', all.y = TRUE)


write.csv(year_counts_obs_comb, file = "year_counts_pheno_birds_shrimp_discharge.csv", row.names = FALSE)
