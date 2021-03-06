## package.json を編集

`private` 設定にして, `main` セクションも削除します

ファイル名: `/work/webpack-demo/package.json`

<pre class="file" data-filename="/work/webpack-demo/package.json" data-target="replace">
{
  "name": "webpack-demo",
  "version": "1.0.0",
  "description": "",
  "private": true,
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "webpack": "^4.41.0",
    "webpack-cli": "^3.3.9"
  }
}
</pre>

## Bundle を作る

Bundle バンドル: 機能ごとに別れた `.js` ファイル (モジュール) をまとめること

## loadsh をバンドルする

`./dist/index.html` 内で, `script` タグによって直接読み込まれている `loadsh` をバンドルしてみます

loadsh をインストールします

`npm install --save lodash`{{execute}}

`./dist/index.js` を `./src` 下に移動します

`mkdir ./src && mv ./dist/index.js ./src`{{execute}}

同ファイルを編集し, `loadsh` をインポートする行を加えます

ファイル名: `/work/webpack-demo/src/index.js`

<pre class="file" data-filename="/work/webpack-demo/src/index.js" data-target="replace">
import _ from 'lodash';

function component() {
  const element = document.createElement('div');

  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
</pre>

`./dist/index.html` を編集し, `loadsh` の呼び出し部分を削除します

また, Bundle 後に生成される `main.js` へのリンクに変更します

ファイル名: `/work/webpack-demo/dist/index.html`

<pre class="file" data-filename="/work/webpack-demo/dist/index.html" data-target="replace">
&lt;!doctype html&gt;
&lt;html&gt;
 &lt;head&gt;
   &lt;title&gt;Getting Started&lt;/title&gt;
 &lt;/head&gt;
 &lt;body&gt;
   &lt;script src="main.js"&gt;&lt;/script&gt;
 &lt;/body&gt;
&lt;/html&gt;
</pre>

## main.js の生成

`./src/index.js` をエントリーポイントとして, `./dist/main.js` を生成します

`npx` コマンドは `npm install` でインストールしたパッケージを実行します

( npm コマンドで実行する場合は, `$(npm bin)/パッケージ名` のようになります )

`npx webpack`{{execute}}


ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを確認します

![](https://i.gyazo.com/acf4fdd9975229e300f85d41b6e6c476.png)
