## Font Awesome

- HTML タグを書くだけで, アイコンが利用できるもの
- 書籍と違う導入方法です

## Font Awesome の導入

`./web/templates/layout/app.html.eex` を書き換えます

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

    &lt;title&gt;ModestGreeter (&lt;%= @name %&gt;)&lt;/title&gt;
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
