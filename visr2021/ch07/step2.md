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
pref <- read_csv("./prefecture.csv")
data <- read_csv("./sample.csv")
</pre>


## バブルプロットの描画
<pre class="file" data-target="clipboard">
ggplot(pref) +
  aes(x = income_pop, y = mortality_ncds_pop, size = density) +
  geom_point(alpha = 0.5) +
  scale_size_continuous(range = c(0.1, 10), name = "density (/km2)") +
  theme_classic() +
  labs(x = "Income per capita (yen)", y = "Mortality rate of NCDs (/1M)")
</pre>
