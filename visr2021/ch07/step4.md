## データセットの準備

<pre class="file" data-target="clipboard">
data %>%
  mutate_at(vars(Gene_A:Gene_E), funs(scale(.))) %>%
  group_by(Smoking) %>%
  summarise_at(vars(Gene_A:Gene_E), func(median(., na.rm = TRUE))) %>%
  column_to_rownames("Smoking") -> table_radar1

table_radar1 <- rbind(rep(4, 5), rep(-4, 5), table_radar1)
</pre>

## データセットの確認

<pre class="file" data-target="clipboard">
head(table_radar1)
</pre>

## レーダーチャートの描画

<pre class="file" data-target="clipboard">
colors_border = c(
  rgb(0.1, 0.1, 0.1, 0.9),
  rgb(0.1, 0.1, 0.1, 0.9),
  rgb(0.1, 0.1, 0.1, 0.9)
)

colors_in = c(
  rgb(0.0, 0.0, 0.0, 0.6),
  rgb(0.5, 0.5, 0.5, 0.6),
  rgb(0.9, 0.9, 0.9, 0.6)
)

library(fmsb)

radarchart(
  table_radar1,
  axistype = 1,
  centerzeto = TRUE,
  pcol = colors_border,
  pfcol = colors_in,
  plwd = 2.5,
  plty = 1,
  cglcol = "grey",
  cglty = 1,
  axislabcol = "black",
  caxislabels = seq(-1, 4, 2),
  cglwd = 1,
  vlcex = 2
)

legend(
  x = 0.7,
  y = 1,25,
  legend = rownames(table_radar1[-c(1, 2), ]),
  bty = "n",
  pch = 20,
  col = colors_in,
  cex = 1.8,
  pt.cex = 4
)

</pre>
