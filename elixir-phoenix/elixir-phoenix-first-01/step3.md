## kiex, Elixir のインストール

### kiex のインストール

`cd /tmp`{{execute}}

`git clone https://github.com/taylor/kiex.git`{{execute}}

`cd ./kiex`{{execute}}

`./install`{{execute}}

`source $HOME/.kiex/scripts/kiex`{{execute}}

`echo 'test -s "$HOME/.kiex/scripts/kiex" & source "$HOME/.kiex/scripts/kiex"' >> ~/.bashrc`{{execute}}

### Elixir のインストール

インストール可能な Elixir のバージョンを表示

`kiex list known`{{execute}}

インストール実行

`kiex install 1.12.3`{{execute}}

インストール後の表示

![](https://i.gyazo.com/22da561779bd0db8383f67bdf3631286.png)

`kiex use 1.12.3 --default`{{execute}}

### Hex と rebar のインストール

`mix local.hex --force`{{execute}}

`mix local.rebar --force`{{execute}}

### Hex と rebar のインストール

バージョン番号の確認

`mix hex.info`{{execute}}

![](https://i.gyazo.com/beee7e21d885447013cd4b16015270d7.png)

### Phoenix のインストール

`mix archive.install --force hex phx_new 1.4.11`{{execute}}

`mix phx.new -v`{{execute}}


