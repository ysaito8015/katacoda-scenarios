## webpack を使えるようにする

katacoda 環境: `ubuntu1904`

このコースが始まると環境構築が同時に始まります

`cd /work && pwd; whoami; cat /etc/lsb-release`{{execute}}

上記の <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px> をクリックすると, 右下のターミナルでコマンドが実行されます

## nvm をインストール

Node.js自体を管理するnvm(Node Version Manager)

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash`{{execute}}

`.bashrc` に設定された PATH を通します

`source ~/.bashrc`{{execute}}

nvm のバージョンを確認します

`nvm --version`{{execute}}

## Node.js をインストール

インストール可能な Node.js のバージョン確認

`nvm ls-remote`{{execute}}

lts (Long Term Support) をインストールします

`nvm install --lts`{{execute}}

`nvm use --lts`{{execute}}

Node.js のバージョンを確認します

`node --version`{{execute}}

デフォルトとして設定します

`nvm alias default lts/*`{{execute}}

## webpack プロジェクトを始める

`mkdir ./webpack-demo`{{execute}}

`cd ./webpack-demo`{{execute}}

`npm init` を実行します

初期化処理が実行され, package.jsonが生成されます

`npm init -y`{{execute}}

現状のディレクトリ構造を確認します

`tree -L 2 -I 'node_modules'`{{execute}}

webpack パッケージをインストールします

`npm install webpack webpack-cli --save-dev`{{execute}}

`./dist/index.js` ファイル, `./dist/index.html` を作成します

`mkdir ./dist && touch ./dist/index.js`{{execute}}

`touch ./dist/index.html`{{execute}}

現状のディレクトリ構造を確認します

`tree -L 2 -I 'node_modules'`{{execute}}

`./dist/index.js`, `./dist/index.html` の内容を書き込みます

構成としては, `index.html` から `&lt;script&gt;` タグにより, `./dist/index.js` を読み込み実行しています

また, `./dist/index.js` 内の関数の実行に必要なモジュールを, `./dist/index.html` 内で読み込んでいます

ファイル名: `/work/webpack-demo/dist/index.js`

<pre class="file" data-filename="/work/webpack-demo/dist/index.js" data-target="replace">
function component() {
  const element = document.createElement('div');

  // Lodash, currently included via a script, is required for this line to work
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
</pre>

ファイル名: `/work/webpack-demo/dist/index.html`

<pre class="file" data-filename="/work/webpack-demo/dist/index.html" data-target="replace">
&lt;!doctype html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;Getting Started&lt;/title&gt;
    &lt;script src="https://unpkg.com/lodash@4.16.6"&gt;&lt;/script&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;script src="index.js"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

## dist 以下の構成を公開して確認する

Apache2 に設定します

`sed -i.bak -e 's/\/var\/www\/>/\/work\/webpack-demo>/g' /etc/apache2/apache2.conf`{{execute}}

`sed -i.bak -e 's/\/var\/www\/html/\/work\/webpack-demo\/dist/g' /etc/apache2/sites-available/000-default.conf`{{execute}}

`apache2` を再起動します

`apache2ctl restart`{{execute}}

ブラウザで下記 URL を開いて確認します

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

ページのソースを表示して確認します

![](https://i.gyazo.com/f7b33664971e5dcc125f304ba2d1d0e7.png)

