
## 課題

次のコマンドを右のターミナルで実行してください:

`git clone https://github.com/kuroda/live_dendron.git live_dendron`{{execute}}

リポジトリ内へ移動し、 `install.sh` を実行します

`cd ./live_dendron`{{execute}}

`./install.sh`{{execute}}

`postmaster.pid` がないというエラーが出た場合は、データベースインスタンスが立ち上がる前に次に進んでエラーになっているので
もう一度 `./install.sh` を実行します

## パーミッションエラーが起きた場合

パーミッションエラーが起きた場合は、 `install.sh` の11行目を以下に書き換えます

`docker-compose run -u root --rm app /bin/sh -c "$command1; $command2; $command3; $command4"`{{copy}}

`Dockerfile` の21行目部分を書き換えます

```
USER devel # 削除
```


起動

`docker-compose up`{{execute}}

ターミナルの横にある `LiveDendron` のタブをクリックしてください
