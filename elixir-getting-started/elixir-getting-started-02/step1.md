## 事前準備

katacoda 環境: `ubuntu1904`

`pwd; whoami; cat /etc/lsb-release`{{execute}}

上記の <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px> をクリックすると, 右下のターミナルでコマンドが実行されます

## Erlang のインストール

- `1.` もしくは, `2.` の手順でインストールします

#### 1. apt を使用する場合

GPG Key を取得します

`wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -`{{execute}}

リポジトリを設定します

`echo "deb https://packages.erlang-solutions.com/ubuntu disco contrib" | sudo tee /etc/apt/sources.list.d/rabbitmq.list`{{execute}}

Erlang をインストールします

`sudo apt update && sudo apt install -y erlang`{{execute}}

バージョンを確認します

`cat /usr/lib/erlang/releases/RELEASES`{{execute}}

表示例です

![](https://i.gyazo.com/2549343a962a509b007f951c06daa287.png)

#### 2. ソースからビルドする場合

<!-- `apt install libncurses5-dev autoconf xsltproc fop libxml2-utils libwxgtk3.0-dev` -->
`sudo apt install -y build-essential libncurses5-dev autoconf`{{execute}}

Erlang をダウンロードしインストールします

`cd /opt && wget http://erlang.org/download/otp_src_22.0.tar.gz`{{execute}}

展開します

`tar zxvf /opt/otp_src_22.0.tar.gz -C /opt && cd /opt/otp_src_22.0`{{execute}}

`./configure --enable-hipe`{{execute}}

次のような表示がでますが, 問題なく次へ進めます

![](https://i.gyazo.com/f79661d28777770fe74ab604df91dc9a.png)
![](https://i.gyazo.com/41bfd2b14e9c867312ab33456d898939.png)
![](https://i.gyazo.com/d294409606894d90b3478c1ab211e181.png)

インストールします

`make && make install`{{execute}}

バージョンを確認します

`cat /usr/local/lib/erlang/releases/RELEASES`{{execute}}

表示例です

![](https://i.gyazo.com/99954aa3900c933135997c6d8f28093c.png)

## Elixir のインストール

ソースコードをダウンロードします

`cd /opt && wget https://github.com/elixir-lang/elixir/archive/v1.9.1.tar.gz`{{execute}}

展開します

`tar zxvf /opt/v1.9.1.tar.gz -C /opt && cd /opt/elixir-1.9.1`{{execute}}

`PATH` を設定します

`export PATH="${PATH}:/usr/local/bin"`{{execute}}

インストールします

`make && make install`{{execute}}

バージョンを確認します

`elixir -v`{{execute}}

表示例です

![](https://i.gyazo.com/72c4fa64c019aeb5c7dbfb8e12423a7e.png)

## Docker を利用したインストール

`docker pull elixir:1.9.1`{{execute}}

`docker run -p 4000:4000 -i -t  elixir:1.9.1 /bin/bash`{{execute}}

バージョンを確認します

`elixir -v`{{execute}}

表示例です

![](https://i.gyazo.com/2bf302ef026f585f6902f43e118c8c2e.png)

