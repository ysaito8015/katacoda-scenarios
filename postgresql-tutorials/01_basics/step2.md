## DB Admin へのユーザ変更

`su - postgres`{{execute}}

## psql の実行

`psql`{{execute}}

## データベースの作成

`CREATE DATABASE dvdrental;`{{execute}}

`\q`{{execute}}

## データベースデータの取り込み

`pg_restore -U postgres -d dvdrental /work/dvdrental.tar`{{execute}}

## 一般ユーザの作成

`su - postgres`{{execute}}

`psql -d dvdrental`{{execute}}

`CREATE USER pi WITH PASSWORD 'raspberry';`{{execute}}

`GRANT ALL PRIVILEGES ON DATABASE dvdrental TO packer;`{{execute}}

`GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA 'public' TO packer;`{{execute}}
