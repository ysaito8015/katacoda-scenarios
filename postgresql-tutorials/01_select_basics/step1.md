## 実行環境

`pwd; whoami; cat /etc/lsb-release `{{execute}}

## PostgreSQL サーバを Ubuntu にインストールする

`apt install -y curl ca-certificates gnupg`{{execute}}

`curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg > /dev/null`{{execute}}

`echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list`{{execute}}

`apt update`{{execute}}

`apt install -y postgresql-14`{{execute}}

### その他のインストール方法

`apt install porstgresql-common`

`sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh`

### PostgreSQL に付属するチュートリアルの取得

`cd /work`{{execute}}

`wget https://ftp.postgresql.org/pub/source/v14.1/postgresql-14.1.tar.gz`{{execute}}

`tar axvf ./postgresql-14.1.tar.gz`{{execute}}

`apt install -y postgresql-server-dev-14`{{execute}}

`cd ./postgresql-14.1/src/tutorial`{{execute}}

`make`{{execute}}

