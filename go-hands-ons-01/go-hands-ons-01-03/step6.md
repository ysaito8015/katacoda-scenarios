## 解答４ (04_stdio.go)

```
package main

import "fmt"

// 例）1行1変数定義の書き方
var example = []string{"golang", "hands-on", "in", "kagawa"}

func main() {
    var data []string
    data = example
    for _, v := range data {
        fmt.Println(v)

        fmt.Print("input : ")
        var ans string
        fmt.Scanln(&ans)

        if v == ans {
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
input : golang
○
hands-on
input : hands-on
○
in
input : in
○
kagawa
input : okayama
×
```

## 実行バイナリーを作成

初期状態

`ls`{{execute}}

```
01_slice.go 02_for.go   03_if.go    04_stdio.go hello.go
```

`go build ファイル名`

`go build 04_stdio.go`{{execute}}

`ls`{{execute}}

```
01_slice.go 02_for.go   03_if.go    04_stdio    04_stdio.go hello.go
```

- ファイル名と同名の実行バイナリー「04_stdio」が生成される。

go build -o 実行バイナリー名 ファイル名

`go build -o typing 04_stdio.go `{{execute}}

`ls`{{execute}}

```
01_slice.go 02_for.go   03_if.go    04_stdio    04_stdio.go hello.go    typing
```

- 指定した名前の実行バイナリー「typing」が生成される。

* 完成！q@w@p

```
$ ./typing
golang
input : golang
○
hands-on
input : hands-on
○
in
input : in
○
kagawa
input : kagawa
○
```
