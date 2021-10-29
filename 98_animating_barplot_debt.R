library(ggplot2)
library(gifski)
library(gganimate)
library(ggthemes)

#Building database: a wide-table
#Data source: countryeconomy.com, then convert to Rupiah using data provided by investing.com.
db01 <- read.table(
  header = TRUE,
  text = '
year gdppc_usd dbtpc_usd   excrate   gdppc_idrjt  dbtpc_idrjt ratio
2000  870.0       760.0      9675.0   8.42         7.35     0.87
2001  834.0       615.0     10400.0   8.67         6.40     0.74
2002 1003.0       626.0      8950.0   8.98         5.60     0.62
2003 1187.0       661.0      8422.5  10.00         5.57     0.56
2004 1281.0       658.0      9282.5  11.89         6.11     0.51
2005 1404.0       598.0      9830.0  13.80         5.88     0.43
2006 1765.0       633.0      8993.5  15.87         5.69     0.36
2007 2064.0       667.0      9392.5  19.39         6.26     0.32
2008 2418.0       732.0     10900.0  26.36         7.98     0.30
2009 2465.0       654.0      9425.0  23.23         6.16     0.27
2010 3178.0       779.0      9010.0  28.63         7.02     0.25
2011 3689.0       852.0      9067.5  33.45         7.73     0.23
2012 3745.0       859.0      9637.5  36.09         8.28     0.23
2013 3684.0       915.0     12170.0  44.83        11.14     0.25
2014 3534.0       872.0     12385.0  43.77        10.80     0.25
2015 3368.0       910.0     13787.5  46.44        12.55     0.27
2016 3606.0      1008.0     13472.5  48.58        13.58     0.28
2017 3885.0      1143.0     13567.5  52.71        15.51     0.29
2018 3871.0      1164.0     14380.0  55.66        16.74     0.30
        '
)

#Data checking.
#All of variables, excluding 'year', are supposed to be in numeric.
as.numeric(db01$gdppc_usd)
as.numeric(db01$dbtpc_usd)
as.numeric(db01$excrate)
as.numeric(db01$gdppc_idrjt)
as.numeric(db01$dbtpc_idrjt)
as.numeric(db01$ratio)
class(db01$gdppc_usd)
class(db01$dbtpc_usd)
class(db01$excrate)
class(db01$gdppc_idrjt)
class(db01$dbtpc_idrjt)
class(db01$ratio)
head(db01)
tail(db01)

#Convert to long-table
library(tidyr)
db02 <-
  gather(db01, varble, value, gdppc_usd:ratio, factor_key = TRUE)
db02

#Sorting based on the year then leaving out the gdp per capita in USD, debt per capita in USD, the exchange rate, and the ratio
db03 <- db02 %>%
  arrange(year, desc(value)) %>%
  filter(varble != "gdppc_usd" &
           varble != "dbtpc_usd" &
           varble != "excrate" &
           varble != "ratio") %>%
  group_by(year) %>%
  mutate(rank = 1:n())

head(db04)
tail(db04)
db04

#Creating color-blind-friendly
col01 <-
  c(
    "#999999",
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#F0E442",
    "#0072B2",
    "#D55E00",
    "#CC79A7"
  )
col02 <- c("#0072B2", "#D55E00")

#Starting to build the plot
plot01 <- db03 %>%
  ggplot(aes(year, value)) +
  scale_fill_manual(
    values = col02,
    name = "",
    labels = c("Pendapatan per penduduk", "Utang per penduduk")
  ) +
  aes(
    xmin = 0,
    xmax = value / 1,
    ymin = rank - .45,
    ymax = rank + .45,
    y = rank,
    fill = varble
  ) +
  scale_y_reverse()
plot01
plot02 <- plot01 + facet_wrap( ~ year) +
  geom_rect(alpha = 0.9) +
  scale_x_continuous(
    limits = c(0, 70),
    breaks = c(20, 40, 60),
    labels = dollar_format(prefix = "Rp", suffix = " juta")
  )
plot02
plot03 <- plot02 +
  geom_text(
    aes(
      x = value,
      color = varble,
      label = sprintf("%0.1f", round(value, digits = 2))
    ),
    nudge_x = 6,
    #x = 70,
    size = 15,
    show.legend = FALSE
  ) +
  ylab(NULL) +
  xlab(NULL) +
  #theme_article() +
  scale_color_manual(values = col02)
plot03
plot04 <- plot03 +
  theme(
    plot.title = element_text(hjust = 0.5, size = 40, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 30),
    plot.caption = element_text(size = 15),
    legend.position = "top",
    legend.text = element_text(size = 18),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 18)
  ) +
  labs(title = "Indonesia",
       subtitle = "Tahun {frame_time}")
plot04

#Render to gif
animate(
  plot04 +
    facet_null() +
    transition_time(as.integer(year)),
  width = 800,
  height = 800,
  nframes = 600,
  duration = 30,
  fps = 30,
  end_pause = 10,
  rewind = TRUE
)
anim_save("debt01.gif", animation = last_animation(), overwrite = TRUE)

#Link: https://arifpras.medium.com/utang-melulu-2-265a0ea7afaf