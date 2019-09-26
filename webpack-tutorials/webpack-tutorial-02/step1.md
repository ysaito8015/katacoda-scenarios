## 環境構築

katacoda 環境: `ubuntu1904`

このコースが始まると環境構築が同時に始まります

`cd /work && ./get_source.sh`{{execute}}

`cd /work/webpack-demo && pwd; whoami; cat /etc/lsb-release`{{execute}}

上記の <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px> をクリックすると, 右下のターミナルでコマンドが実行されます

チュートリアル 01 が終わった状態が再現されます

ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを表示して確認します

![](https://i.gyazo.com/f7b33664971e5dcc125f304ba2d1d0e7.png)

## ページタイトルの変更

ガイドの流れに則り, 今まで `./dist/main.js` を参照していた部分を `./dist/bundle.js` に変更します

ファイル名: `/work/webpack-demo/dist/index.html`

<pre class="file" data-filename="/work/webpack-demo/dist/index.html" data-target="replace">
&lt;!doctype html&gt;
&lt;html&gt;
 &lt;head&gt;
   &lt;title&gt;Asset Management&lt;/title&gt;
 &lt;/head&gt;
 &lt;body&gt;
   &lt;script src="bundle.js"&gt;&lt;/script&gt;
 &lt;/body&gt;
&lt;/html&gt;
</pre>

ファイル名: `/work/webpack-demo/webpack.config.js`

<pre class="file" data-filename="/work/webpack-demo/webpack.config.js" data-target="replace">
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  }
};
</pre>

## CSS を読み込めるようにする

必要なモジュールをインストールします

- `style-loader` : `bundle.js` 内に style タグを生成し, その中に指定した CSS コードを導入する
- `css-loader` : CSS ファイルの読み込み ( `url` , `@import` などの解決 )

`npm install --save-dev style-loader css-loader`{{execute}}

`webpack.config.js` に, モジュールの設定を追加します

ファイル名: `/work/webpack-demo/webpack.config.js`

<pre class="file" data-filename="/work/webpack-demo/webpack.config.js" data-target="replace">
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
        ],
      },
    ],
  },
};
</pre>

## CSS ファイルの作成

CSS を読み込む設定が終わったので, 読み込む実体を作成します

`class="hello"` が設定されているタグ内のテキストを赤色にする設定です

`touch ./src/style.css`{{execute}}

ファイル名: `/work/webpack-demo/src/style.css`

<pre class="file" data-filename="/work/webpack-demo/src/style.css" data-target="replace">
.hello {
  color: red;
}
</pre>

`./src/index.js` 内で `import` し, `div` タグに, `class` を追加します

ファイル名: `/work/webpack-demo/src/index.js`

<pre class="file" data-filename="/work/webpack-demo/src/index.js" data-target="replace">
import _ from 'lodash';
import './style.css';

function component() {
  const element = document.createElement('div');

  // Lodash, now imported by this script
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  element.classList.add('hello');

  return element;
}

document.body.appendChild(component());
</pre>

## build と結果確認

`webpack` を実行します

`npm run build`{[execute}}

ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを表示して確認します

![](https://i.gyazo.com/f7b33664971e5dcc125f304ba2d1d0e7.png)

## CSS ファイルの個別化

`style-loader` は, `bundle.js` に, CSS ファイルの内容をまとめてくれますが, いくつかデメリットもあります
- 共通の CSS ファイルを, いろいろな javascript から参照している場合, ブラウザキャッシュが働かず, 読み込みが何度も起こり非効率になる
- CSS ファイルが長大になると, CSS ファイルと javascript ファイルを並行で読み込むより遅くなる

`style-loader` を外し, CSS を別ファイルとして生成するように変更します

必要なモジュールをインストールします

- `mini-css-extract-plugin` : CSS ファイルを `bundle.js` とは別に生成する

`npm install --save-dev mini-css-extract-plugin`{{execute}}

`webpack.config.js` を変更します

ファイル名: `/work/webpack-demo/webpack.config.js`

<pre class="file" data-filename="/work/webpack-demo/webpack.config.js" data-target="replace">
const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
        ],
      },
    ],
  },
  plugin: [
    new MiniCssExtractPlugin({filename: 'style/[name].css'})
  ],
};
</pre>

生成される CSS ファイルを読み込むリンクを `index.html` に追加します

ファイル名: `/work/webpack-demo/dist/index.html`

<pre class="file" data-filename="/work/webpack-demo/dist/index.html" data-target="replace">
&lt;!doctype html&gt;
&lt;html&gt;
 &lt;head&gt;
   &lt;title&gt;Asset Management&lt;/title&gt;
    &lt;link rel = "stylesheet" type = "text/css" href = "style/main.css" /&gt;
 &lt;/head&gt;
 &lt;body&gt;
   &lt;script src="bundle.js"&gt;&lt;/script&gt;
 &lt;/body&gt;
&lt;/html&gt;
</pre>

## build と結果確認

`webpack` を実行します

`npm run build`{[execute}}

ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを表示して確認します

![](https://i.gyazo.com/f7b33664971e5dcc125f304ba2d1d0e7.png)
