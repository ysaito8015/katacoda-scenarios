elixir/phoenix ハンズオンのサンプルです

## 環境

```
Ubuntu 19.04
```

## 課題

`docker`, `docker-compose` のバージョンを確認してください

次のコマンドを右のターミナルで実行してください:

`docker version`{{execute}}

`docker-compose --version`{{execute}}

`apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common`{{execute}}

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`{{execute}}

`add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"`{{execute}}

`apt update && apt upgrade -y && apt install -y docker-ce`{{execute}}

`docker-compose` のバージョンが低いため、最新のバージョンをインストールします

`curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}

`chmod +x /usr/local/bin/docker-compos`{{execute}}

`ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose`{{execute}}

もういちど `docker-compose` のバージョンを確認します

`docker-compose --version`{{execute}}

`1.24.1` であれば、次に `npm` をインストールします

`apt install -y npm`{{execute}}

