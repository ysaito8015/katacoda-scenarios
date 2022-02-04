## DB Admin へのユーザ変更

`su - postgres`{{execute}}

## データベースの作成

`createdb dvdrental;`{{execute}}

## データベースデータの取り込み

`pg_restore -U postgres -d dvdrental /work/dvdrental.tar`{{execute}}

## 一般ユーザの作成
- postgres ユーザのままである前提

`psql -d dvdrental`{{execute}}

`CREATE USER packer WITH PASSWORD 'packer';`{{execute}}

`GRANT ALL PRIVILEGES ON DATABASE dvdrental TO packer;`{{execute}}

`GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO packer;`{{execute}}

- postgres ユーザから exit する

`\q`{{execute}}

`exit`{{execute}}

## 一般ユーザで接続
- 一般ユーザに切り替える

`su - packer`{{execute}}

`psql -d dvdrental`{{execute}}

