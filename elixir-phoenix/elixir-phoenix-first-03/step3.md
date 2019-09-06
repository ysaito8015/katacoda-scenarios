
## 経路の設定

ファイル名: `./web/router.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/router.ex" data-target="replace">
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

    get "/hello", HelloControler, :show
  end
end
</pre>

## アクションの作成

ファイル名: `./web/controllers/hello_controller.ex`
`touch ./web/controllers/hello_controller.ex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/hello_controller.ex" data-target="replace">
defmodule ModestGreeter.HelloController do
  use ModestGreeter.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end
end
</pre>

## ビューの作成

ファイル名: `./web/views/hello_view.ex`
`touch ./web/views/hello_view.ex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/views/hello_view.ex" data-target="replace">
defmodule ModestGreeter.HelloView do
  use ModestGreeter.Web, :view
end
</pre>

## テンプレートの作成

`mkdir ./web/templates/hello`{{execute}}

ファイル名: `./web/templates/hello/show.html.eex`
`touch ./web/templates/hello/show.html.eex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
 &lt;p&gt;Hello, world!&lt;/p&gt;
</pre>


## 表示の確認

`mix phoenix.server`{{execute}}

ブラウザのアドレスバーにあるURLの末尾に`/hello`を加えて読み込みます

例: https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

ページソース

![](https://i.gyazo.com/fca923c07a91e8b0eec81b83614965d7.png)
