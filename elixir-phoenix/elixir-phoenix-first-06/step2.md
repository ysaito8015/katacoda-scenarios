## リストとタプル

`cd ~/oiax/projects/elixir-primer/v01/ch13`{{execute}}

## リストとは

- 複数個の値を集合として扱うデータ型
- `[]` で囲む　
- 要素動詞の型が違ってもいい
  - `[100, :foo, "ABC", nil]`
- 入れ子構造のリストも可能
  - `[[0, 1], 2, [3, [4, 5]]]`
- 文字のみのリストの場合シジルが便利
  - `~w(Alice Bob Charlie)`
- 式の埋め込みや, 制御文字をエスケープしたい場合
  - `~W(#{name} Program\tFiles)`

## リストを使った繰り返し処理

- `Enum.each/2`
- `Enum.each(リスト, 処理)`

ファイル名: `./list1.exs`

`touch ./list1.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list1.exs" data-target="replace">
numbers = [2, 3, 5, 7, 11]

Enum.each numbers, fn(n) ->
  IO.puts n
end
</pre>

実行します

`elixir ./list1.exs`{{execute}}

- 引数を強調した書き換え

<pre class="file" data-filename="" data-target="replace">
numbers = [2, 3, 5, 7, 11]

f = fn(n) ->
  IO.puts n
end

Enum.each(numbers, f)
</pre>

### `for` の利用

- `for 仮引数 <- リスト do 処理 end`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list1.exs" data-target="replace">
numbers = [2, 3, 5, 7, 11]

for n <- numbers do
  IO.puts n
end
</pre>

実行します

`elixir ./list1.exs`{{execute}}

## リストに対する操作

- すべての値が不変, イミュータブルなので, リストの中身も変更できません
- リストから別のリストを作ることができます
- リストの結合 `[前に加えたい要素 | リスト]`
- `|` cons 演算子

### リストの先頭に要素を加える

ファイル名: `./list2.exs`

`touch ./list2.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list2.exs" data-target="replace">
a = [1, 2]
b = [0 | a]
IO.inspect b
</pre>

実行します

`elixir ./list2.exs`{{execute}}

### 複数要素の追加

ファイル名: `./list2.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list2.exs" data-target="replace">
a = [1, 2]
b = [-1, 0 | a]
IO.inspect b
</pre>

実行します

`elixir ./list2.exs`{{execute}}

### リストの末尾に要素を加える

- ` | リスト以外の値` -> 不適切なリストと呼ばれる特別なリスト

ファイル名: `./list2.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list2.exs" data-target="replace">
a = [1, 2]
b = [a | 3]
IO.inspect b
</pre>

実行します

`elixir ./list2.exs`{{execute}}

- `++` リストを連結する演算子

ファイル名: `./list2.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list2.exs" data-target="replace">
a = [1, 2]
b = a ++ [3]
IO.inspect b
</pre>

実行します

`elixir ./list2.exs`{{execute}}

## リストの要素を連結して文字列を作る

ファイル名: `./list3.exs`

`touch ./list3.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list3.exs" data-target="replace">
numbers = [2, 3, 4, 7, 11]
IO.inspect Enum.join(numbers)
</pre>

実行します

`elixir ./list3.exs`{{execute}}

### 区切り文字を指定したい場合

ファイル名: `./list3.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/list3.exs" data-target="replace">
numbers = [2, 3, 4, 7, 11]
IO.inspect Enum.join(numbers, ", ")
</pre>

実行します

`elixir ./list3.exs`{{execute}}

## タプル

- `{}` で囲み
- 要素を `,` で区切る
- 典型的なタプル `{:ok, 1}`
- 関数が複数の戻り値を返すときにタプルを使う
- 要素の追加, 削除, 入れ替えなどに時間がかかる

ファイル名: `./tuples1.exs`

`touch ./tuples1.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch13/tuples1.exs" data-target="replace">
numbers = [2, 3, 4, 7, 11]
r = Enum.fetch(numbers, 1)
IO.inspect r
r = Enum.fetch(numbers, 5)
IO.inspect r
</pre>

実行します

`elixir ./tuples1.exs`{{execute}}



