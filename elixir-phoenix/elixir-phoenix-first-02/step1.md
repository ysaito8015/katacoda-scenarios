## 環境

このコースが始まると、右のターミナルで、環境構築が始まります

docker イメージが立ち上がりますので、その後次へ進んでください

作業ディレクトリに移動します

`cd /root/elixir-primer/v01/ch03`{{execute}}

## IEx の使い方

IEx を起動します

`iex`{{execute}}

![](https://i.gyazo.com/2b9e70577434285a10b5763b806f6b5c.png)

`1 + 1`{{execute}}

`CTRL C` を二回押すことで終了できます

### katacoda エディタでのファイルの作り方

下記の図のようにファイルツリー上で右クリックし、NEW>file と選択します

![](https://i.gyazo.com/d1f067e601f78ffb03093523db792b52.png)

モーダルに現れるテキストボックスにファイル名を入力します

![](https://i.gyazo.com/92a1d5775f8976227f3d33e3e70e8021.png)

ファイル名: `variable.exs`

上記の方法か, `touch` でファイルを作成します

`touch ./variable.exs`{{execute}}

<span style="color: red; "下記の `copy to editor` ボタンは, ファイル名を基準にしています. katacoda エディタで同じ名前のファイルが開かれていればその内容をエディタ内へコピーします</span>

<pre class="file" data-filename="variable.exs" data-target="replace">
n = 1
n = n + 1
IO.puts n
</pre>

`elixir variable.exs`{{execute}}

## コメント

ファイル名: `variable.exs`

<pre class="file" data-filename="variable.exs" data-target="replace">
# この行全体がコメント
n = 1
n = n + 1
IO.puts n # 行末のコメント
</pre>

`elixir variable.exs`{{execute}}
