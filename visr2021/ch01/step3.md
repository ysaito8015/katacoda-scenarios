## 円グラフ用のデータの整形

<pre class="file" data-target="clipboard">
data %>%
  count(Sex) -> table_pi_sex
</pre>

## データの内容表示


<pre class="file" data-target="clipboard">
table_pi_sex
</pre>


## 円グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table_pi_sex) +
  aes(x = "", y = n, fill = Sex) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y") +
  theme_void() +
  scale_fill_manual_values = c("#d3d3d3", "#000000")) +
  guides(fill = guide_legend(reverse = TRUE)) +
  labs(fill = "Sex")
</pre>
