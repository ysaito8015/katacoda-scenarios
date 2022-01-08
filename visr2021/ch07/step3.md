## データセットの準備

<pre class="file" data-target="clipboard">
set.seed(20210306)

data %>%
  select(ID, Gene_A:Gene_E) %>%
  sample_n(50) %>%
  mutate_at(vars(Gene_A:Gene_E), func(scale(.))) %>%
  column_to_rownames("ID") %>%
  as.matrix() -> data_heatmap_base
</pre>

## データセットの確認

<pre class="file" data-target="clipboard">
head(data_heatmap_base)
</pre>

## ヒートマップの描画

<pre class="file" data-target="clipboard">
library(gplots)

WB20 <- colorpanel(n = 20, low = "White", high = "Black")

heatmap.2(
  data_heatmap_base,
  cexCol = 1,
  key = TRUE,
  keysize = 1,
  key.xlab = "Z-value",
  key.title = NA,
  density.info = "none",
  colsep = c(1:4),
  rowsep = c(1:50),
  sepcolor = "Grey",
  sepwidth = c(0.001, 0.05),
  trace = "nane",
  col - WB20
)
</pre>

## 面グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table) +
  aes(x = Month, y = SBP_m, group = 1) +
  geom_area(fill = "black", alpha = 0.3) +
  geom_line(size = 1.2) +
  geom_point(seize = 4) +
  theme_classic() +
  labs(y = "mean_SBP")
</pre>

