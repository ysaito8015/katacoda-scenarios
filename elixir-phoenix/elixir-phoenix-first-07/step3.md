## 画像

## tag 関数と static_path 関数

書式: `tag :タグ名, [キーワードリストでオプションを指定]`
書式: `static_path(@conn, "画像ファイルのパス")`

`cd ~/oiax/projects/modest_greeter`{[execute}}

`wget https://www.oiax.jp/books/files/modest_greeter.svg`{[execute}}

`mv ./modest_greeter.svg ./web/static/assets/images/`{[execute}}

### `hello/show.html.eex` の変更

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card m-3"&gt;
  &lt;%= tag :img, src: static_path(@conn, "/images/modest_greeter.svg"),
    alt: "Robot", width: "320", height: "320",
    class: "card-image-top mx-auto" %&gt;
&lt;/div&gt;
  &lt;div class="card-body text-white bg-success"&gt;
    &lt;p class="card-text lead"&gt;
      &lt;i class="fa fa-smile-o"&gt;&lt;/i&gt;
      Hello, &lt;%= @name %&gt;!
    &lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>


### 一旦確認

Phoenix サーバを立ち上げます

`mix phoenix.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## 画像表示幅の調整

### `hello/show.html.eex` の変更

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card m-3"&gt;
  &lt;%= tag :img, src: static_path(@conn, "/images/modest_greeter.svg"),
    alt: "Robot", style: "width: 100%; max-width: 320px;",
    class: "card-image-top mx-auto" %&gt;
&lt;/div&gt;
  &lt;div class="card-body text-white bg-success"&gt;
    &lt;p class="card-text lead"&gt;
      &lt;i class="fa fa-smile-o"&gt;&lt;/i&gt;
      Hello, &lt;%= @name %&gt;!
    &lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>


### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## ファビコンと, Web クリップアイコンの指定

`wget https://www.oiax.jp/books/files/modest_greeter.ico`{[execute}}

`wget https://www.oiax.jp/books/files/modest_greeter256.png`{[execute}}

`mv ./modest_greeter.ico ./web/static/assets/images/`{[execute}}

`mv ./modest_greeter256.png ./web/static/assets/images/`{[execute}}

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
    &lt;link rel="shortcut icon" type="image/x-icon" href="&lt;%= static_path(@conn, "/images/modest_greeter.ico") %&gt;"&gt;
    &lt;link rel="apple-touch-icon" type="image/x-icon" href="&lt;%= static_path(@conn, "/images/modest_greeter256.png") %&gt;"&gt;
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

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## content_tag 関数

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
    &lt;%= tag :link, rel: "stylesheet", href: "&lt;%= static_path(@conn, "/css/app.css") %&gt;"&gt;
    &lt;%= tag :link, rel: "stylesheet", href: "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"&gt;
    &lt;%= tag :link, rel: "shortcut icon," type: "image/x-icon", href: "&lt;%= static_path(@conn, "/images/modest_greeter.ico") %&gt;"&gt;
    &lt;%= tag :link, rel: "apple-touch-icon", type: "image/x-icon", href: "&lt;%= static_path(@conn, "/images/modest_greeter256.png") %&gt;"&gt;
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
    &lt;%= content_tag :script, "", src: static_path(@conn, "/js/app.js") %&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

### 一旦確認

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

