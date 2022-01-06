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

関数を実行する場合は, 実行する範囲を選択して Ctrl + &#9166; もしくは, 画像のアイコンをクリックします

<img src='https://i.gyazo.com/02e650725f1abc075314016b5d20220c.png' width='400'>


## CSV ファイルからデータの読み込み

<pre class="file" data-target="clipboard">
data <- read_csv("./sample.csv")
</pre>

## 描画用のデータセットの作成

<pre class="file" data-target="clipboard">
data %>%
  count(Age_10, Sleep) %>%
  mutate(Sleep = fct_relevel(Sleep,
                 c("<5hrs", "5-6hrs", "6-7hrs", "7-8hrs", "8-9hrs", ">9hrs")),
         Age_10 = fct_relevel(Age_10, c("30-39", "40-49", "50-59", "60-69"))) ->
  table_sb_age10_sleep
</pre>

## データセットの確認

<pre class="file" data-target="clipboard">
print(table_sb_age10_sleep)
</pre>

## データセットの描画
<pre class="file" data-target="clipboard">
ggplot(table_sb_age10_sleep) +
  aes(x = Age_10, y = n, fill = Sleep) +
  geom_bar(stat = "identity", position = "dodge",  color = "black") +
  scale_fill_brewer(palette = "Greys") +
  theme_classic() +
  labs(y = "count") +
  guides(fill = guilde_legent(reverse = TRUE))
</pre>
