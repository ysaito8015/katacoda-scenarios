## kerl, Erlang/OTP のインストール

### kerl のインストール

`cd /tmp`{{execute}}

`curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl`{{execute}}

`chmod a+x ./kerl`{{execute}}

`mv kerl /usr/local/bin`{{execute}}

###  Erlang/OTP のインストール

Erlang/OTP のインストール可能なバージョン一覧を表示します

`kerl list releases`{{execute}}

バージョン 19.3 では, elixir のインストール時に, `uncaught error in rebar_core` が起こるので、書籍とは別のバージョンを指定しています

バージョンを指定してインストールします

`kerl build 20.3 20.3`{{execute}}

書式 `kerl build [Erlang/OTP バージョン] [ラベル]`

次のような表示が出れば Erlang/OTP のビルドに成功しています

![](https://i.gyazo.com/b1d482e594b20d063e050babfbca073b.png)

`kerl install 20.3 ~/erlang/20.3`{{execute}}

書式 `kerl install [Erlang/OTP バージョン] [ラベル]`

次のような表示が出れば Erlang/OTP のインストールに成功しています

![](https://i.gyazo.com/eb82b091c90c53119e458b442022e7fd.png)

### Erlang/OTP の有効化

インストールしたバージョンを指定してアクティベート

`source ~/erlang/20.3/activate`{{execute}}

* デアクティベートの方法

`kerl_deactivate`

環境変数 `PATH` に追加します

`echo 'export PATH="$HOME/erlang/21.3/bin:$PATH"' >> ~/.bashrc`{{execute}}
