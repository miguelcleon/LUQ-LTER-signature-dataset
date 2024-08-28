source("./Shrimp54PostProcessKeepPools.R")

# Load necessary libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# create a time series plot for each column
shrimpplot <- ggplot() +
  geom_line(data = shrimpdata, aes(x = Date, y = ATYACPUE_POOL0, color = "ATYACPUE_POOL0"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = XIPHCPUE_POOL0, color = "XIPHCPUE_POOL0"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = MACCPUE_POOL0, color = "MACCPUE_POOL0"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = ATYACPUE_POOL8, color = "ATYACPUE_POOL8"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = XIPHCPUE_POOL8, color = "XIPHCPUE_POOL8"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = MACCPUE_POOL8, color = "MACCPUE_POOL8"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = ATYACPUE_POOL9, color = "ATYACPUE_POOL9"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = XIPHCPUE_POOL9, color = "XIPHCPUE_POOL9"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = MACCPUE_POOL9, color = "MACCPUE_POOL9"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = ATYACPUE_POOL15, color = "ATYACPUE_POOL15"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = XIPHCPUE_POOL15, color = "XIPHCPUE_POOL15"), na.rm = TRUE) +
  geom_line(data = shrimpdata, aes(x = Date, y = MACCPUE_POOL15, color = "MACCPUE_POOL15"), na.rm = TRUE) +
  labs(title = "Time Series Plot of Shrimp Species CPUE at Each Pool",
       x = "Date",
       y = "Shrimp at pool",
       color = "Species at Pool") +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "white"),
    legend.background = element_rect(fill = "white"),
    panel.grid.major = element_line(color = "gray80"),
    panel.grid.minor = element_line(color = "gray90")
  )
print(shrimpplot)
# Save the plot to a file
ggsave(filename = "./plots/shrimp_species_cpue_time_series.png", plot = shrimpplot, width = 12, height = 8, dpi = 300)
