#  plots

source("./mergeall.R")
library(cowplot)
library(patchwork)
# plot the merged data 
summary(df_met_shrimp_phenmonthly)
df_monthly <- df_met_shrimp_phenmonthly
summary(df_monthly)
# df_monthly$Year <- year(df_monthly$Date)
df_monthly$Year <- as.integer(year(strptime(df_monthly$month, "%Y-%m-%d")))

df_plant <- df_monthly  %>%
  filter(Plant.ID == "GUAGUI")
unique(df_monthly$ATYACPUE)
summary(df_plant)

df_plant$mean_monthly_seeds.per.m2 <- df_plant$mean_monthly_seeds.per.m2 * 1000

df_plant <- df_plant %>%
  mutate_at(vars(totrainfall_mm, ATYACPUE, mean_monthly_seeds.per.m2), ~replace(., . == 0, NA))

# pick the columns to show
df_plant <- df_plant %>% select(month,Year, totrainfall_mm,ATYACPUE,mean_monthly_seeds.per.m2)

#reformat the data for plotting
df_plant <-df_plant %>% pivot_longer(cols = c(-month, -Year), names_to= "variable", 
                            values_to="value")

summary(df_plant)
head(df_plant)

gaugui<- ggplot(df_plant, aes(x =month, y=value, color=variable)) +
  ggtitle("Monthly total rainfall (mm), sum of ATYACPUE shrimp in three pools, and mean Seeds per square meter for Guarea guidonia-Muskwood (*1000) 'GUAGUI'") +
  geom_line(data = df_plant[df_plant$variable == "totrainfall_mm",], aes(x =month, y=value)) +
  geom_point(data = df_plant[df_plant$variable %in% c("ATYACPUE", "mean_monthly_seeds.per.m2"),], aes(x =month, y=value)) +
  scale_color_manual(values = c("totrainfall_mm" = '#3399ff','ATYACPUE' = 'chocolate4', 'mean_monthly_seeds.per.m2'='chartreuse4')) + 
  scale_x_continuous(breaks = pretty(df_plant$month, n = 10)) +
  xlab("Date") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + 
  # theme_classic() +
  theme(plot.width = 2000) + 
  theme_gray()



gaugui 
ggsave("./longtermRainGauguiAndAtyacpuev2.png", plot = gaugui, width = 12, units="in")
# shrimp plot 
shrimp<- ggplot(df_monthly, aes(x = month)) +
  geom_point(aes(y = totrainfall_mm), color = "orange") +
  geom_point(aes(y = ATYACPUE), color = "blue") +
  geom_point(aes(y = MACCPUE), color = "green") +
  ggtitle("Monthly total rainfall, sum of ATYACPUE, and sum of Seeds for Plant.ID 'GUAGUI'") +
  ylim(0, 200) + 
  xlab("Date") +
  ylab("Value")

shrimp 


p1 <- ggplot(df, aes(Sepal.Width, Sepal.Length)) + 
  geom_point() + theme(axis.line = element_line())
p2 <- ggplot(df, aes(Sepal.Width, Petal.Width)) + geom_point() +
  theme(axis.line = element_line())

p3 <- ggplot(df, aes(Sepal.Width, Petal.Length)) + 
  geom_point(aes(color = "Petal.Length")) +
  geom_point(aes(y = Sepal.Length/100, color = "Sepal.Length")) +
  geom_point(aes(y = Petal.Width / 1000, color = "Petal.Width")) +
  theme(axis.line = element_line(),
        plot.margin = margin(10, 10, 10, 30))

wrap_elements(get_plot_component(p1, "ylab-l")) +
  wrap_elements(get_y_axis(p1)) +
  wrap_elements(get_plot_component(p2, "ylab-l")) +
  wrap_elements(get_y_axis(p2)) +
  p3 + 
  plot_layout(widths = c(3, 1, 3, 1, 40))