## ビューモジュール

第十一章を終了した状態を構築します

`./get_source.sh`{{execute}}

`cd ./modest_greeter`{{execute}}

## トップページの作成

### 経路設定

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

    get "/", TopController, :index
    get "/hello/:name", HelloController, :show
    get "/hello", HelloController, :show
  end
end
</pre>

### コントローラ, アクション作成

ファイル名: `./web/controllers/top_controller.ex`

`touch ./web/controllers/top_controller.ex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/top_controller.ex" data-target="replace">
defmodule ModestGreeter.TopController do
  use ModestGreeter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
</pre>

### ビューモジュール作成

ファイル名: `./web/views/top_view.ex`

`touch ./web/views/top_view.ex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/views/top_view.ex" data-target="replace">
defmodule ModestGreeter.TopView do
  use ModestGreeter.Web, :view
end
</pre>

### テンプレート作成

`mkdir ./web/templates/top`{{execute}}

ファイル名: `./web/templates/top/index.html.eex`

`touch ./web/templates/top/index.html.eex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotrom m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
&lt;/div&gt;
</pre>

### 一旦確認

`mix phoenix.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

`CTRL C` を二回押して, Phoenix サーバを止めておきます

### エラー修正

ファイル名: `./web/controllers/top_controller.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/top_controller.ex" data-target="replace">
defmodule ModestGreeter.TopController do
  use ModestGreeter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", name: "Top"
  end
end
</pre>

## ビューモジュールの活用

### 先程の修正をもとに戻します

ファイル名: `./web/controllers/top_controller.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/top_controller.ex" data-target="replace">
defmodule ModestGreeter.TopController do
  use ModestGreeter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
</pre>

### ビューモジュールへ関数を定義

- `hello_view.ex` の修正

ファイル名: `./web/views/hello_view.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/views/hello_view.ex" data-target="replace">
defmodule ModestGreeter.HelloView do
  use ModestGreeter.Web, :view

  def document_title(assigns) do
    "ModestGreeter (#{assigns.name})"
  end
end
</pre>

- `top_view.ex` の修正

ファイル名: `./web/views/top_view.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/views/top_view.ex" data-target="replace">
defmodule ModestGreeter.TopView do
  use ModestGreeter.Web, :view

  def document_title(_assigns) do
    "ModestGreeter"
  end
end
</pre>

### テンプレートの変更

- `index.html.eex` の修正

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotrom m-3"&gt;
  &lt;h1 class="display-3"&gt;&lt;%= document_title(assigns) %&gt;&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
&lt;/div&gt;
</pre>

- `app.html.eex` の修正

ファイル名: `./web/templates/layout/app.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/layout/app.html.eex" data-target="replace">
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8"&gt;
    &lt;meta http-equiv="X-UA-Compatible" content="IE=edge"&gt;
    &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;
    &lt;meta name="description" content=""&gt;
    &lt;meta name="author" content=""&gt;

    &lt;title&gt;&lt;%= @view_module.document_title assigns %&gt;&lt;/title&gt;
    &lt;link rel="stylesheet" href="&lt;%= static_path(@conn, "/css/app.css") %&gt;"&gt;
    &lt;link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"&gt;
  &lt;/head&gt;

  &lt;body&gt;
    &lt;header&gt;
      &lt;h1&gt;ModestGreeter&lt;/h1&gt;
    &lt;/header&gt;
    &lt;main&gt;
      &lt;%= render @view_module, @view_template, assigns %&gt;
    &lt;/main&gt;
    &lt;footer&gt;
      © 2016 Oiax Inc.
    &lt;/footer&gt;
    &lt;script src="&lt;%= static_path(@conn, "/js/app.js") %&gt;"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

### 一旦確認

`mix phoenix.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

`CTRL C` を二回押して, Phoenix サーバを止めておきます

## document_title 関数の説明

### document_title 関数の定義

<pre class="file">
defmodule ModestGreeter.HelloView do
  use ModestGreeter.Web, :view

  def document_title(assigns) do
    "ModestGreeter (#{assigns.name})"
  end
end
</pre>

- `assigns` には `render` 関数の第３引数に与えられたキーワードリストの要素をすべて持つマップがセットされます

<pre class="file">
defmodule ModestGreeter.TopView do
  use ModestGreeter.Web, :view

  def document_title(_assigns) do
    "ModestGreeter"
  end
end
</pre>

- `_` で始め, 引数に与えられたマップを使用しないため

### テンプレートでの利用

### `top/index.html.eex`

<pre class="file">
  &lt;h1 class="display-3"&gt;&lt;%= document_title(assigns) %&gt;&lt;/h1&gt;
</pre>

- `TopView` は `TopController` に対応するビューモジュールであるため, モジュール名なしで呼び出しています
- テンプレートの中では常に `assigns` という変数を参照できます
- `assigns` には `render` 関数の第３引数に与えられたキーワードリストの要素をすべて持つマップがセットされています

### `layout/app.html.eex`

<pre class="file">
    &lt;title&gt;&lt;%= @view_module.document_title assigns %&gt;&lt;/title&gt;
</pre>

- `@view_module` は, 現在使われているコントローラに対応するテンプレートを返します

## 「このサイトについて」ページの作成

### 経路設定

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

    get "/", TopController, :index
    get "/about", TopContoroller, :about
    get "/hello/:name", HelloController, :show
    get "/hello", HelloController, :show
  end
end
</pre>

### コントローラ, アクション作成

ファイル名: `./web/controllers/top_controller.ex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/controllers/top_controller.ex" data-target="replace">
defmodule ModestGreeter.TopController do
  use ModestGreeter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _param) do
    render conn, "about.html"
  end
end
</pre>

### テンプレート作成

ファイル名: `./web/templates/top/about.html.eex`

`touch ./web/templates/top/about.html.eex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/about.html.eex" data-target="replace">
&lt;div class="m-3"&gt;
  &lt;h1&gt;このサイトについて&lt;/h1&gt;
  &lt;p&gt;ModestGreeter は『Elixir/ Phoenix 初級 ①』の学習用 Phoenix アプリです。&lt;/p&gt;
&lt;/div&gt;
</pre>

### 一旦確認

`mix phoenix.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

`CTRL C` を二回押して, Phoenix サーバを止めておきます

### case による条件分岐

- case 文の書き方

<pre class="file">
n = 1
case n do
  1 -> IO.puts "A"
  2 -> IO.puts "B"
  _ -> IO.puts "C"
end
</pre>

<pre class="file">
case チェックする変数 do
  一致した場合 -> 処理
  _ -> 処理 # どれも一致しなかった場合
end
</pre>

## ページタイトルの切り替え

ファイル名: `./web/views/top_view.ex`

`touch ./web/views/top_view.ex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/views/top_view.ex" data-target="replace">
defmodule ModestGreeter.TopView do
  use ModestGreeter.Web, :view

  def document_title(assigns) do
    case assigns.view_template do
      "about.html" -> "ModestGreeter - このサイトについて"
      _ -> "ModestGreeter"
  end
end
</pre>

### 一旦確認

`mix phoenix.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

`CTRL C` を二回押して, Phoenix サーバを止めておきます
