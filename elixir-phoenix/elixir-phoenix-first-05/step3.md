
## Bootstrap と Font Awesome

Phoenix サーバが停止していることを確認します

## Bootstrap 導入

`cd ~/oiax/projects/modest_greeter`{{execute}}

`npm install --save jquery popper.js tether bootstrap@4.0.0`{{execute}}

`app.css` を書き換えます

`rm ./web/static/css/app.css`{{execute}}

ファイル名: `./web/static/css/app.scss`

`touch ./web/static/css/app.scss`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/static/css/app.scss" data-target="replace">
@import "node_modules/bootstrap/dist/css/bootstrap";
</pre>

`app.js` を書き換えます

ファイル名: `./web/static/js/app.js`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/static/js/app.js" data-target="replace">
// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import "bootstrap"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
</pre>

`brunch-config.js` を書き換えます

ファイル名: `./brunch-config.js`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/brunch-config.js" data-target="replace">
exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      // joinTo: {
      //  "js/app.js": /^(web\/static\/js)/,
      //  "js/vendor.js": /^(web\/static\/vendor)|(deps)/
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // order: {
      //   before: [
      //     "web/static/vendor/js/jquery-2.1.1.js",
      //     "web/static/vendor/js/bootstrap.min.js"
      //   ]
      // }
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["web/static/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {
      $: "jquery",
      jQuery: "jquery",
      Popper: "popper.js",
      Tether: "tether"
    }
  },

  watcher: {
    usePolling: true
  }
};
</pre>

Phoenix サーバを立ち上げ, URL にアクセスし確認します

`mix phoenix.server`{{execute}}

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

## Card コンポーネント

`./web/templates/hello/show.html.eex` を書き換えます

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card"&gt;
  &lt;div class="card-body"&gt;
    &lt;p&gt;Hello, &lt;%= @name %&gt;!&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

URL にアクセスし確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

### card-text クラス

- `card-text`: 親要素の最後の子要素であれば, 下辺のマージンが`0`に調整されます
- Bootstrap では, デフォルトで`p`要素の下辺のマージンを 1rem に設定しています

`./web/templates/hello/show.html.eex` を書き換えます

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card"&gt;
  &lt;div class="card-body"&gt;
    &lt;p class="card-text"&gt;Hello, &lt;%= @name %&gt;!&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

URL にアクセスし確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

### マージンの調整

- `m-3`: マージンを 1rem に調整します
- `p-`: パディング調整の場合
- `-[0, 1, 2, 3, 4, 5]` 0, 0.25rem, 0.5rem, 1rem, 1.5rem, 3rem に相当します
- 各辺を個別に指定する場合 `mt-1` のように設定します

|文字|対象|
|------|------|
|t|上辺|
|r|右辺|
|b|下辺|
|l|左辺|
|x|左辺と右辺|
|y|上辺と下辺|


`./web/templates/hello/show.html.eex` を書き換えます

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card m-3"&gt;
  &lt;div class="card-body"&gt;
    &lt;p class="card-text"&gt;Hello, &lt;%= @name %&gt;!&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

URL にアクセスし確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

### 背景色とフォントの調整

- 背景色を設定するクラス

|クラス名|背景色|16進数表示|
|------|------|------|
|bg-primary|青|#007bff|
|bg-secondary|灰色|#868e96|
|bg-success|緑|#28a745|
|bg-danger|赤|#d9534f|
|bg-warning|オレンジ色|#ffc107|
|bg-info|水色|#17a2b8|
|bg-light|薄い灰色|#f8f9fa|
|bg-dark|黒|#17a2b8|
|bg-white|白|#ffffff|

`./web/templates/hello/show.html.eex` を書き換えます

ファイル名: `./web/templates/hello/show.html.eex`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/templates/hello/show.html.eex" data-target="replace">
&lt;div class="card m-3"&gt;
  &lt;div class="card-body text-white bg-success"&gt;
    &lt;p class="card-text lead"&gt;Hello, &lt;%= @name %&gt;!&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

URL にアクセスし確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

`CTRL C` を２回押して Phoenix サーバを止めておきます
