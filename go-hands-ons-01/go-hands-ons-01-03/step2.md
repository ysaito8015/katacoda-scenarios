## スライス

- 配列への参照（ポインター）を有する型で、要素を変更できる。

## 宣言、代入、要素の追加

```
// 変数exampleをstring型スライスで宣言
var example []string
fmt.Println("初期値は", example)

// 値をまとめて代入（}の前に要素がなければ最後の要素にカンマが必要！）
example = []string{
    "Golang",
    "hands-on",
}
fmt.Println("2番目の値は", example[1])

// 値を追加するにはappend()関数を使用
example = append(example, "in", "kagawa")
fmt.Println("追加結果は", example)
```

実行結果

```
初期値は []
2番目の値は hands-on
追加結果は [Golang hands-on in kagawa]
```

## 要素の取得

- 取得したい要素の位置を開始する添字〜終了する添字+1で指定して取得。

```
// 連続した値
fmt.Println(example[1:3])
// 指定した位置以降（以前だと[:2]）
fmt.Println(example[2:])
```

実行結果

```
[hands-on in]
[in kagawa]
```

## 要素の変更

- 変更したい要素の位置に値を代入。

```
// 4番目の値を変更
example[3] = "okayama"
fmt.Println(example)
```

実行結果

```
[Golang hands-on in okayama]
```


## 課題１ (01_slice.go)

１−１：

hello.goをコピーして01_slice.goを作成してください。
以降は01_slice.goを編集してください。

１−２：

var文のmsg1とmsg2を消した後、次の変数を定義してください。

- 変数名：example
- 型：string型のスライス
- 値："golang", "hands-on", "in", "kagawa"

１−３：

main()関数のmsg2を削した後、exampleを標準出力してください。
