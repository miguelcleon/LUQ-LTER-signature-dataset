
source("./LUQ54ShrimpCrowl.R")
library(lubridate)
# Pool 0
dtpool0monthly <- dt1
dtpool0weekly <- dt4
dtpool0monthly <- dtpool0monthly %>%
  mutate(Date = as.Date(paste0(YEAR, "-", Month, "-", 18)))

dtpool0weekly <- dtpool0weekly %>%
  mutate(Date = as.Date(paste0(as.character(YEAR), "-", WEEK, "-1"), '%Y-%U-%u'))

dtpool0weekly <- dtpool0weekly %>%
  select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE) %>%
  rename(
    ATYACPUE_POOL0 = ATYACPUE,
    XIPHCPUE_POOL0 = XIPHCPUE,
    MACCPUE_POOL0 = MACCPUE
  )

dtpool0monthly <- dtpool0monthly %>%
  select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE) %>%
  rename(
    ATYACPUE_POOL0 = ATYACPUE,
    XIPHCPUE_POOL0 = XIPHCPUE,
    MACCPUE_POOL0 = MACCPUE
  )

overlaping <- inner_join(dtpool0weekly, dtpool0monthly, by = "Date")
dtpool0 <- rbind(dtpool0monthly, dtpool0weekly)

overlaping <- overlaping %>%
  mutate(Date = Date + days(1))

overlaping <- overlaping %>%
  select(Date, POOL.x, ATYACPUE_POOL0.x, XIPHCPUE_POOL0.x, MACCPUE_POOL0.x) %>%
  rename(
    POOL = POOL.x,
    ATYACPUE_POOL0 = ATYACPUE_POOL0.x,
    XIPHCPUE_POOL0 = XIPHCPUE_POOL0.x,
    MACCPUE_POOL0 = MACCPUE_POOL0.x
  )

dtpool0 <- rbind(dtpool0, overlaping)

dtpool0 <- dtpool0 %>%
  arrange(Date) %>%
  filter(!duplicated(Date))


# Pool 8
dtpool8monthly <- dt2
dtpool8weekly <- dt5
dtpool8monthly <- dtpool8monthly %>%
  mutate(Date = as.Date(paste0(YEAR, "-", Month, "-", 18)))

dtpool8weekly <- dtpool8weekly %>%
  mutate(Date = as.Date(paste0(as.character(YEAR), "-", WEEK, "-1"), '%Y-%U-%u'))

dtpool8weekly <- dtpool8weekly %>%
  select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE) %>%
  rename(
    ATYACPUE_POOL8 = ATYACPUE,
    XIPHCPUE_POOL8 = XIPHCPUE,
    MACCPUE_POOL8 = MACCPUE
  )

dtpool8monthly <- dtpool8monthly %>%
  select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE) %>%
  rename(
    ATYACPUE_POOL8 = ATYACPUE,
    XIPHCPUE_POOL8 = XIPHCPUE,
    MACCPUE_POOL8 = MACCPUE
  )

overlaping <- inner_join(dtpool8weekly, dtpool8monthly, by = "Date")
dtpool8 <- rbind(dtpool8monthly, dtpool8weekly)

overlaping <- overlaping %>%
  mutate(Date = Date + days(1))

overlaping <- overlaping %>%
  select(Date, POOL.x, ATYACPUE_POOL8.x, XIPHCPUE_POOL8.x, MACCPUE_POOL8.x) %>%
  rename(
    POOL = POOL.x,
    ATYACPUE_POOL8 = ATYACPUE_POOL8.x,
    XIPHCPUE_POOL8 = XIPHCPUE_POOL8.x,
    MACCPUE_POOL8 = MACCPUE_POOL8.x
  )

dtpool8 <- rbind(dtpool8, overlaping)

dtpool8 <- dtpool8 %>%
  arrange(Date) %>%
  filter(!duplicated(Date))

# Pool 9
dtpool9weekly <- dt6
dtpool9weekly <- dtpool9weekly %>%
  mutate(Date = as.Date(paste0(as.character(YEAR), "-", WEEK, "-1"), '%Y-%U-%u'))

dtpool9 <- dtpool9weekly %>%
  select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE) %>%
  rename(
    ATYACPUE_POOL9 = ATYACPUE,
    XIPHCPUE_POOL9 = XIPHCPUE,
    MACCPUE_POOL9 = MACCPUE
  )

dtpool9 <- dtpool9 %>%
  arrange(Date) %>%
  filter(!duplicated(Date))

# Pool 15
dtpool5monthly <- dt3
dtpool5monthly <- dtpool5monthly %>%
  mutate(Date = as.Date(paste0(YEAR, "-", Month, "-", 18)))

dtpool15 <- dtpool5monthly %>%
  select(Date, POOL, ATYACPUE, XIPHCPUE, MACCPUE) %>%
  rename(
    ATYACPUE_POOL15 = ATYACPUE,
    XIPHCPUE_POOL15 = XIPHCPUE,
    MACCPUE_POOL15 = MACCPUE
  )

dtpool15 <- dtpool15 %>%
  arrange(Date) %>%
  filter(!duplicated(Date))

# Combine all pools

# Merge Pool 0 with Pool 8
shrimpdata <- full_join(dtpool0, dtpool8, by = "Date")

# Merge with Pool 9
shrimpdata <- full_join(shrimpdata, dtpool9, by = "Date")

# Finally, merge with Pool 15
shrimpdata <- full_join(shrimpdata, dtpool15, by = "Date")

# Check the structure and first few rows of the combined dataframe
print(str(shrimpdata))
print(head(shrimpdata))

# Optional: Sorting the data by date to maintain chronological order
shrimpdata <- shrimpdata %>%
  arrange(Date)
shrimpdata <- shrimpdata %>%
  select(-starts_with("POOL."))

shrimpdata <- shrimpdata %>%
  mutate(across(starts_with("ATYACPUE_") | starts_with("XIPHCPUE_") | starts_with("MACCPUE_"), as.numeric))

summary(shrimpdata)