## HTML 文書の区分とスタイルシート

### 主部、ヘッダ、フッタ

![](https://i.gyazo.com/3f5931bd0b7559690378ffb0ea9c59b2.png)

- `<main>` 要素: HTML 文書の主部
- `<header>` 要素: HTML 文書のヘッダ
- `<footer>` 要素: HTML 文書のフッタ

ファイル名: `./web/templates/layout/app.html.eex`

変更前:

![](https://i.gyazo.com/768c28e2fd727478f6f67588245b417e.png)

変更後:

![](https://i.gyazo.com/e9679b9cc1bb50c08885e15fab70002d.png)

## スタイルシート

SCSS 用のパッケージを導入します

`npm install --save-dev sass-brunch`{{execute}}

適用後の `./package.json`

![](https://i.gyazo.com/a002edcc5e694a8c5c2754c204b56bf9.png)

`brunch-config.js` の変更

ファイル名: `./bunch-config.js`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/bunch-config.js" data-target="replace">
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
    enabled: true
  },

  watcher: {
    usePolling: true
  }
};
</pre>

Phoenix サーバを起動しておきます

`mix phoenix.server`{{execute}}

### 主部にスタイルシートを適用

ファイル名: `./web/static/css/main.scss`

`touch ./web/static/css/main.scss`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/static/css/main.scss" data-target="replace">
main {
  text-align: center;
}
</pre>

- セレクタ: スタイルが適用される対象 `main`
- 宣言ブロック: `{}` で囲まれた部分
- 宣言の書式: `プロパティ: 値;`

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

### フッタにスタイルシートを適用

ファイル名: `./web/static/css/footer.scss`

`touch ./web/static/css/footer.scss`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/static/css/footer.scss" data-target="replace">
footer {
  background-color: #eee;
  color: #777;
  padding: 0.5rem;
  font-size: 0.75rem;
  font-family: Helvetica, Arial, sans-serif;
}
</pre>

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

### ヘッダにスタイルシートを適用

ファイル名: `./web/static/css/header.scss`

`touch ./web/static/css/header.scss`{{execute}}

<pre class="file" data-filename="~/oiax/projects/modest_greeter/web/static/css/header.scss" data-target="replace">
header {
  background-color: #ddd;
  boder-style: solid;
  boder-width: 1px;
  border-color: #ccc;

  h1 {
    font-size: 1.25rem;
    margin: 0.5rem;
  }
}
</pre>

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/hello

