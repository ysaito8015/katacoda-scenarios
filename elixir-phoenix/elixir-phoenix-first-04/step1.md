## 環境構築

第五章を終了した状態を構築します

`wget -qO- https://github.com/ysaito8015/modest_greeter/archive/ch05.tar.gz| tar xvz - -C /root/oiax/projects/modest_greeter`{{execute}}

`cd ~/oiax/projects/modest_greeter`{{execute}}

## 第五章の復習

### 行ったこと

1. 経路(route)の設定
1. アクションの作成
1. ビューの作成
1. テンプレートの作成
1. Phoenix サーバの起動
1. ブラウザでアクセス

## routing

ファイル名: `./router.ex`

![](https://i.gyazo.com/f7ad65e9eecd63cc6ba8792f725c0efb.png)

経路設定書式:

`get "パス文字列", コントローラ名, :アクション名`

- HTTP動詞(HTTP verbs) get, post など
- コントローラ名, 大文字始まりのアトム
- アクション名, :始まりのアトム

## コントローラ

### コントローラ名

ファイル名: `./web/controller/hello_controller.ex`

![](https://i.gyazo.com/94364f2f104dc65df321ccc09a61f366.png)

- ファイル全体で一つのモジュールを定義
- モジュール=関数の入れ物, モジュールを入れることもできる

書式:

<pre>
defmodule アプリケーション名.コントローラ名 do
end
</pre>

### use マクロ

![](https://i.gyazo.com/ac63402ad7f741b6e2c97b2a79b73c15.png)

マクロを用いることで他のモジュールを利用して現在のモジュールの定義を変更することができます

 コード上で`use`を呼び出すと, 実際には提供されたモジュールに定義されている`__using__/1`コールバックを呼び出します

`__using__/1`コールバックが呼び出されたあと, その結果のコードを呼び出し元のモジュールに追加します

`phoenixframework`の, この[ファイル](https://github.com/phoenixframework/phoenix/blob/0b6fe832296ea20cb2d2e987dbffd42e27bd41ed/installer/templates/phx_single/lib/app_name_web.ex#L20)で定義されています

### アクション

- アクション:コントローラモジュールで定義された関数

![](https://i.gyazo.com/f2ccd872cf742188ab6121624e4e26e9.png)

- conn: ブラウザからのリクエストに関する情報を格納した構造体
- _params: ブラウザから送られてきたパラメータを格納したマップ
  - _始まりなのは, show 関数内で使われないため
  - 使われない変数があるとコンパイル時にエラーが起こる

書式:

<pre>
def 関数名(仮引数...) do
end
</pre>


### render 関数

- HTML テンプレートを HTML 文書に変換し, ブラウザに返します

書式:

<pre>
render conn, "テンプレート文字列"
</pre>


