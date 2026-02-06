getwd()
df<-read.csv("pdi_data.csv")
names(df)
install.packages("ggplot2")
library(ggplot2)
ggplot(df, aes(x = Harvest.Weight..g., y = log.CFU.g)) +
  geom_point() +
  labs(
    title = "Harvest Weight vs Bacterial Load",
    x = "Harvest Weight (g)",
    y = "log CFU/g")
ggplot(df, aes(x = Harvest.Weight..g., y = log.CFU.g)) +
  geom_point() +
  theme_minimal()

ggplot(df, aes(x = Harvest.Weight..g., y = log.CFU.g, color = Tray_Friday)) +
  geom_point()
geom_point(color = "blue")  # all points blue
ggplot(df, aes(x = Harvest.Weight..g., y = log.CFU.g)) +
  geom_point() +
  facet_wrap(~ Tray_Friday)
scale_y_continuous(limits = c(0, 8))
scale_color_brewer(palette = "Set1")
ggplot(df, aes(x = Harvest.Weight..g., y = log.CFU.g, color = Tray_Friday)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")
ggplot(df, aes(x = Tray_Friday, y = log.CFU.g)) +
  geom_boxplot()
ggplot(df, aes(x = Tray_Friday, y = log.CFU.g)) +
  geom_boxplot() +
  labs(
    title = "Bacterial Load by Media Type",
    x = "Media",
    y = "log CFU/g"
  ) +
  theme_classic()


