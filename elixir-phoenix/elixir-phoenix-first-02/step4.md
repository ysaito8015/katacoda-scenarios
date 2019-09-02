## デフォルトファイルの削除

自動生成されるファイルを削除します

`rm ./web/controllers/page_controller.ex`{{execute}}

`rm ./web/static/css/phoenix.css`{{execute}}

`rm ./web/views/page_view.ex`{{execute}}

`rm -rf ./web/templates/page`{{execute}}

## ./web/router.ex の整理

ファイル名: `./web/router.ex`

変更前

![](https://i.gyazo.com/30924d80239b6c97abf924a245a8cbcd.png)

これらの行を削除

変更後

![](https://i.gyazo.com/a818c95d96186419b710a7fbded90de9.png)

同ファイルを更に変更

変更前

![](https://i.gyazo.com/6e3cfe5cf579d770152373218b5d5c15.png)

変更後

![](https://i.gyazo.com/55023880def99fb48f4191d3019eb958.png)

ファイル末尾のコメントを削除

変更前

![](https://i.gyazo.com/ab2ec152a2744f0715dee7b5c8139c3c.png)

変更後

![](https://i.gyazo.com/17f323ad930688520c258de33e0f0718.png)


## レイアウトテンプレートの整理

ファイル名: `./web/templates/layout/app.html.eex`

変更前

![](https://i.gyazo.com/53bcaa7b3938bb912de4a4586b7fb175.png)

変更後

![](https://i.gyazo.com/c0be12ca8456ba15c245b426d2ac1608.png)

同ファイルの15 ~ 28 行目を削除します

変更前

![](https://i.gyazo.com/6fb682bf827f372eb4b1c869353a2f03.png)

変更後

![](https://i.gyazo.com/c0be12ca8456ba15c245b426d2ac1608.png)

さらに, 同ファイルを書き換えます

変更前

![](https://i.gyazo.com/c0be12ca8456ba15c245b426d2ac1608.png)

変更後

![](https://i.gyazo.com/47b524b7b3b0dc5327dba4aee8836eb3.png)
