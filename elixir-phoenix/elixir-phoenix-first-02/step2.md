## 基本データ型

`iex`{{execute}}

## 整数

`255 #integer`{{execute}}

`0xff #hexdecimal`{{execute}}

`0b11111111 #binary`{{execute}}

`0o377 #binary`{{execute}}

`1_000_000 #integer`{{execute}}

## 比較演算子

`1 == 1`{{execute}}

`1 == 2`{{execute}}

`1 != 1`{{execute}}

`1 != 2`{{execute}}

## 四則演算

`5 + 2 #=> 7`{{execute}}

`5 - 2 #=> 3`{{execute}}

`5 * 2 #=> 10`{{execute}}

`5 / 2 #=> 2.5 浮動小数点(float)`{{execute}}

`div(5, 2) #=> 2`{{execute}}

## 剰余演算

`rem(7, 4) #=> 3`{{execute}}

`rem(-7, 4) #=> -3`{{execute}}

## 文字列

文字列は""ダブルクォートで囲みます

`"ABC"`{{execute}}

`"あいうえお"`{{execute}}

'' シングルクォートは文字リスト(charlist)として扱われる

`'abc'`{{execute}}

### 比較演算

`"ABC" == "ABC"`{{execute}}

`"ABC" != "abc"`{{execute}}

!!`CTRL C` を二回押し, iex を終了してください

### 文字列連結

ファイル名: `string1.exs`
`touch ./string1.exs`{{execute}}

<pre class="file" data-filename="string1.exs" data-target="replace">
a = "AAA"
b = "BBB"
IO.puts a <> b # 文字列連結記号 <>
</pre>

`elixir string1.exs #=> AAABBB`{{execute}}

### 式展開

ファイル名: `string2.exs`
`touch ./string2.exs`{{execute}}

<pre class="file" data-filename="string2.exs" data-target="replace">
name = "world"
IO.puts "Hello, #{name}!"
</pre>

`elixir string2.exs #=> Hello, world!`{{execute}}

### 文字列を表すシジル

`~s(AAA)`

`~s(BBB)`

### シジルと式展開

ファイル名: `string3.exs`
`touch ./string3.exs`{{execute}}

<pre class="file" data-filename="string3.exs" data-target="replace">
name = "world"
IO.puts ~s(Hello, #{name}!) #=> Hello, world!
IO.puts ~S(Hello, #{name}!) #=> Hello, #{name}!
</pre>

`elixir string3.exs`{{execute}}

ファイル名: `string4.exs`
`touch ./string4.exs`{{execute}}

<pre class="file" data-filename="string4.exs" data-target="replace">
IO.puts ~s(A\nB\tC) #=> A
                    #   B    C
IO.puts ~S(D\nE\tF) #=> D\nE\tF
</pre>

`elixir string4.exs`{{execute}}

## アトム

* ソフトウェア内部で使用される名前 Ruby のシンボルと似ている
* ４種類の書き方

1. : を用いる
  - : で始める
  - 2文字目 [A-Z]か[a-z]か"_"アンダースコア
  - 3文字目以降で数字または記号も利用可能
  - 最後は!や?でもよい
  - スネークケースで書く
1. 先頭をアルファベット大文字で始める
  - 2文字目以降は [A-Z]か[a-z]か[0-9]か"_"アンダースコア
  - キャメルケース
1. ""ダブルクォートで囲んで:で始める
1. 演算子の前に:を置くとアトムとなる

## モジュール

- 名前はアトムで書く
  - 前述の2.の書き方, 大文字始まり
- キャメルケースで書く

例: 1から100までの整数を取る一様分布からひとつランダムに返す

`elixir -e "IO.puts :rand.uniform(100)"`{{execute}}

## 真偽値

`true, false, nil` は、それぞれのアトムへの別名として定義されています

`iex`{{execute}}

`i(true)`{{execute}}

`i(false)`{{execute}}

`i(nil)`{{execute}}

`CTRL C` を二回押し, `iex` を終了してください
