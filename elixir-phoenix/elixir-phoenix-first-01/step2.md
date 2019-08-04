## kerl, Erlang/OTP のインストール

### kerl のインストール

`cd /tmp`{{execute}}

`curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl`{{execute}}

`chmod a+x ./kerl`{{execute}}

`mv kerl /usr/local/bin`{{execute}}

###  Erlang/OTP のインストール

Erlang/OTP のインストール可能なバージョン一覧を表示します

`kerl list releases`{{execute}}

バージョンを指定してインストールします

`kerl build 19.3 19.3`{{execute}}

`kerl install 19.3 ~/erlang/19.3`{{execute}}

### Erlang/OTP の有効化

`source ~/erlang/19.3/activate`{{execute}}

環境変数 `PATH` に追加します

`echo 'export PATH="$HOME/erlang/19.3/bin:$PATH"' >> ~/.bashrc`{{execute}}
