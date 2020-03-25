## 解答３ (03_if.go)

```
package main

import "fmt"

var (
    example = []string{"golang", "hands-on", "in", "kagawa"}
)

func main() {
    var data []string
    data = example
    for _, v := range data {
        fmt.Println(v)

        if v == "in" {
            fmt.Println("○")
        } else {
            fmt.Println("×")
        }
    }
}
```


実行結果

```
golang
×
hands-on
×
in
○
kagawa
×
```

## 標準入出力

- 標準入力
```
fmt.Print("入力は？> ")
var ans string

fmt.Scanln(&ans)

// 変数名に&がついていないと値が書き変わらない
// fmt.Scanln(ans)

fmt.Printf("入力は %s です\n", ans)
```

- 関数の引数は「値を渡す」（引数の値をコピーする）方式になっている。
- 実変数の変数名の先頭に&をつけると、その変数の参照（ポインター）となる。
- Scanln()関数は、引数に入力された値を設定するので「参照を渡し」ている。


実行結果（fmt.Scanln()関数の変数名に&あり）

``
入力は？> Go
入力は Go です
```

実行結果（fmt.Scanln()関数の変数名に&なし）

```
入力は？> 入力は  です
```

## fmtパッケージ

- 標準出力、標準入力、標準エラーの関数が集約されている。

[link](https://golang.org/pkg/fmt/)

<img src='https://raw.githubusercontent.com/qt-luigi/talks/master/2018/go-intro-hands-on/img/fmt.png' width='300px'>

- Print系は主に標準出力

```
// 改行させる場合は、改行コードを含める。
fmt.Print("golang ")
fmt.Print("2018\n")

// 最後にf付きは、フォーマット形式。
fmt.Printf("%s %d\n", "golang", 2018)

// 最後にln付きは、文末に改行コードが付く。
fmt.Println("golang", "2018")

// 最初にF付きは、第1引数に出力先を指定（ここでは標準エラー）
fmt.Fprintln(os.Stderr, "golang", "2018")

// 最初にS付きは、文字列を返す
s := fmt.Sprintf("%s %d", "golang", 2018)
fmt.Println(s)
```

出力結果（上記全て）

```
golang 2018
```

- Scan系は標準入力で、Print系と同じような命名規則。
- 標準エラーは、Errorf()関数や一部のPrint系で対応。

fmtパッケージはGoのパッケージについて学び始めるのに最適かと！q@w@p

## 課題４ (04_stdio.go)

４−１：

03_if.goをコピーして04_stdio.goを作成してください。
以降は04_stdio.goを編集してください。

４−２：

main()関数のfor文内のfmt.Println(v)の後に、次の要件を満たす処理を追加してください。

１．入力プロンプトとして"input : "を標準出力に表示する。
２．標準入力を受け取る変数はstring型で変数名はansとする。
３．ループの値変数vの値が標準入力された値なら"○"を、それ以外なら"×"を標準出力に表示する。

