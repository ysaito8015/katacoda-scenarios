## SCSS の導入

CSS の文法を拡張した SASS (SCSS) を読み込めるようにします

必要なモジュールをインストールします

- `sass-loader` : SCSS ファイルの読み込み
- `node-sass` : `sass-loader` が依存しているモジュール, SCSS をコンパイルする

`npm install --save-dev node-sass sass-loader`{{execute}}

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
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader'
        ],
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({filename: 'style/[name].css'})
  ],
};
</pre>

## SCSS ファイルの生成

`stye.css` を `style.scss` ヘリネームします

`mv ./src/style.css ./src/style.scss`{{execute}}

`./src/index.js` 内で `import` します

ファイル名: `/work/webpack-demo/src/index.js`

<pre class="file" data-filename="/work/webpack-demo/src/index.js" data-target="replace">
import _ from 'lodash';
import './style.scss';

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

`npm run build`{{execute}}

ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを表示して確認します

![](https://i.gyazo.com/f7b33664971e5dcc125f304ba2d1d0e7.png)

## 指定ディレクトリ以下の SCSS ファイルの一括読み込み

複数の SCSS を一括で読み込む `./src/scss/*.scss` という書き方 (glob) は, `sass-loader` が対応していないため, 新たにモジュールを導入する必要があります

- `import-glob-loader` : ファイルの一括読み込み

`npm install --save-dev import-glob-loader`{{execute}}

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
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader',
          'import-glob-loader'
        ],
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({filename: 'style/[name].css'})
  ],
};
</pre>

## SCSS ディレクトリの作成

scss ディレクトリを作り, `style.scss` を移動します

`mkdir ./src/scss && mv ./src/style.scss ./src/scss/`{{execute}}

エントリポイントとなる `app.scss` を生成します

`touch ./src/app.scss`{{execute}}

ファイル名: `/work/webpack-demo/src/app.scss`

<pre class="file" data-filename="/work/webpack-demo/src/app.scss" data-target="replace">
@import "./scss/*.scss";
</pre>

`./src/index.js` 内で `import` します

ファイル名: `/work/webpack-demo/src/index.js`

<pre class="file" data-filename="/work/webpack-demo/src/index.js" data-target="replace">
import _ from 'lodash';
import './app.scss';

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

`npm run build`{{execute}}

ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを表示して確認します

![](https://i.gyazo.com/f7b33664971e5dcc125f304ba2d1d0e7.png)
