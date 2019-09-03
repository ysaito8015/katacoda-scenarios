## 環境構築

第八章を終了した状態を構築します

`./get_source.sh`{{execute}}

`cd ./modest_greeter`{{execute}}

## アクションへ付加情報を加える

- クエリ文字列: URL に `?` に続く文字列 `name=Bob` など
- `クエリパラメータ=クエリパラメータの値`

### params を利用する

controller を書き換えます

ファイル名: `./web/controllers/hello_controller.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/hello_controller.ex" data-target="replace">
defmodule ModestGreeter.HelloController do
  use ModestGreeter.Web, :controller

  def show(conn, params) do
    render conn, "show.html", name: params["name"]
  end
end
</pre>

## URL パスにパラメータを埋め込む

### クエリパラメータがある場合

- `/hello?name=Bob` を `/hello/Bob` に変えたい

router を書き換えます

ファイル名: `./router.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/router.ex" data-target="replace">
defmodule ModestGreeter.Router do

  scope "/", ModestGreeter do
    pipe_through :browser

    get "/hello/:name", HelloController, :show
  end
end
</pre>

書式:

<pre class="file" data-target="">
get "URL パターン文字列", コントローラ名, :アクション名
</pre>

### クエリパラメータがない場合

router を書き換えます

ファイル名: `./router.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/router.ex" data-target="replace">
defmodule ModestGreeter.Router do

  scope "/", ModestGreeter do
    pipe_through :browser

    get "/hello", HelloController, :show
    get "/hello/:name", HelloController, :show
  end
end
</pre>

### デフォルト値を設定する

controller を書き換えます

ファイル名: `./web/controllers/hello_controller.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/hello_controller.ex" data-target="replace">
defmodule ModestGreeter.HelloController do
  use ModestGreeter.Web, :controller

  def show(conn, params) do
    render conn, "show.html", name: params["name"] || "world"
  end
end
</pre>

- Elixir での真偽値
  - 偽とみなされる値: `false`, `nil`
  - しんとみなされる値: それ以外すべて
