## CSV ファイルからデータの読み込み

<pre class="file" data-target="clipboard">
data <- read_csv("./sample.csv")
</pre>

入力カーソルのある行の関数を実行する場合は, Ctrl + &#9166; もしくは, 画像のアイコンをクリックします

<img src='' width=''>

## グラフ描画ライブラリの読み込み

<pre class="file" data-target="clipboard">
library(ggplot2)
</pre>

## サンプルデータの Sex 列の描画

<pre class="file" data-target="clipboard">
ggplot(data) +
  aes(x = Sex) +
  geom_bar(width = 0.8, fill = "black") +
  theme_classic()
</pre>

## サンプルデータの Area 列の描画

- Area 列の並び替え

<pre class="file" data-target="clipboard">
data %>%
  mutate(Area_order = fct_infreq(Area)) -> data
</pre>

- グラフ描画

<pre class="file" data-target="clipboard">
ggplot(data) +
  aes(x = Area_order) +
  geom_bar(width = 0.8, fill = "black") +
  theme_classic()
</pre>
