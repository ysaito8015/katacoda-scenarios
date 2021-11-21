## kerl, Erlang/OTP のインストール

### kerl のインストール

`cd /tmp`{{execute}}

`curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl`{{execute}}

`chmod a+x ./kerl`{{execute}}

`mv kerl /usr/local/bin`{{execute}}

###  Erlang/OTP のインストール

Erlang/OTP のバージョンリストをアップデートします

`kerl update releases`{{execute}}

Erlang/OTP のインストール可能なバージョン一覧を表示します

`kerl list releases`{{execute}}

バージョンを指定してインストールします

`kerl build 24.1.6 24.1.6`{{execute}}

書式 `kerl build [Erlang/OTP バージョン] [任意の名前（ラベル）]`

次のような表示が出れば Erlang/OTP のビルドに成功しています

![](https://i.gyazo.com/acb79fd5888ae857b3b77b9da239284f.png)

`kerl install 20.3 ~/erlang/20.3`{{execute}}

書式 `kerl install [ラベル] [インストール先ディレクトリ]`

次のような表示が出れば Erlang/OTP のインストールに成功しています

![](https://i.gyazo.com/4388fa5f5bf698c42d592755aabfa85b.png)

### Erlang/OTP の有効化

インストールしたバージョンを指定してアクティベート

`source ~/erlang/24.1.6/activate`{{execute}}

* デアクティベートの方法

`kerl_deactivate`

環境変数 `PATH` に追加します

`echo 'export PATH="$HOME/erlang/24.1.6/bin:$PATH"' >> ~/.bashrc`{{execute}}
