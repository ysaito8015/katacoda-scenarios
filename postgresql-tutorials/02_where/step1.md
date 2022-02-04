## 実行環境

`pwd; whoami; cat /etc/lsb-release `{{execute}}

- 画面が開くと PostgreSQL サーバが Ubuntu にインストールされ, データベースがセットアップされます


## 一般ユーザを作成する

`su - postgres`{{execute}}

`psql < /work/creat_user.sql`{{execute}}

`\q`{{execute}}

`exit`{{execute}}

## 一般ユーザに切り替える

`su - packer`{{execute}}

`psql -d dvdrental`{{execute}}
