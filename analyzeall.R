all_monthly <- df_monthly_met_shrimp
# summary(df_monthly_met_shrimp)
#
# all_monthly <- all_monthly %>%
#     mutate(ATYACPUE = ifelse(ATYACPUE == 0, NA, ATYACPUE)) %>%
#        mutate(MACCPUE = ifelse(MACCPUE == 0, NA, MACCPUE))
#
# shrimpPO4 <- lm(mean_streamqp_PO4P ~  ATYACPUE + MACCPUE, data=all_monthly)
# summary(shrimpPO4)
#
# ggplot(all_monthly, aes(x =  ATYACPUE + MACCPUE, y =  mean_streamqp_PO4P))  +
#  geom_point() +   # geom_smooth(method = "lm", se = TRUE) +
#   labs(x = "Shrimp  counts ", y = "Mean Stream PO4P (ug/L)") +
#   theme_bw() +
#   theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14)) +
#   theme(legend.position = "none")

df_daily <- df_met_shrimp
summary(df_daily)
# df_monthly$Year <- year(df_monthly$Date)
df_daily$Year <- as.integer(year(strptime(df_daily$Date, "%Y-%m-%d")))

shrimpPO4lm <- lm(PO4P_QP ~  ATYACPUE + MACCPUE + XIPHCPUE, data=df_daily)
summary(shrimpPO4lm)
df_daily <- df_daily %>%
  mutate_at(vars(PO4P, ATYACPUE,MACCPUE), ~replace(., . == 0, NA))

# pick the columns to show
df_daily <- df_daily %>% select(Date,Year, ATYACPUE,MACCPUE, PO4P_QP, max_discharge__qp0_m3_s)

#reformat the data for plotting
df_daily <-df_daily %>% pivot_longer(cols = c(-Date, -Year), names_to= "variable",
                            values_to="value")

shrimppo4<- ggplot(df_daily, aes(x =Date, y=value, color=variable)) +
  ggtitle("Shrimp populations and PO4 ") +
  # geom_line(data = df_daily[df_daily$variable == "max_discharge__qp0_m3_s",], aes(x =Date, y=value)) +
  geom_point(data = df_daily[df_daily$variable %in% c("ATYACPUE", "MACCPUE", "PO4P_QP"),], aes(x =Date, y=value)) +
  scale_color_manual(values = c("MACCPUE" = '#3399ff','ATYACPUE' = 'chocolate4', 'PO4P_QP'='chartreuse4')) +
  scale_x_continuous(breaks = pretty(df_daily$Date, n = 10)) +
  xlab("Date") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(plot.width = 2000) +
  theme_gray()
shrimppo4

# plot - clean up met data -
# what do people need -