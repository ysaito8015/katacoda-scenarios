## 描画用のデータセット作成

<pre class="file" data-target="clipboard">
data %>%
  count(ICD10, ICD10_cat) %>%
  drop_na(everything()) -> table_treemap_ICD
</pre>

## データの表示

<pre class="file" data-target="clipboard">
print(table_treemap_ICD)
</pre>

## グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table_treemap_ICD) +
  aes(area = n, fill = ICD10_cat, label = ICD10, subgroup = ICD10_cat) +
  geom_treemap(color = "white") +
  geom_treemap_subgroup_border(color = "black") +
  geom_treemap_text(place = "topleft", alpha = 0.8, color = "black") +
  geom_treemap_subgroup_text(place = "centre", color = "black", fontface = "italic") +
  scale_fill_brewer(palette = "Greys", direction = -1) +
  labs(fill = "ICD10 category")
</pre>
