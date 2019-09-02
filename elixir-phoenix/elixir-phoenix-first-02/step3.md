## Hello World!

`mkdir -p ~/oiax/projects; cd $_`{{execute}}

`mix phoenix.new modest_greeter --no-ecto`{{execute}}

次の質問には `Y` と入力してください

![](https://i.gyazo.com/8b69deaa2b4657a8a4f34d45191c329d.png)

作業ディレクトリを移動します

`cd ./modest_greeter`{{execute}}

### gettext をダウングレードする

gettext をダウングレードする必要があります

katacoda エディタで `./projects/modest_greeter/mix.exs` を開き該当の箇所を修正するか `sed` を実行してください

![](https://i.gyazo.com/2c568e9bfa5eae19213883ba9db5ac03.png)

ファイル名: `~/oiax/projects/modest_greeter/mix.exs`

修正前

![](https://i.gyazo.com/3b5497c84ff8c2125b4ab11577f84ee7.png)

修正後

![](https://i.gyazo.com/a44ea812e3dc622e26f39f5a6e4aa27c.png)

`sed -i -e 's/:gettext, "~> 0.11"/:gettext, "~> 0.14.1"/g' ~/oiax/projects/modest_greeter/mix.exs`{{execute}}

一旦, `clean` します

`mix deps.clean gettext`{{execute}}

`mix deps.get`{{execute}}

### phoenix を立ち上げる

`mix phoenix.server`{{execute}}

katakcoda 画面上の下記のタブをクリックします

![](https://i.gyazo.com/2abf40b1b0b2f49252e4617b5d37a33c.png)

ブラウザで下記画面が立ち上がります

![](https://i.gyazo.com/0839fba2a3ca5104eb8420615d63a2b2.png)
