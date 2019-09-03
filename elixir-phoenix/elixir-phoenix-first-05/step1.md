## 環境構築

第八章を終了した状態を構築します

`./get_source.sh`{{execute}}

`cd ./modest_greeter`{{execute}}

## アクションへ付加情報を加える

- クエリ文字列: URL 中の `?` に続く文字列 `name=Bob` など
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
  use ModestGreeter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

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

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello?name=Bob

クエリパラメータがない場合

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

### クエリパラメータがない場合

router を書き換えます

ファイル名: `./router.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/router.ex" data-target="replace">
defmodule ModestGreeter.Router do
  use ModestGreeter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ModestGreeter do
    pipe_through :browser

    get "/hello", HelloController, :show
    get "/hello/:name", HelloController, :show
  end
end
</pre>

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

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
  - 真とみなされる値: それ以外すべて

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello
