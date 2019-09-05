## HTML 文書の区分とスタイルシート

### 主部、ヘッダ、フッタ

![](https://i.gyazo.com/3f5931bd0b7559690378ffb0ea9c59b2.png)

- `<main>` 要素: HTML 文書の主部
- `<header>` 要素: HTML 文書のヘッダ
- `<footer>` 要素: HTML 文書のフッタ

ファイル名: `./web/templates/layout/app.html.eex`

変更前:

![](https://i.gyazo.com/5b367952cf66b8ae201d72d24457096f.png)

変更後:

![](https://i.gyazo.com/e9679b9cc1bb50c08885e15fab70002d.png)

## スタイルシート

SCSS 用のパッケージを導入します

書籍では, `npm install --save-dev sass-brunch` で導入していますが

いくつかのバージョンでは, sass cpmpiler がうまく動かないため

`package.json` に直接指定します

ファイル名: `./package.json`

<pre class="file" data-filename="~/oiax/projects/modest_greeter/package.json" data-target="replace">
{
  "repository": {},
  "license": "MIT",
  "scripts": {
    "deploy": "brunch build --production",
    "watch": "brunch watch --stdin"
  },
  "dependencies": {
    "phoenix": "file:deps/phoenix",
    "phoenix_html": "file:deps/phoenix_html"
  },
  "devDependencies": {
    "babel-brunch": "6.0.6",
    "brunch": "2.10.7",
    "clean-css-brunch": "2.10.0",
    "sass-brunch": "2.7.0",
    "uglify-js-brunch": "2.1.1"
  }
}
</pre>

`brunch-config.js` の変更

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
    enabled: true
  },

  watcher: {
    usePolling: true
  }
};
</pre>

編集するファイルを作成しておきます

`touch ./web/static/css/{main,header,footer}.scss`{{execute}}

Phoenix サーバを起動しておきます

`mix phoenix.server`{{execute}}

### 主部にスタイルシートを適用

ファイル名: `./web/static/css/main.scss`

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

次のステップに進む前に `CTRL C` を二回押し,  Phoenix サーバを停止しておきます

