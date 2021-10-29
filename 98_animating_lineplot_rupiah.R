#Building database: a wide-table
#Data source: Yahoo Finance for idrusd2008 and Bank Indonesia for idrusd2020.
setAs("character", "Date01", function(from)
  as.Date(from, format = "%d/%m/%Y"))
db01 <- as_tibble(
  read.table(
    header = TRUE,
    colClasses = c("numeric", "Date01", "numeric", "Date01", "numeric"),
    text = '
day date2008 idrusd2008 date2020 idrusd2020
0 12/06/2008 9365.2 07/11/2019 14040.0
1 13/06/2008 9423.1 08/11/2019 14020.0
2 16/06/2008 9303.6 11/11/2019 14040.0
3 17/06/2008 9286.8 12/11/2019 14059.0
4 18/06/2008 9277.6 13/11/2019 14082.0
5 19/06/2008 9266.2 14/11/2019 14098.0
6 20/06/2008 9251.2 15/11/2019 14069.0
7 23/06/2008 9311.7 18/11/2019 14075.0
8 24/06/2008 9269.0 19/11/2019 14091.0
9 25/06/2008 9188.4 20/11/2019 14097.0
10 26/06/2008 9192.3 21/11/2019 14112.0
11 27/06/2008 9193.7 22/11/2019 14100.0
12 30/06/2008 9194.5 25/11/2019 14091.0
13 01/07/2008 9265.0 26/11/2019 14081.0
14 02/07/2008 9203.4 27/11/2019 14096.0
15 03/07/2008 9202.2 28/11/2019 14099.0
16 04/07/2008 9194.2 29/11/2019 14102.0
17 07/07/2008 9189.2 02/12/2019 14122.0
18 08/07/2008 9208.3 03/12/2019 14130.0
19 09/07/2008 9157.1 04/12/2019 14125.0
20 10/07/2008 9152.0 05/12/2019 14094.0
21 11/07/2008 9058.1 06/12/2019 14037.0
22 14/07/2008 9141.5 09/12/2019 14021.0
23 15/07/2008 9140.3 10/12/2019 14004.0
24 16/07/2008 9184.3 11/12/2019 14025.0
25 17/07/2008 9158.7 12/12/2019 14042.0
26 18/07/2008 9137.1 13/12/2019 13982.0
27 21/07/2008 9150.3 16/12/2019 14004.0
28 22/07/2008 9151.1 17/12/2019 14018.0
29 23/07/2008 9210.0 18/12/2019 14007.0
30 24/07/2008 9110.3 19/12/2019 13983.0
31 25/07/2008 9140.5 20/12/2019 13993.0
32 28/07/2008 9120.4 23/12/2019 13978.0
33 29/07/2008 9106.9 26/12/2019 13982.0
34 30/07/2008 9118.6 27/12/2019 13956.0
35 31/07/2008 9108.1 30/12/2019 13945.0
36 01/08/2008 9265.0 31/12/2019 13901.0
37 26/08/2008 9312.8 02/01/2020 13895.0
38 27/08/2008 9159.4 03/01/2020 13899.0
39 28/08/2008 9165.7 06/01/2020 13961.0
40 29/08/2008 9193.5 07/01/2020 13919.0
41 01/09/2008 9253.2 08/01/2020 13934.0
42 02/09/2008 9500.5 09/01/2020 13860.0
43 03/09/2008 9521.1 10/01/2020 13812.0
44 04/09/2008 9330.4 13/01/2020 13708.0
45 05/09/2008 9318.9 14/01/2020 13654.0
46 08/09/2008 9377.8 15/01/2020 13706.0
47 09/09/2008 9357.6 16/01/2020 13658.0
48 10/09/2008 9470.2 17/01/2020 13648.0
49 11/09/2008 9461.2 20/01/2020 13654.0
50 12/09/2008 9299.1 21/01/2020 13658.0
51 15/09/2008 9118.9 22/01/2020 13678.0
52 16/09/2008 9468.2 23/01/2020 13626.0
53 17/09/2008 9367.7 24/01/2020 13632.0
54 18/09/2008 9385.0 27/01/2020 13612.0
55 19/09/2008 9389.2 28/01/2020 13647.0
56 22/09/2008 9277.7 29/01/2020 13634.0
57 23/09/2008 9327.3 30/01/2020 13652.0
58 24/09/2008 9367.1 31/01/2020 13662.0
59 25/09/2008 9360.4 03/02/2020 13726.0
60 26/09/2008 9393.0 04/02/2020 13760.0
61 29/09/2008 9442.7 05/02/2020 13717.0
62 30/09/2008 9481.7 06/02/2020 13662.0
63 01/10/2008 9536.2 07/02/2020 13647.0
64 02/10/2008 9431.0 10/02/2020 13708.0
65 03/10/2008 9453.7 11/02/2020 13686.0
66 06/10/2008 9572.1 12/02/2020 13659.0
67 07/10/2008 9605.1 13/02/2020 13679.0
68 08/10/2008 9572.4 14/02/2020 13707.0
69 09/10/2008 9634.9 17/02/2020 13693.0
70 10/10/2008 9876.1 18/02/2020 13676.0
71 13/10/2008 9713.7 19/02/2020 13717.0
72 14/10/2008 9715.4 20/02/2020 13735.0
73 15/10/2008 9823.7 21/02/2020 13777.0
74 16/10/2008 9838.0 24/02/2020 13863.0
75 17/10/2008 9868.9 25/02/2020 13893.0
76 20/10/2008 9953.7 26/02/2020 13966.0
77 21/10/2008 9858.1 27/02/2020 14018.0
78 22/10/2008 9954.0 28/02/2020 14234.0
79 23/10/2008 9854.0 02/03/2020 14413.0
80 24/10/2008 9993.7 03/03/2020 14222.0
81 27/10/2008 10832.0 04/03/2020 14171.0
82 28/10/2008 10542.0 05/03/2020 14168.0
83 29/10/2008 10700.0 06/03/2020 14267.0
84 30/10/2008 10782.0 09/03/2020 14342.0
85 31/10/2008 11024.0 10/03/2020 14411.0
86 03/11/2008 11065.0 11/03/2020 14323.0
87 04/11/2008 10749.0 12/03/2020 14490.0
88 05/11/2008 10453.0 13/03/2020 14815.0
89 06/11/2008 11100.0 16/03/2020 14818.0
90 07/11/2008 11155.0 17/03/2020 15083.0
91 10/11/2008 11124.0 18/03/2020 15223.0
92 11/11/2008 11171.0 19/03/2020 15712.0
93 12/11/2008 11218.0 20/03/2020 16273.0
94 13/11/2008 11314.0 23/03/2020 16608.0
95 14/11/2008 11493.0 24/03/2020 16486.0
96 17/11/2008 11865.0 26/03/2020 16328.0
97 18/11/2008 12009.0 27/03/2020 16230.0
98 19/11/2008 12000.0 30/03/2020 16336.0
99 20/11/2008 12372.0 31/03/2020 16367.0
100 21/11/2008 11955.0 01/04/2020 16413.0
101 24/11/2008 12407.0 02/04/2020 16741.0
102 25/11/2008 12416.0 03/04/2020 16464.0
103 26/11/2008 12549.0 06/04/2020 16556.0
104 27/11/2008 12552.0 07/04/2020 16410.0
105 28/11/2008 12749.0 08/04/2020 16245.0
106 01/12/2008 12233.0 09/04/2020 16241.0
107 02/12/2008 12313.0 13/04/2020 15840.0
108 03/12/2008 11961.0 14/04/2020 15722.0
109 04/12/2008 11949.0 15/04/2020 15707.0
110 05/12/2008 12002.0 16/04/2020 15787.0
111 08/12/2008 11430.0 17/04/2020 15503.0
112 09/12/2008 10856.0 20/04/2020 15543.0
113 10/12/2008 10889.0 21/04/2020 15643.0
114 11/12/2008 10926.0 22/04/2020 15567.0
115 12/12/2008 10909.0 23/04/2020 15630.0
116 15/12/2008 11100.0 24/04/2020 15553.0
117 16/12/2008 10853.0 27/04/2020 15591.0
118 17/12/2008 10863.0 28/04/2020 15488.0
119 18/12/2008 10953.0 29/04/2020 15415.0
120 19/12/2008 11244.0 30/04/2020 15157.0
'
  )
)
#The notification "in method for ‘coerce’ with signature ‘"character","Date01"’: no definition for class “Date01” can be ignored.

#Check the database
dim(db01)
lapply(db01, class)
str(db01)
head(db01)

#Developing the index
##day-0 for idrusd2008 is IDR9365.2/USD, while for idrusd2020 is IDR14040.
db02 <- db01 %>%
  mutate("2008subprime" = ((idrusd2008 - 9365.2) / 9365.2) * -100,
         "2020corona" = ((idrusd2020 - 14040) / 14040) * -100)
db02
#Making it easier to interpret by times with -100, so the appreciation of rupiah will have positive value, while the depreciation will have negative value. Both of them will be in percentage format.

#Selecting the day and the new variables as our final database
db03 <- db02 %>% select("day", "2008subprime", "2020corona")
db03

#Converting from wide-table to long-table
library(tidyr)
db04 <-
  gather(db03, varble, value, "2008subprime":"2020corona", factor_key = TRUE)
head(db04)

#Ordering the data by the day
db05 <- db04 %>% arrange(day, varble) %>%
  group_by(day)
head(db05)

#Defining our manual color: a set of color-bind-friendly color.
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
col02 <- c("#D55E00", "#009E73")

#Starting create the plot
plot01 <- ggplot(db05, aes(day, value, group = varble,)) +
  geom_line(aes(colour = varble), size = 1) +
  scale_color_manual(
    values = col02,
    name = "",
    labels = c("2008 Subprime",
               "2020 Corona")
  )
plot01
plot02 <-  plot01 +
  geom_segment(aes(
    xend = max(day),
    yend = value,
    color = varble
  ),
  linetype = 2)
plot02
plot03 <- plot02 +
  geom_text(
    aes(
      x = 123,
      label = sprintf("%0.1f", round(value, digits = 2)),
      color = varble
    ),
    show.legend = FALSE,
    size = 5,
    hjust = 0
  )
plot03
plot04 <-  plot03 +
  scale_y_continuous(limits = c(-40, 5)) +
  scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100, 120),
                     limits = c(0, 130)) +
  theme(legend.position = "bottom") +
  ylab("(dalam %)") +
  xlab("Hari ke-") +
  geom_vline(xintercept = 100, col = "#56B4E9") +
  annotate(
    "text",
    label = "Keputusan bailout Bank Century: 21-Nov-08 --»",
    x = 99,
    y = -36,
    size = 4,
    hjust = 1,
    colour = "#D55E00"
  ) +
  annotate(
    "text",
    label = "Penerbitan Perppu 1/2020: 1-Apr-20 --»",
    x = 99,
    y = -39,
    size = 4,
    hjust = 1,
    colour = "#009E73"
  ) +
  annotate(
    "text",
    label = "• Hari ke-0: 12-Jun-08, IDR9,365/USD",
    x = 0,
    y = -16,
    size = 4,
    hjust = 0,
    colour = "#D55E00"
  ) +
  annotate(
    "text",
    label = "• Hari ke-0: 7-Nov-19, IDR14,040/USD",
    x = 0,
    y = -19,
    size = 4,
    hjust = 0,
    colour = "#009E73"
  )
plot04
plot05 <- plot04 +
  theme(
    plot.title = element_text(hjust = 0, size = 30, face = "bold"),
    plot.subtitle = element_text(hjust = 0, size = 13),
    plot.caption = element_text(size = 11, hjust = 1),
    legend.text = element_text(size = 12),
    axis.title.x = element_text(size = 11, face = "italic"),
    axis.title.y = element_text(size = 11, face = "italic"),
    axis.text.y = element_text(size = 12),
    axis.text.x = element_text(size = 12),
    legend.key = element_rect(fill = "white"),
  ) +
  labs(
    title = "Indonesia",
    subtitle = "Indeks IDR/USD: >0 = menguat, <0 = melemah; bila dibandingkan dengan
       posisi nilai tukar rupiah terhadap dollar AS pada hari ke-0 (basis indeks)",
    caption = "Sumber data: Yahoo Finance dan Bank Indonesia, diolah."
  )
plot05
plot06 <- plot05 + transition_reveal(day) +
  coord_cartesian(clip = 'off')
plot06

#Save as a gif file.
animate(
  plot06,
  width = 480,
  height = 480,
  nframes = 600,
  duration = 50,
  fps = 30,
  end_pause = 10
)
anim_save("idr01.gif", animation = last_animation(), overwrite = TRUE)

#Note:
##a 480x480 resolution is enough if we would like to upload the gif-file on the website and twitter. But, if we intend to post on instagram and facebook, we need to have at least a 1080x1080 resolution. Below is my recommendation for the rendering process (it takes around 30 minutes):
animate(
  plot06,
  width = 1080,
  height = 1080,
  nframes = 1200,
  duration = 50,
  fps = 45,
  end_pause = 10
)
anim_save("idr02.gif", animation = last_animation(), overwrite = TRUE)

##Further, since it is not possible to upload a gif-file on instagram, firstly I convert the gif-file to be a mp4-file using an android-app called 'GIF Maker-Editor'. Secondly, to preserve the video quality of the plot, I convert the result of the previous conversion to be another mp4-file using another android-app called 'inShot' and choose the highest resolution (1080) when save the file.

##Now, you are ready to upload the plot on instagram and facebook without worrying to much about its quality.

# Link: https://arifpras.medium.com/dua-dari-tiga-9a4f1a9408c0
