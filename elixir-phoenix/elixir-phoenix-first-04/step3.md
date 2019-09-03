
## テンプレートに値を渡す

`hello_controller.ex` を書き換えます


ファイル名: `./web/controllers/hello_controller.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/hello_controller.ex" data-target="replace">
defmodule ModestGreeter.HelloController do
  use ModestGreeter.Web, :controller

  def show(conn, _params) do
    render conn, "show.html", name: "Alice"
  end
end
</pre>

`hello_controller.ex` の `show` アクション向けのテンプレートを書き換えます

ファイル名: `./web/templates/hello/show.html.eex`

` <p>Hello, <%= @name %>!</p>`


phoenix server を起動して, URL にアクセスします

`mix phoenix.server`{{execute}}

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello


