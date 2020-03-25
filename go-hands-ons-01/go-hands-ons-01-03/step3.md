* 解答１ (01_slice.go)

```
package main

import (
    "fmt"
)

var (
    // 値をまとめて代入（}の前に要素があるので最後の要素にカンマは不要！）
    example = []string{"golang", "hands-on", "in", "kagawa"}
)

func main() {
    fmt.Println(example)
}
```

## 繰り返し
- for文のみ（while文などなし！シンプル！）

```
for i := 0; i < 4; i++ {
    fmt.Print(i)
}
```

実行結果

```
0123
```

## 無限ループ

```
// 「:=」記述：変数iは宣言＋初期化（値から推測してint型）
i := 1
for {
    fmt.Print(i)
    i++
}
```

実行結果

```
123456789101112131415（略）
```

## range
- rangeでスライス型を指定すると添字と値を取得できる。

```
// 変数abcをstring型のスライスで宣言して、値を設定。
var abc []string
abc = []string{"a", "b", "c"}

// 第1戻り値変数で添字、第2戻り値変数で値が取得できる。
for i, v := range abc {
    fmt.Println(i, v)
}
// 標準出力に空行を出力
fmt.Println()

// 値だけを取得する場合は、第1戻り値変数を_にして第2戻り値変数を指定する。
for _, v := range abc {
    fmt.Println(v)
}
fmt.Println()

// 添字だけを取得する場合は、第1戻り値変数のみ指定する（i, _でも良い）
for i := range abc {
    fmt.Println(i)
}
```

実行結果

```
0 a
1 b
2 c

a
b
c

0
1
2
```

## 課題２ (02_for.go)

２−１：

01_slice.goをコピーして02_for.goを作成してください。
以降は02_for.goを編集してください。

２−２：

main()関数内を、以降に書き換えてください。

１．次の変数を宣言してください。

- 変数名：data
- 型：string型のスライス

２．変数dataにexampleを設定（代入）してください。

３．for文とrangeを使用してdataの値だけを順番に標準出力に表示してください。

