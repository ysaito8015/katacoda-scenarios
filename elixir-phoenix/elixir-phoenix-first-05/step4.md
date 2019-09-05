## Font Awesome

- HTML タグを書くだけで, アイコンが利用できるもの

## Font Awesome の導入

`cd ~/oiax/projects/modest_greeter`{{execute}}

`npm install --save font-awesome`{{execute}}

`app.scss` を書き換えます

ファイル名: `./web/static/css/app.scss`

`touch ./web/static/css/app.scss`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/static/css/app.scss" data-target="replace">
@import "node_modules/bootstrap/dist/css/bootstrap";
@import "node_modules/font-awesome/scss/font-awesome;
</pre>

## フォントファイルの配置

`copycat-brunch` を導入します

`npm install --save-dev copycat-brunch`{{execute}}

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
    },
    copycat: {
      fonts: ["node_modules/font-awesome/fonts"]
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
      Poper: "popper.js",
      Tether: "tether"
    }
  },

  watcher: {
    usePolling: true
  }
};
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
