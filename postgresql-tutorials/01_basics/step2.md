## DB Admin へのユーザ変更

`su - postgres`{{execute}}

## psql の実行

`psql`{{execute}}

## データベースの作成

`CREATE DATABASE dvdrental;`{{execute}}

`\q`{{execute}}

## データベースデータの取り込み

`pg_restore -U postgres -d dvdrental /work/dvdrental.tar`{{execute}}
