## マップとキーワードリスト

`cd ~/oiax/projects/elixir-primer/v01/ch14`{{execute}}

## マップとは

- 値に順序がない
- `キー => 値' の集合
- `ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}'
- 取り出し方 `ages["Alice"]`

ファイル名: `./map1.exs`

`touch ./map1.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map1.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
IO.inspect ages["Bob"]
IO.inspect ages["David"]
</pre>

実行します

`elixir ./map1.exs`{{execute}}

### キーにアトムを使った書き方

ファイル名: `./map2.exs`

`touch ./map2.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map2.exs" data-target="replace">
member = %{name: "Alice", age: 23}
IO.inspect member[:name]
IO.inspect member["name"]
</pre>

実行します

`elixir ./map2.exs`{{execute}}

- `.` を使った呼び出し

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map2.exs" data-target="replace">
member = %{name: "Alice", age: 23}
IO.inspect member.name
IO.inspect member["name"]
</pre>

実行します

`elixir ./map2.exs`{{execute}}

### マップにマップを格納

ファイル名: `./map3.exs`

`touch ./map3.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map3.exs" data-target="replace">
team= %{
  leader: ${name: "Charlie", age: 48}
  subleader: %{name: "Alice", age: 23},
}
IO.inspect team[:leader][:age]
</pre>

実行します

`elixir ./map2.exs`{{execute}}

## マップの値を書き換える

ファイル名: `./map4.exs`

`touch ./map4.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map4.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
ages = %{ages | "Bob" => 16}
IO.inspect ages
</pre>

実行します

`elixir ./map4.exs`{{execute}}

### 複数の変更

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map4.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
ages = %{ages | "Bob" => 16, "Charlie" => 49}
IO.inspect ages
</pre>

実行します

`elixir ./map4.exs`{{execute}}

## マップに要素を追加する

ファイル名: `./map4.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map4.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
ages = %{ages | "Bob" => 16, "David" => 30}
IO.inspect ages
</pre>

実行します

`elixir ./map4.exs`{{execute}}

- パイプ記号を用いる場合, 存在するキーにのみ可能です
- `Map.merge/2` `Map.mearge(マップ, 追加するマップや変更するキーと値)`

ファイル名: `./map4.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map4.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
ages = Map.merge(ages, %{"Bob" => 16, "David" => 30})
IO.inspect ages
</pre>

実行します

`elixir ./map4.exs`{{execute}}

## キーを指定して, マップから値を削除する

- `Map.delete/2` `Map.delete(マップ名, 削除するキー)`

ファイル名: `./map5.exs`

`touch ./map5.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map5.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
ages = Map.delete(ages, "Bob")
IO.inspect ages
</pre>

実行します

`elixir ./map5.exs`{{execute}}

### 複数のキーを削除する

- `Map.drop/2` `Map.drop(マップ名, [キーのリスト])`

ファイル名: `./map5.exs`

`touch ./map5.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map5.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
ages = Map.drop(ages, ["Bob", "Charlie"])
IO.inspect ages
</pre>

実行します

`elixir ./map5.exs`{{execute}}

## マップを使った繰り返し処理

ファイル名: `./map6.exs`

`touch ./map6.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map6.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
Enum.each ages, fn({name, value}) ->
  IO.puts "#{name}: #{value}"
end
</pre>

実行します

`elixir ./map6.exs`{{execute}}

## `for` による記載

ファイル名: `./map6.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch14/map6.exs" data-target="replace">
ages = %{"Alice" => 23, "Bob" => 15, "Charlie" => 48}
for {name, value} <- ages do
  IO.puts "#{name}: #{value}"
end
</pre>

実行します

`elixir ./map6.exs`{{execute}}
