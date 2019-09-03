
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

` <p>Hello, <%= @name %>!</p>`


phoenix server を起動して, URL にアクセスします

`mix phoenix.server`{{execute}}

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

ブラウザ表示例:

![](https://i.gyazo.com/d59927e26b5efa4fbf4c54731dc20e1e.png)

## @ はマクロ

- 例 `@name` は, キーワードリストの `:name` キーの値を取得するコードに翻訳されます

## レイアウトテンプレートに値を埋め込む

ファイル名: `./web/templates/layout/app.html.eex`

変更前:

![](https://i.gyazo.com/19883703f6a2f4544c0d8a48439cd6ef.png)

変更後:

![](https://i.gyazo.com/768c28e2fd727478f6f67588245b417e.png)

ブラウザの表示(タイトル部):

![](https://i.gyazo.com/d59927e26b5efa4fbf4c54731dc20e1e.png)
