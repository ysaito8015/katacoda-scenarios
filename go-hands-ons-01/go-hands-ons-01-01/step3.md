## Katacoda Editor

簡易な機能をもったテキストエディタです

## ファイル作成

`work` ディレクトリ上で右クリックすることで, ファイル作成などのメニューが表示されます

<img src='https://i.gyazo.com/45591c31172fe82065b091c0bb6995f5.png'>

あるいは, 次のコマンドでもファイル画からのファイルが作成されます

`touch hello2.go`{{execute}}

## 入力

該当ファイルを, クリックで開いた後に

<img src='https://i.gyazo.com/36732319491cd2b4ebeeb1a9ef0e0356.png' width='255px'> ボタンをクリックすることでエディタ内にペーストされます

<pre class="file" data-filename="hello2.go" data-target="replace">
package main

import "fmt"

func main() {
    fmt.Println("hello, go")
}
</pre>

## Hello, Go

コマンドをターミナルへ入力し実行します

あるいは <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width='15px'> をクリックすると, 右下のターミナルでコマンドが実行されます

`go run ./hello2.go`{{execute}}

`go build ./hello2.go`{{execute}}

`./hello2`{{execute}}
