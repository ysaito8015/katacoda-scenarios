
## テンプレートに値を渡す

`hello_controller.ex` を書き換えます

キーワードリストを第三引数に追加する


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

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
 &lt;p&gt;Hello, &lt;%= @name %&gt;!&lt;/p&gt;
</pre>


phoenix server を起動して, URL にアクセスします

`mix phoenix.server`{{execute}}

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

ブラウザ表示例:

![](https://i.gyazo.com/d59927e26b5efa4fbf4c54731dc20e1e.png)

## @ はマクロ

- 例 `@name` は, キーワードリストの `:name` キーの値を取得するコードに翻訳されます

## レイアウトテンプレートに値を埋め込む

ファイル名: `./web/templates/layout/app.html.eex`

<pre class="file" data-target="~/oiax/projects/modest_greeter/web/templates/layout/app.html.eex">
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ModestGreeter (<%= @name %>)</title>
    <link rel="stylesheet" href="<%= static_path(@conn, "/css/app.css") %>">
  </head>

  <body>
    <%= render @view_module, @view_template, assigns %>
    <script src="<%= static_path(@conn, "/js/app.js") %>"></script>
  </body>
</html>
<pre>


ブラウザの表示(タイトル部):

![](https://i.gyazo.com/d59927e26b5efa4fbf4c54731dc20e1e.png)
