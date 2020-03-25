## 解答２ (02_for.go)

```
package main

// 例）1行1パッケージの書き方
import "fmt"

var (
    example = []string{"golang", "hands-on", "in", "kagawa"}
)

func main() {
    var data []string
    data = example
    for _, v := range data {
        fmt.Println(v)
    }
}
```


実行結果

`go run 02_for.go`{{execute}}

```
golang
hands-on
in
kagawa
```


## if文

- 三項演算子はない！シンプル！
- 判定文としては、switch文もある。

```
v := "GoLang"

if v == "golang" {
    fmt.Println("○")
} else if v == "GOLANG" {
    fmt.Println("△")
} else {
    fmt.Println("×")
}

// 変数vはif文の内外からアクセスできる
fmt.Println(v)
```

実行結果

```
×
GoLang
```

## 発展

- 条件式の前に式を記述できる

```
if v := "GoLang"; v == "golang" {
    fmt.Println("○")
} else if v == "GOLANG" {
    fmt.Println("△")
} else {
    fmt.Println("×")
}

// 変数vのネームスコープがif文内だけになるので、外からアクセスするとエラーになる
// fmt.Println(v)
```

実行結果（fmt.Println(v)を無効時）

```
×
```

実行結果（fmt.Println(v)を有効時）

```
# command-line-arguments
./main.go:17:17: undefined: v
```

## 課題３ (03_if.go)

３−１：

02_for.goをコピーして03_if.goを作成してください。
以降は03_if.goを編集してください。

３−２：

main()関数のfor文内を、以降に書き換えてください。

１．fmt.Println(v)の後に、ループの値変数vの値が"in"なら"○"を、それ以外なら"×"を標準出力に表示するif文を追加してください。
