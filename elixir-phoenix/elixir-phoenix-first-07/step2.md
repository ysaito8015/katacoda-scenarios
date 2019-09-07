## ページ間のリンク

## リンクの設置

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;a href="/about"&gt;このサイトについて&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
</pre>

### `layout/app.html.eex` の変更

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
      &lt;h1&gt;&lt;a href="/"&gt;ModestGreeter&lt;/a&gt;&lt;/h1&gt;
    &lt;/header&gt;
    &lt;main&gt;
      &lt;%= render @view_module, @view_template, assigns %&gt;
    &lt;/main&gt;
    &lt;footer&gt;
      &copy; 2016 Oiax Inc.
    &lt;/footer&gt;
    &lt;script src="&lt;%= static_path(@conn, "/js/app.js") %&gt;"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

### 一旦確認

Phoenix サーバを立ち上げます

`mix phoenix.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/


## link 関数

書式

`link "リンク文字列", to: "リンク先の URL パス"`

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;%= link "このサイトについて", to: "/about" %&gt;&lt;/p&gt;
&lt;/div&gt;
</pre>

### `layout/app.html.eex` の変更

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
      &lt;h1&gt;&lt;%= link "ModestGreeter", to: "/" %&gt;&lt;/h1&gt;
    &lt;/header&gt;
    &lt;main&gt;
      &lt;%= render @view_module, @view_template, assigns %&gt;
    &lt;/main&gt;
    &lt;footer&gt;
      &copy; 2016 Oiax Inc.
    &lt;/footer&gt;
    &lt;script src="&lt;%= static_path(@conn, "/js/app.js") %&gt;"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## パスヘルパー

- `top_path()` 関数: 指定されたアクションへの URL パスを文字列として返す

書式: `top_path(@conn, :アクションを表すアトム, [キーワードリスト])`

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;%= link "このサイトについて", to: top_path(@conn, :about, []) %&gt;&lt;/p&gt;
&lt;/div&gt;
</pre>

### `layout/app.html.eex` の変更

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
      &lt;h1&gt;&lt;%= link "ModestGreeter", to: top_path(@conn, :index, []) %&gt;&lt;/h1&gt;
    &lt;/header&gt;
    &lt;main&gt;
      &lt;%= render @view_module, @view_template, assigns %&gt;
    &lt;/main&gt;
    &lt;footer&gt;
      &copy; 2016 Oiax Inc.
    &lt;/footer&gt;
    &lt;script src="&lt;%= static_path(@conn, "/js/app.js") %&gt;"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## ナビゲーション

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;%= link "このサイトについて", to: top_path(@conn, :about, []) %&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;nav class="nav justify-content-center mb-3"&gt;
  &lt;a class="nav-link" href="/hello/Alice"&gt;Alice&lt;/a&gt;
  &lt;a class="nav-link" href="/hello/Bob"&gt;Bob&lt;/a&gt;
  &lt;a class="nav-link" href="/hello/Charlie"&gt;Charlie&lt;/a&gt;
&lt;/nav&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## link 関数を用いて書き換える

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;%= link "このサイトについて", to: top_path(@conn, :about, []) %&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;nav class="nav justify-content-center mb-3"&gt;
    &lt;%= link "Alice", to: "/hello/Alice", class: "nav-link" %&gt;
    &lt;%= link "Bob", to: "/hello/Bob", class: "nav-link" %&gt;
    &lt;%= link "Charlie", to: "/hello/Charlie", class: "nav-link" %&gt;
&lt;/nav&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## パスヘルパー 関数を用いて書き換える

書式: `top_path(@conn, :アクションを表すアトム, 可変部分に埋め込む値, [キーワードリスト])`

`router.ex` 内でのパス

`get "/hello/:name", HelloController, :show` `:name` が可変部分

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;%= link "このサイトについて", to: top_path(@conn, :about, []) %&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;nav class="nav justify-content-center mb-3"&gt;
    &lt;%= link "Alice", to: hello_path(@conn, :show, "Alice", []), class: "nav-link" %&gt;
    &lt;%= link "Bob", to: hello_path(@conn, :show, "Bob", []), class: "nav-link" %&gt;
    &lt;%= link "Charlie", to: hello_path(@conn, :show, "Charlie", []), class: "nav-link" %&gt;
&lt;/nav&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## リストを使ってナビゲーションを書き換える

### `top/index.html.eex` の変更

ファイル名: `./web/templates/top/index.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/top/index.html.eex" data-target="replace">
&lt;%
  names = ~w(Alice Bob Charlie)
%&gt;
&lt;div class="jumbotron m-3"&gt;
  &lt;h1 class="display-3"&gt;ModestGreeter&lt;/h1&gt;
  &lt;p class="lead"&gt;ModestGreeter へようこそ！&lt;/p&gt;
  &lt;hr&gt;
  &lt;p&gt;&lt;%= link "このサイトについて", to: top_path(@conn, :about, []) %&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;nav class="nav justify-content-center mb-3"&gt;
    &lt;%= for name &lt;- names do %&gt;
      &lt;%= link name, to: hello_path(@conn, :show, name, []), class: "nav-link" %&gt;
    &lt;% end %&gt;
&lt;/nav&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

`CTRL C` を二回押して, Phoenix サーバを止めておきます
