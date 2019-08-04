## 環境

`ubuntu19.04` 


## 構築

apt によるアップデートを行います

`apt update`{{execute}}

`apt upgrade`{{execute}}

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

`nvm --version`

Node.js をインストールします

`nvm install 8.9`{{execute}}

Node.js のバージョンを確認します

`node --version`{{execute}}

Erlang のインストールに必要なパッケージをインストールします

`apt install build-essential libncurses 5-dev openssl libssl-dev`{{execute}}
`apt install curl git-core`{{execute}}

ファイルイベント監視ツールをインストールしてください

`apt install notify-tools`{{execute}}


