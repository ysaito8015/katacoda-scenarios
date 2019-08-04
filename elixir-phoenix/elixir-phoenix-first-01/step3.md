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

`kiex use 1.3.4 --default`{{execute}}
