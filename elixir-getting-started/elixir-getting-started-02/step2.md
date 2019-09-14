## Excelの「並べ替え」をElixirで書いてみる

`iex` を起動します

`iex`{{execute}}

起動時表示例です

![](https://i.gyazo.com/b407092bd09d6fdcb74d484e3da7ca5a.png)

### Enum.sort()

`323, 99, 54` という, リストを並べ替えます

`Enum.sort([323, 99, 54])`{{execute}}

パイプ演算子を利用した場合

`[323, 99, 54] |> Enum.sort`{{execute}}

## Excelの「フィルタ」をElixirで書いてみる

### Enum.filter()

渡されたリストの要素が, 一つ一つ `fn(n)` の `n` に代入され `->` 以降の処理が行われます

`[323, 99, 54] |> Enum.filter(fn(n) -> n != 999 end)`{{execute}}

- `fn()` : 関数(function) を意味しています
- `-> ... end` : 関数の処理を意味しています

### バリエーション

`n` が `999` と一致しない場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n != 999 end)`{{execute}}

`n` が `999` と一致する場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n == 999 end)`{{execute}}

`n` が `999` 以上の場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n >= 999 end)`{{execute}}

`n` が `999` より大きい場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n > 999 end)`{{execute}}

`n` が `999` 未満の場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n < 999 end)`{{execute}}

`n` が `999` 以下の場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n <= 999 end)`{{execute}}

`n` が `323` 以下 かつ `n` が `999` 以上の場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n <= 323 && n >= 999 end)`{{execute}}

`n` が `323` と一致 または `n` が `54` と一致した場合

`[323, 99, 54] |> Enum.filter(fn(n) -> n == 323 || n == 54 end)`{{execute}}

>>Q1: 確認 次の実行結果を入力してください `[323, 99, 54] |> Enum.sort`<<
=== [54, 99, 323]

>>Q2: 確認 次の実行結果を入力してください `[323, 99, 54] |> Enum.filter(fn(n) -> n >= 55 || n <= 323 end)`<<
=== [323, 99, 54]
