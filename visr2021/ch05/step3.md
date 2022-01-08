## ヒストグラムの描画

<pre class="file" data-target="clipboard">
ggplot(data) +
  aes(x = SBP) +
  geom_histogram(bins = 10, fill = "grey", color = "black", boundary = 0) +
  theme_classic() +
  labs(x = "SBP (mmHg)", y = "count")
</pre>

## 密度プロットの描画

<pre class="file" data-target="clipboard">
ggplot(data) +
  aes(x = TG) +
  geom_density(fill = "grey", color = "black") +
  labs(x = "TG (mg/dl)", y = "densityr")
</pre>

## リッジラインプロットの描画

<pre class="file" data-target="clipboard">
library(ggridges)

ggplot(data) +
  aes(x = SBP, y = Smoking, fill = Smoking) +
  geom_density_ridges(color = "black") +
  scale_fill_brewer(palette = "Greys", direction = -1) +
  labs(x = "SBP (mmHg)", y = "Smoking") +
  guides(fill = guide_legend(reverse =TRUE))
</pre>
