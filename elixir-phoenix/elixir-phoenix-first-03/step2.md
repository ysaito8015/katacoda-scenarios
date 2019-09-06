## デフォルトファイルの削除

自動生成されるファイルを削除します

`rm ./web/controllers/page_controller.ex`{{execute}}

`rm ./web/static/css/phoenix.css`{{execute}}

`rm ./web/views/page_view.ex`{{execute}}

`rm -rf ./web/templates/page`{{execute}}

## ./web/router.ex の整理

Katacoda エディタで, 該当のファイルを開くと, `copy to editor` ボタンが機能します

![](https://i.gyazo.com/36732319491cd2b4ebeeb1a9ef0e0356.png)

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
  end
end
</pre>


## レイアウトテンプレートの整理

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

    &lt;title&gt;ModestGreeter&lt;/title&gt;
    &lt;link rel="stylesheet" href="&lt;%= static_path(@conn, "/css/app.css") %&gt;"&gt;
  &lt;/head&gt;

  &lt;body&gt;
    &lt;%= render @view_module, @view_template, assigns %&gt;
    &lt;script src="&lt;%= static_path(@conn, "/js/app.js") %&gt;"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

