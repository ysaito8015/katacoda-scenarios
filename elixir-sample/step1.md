elixir/phoenix ハンズオンのサンプルです

## 環境

```
Ubuntu 19.04
Docker
Docker-compose
```

## 課題

`docker`, `docker-compose` をインストールします

次のコマンドを右のターミナルで実行してください:

`apt update && apt dist-upgrade -y`{{execute}}

```
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```{{execute}}


`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -`{{execute}}

```
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```{{execute}}

`apt update && apt install -y docker-ce`{{execute}}

`curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}
