## 成果物の確認

このコースが始まると同時に `go` のインストールが行われます

katacoda 環境: `ubuntu1904`

`pwd; whoami; cat /etc/lsb-release`{{execute}}

上記の <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px> をクリックすると, 右下のターミナルでコマンドが実行されます

成果物を実行します

`go run ./typing.go`{{execute}}

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
* 基本仕様

表示する単語をスライス（配列）で用意します。

```
  [ "golang", "hands-on", "in", "kagawa" ]
```

以下、スライスの要素の数だけ、添字の順番に繰り返します。

1. 単語を一つ表示します。

```
  golang
```

2. 単語を入力します。

```
  input : golang
```

3. 表示した単語と入力した単語が一致なら○を、不一致なら×を表示します。

```
  ○
```
