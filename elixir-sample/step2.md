
## 課題

次のコマンドを右のターミナルで実行してください:

`git clone https://github.com/kuroda/live_dendron.git live_dendron`{{execute}}

リポジトリ内へ移動し、 `install.sh` を実行します

`cd ./live_dendron`{{execute}}

`./install.sh`{{execute}}

パーミッションエラーが起きた場合は、 `install.sh` の11行目を以下に書き換えます

`docker-compose run -u root --rm app /bin/sh -c "$command1; $command2; $command3; $command4"`{{copy}}
