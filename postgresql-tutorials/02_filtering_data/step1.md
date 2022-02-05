## 実行環境

`pwd; whoami; cat /etc/lsb-release `{{execute}}

- 画面が開くと PostgreSQL サーバが Ubuntu にインストールされ, データベースがセットアップされます


## 一般ユーザを作成する

`su - postgres`{{execute}}

`psql`{{execute}}

`CREATE USER packer WITH PASSWORD 'packer';`{{execute}}

`GRANT ALL PRIVILEGES ON DATABASE dvdrental TO packer;`{{execute}}

`GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO packer;`{{execute}}

`\q`{{execute}}

`exit`{{execute}}

## 一般ユーザに切り替える

`su - packer`{{execute}}

`psql -d dvdrental`{{execute}}
