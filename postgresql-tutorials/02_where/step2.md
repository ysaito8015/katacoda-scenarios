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
- postgres ユーザのままである前提

`psql -d dvdrental`{{execute}}

`CREATE USER packer WITH PASSWORD 'packer';`{{execute}}

`GRANT ALL PRIVILEGES ON DATABASE dvdrental TO packer;`{{execute}}

`GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO packer;`{{execute}}

- postgres ユーザから exit する

`\q`{{execute}}

`exit`{{execute}}
