#install.packages("GetBCBData")
#install.packages("gganimate") 
#install.packages("transformr") # Necessário para animações suaves
#install.packages("scales")
#install.packages("viridis")

library(GetBCBData)
library(tidyverse)
library(gganimate)
library(transformr)
library(scales)
library(viridis)
library(lubridate)

my.id <- c(divida_liquida = 4468)

df.bcb <- gbcbd_get_series(id = my.id,
                           first.date = '2000-01-01',
                           last.date = Sys.Date(),
                           format.data = 'long',
                           use.memoise = TRUE,
                           cache.path = tempdir(),
                           do.parallel = FALSE)
glimpse(df.bcb)

df.bcb <- df.bcb %>%
  mutate(ano = lubridate::year(ref.date))



p <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_line(color = "#1f77b4", size = 1.4) +  # linha azul
  geom_point(color = "#e74c3c", size = 3, alpha = 0.9) +
  geom_text(data = tail(df.bcb, 1),
            aes(label = paste0("R$ ", format(value, big.mark = ".", decimal.mark = ","))),
            vjust = -1, hjust = 1, size = 5, fontface = "bold", color = "#1f77b4") +
  geom_text(data = df.bcb %>% filter(lubridate::month(ref.date) == 1),
            aes(label = ano),
            vjust = 1.5, hjust = 0.5, size = 3.5, color = "#1f77b4") + # rótulo dos anos em janeiro
  scale_y_continuous(labels = label_comma(big.mark = ".", decimal.mark = ",")) +
  labs(
    title = "💰 Dívida Líquida do Setor Público",
    subtitle = "Governo Federal e Banco Central | {frame_along}",
    x = NULL, y = "Saldo (R$ milhões)"
  ) +
  theme_minimal(base_size = 16) +
  theme(
    plot.background = element_rect(fill = "#ffffff", color = NA),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title = element_text(face = "bold", color = "#1a1a1a", size = 20),
    plot.subtitle = element_text(color = "#555555", size = 14),
    axis.title.y = element_text(face = "bold", margin = margin(r = 10)),
    axis.text = element_text(color = "#333333")
  ) +
  transition_reveal(ref.date)
animate(p, width = 800, height = 500, fps = 15, duration = 20, end_pause = 40)
