## 実行環境

`pwd; whoami; cat /etc/lsb-release`{{execute}}

右に表示されているターミナルで, Docker の pull が終わると RStudio が立ち上がります

R server のタブをクリックし, もし表示されない場合は, 画像のアイコンをクリックします

<img src='https://i.gyazo.com/93f617774f4b21ecd1694c491f76ad58.png' width='400'>

```
R version
  R version 4.1.2 (2021-11-01) -- "Bird Hippie"
RStudio version
  2021.09.1 Build 372
```

## 新規 R プロジェクトの作成
RStudio のメニューから, File > New Project... を選択します

(クリックで画像拡大)

<img src='https://i.gyazo.com/67c1dc4cbf31dca2fc8f9b80de3d3af4.png' width='400'>

New Directory を選択します

<img src='https://i.gyazo.com/f4c1be6d0b89362f3955621c1b6b0304.png' width='400'>

New Project を選択します

<img src='https://i.gyazo.com/6cc58206b86fc5175a3f4a0b6c1a7f32.png' width='400'>

Create New Project の画面で, 下記のように入力し, Create Project をクリックします

<img src='https://i.gyazo.com/00212e504815816a66d0b07e73b00837.png' width='400'>

## 使用するデータの準備
`sample.csv` を準備します

`mv /work/prefecture.csv /work/visR2021/ && mv /work/sample.csv /work/visR2021/`{{execute}}

上記のコマンドの最後に表示されている &#x23CE; アイコンをクリックすると自動的にコマンドが実行されます

RStuido の右下のペインで, Home > work > visR2021 とクリックしていくと `sample.csv` が表示されます

<img src='https://i.gyazo.com/cd60618e21e41a39693f01df34c70482.png' width='400'>

<img src='https://i.gyazo.com/a28d9391e978b26a6bfd5a65e5cde824.png' width='400'>

<img src='https://i.gyazo.com/5ee3f205a9e384cc52b183982dc983e9.png' width='400'>
