## kerl, Erlang/OTP のインストール

### kerl のインストール

`cd /tmp`{{execute}}

`curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl`{{execute}}

`chmod a+x ./kerl`{{execute}}

`mv kerl /usr/local/bin`{{execute}}

###  Erlang/OTP のインストール

Erlang/OTP のインストール可能なバージョン一覧を表示します

`kerl list releases`{{execute}}

19.3 では, openssl の場所が見つけられないようなので、指定します

`echo 'KERL_CONFIGURE_OPTIONS="--enable-dynamic-ssl-lib --with-ssl=/usr/lib/x86_64-linux-gnu/openssl-1.0.0"' >> ~/.kerlrc`{{execute}}

バージョンを指定してインストールします

`kerl build 19.3 19.3`{{execute}}

`kerl install 19.3 ~/erlang/19.3`{{execute}}

### Erlang/OTP の有効化

インストールしたバージョンを指定してアクティベート

`source ~/erlang/19.3/activate`{{execute}}

* デアクティベートの方法

`kerl_deactivate'

環境変数 `PATH` に追加します

`echo 'export PATH="$HOME/erlang/19.3/bin:$PATH"' >> ~/.bashrc`{{execute}}
