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
library(VennDiagram)
library(networkD3)
</pre>

関数を実行する場合は, 実行する範囲を選択して Ctrl + &#9166; もしくは, 画像のアイコンをクリックします

<img src='https://i.gyazo.com/02e650725f1abc075314016b5d20220c.png' width='400'>


## CSV ファイルからデータの読み込み

<pre class="file" data-target="clipboard">
data <- read_csv("./sample.csv")
</pre>

## 描画用のデータセットの作成

<pre class="file" data-target="clipboard">
Obese <- which(data#Obese == 1)
Hyperglycemia <- which(data$Hyperglycemia == 1)
Hypertension <- which(data$Hypertension == 1)

list <- list(
  Obese = Obese,
  Hypertension = Hypertension,
  Hyperglycemia = Hyperglycemia
</pre>

## データセットの確認

<pre class="file" data-target="clipboard">
print(table_sb_age10_sleep)
</pre>

## データセットの描画
<pre class="file" data-target="clipboard">
venn.diagram(
  list, cex = 1.5, fill = c(1, 1, 1), alpha = 0.3,
  filename = "venn.jpg", main = "TOtal n = 200, None: 47.5%",
  fontfamily = "sans", main.fontfamily = "sans", cat.fontfamily = "sans")
</pre>
