## 積み上げ棒グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table_sb_age10_sleep) +
  aes(x = Age_10, y = n, fill = Sleep) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_brewer(palette = "Greys", direction = -1) +
  theme_classic() +
  labs(y = "count")
</pre>

## １００％積み上げ棒グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table_sb_age10_sleep) +
  aes(x = Age_10, y = n, fill = Sleep) +
  geom_bar(stat = "identity", position = "fill", color = "black") +
  scale_fill_brewer(palette = "Greys", direction = -1) +
  scale_y_continuous(labels = scales::percent) +
  theme_classic() +
  labs(y = "count")
</pre>
