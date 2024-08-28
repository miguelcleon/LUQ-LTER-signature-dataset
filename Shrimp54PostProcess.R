#shrimp post processs
# setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/")

source("./LUQ54ShrimpCrowl.R")
library(lubridate)
# QP pool locations 
# 0,8,9,15 
# 0 - lon_x = -65.815087 lat_y = 18.323088
# 8 - lon_x = -65.814131 lat_y = 18.322581
# 9 - lon_x = -65.814076 lat_y = 18.322561
# 15 - lon_x = 

# make a date 
# dt1 = Pool 0, and dt4 Pool 0
summary(dt1)
summary(dt4)
head(dt1)
print("where no date - assume the middle of the month")
dtpool0monthly <- dt1  
dtpool0weekly <- dt4  
dtpool0monthly <- dtpool0monthly %>%
  mutate(Date = as.Date(paste0(YEAR, "-", Month, "-", 18)))

summary(dtpool0weekly)
dtpool0weekly <- dtpool0weekly %>%
  mutate(Date = as.Date(paste0(as.character(YEAR), "-", WEEK, "-1"), '%Y-%U-%u'))
dtpool0weekly<- dtpool0weekly %>% select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE)
dtpool0monthly<- dtpool0monthly %>% select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE)

overlaping<- inner_join(dtpool0weekly, dtpool0monthly, by = "Date")
dtpool0 <- rbind(dtpool0monthly, dtpool0weekly)

overlaping <- overlaping %>%
  mutate(Date = Date + days(1),
   )

overlaping <- overlaping %>% select(Date, POOL.x, ATYACPUE.x, XIPHCPUE.x, MACCPUE.x) %>%
                rename(POOL=POOL.x, ATYACPUE=ATYACPUE.x, XIPHCPUE = XIPHCPUE.x, MACCPUE=MACCPUE.x)
dtpool0 <- rbind(dtpool0, overlaping)


dtpool0<- dtpool0 %>%
  arrange(Date)
dtpool0<- dtpool0 %>%
  filter(!duplicated(Date))

# pool 8 

dtpool8monthly <- dt2  
dtpool8weekly <- dt5  
dtpool8monthly <- dtpool8monthly %>%
  mutate(Date = as.Date(paste0(YEAR, "-", Month, "-", 18)))

summary(dtpool8weekly)
dtpool8weekly <- dtpool8weekly %>%
  mutate(Date = as.Date(paste0(as.character(YEAR), "-", WEEK, "-1"), '%Y-%U-%u'))
dtpool8weekly<- dtpool8weekly %>% select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE)
dtpool8monthly<- dtpool8monthly %>% select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE)

overlaping<- inner_join(dtpool8weekly, dtpool8monthly, by = "Date")
dtpool8 <- rbind(dtpool8monthly, dtpool8weekly)

overlaping <- overlaping %>%
  mutate(Date = Date + days(1),
  )

overlaping <- overlaping %>% select(Date, POOL.x, ATYACPUE.x, XIPHCPUE.x, MACCPUE.x) %>%
  rename(POOL=POOL.x, ATYACPUE=ATYACPUE.x, XIPHCPUE = XIPHCPUE.x, MACCPUE=MACCPUE.x)
dtpool8 <- rbind(dtpool8, overlaping)


dtpool8<- dtpool8 %>%
  arrange(Date)
dtpool8<- dtpool8 %>%
  filter(!duplicated(Date))

# pool 9 weekly
dtpool9weekly <- dt6  
dtpool9weekly <- dtpool9weekly %>%
  mutate(Date = as.Date(paste0(as.character(YEAR), "-", WEEK, "-1"), '%Y-%U-%u'))
dtpool9<- dtpool9weekly %>% select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE)

summary(dtpool9)
shrimpdata <- rbind(dtpool0, dtpool8)
shrimpdata <- rbind(shrimpdata, dtpool9)


# pool 15 weekly
summary(dt3)
dtpool5monthly <- dt3  
dtpool5monthly <- dtpool5monthly %>%
  mutate(Date = as.Date(paste0(YEAR, "-", Month, "-", 18)))
dtpool15<- dtpool5monthly %>% select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE)

summary(dtpool15)
shrimpdata <- rbind(shrimpdata, dtpool15)

