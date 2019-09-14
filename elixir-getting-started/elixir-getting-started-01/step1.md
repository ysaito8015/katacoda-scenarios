## 事前準備

katacoda 環境: `ubuntu1904`

`pwd; whoami`{{execute}}

## Erlang のインストール

#### apt を使用する場合

GPG Key を取得します

`wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -`{{execute}}

リポジトリを設定します

`echo "deb https://packages.erlang-solutions.com/ubuntu disco contrib" | sudo tee /etc/apt/sources.list.d/rabbitmq.list`{{execute}}

Erlang をインストールします

`sudo apt update && sudo apt install erlang`{{execute}}

バージョンを確認します

`cat /usr/lib/erlang/releases/RELEASES`{{execute}}


#### ソースからビルドする場合

<!-- `apt install libncurses5-dev autoconf xsltproc fop libxml2-utils libwxgtk3.0-dev` -->
`sudo apt install build-essential libncurses5-dev autoconf`{{execute}}

Erlang をダウンロードしインストールします

`cd /opt && wget http://erlang.org/download/otp_src_22.0.tar.gz`{{execute}}

展開します

`tar zxvf /opt/otp_src_22.0.tar.gz -C /opt && cd /opt/otp_src_22.0`{{execute}}

`./configure --enable-hipe`{{execute}}

インストールします

`make && make install`{{execute}}

バージョンを確認します

`cat /usr/lib/erlang/releases/RELEASES`{{execute}}

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
