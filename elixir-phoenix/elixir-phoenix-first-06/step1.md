## モジュールと関数

環境設定が実行されています

## 準備作業

`cd ~/oiax/projects/elixir-primer/v01`{{execute}}

`mkdir -p ch12 ch13 ch14 && cd ./ch12`{{execute}}

## モジュールと関数の定義

ファイル名: `./hello1.exs`

`touch ./hello1.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello1.exs" data-target="replace">
defmodule Hello1 do
  def greet(name) do
    IO.puts "Hello, #{name}!"
  end
end
</pre>

## 関数の呼び出し

ファイル名: `./hello1.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello1.exs" data-target="replace">
defmodule Hello1 do
  def greet(name) do
    IO.puts "Hello, #{name}!"
  end
end

Hello1.greet("Alice")
Hello1.greet("Bob")
</pre>

実行します

`elixir ./hello1.exs`{{execute}}

- 引数を囲むカッコの省略
- 関数の戻り値を別の関数に渡す場合は引数にカッコをつけたほうがわかりやすい

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello1.exs" data-target="replace">
defmodule Hello1 do
  def greet(name) do
    IO.puts "Hello, #{name}!"
  end
end

Hello1.greet "Alice" 
Hello1.greet "Bob" 
</pre>

実行します

`elixir ./hello1.exs`{{execute}}

### モジュールの外では, 関数を定義できない

ファイル名: `./bare_func.exs`

`touch ./bare_func.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/bare_func.exs" data-target="replace">
def greet(name) do
  IO.puts "Hello, #{name}!"
end

greet "Alice" 
</pre>

実行します

`elixir ./bare_func.exs`{{execute}}

## モジュールのコンパイル

ファイル名: `./hello2.ex`

`touch ./hello2.ex`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello2.ex" data-target="replace">
defmodule Hello2 do
  def greet(name) do
    IO.puts "Hello, #{name}!"
  end
end
</pre>

コンパイルします

`elixirc ./hello2.exs`{{execute}}

### `Hello2` モジュールを使ってみる

`elixir -e 'Hello2.greet "Alice"'`{{execute}}

### スクリプトから使ってみる

ファイル名: `./hello2.exs`

`touch ./hello2.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello2.exs" data-target="replace">
Hello2.greet "Alice" 
Hello2.greet "Bob" 
</pre>

実行します

`elixirc ./hello2.exs`{{execute}}

## 関数の戻り値

ファイル名: `./hello3.exs`

`touch ./hello3.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello3.exs" data-target="replace">
defmodule Hello3 do
  def message(name) do
    "Hello, #{name}!"
  end
end

IO.puts Hello3.message "Alice" 
IO.puts Hello3.message "Bob" 
</pre>

## アリティ

- アリティ: 引数の個数
- `関数名/アリティ`

ファイル名: `./hello3.exs`

`touch ./hello3.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello3.exs" data-target="replace">
defmodule Hello3 do
  def message(name) do
    "Hello, #{name}!"
  end
end

IO.puts Hello3.message "Alice" 
IO.puts Hello3.message "Bob" 
IO.puts Hello3.message
</pre>

実行します

`elixirc ./hello3.exs`{{execute}}

## 関数のデフォルト値

- `\\` で区切ってデフォルト値指定

ファイル名: `./hello3.exs`

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello3.exs" data-target="replace">
defmodule Hello3 do
  def message do
    "Hello, world!"
  end

  def message(name) do
    "Hello, #{name}!"
  end
end

IO.puts Hello3.message "Alice" 
IO.puts Hello3.message "Bob" 
IO.puts Hello3.message
</pre>

実行します

`elixirc ./hello3.exs`{{execute}}

## 無名関数

- 書式: `fn(仮引数)  -> [コード] end`
- 呼び出し: `f.(引数)`

ファイル名: `./hello4.exs`

`touch ./hello4.exs`{{execute}}

<pre class="file" data-filename="~/oiax/projects/elixir-primer/v01/ch12/hello4.exs" data-target="replace">
f = fn(name) -> IO.puts "Hello, #{name}!" end
f.("Alice")
f.("Bob")
</pre>

実行します

`elixirc ./hello4.exs`{{execute}}

複数行の定義

<pre class="file" data-filename="" data-target="replace">
f = fn(name) ->
  IO.puts "Hello, #{name}!"
  IO.puts "How are you?"
end
</pre>

- アリティ `0` の場合は, カッコを省略可能

<pre class="file" data-filename="" data-target="replace">
f = fn -> IO.puts "Hello, world!" end
</pre>
