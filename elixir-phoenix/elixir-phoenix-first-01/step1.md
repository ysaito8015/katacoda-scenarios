## 環境

`ubuntu19.04` 


## 構築

apt によるアップデートを行います

`apt update`{{execute}}

`apt upgrade -y`{{execute}}

Node.js をインストールします

nvm のインストール

`touch ~/.bashrc`{{execute}}

`cd /tmp`{{execute}}

`NVMURL=https://rawgit.com/creationix/nvm/v0.33.6/install.sh`{{execute}}

`wget --no-check-certificate $NVMURL`{{execute}}

`bash ./install.sh`{{execute}}

`rm -f ./install.sh`{{execute}}

`source ~/.bashrc`{{execute}}

nvm のバージョンを確認します

`nvm --version`{{execute}}

Node.js をインストールします

`nvm install 8.9`{{execute}}

Node.js のバージョンを確認します

`node --version`{{execute}}

Erlang のインストールに必要なパッケージをインストールします

`apt install -y build-essential libncurses5-dev openssl libssl-dev`{{execute}}

`apt install -y autoconf automake`{{execute}}

`apt install -y curl git-core`{{execute}}

ファイルイベント監視ツールをインストールしてください

`apt install -y inotify-tools`{{execute}}


