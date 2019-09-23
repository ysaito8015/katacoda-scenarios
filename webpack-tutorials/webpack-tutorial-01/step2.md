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
    "webpack": "^4.40.2",
    "webpack-cli": "^3.3.9"
  }
}
</pre>

## Bundle を作る

Bundle バンドル: 機能ごとに別れた `.js` ファイル (モジュール) をまとめること

## loadsh をバンドルする

`./dist/index.html` 内で, `&lt;script&gt;` タグによって直接読み込まれている `loadsh` をバンドルしてみます

loadsh をインストールします

`npm install --save lodash`{{execute}}

`./src/index.js` を編集し, `loadsh` をインポートします

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

`./dist/indes.html` を編集し, `loadsh` の呼び出し部分を削除します

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


サーバを起動します

`node server`{{execute}}

ブラウザを開いて確認します

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
