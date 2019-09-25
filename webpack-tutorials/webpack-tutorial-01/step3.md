## モジュール

ES2015 から `import`, `export` ステートメントが標準化されました

しかしながら, 多くのブラウザではサポートされていません

webpack はそれらをサポートしています

webpack は古いブラウザでも実行できるように, トランスパイル (transpiles) します

## webpack-config.js を使ってみる

webpack4 から, コンフィグレーションは必要ありません

しかし, 多くのプロジェクトでは, より複雑なセットアップが必要です

それが webpack がコンフィグレーションファイルをサポートする理由です

新たに, `webpack.config.js` ファイルをつくります

`touch ./webpack.config.js`{{execute}}

ファイル名: `/work/webpack-demo/webpack.config.js`

<pre class="file" data-filename="/work/webpack-demo/webpack.config.js" data-target="replace">
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  }
};
</pre>

webpack を実行します

`npx webpack --config webpack.config.js`{{execute}}

実際にはオプションを指定しなくても, デフォルトで, `webpack.config.js` があれば自動的に読み込みます

## NPM スクリプト

webpack コマンドを実行しなくても良いように, `./package.json` に設定します

ファイル名: `/work/webpack-demo/package.json`

<pre class="file" data-filename="/work/webpack-demo/package.json" data-target="replace">
{
  "name": "webpack-demo",
  "version": "1.0.0",
  "description": "",
  "private": true,
  "scripts": {
     "test": "echo \"Error: no test specified\" && exit 1",
     "build": "webpack"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
     "webpack": "^4.41.0",
     "webpack-cli": "^3.3.9"
  },
  "dependencies": {
    "lodash": "^4.17.5"
  }
}
</pre>

これにより `npm run build` コマンドの実行で同じ出力が得られます

`npm run build`{{execute}}
