## Katacoda Editor

簡易な機能をもったテキストエディタです

## ファイル作成

`work` ディレクトリ上で右クリックすることで, ファイル作成などのメニューが表示されます

<img src='https://i.gyazo.com/45591c31172fe82065b091c0bb6995f5.png'>

あるいは, 次のコマンドでもファイル画からのファイルが作成されます

`touch hello.go`{{execute}}

## Hello, World

<img src='https://i.gyazo.com/36732319491cd2b4ebeeb1a9ef0e0356.png' height='15px'> ボタンをクリックすることでエディタ内にペーストされます

<pre class="file" data-filename="hello.go" data-target="replace">
package main

import "fmt"

func main() {
    fmt.Println("hello, world")
}
</pre>

## Hello, World

コマンドをターミナルへ入力し実行します

あるいは <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width='15px'> をクリックすると, 右下のターミナルでコマンドが実行されます

`go run ./hello.go`{{execute}}

`go build ./hello.go`{{execute}}

`./hello`{{execute}}
