## webpack を使えるようにする

katacoda 環境: `ubuntu1904`

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

`./src/index.js` ファイル, `index.html` を作成します

`mkdir ./src && touch ./src/index.js`{{execute}}

`mkdir ./dist && touch ./dist/index.html`{{execute}}

現状のディレクトリ構造を確認します

`tree -L 2 -I 'node_modules'`{{execute}}

`./src/index.js`, `./dist/index.html` の内容を書き込みます

ファイル名: `/work/webpack-demo/src/index.js`

<pre class="file" data-filename="/work/webpack-demo/src/index.js" data-target="replace">
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
    &lt;p&gt;Hello, webpack!&lt;/p&gt;
    &lt;script src="./src/index.js"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

## Node.js でサーバを立てる

`touch ./server.js`{{execute}}

ファイル名: `/work/webpack-demo/server.js`

<pre class="file" data-filename="/work/webpack-demo/server.js" data-target="replace">
var http = require('http'),
    port = 8000,
    fs = require('fs');


var server = http.createServer();

server.on('request', function (req, res) {
    fs.readFile(__dirname + '/dist' + '/index.html', 'utf-8', function (err, data) {
        if (err) {
            res.writeHead(404, { 'Content-Type': 'text/plain' });
            res.write("not found!");
            return res.end();
        }
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write(data);
        res.end();
    });
});

server.listen(port);
console.log("server listening ...");
</pre>

サーバを起動します

`node ./server.js`{{execute}}

ブラウザを開いて確認します

https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/
