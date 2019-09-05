## HTML とテンプレート

### タグと要素

![](https://i.gyazo.com/aa87fc59c6e72a3f7ae450c89529e4be.png)

- タグの例: `<p></p>`
  - タグ名: p
  - 開始タグ: `<p>`
  - 終了タグ: `</p>`
  - 要素: `<p>Hello, world!</p>` タグを含んだ全て
  - コンテンツ: `Hello, world!` タグに挟まれた中身

- 改行タグ
  - `<br>`
  - `<br/>`
  - `<br />`

- 空白文字
  - 連続する２つ以上の半角スペース, タブ文字, 改行文字はひとつの空白文字として解釈されます

- 属性指定の例: `<p id='message' class='lead'>Hello, world!</p>`
  - 書式: `属性名='属性値'`
  - ブーリアン属性の例: `<p hidden=''>Hello, world!</p>` 指定されているかどうかのみ

### HTML 文書の基本構造

<pre class="file" data-target="">
&lt;!DOCTYPE html&gt;
&lt;html lang="ja"&gt;
&lt;head&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;title&gt;&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
  
&lt;/body&gt;
&lt;/html&gt;
</pre>

- `<head>` 要素: 文書に関するメタデータ, タイトルなど
- `<body>` 要素: 文書の中身

### テンプレートと「ページのソース」の関係

- レイアウトテンプレートに, `show.html.eex` の内容が差し込まれます

ファイル名:

`./web/template/layout/app.html.eex`

![](https://i.gyazo.com/a9f7c93adc7568d9171f76d90f888594.png)

- JavaScript ファイルの読み込み

![](https://i.gyazo.com/5fd8547412f95c22d2814812d8ca879d.png)

書式:

<pre class="file" data-target="">
static_path @conn, "/JavaScriptファイルへのパス"
</pre>

