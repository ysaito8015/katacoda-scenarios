## Font Awesome

- HTML タグを書くだけで, アイコンが利用できるもの
- 書籍と違う導入方法です

## Font Awesome の導入

`./web/templates/layout/app.html.eex` を書き換えます

ファイル名: `./web/templates/layout/app.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/layout/app.html.eex" data-target="replace">
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>

  <body>
    <header>
      <h1>ModestGreeter</h1>
    </header>
    <main>
      <%= render @view_module, @view_template, assigns %>
    </main>
    <footer>
      © 2016 Oiax Inc.
    </footer>
    <script src="<%= static_path(@conn, "/js/app.js") %>"></script>
  </body>
</html>

</pre>


`./web/templates/hello/show.html.eex` を書き換えます

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card m-3"&gt;
  &lt;div class="card-body text-white bg-success"&gt;
    &lt;p class="card-text lead"&gt;
      &lt;i class="fa fa-smile-o"&gt;&lt;/i&gt;
        Hello, &lt;%= @name %&gt;!
    &lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

Phoenix サーバを立ち上げ, URL にアクセスし確認します

`mix phoenix.server`{{execute}}

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello
