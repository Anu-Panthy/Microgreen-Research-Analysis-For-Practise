install.packages(c("tidyverse", "janitor"))
library(tidyverse)
library(janitor)

df <- read.csv("pdi_data.csv") %>%
  clean_names()   # makes names easy: "log_cfu_g" instead of "log CFU/g"

names(df)         # always check
head(df)
# optional: remove zeros if they mean "not detected"
df_plot <- df %>% filter(log_cfu_g > 0)

# n labels per group
n_df <- df_plot %>%
  count(tray_friday) %>%
  mutate(label = paste0("n=", n))

ggplot(df_plot, aes(x = tray_friday, y = log_cfu_g, fill = tray_friday)) +
  # boxplot (hide default outliers because we show all points with jitter)
  geom_boxplot(width = 0.55, outlier.shape = NA, alpha = 0.75) +
  
  # show every data point (raw dots)
  geom_jitter(aes(color = tray_friday),
              width = 0.12, size = 2, alpha = 0.75) +
  
  # mean point
  stat_summary(fun = mean, geom = "point",
               shape = 23, size = 3, fill = "white") +
  
  # 95% CI around mean
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar",
               width = 0.12, linewidth = 0.6) +
  
  # add n labels above each group
  geom_text(data = n_df,
            aes(x = tray_friday, y = max(df_plot$log_cfu_g) + 0.2, label = label),
            inherit.aes = FALSE, size = 4) +
  
  labs(
    title = "log CFU/g by Media Type",
    x = "Media (Tray Friday)",
    y = "log CFU/g"
  ) +
  scale_fill_brewer(palette = "Set2") +
  scale_color_brewer(palette = "Dark2") +
  theme_classic(base_size = 14) +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold")
  )
1



