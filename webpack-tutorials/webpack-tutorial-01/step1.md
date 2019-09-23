## webpack を使えるようにする

katacoda 環境: `ubuntu1904`

`pwd; whoami; cat /etc/lsb-release`{{execute}}

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

`tree`{{execute}}

webpack パッケージをインストールします

`npm install webpack --save-dev`{{execute}}

`npm install webpack-cli --save-dev`{{execute}}

現状のディレクトリ構造を確認します

`tree`{{execute}}

`./src/index.js`, `index.html` を開き内容を確認します

