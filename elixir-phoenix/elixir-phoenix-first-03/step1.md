## Hello World!

ターミナルでの環境構築が終わったら, 次のコマンドを実行してください

`mkdir -p ~/oiax/projects; cd $_`{{execute}}

`mix phoenix.new modest_greeter --no-ecto`{{execute}}

次の質問には `Y` と入力してください

![](https://i.gyazo.com/8b69deaa2b4657a8a4f34d45191c329d.png)

作業ディレクトリを移動します

`cd ./modest_greeter`{{execute}}

### gettext をダウングレードする

gettext をダウングレードする必要があります

katacoda エディタで `./projects/modest_greeter/mix.exs` を開き下記の修正を適用してください

![](https://i.gyazo.com/2f5cbfe1276b810e91d9f383221d6ca2.png)

ファイル名: `~/oiax/projects/modest_greeter/mix.exs`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/mix.exs" data-target="replace">
defmodule ModestGreeter.Mixfile do
  use Mix.Project

  def project do
    [app: :modest_greeter,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {ModestGreeter, []},
     applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.5"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.14.1"},
     {:cowboy, "~> 1.0"}]
  end
end

</pre>

一旦, `clean` します

`mix deps.clean gettext`{{execute}}

`mix deps.get`{{execute}}

### phoenix を立ち上げる

`mix phoenix.server`{{execute}}

katakcoda 画面上の下記のタブをクリックします

![](https://i.gyazo.com/2abf40b1b0b2f49252e4617b5d37a33c.png)

ブラウザで下記画面が立ち上がります

![](https://i.gyazo.com/0839fba2a3ca5104eb8420615d63a2b2.png)

ターミナルに戻り`CTRL C` を二回押しサーバを止めます

