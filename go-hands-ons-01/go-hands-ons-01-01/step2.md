## VScode の起動

VScode タブ <img src='https://i.gyazo.com/350be089607151e46301c852229dbd85.png'> をクリックすると, 別ウィンドウでVScode (code-server) が立ち上がります

<img src='https://i.gyazo.com/503fcce5d7d3cba5a093f01df53824bd.png'>

## Extension の導入
左柱の `Extensions` アイコンをクリックします

<img src='https://i.gyazo.com/65992b0de2d65862e38704949c817006.png'>

`go` を検索し, 表示される Extension をインストールします

`reload required` をクリックすることでインストールが完了します

## ファイル作成, 入力

リロード後の画面です

<img src='https://i.gyazo.com/35b6c15cfe13e76b1c6bc904e3780efd.png'>

`Open Folder` ボタンをクリックし, 作業フォルダ `/work` を入力し `OK` をクリックします

<img src='https://i.gyazo.com/6bc57ffd1a2783ae817df97dd4114e39.png'>

画面がリロードされます

新規ファイル作成のアイコンをクリックします

<img src='https://i.gyazo.com/4100f993c5465899406f66fc76532919.png'>

ファイル名を `hello.go` と入力します

入力直後の状態です

<img src='https://i.gyazo.com/3b17f8b9ccd000de3b518184d0b514c5.png'>

次のコードを入力します. `copy` ボタンを押すことでクリップボードにコピーされます

<pre class="file" data-target="clipboard">
package main

import "fmt"

func main() {
    fmt.Println("hello, world")
}
</pre>

入力直後の画面です

<img src='https://i.gyazo.com/b4408af1d1d7e4758fc0510e82a3eb8b.png'>

## Hello, World

最下段のアイコンをクリックすると, デバッグペインが表示されます

<img src='https://i.gyazo.com/9904a67a6d9d6ca0d9d3ede771fcc541.png'>

`Terminal` タブをクリックします

<img src='https://i.gyazo.com/6a37adbc0f1eb66ab66361c2a1bd31ab.png'>

先程のプログラムを実行するために, 次のコマンドをターミナルに入力します

<pre class="file" data-target="clipboard">
go run ./hello.go
</pre>

プログラムをビルドするために, 次のコマンドをターミナルに入力します

<pre class="file" data-target="clipboard">
go build ./hello.go
</pre>

ビルドされたプログラムを実行します

<pre class="file" data-target="clipboard">
./hello
</pre>

出力例です

<img src='https://i.gyazo.com/690c8bab00745592fe69294949dcdb95.png'>
