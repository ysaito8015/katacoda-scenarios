## kiex, Elixir のインストール

### kiex のインストール

`cd /tmp`{{execute}}

`git clone https://github.com/taylor/kiex.git`{{execute}}

`cd ./kiex`{{execute}}

`./install`{{execute}}

`source $HOME/.kiex/scripts/kiex`{{execute}}

`echo 'test -s "$HOME/.kiex/scripts/kiex" & source "$HOME/.kiex/scripts/kiex"' >> ~/.bashrc`{{execute}}

### Elixir のインストール

`kiex install 1.3.4`{{execute}}

インストール後の表示

![](https://i.gyazo.com/be87c3646d103dacccbf228981c1cdc7.png)

`kiex use 1.3.4 --default`{{execute}}

### Hex と rebar のインストール

`mix local.hex --force`{{execute}}

`mix local.rebar --force`{{execute}}

### Hex と rebar のインストール

バージョン番号の確認

`mix hex.info`{{execute}}

![](https://i.gyazo.com/01d6ab6c0f2a01df9bfe9a6b6d92aed3.png)

### Phoenix のインストール

`TEMP=https://github.com/phoenixframework/archives/raw/master`{{execute}}

`mix archive.install $TEMP/phoenix_new-1.2.5.ez --force`{{execute}}

![](https://i.gyazo.com/444f880be6577aeba455008d3debe2fa.png)

`mix phoenix.new -v`{{execute}}

![](https://i.gyazo.com/02bfb9f9c69d5c26606d50897827e217.png)

