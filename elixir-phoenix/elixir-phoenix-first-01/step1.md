## 環境

`ubuntu19.04` 


## 構築

### アップデート
apt によるアップデートを行います

`apt update`{{execute}}

`apt upgrade -y`{{execute}}

### Node.js インストール

#### nvm のインストール

`touch ~/.bashrc`{{execute}}

`cd /tmp`{{execute}}

`NVMURL=https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh`{{execute}}

`wget --no-check-certificate $NVMURL | bash`{{execute}}

`source ~/.bashrc`{{execute}}

nvm のバージョンを確認します

`nvm --version`{{execute}}

Node.js をインストールします

`nvm install --lts`{{execute}}

`nvm use --lts`{{execute}}

Node.js のバージョンを確認します

`node --version`{{execute}}

Erlang のインストールに必要なパッケージをインストールします

`apt install -y build-essential libncurses5-dev openssl libssl-dev`{{execute}}

`apt install -y curl git-core autoconf automake`{{execute}}

ファイルイベント監視ツールをインストールしてください

`apt install -y inotify-tools`{{execute}}


