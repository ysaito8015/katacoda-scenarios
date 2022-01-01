## Source ペインと R Script

File > New File > R Script をクリックし, 新規にスクリプトファイルを作成します

同時に Scource ペインが表示されます

ここに R の関数を記入し, 実行していきます

<img src='https://i.gyazo.com/d2ad27119c6d7ad8c75b71821666901c.png' width='400'>

## ライブラリの読み込み

各コードには, クリップボードにコピーするボタンがあります

このボタンをクリックすることで, Source ペインへの貼付けが楽になります

<img src='https://i.gyazo.com/a6de1ef76d72463259719790522b91c2.png' width='400'>

<pre class="file" data-target="clipboard">
library(ggplot2)
library(tidyverse)
</pre>

## CSV ファイルからデータの読み込み

<pre class="file" data-target="clipboard">
data <- read_csv("./sample.csv")
</pre>

関数を実行する場合は, 実行する範囲を選択して Ctrl + &#9166; もしくは, 画像のアイコンをクリックします

<img src='https://i.gyazo.com/02e650725f1abc075314016b5d20220c.png' width='400'>

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
