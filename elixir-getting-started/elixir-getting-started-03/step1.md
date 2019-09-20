## 事前準備

このコースが始まると, Elixir 実行環境が構築され始めます

katacoda 環境: `ubuntu1904`

Elixir 実行環境 docker `elixir:1.9.1`

`pwd; whoami; echo "debian "$(cat /etc/debian_version)""`{{execute}}

上記の <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px> をクリックすると, 右下のターミナルでコマンドが実行されます

作業ディレクトリの移動と, Phoenix 実行に必要なライブラリ (inotify-tools) のインストールを行います

`cd /work && ./setting_up.sh`{{execute}}

## データベースのインストール

### PostgreSQL のインストール

GPG Key を取得します

`wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -`{{execute}}

PostgreSQL の apt リポジトリを追加します

`echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list.d/pgdg.list`{{execute}}

apt でインストールします

`apt update && apt install -y postgresql postgresql-contrib`{{execute}}

デーモンの状態を確認します

`service postgresql status`{{execute}}

デーモンを起動します

`service postgresql start`{{execute}}

DB ユーザの登録を行います

`sudo -u postgres -i`{{execute}}

`psql` を起動します

`psql`{{execute}}

ユーザを確認します

`\du`{{execute}}

パスワードを `postgres` に設定します

`alter role postgres with password 'postgres';`{{execute}}

`psql` を終了します

`\q`{{execute}}

postgres ユーザのシェルを終了します

`exit`{{execute}}

### MySQL のインストール

apt からインストールします

`apt update && apt install -y mysql-server`{{execute}}

デーモンの状態を確認します

`service mysql status`{{execute}}

デーモンを起動します

`service mysql start`{{execute}}

`mysql` を起動します

`mysql -u root`{{execute}}

ユーザを作ります

`GRANT ALL PRIVILEGES ON *.* TO 'phx'@'localhost' IDENTIFIED BY 'password';`{{execute}}

`mysql` を終了します

`exit`{{execute}}

Step2 は PostgreSQL, Step3 は MySQL を選んで設定を行います

Step4 は共通です
