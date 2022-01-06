## サンキー図
### 描画用のデータセット作成

<pre class="file" data-target="clipboard">
data %>%
  count(Drug_2010, Drug_2015) %>%
  rename(source = Drug_2010,
         target = Drug_2015) %>%
  mutate(ID_source = c(rep(c(0, 1, 2, 3,), each = 2), 4),
         ID_target = c(5, 6, 6, 7, 7, 8, 8, 9, 9))
  -> table_sankey1


data %>%
  count(Drug_2015, Drug_2020) %>%
  rename(source = Drug_2015,
         target = Drug_20210) %>%
  mutate(ID_source = c(rep(c(5, 6, 7, 8), each = 2), 9),
         ID_target = c(10, 11, 11, 12, 12, 13, 13, 14, 14))
  -> table_sankey2


table_sankey <- data.frame(rbind(table_sankey1, table_sankey2))
table_sankey$n <- as.nummeric(table_sankey$n)
</pre>

### データの表示

<pre class="file" data-target="clipboard">
print(table_sankey)
</pre>

### グラフの描画

<pre class="file" data-target="clipboard">
nodes <- data.frame(name = rep(c("0", "1", "2", "3", "4"), 3))
my_color <- 'd3.scaleOrdinal().range(["#EEEEEE", "#999999", "#666666", "#333333", "#000000"])'
sankeyNetwork(
  Links = table_sankey, Nodes = nodes,
  Source = "ID_source", Target = "ID_target",
  Value = "n", NodeID = "name",
  colourScale = my_color, fontSize = 20,
  sinksRight = False
)
</pre>
