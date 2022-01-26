## 事前準備

このコースが始まると, Elixir 実行環境が構築され始めます

katacoda 環境: `ubuntu:2004`

Elixir 実行環境 docker `elixir:1.13.2'

`pwd; whoami; cat /etc/debian_version`{{execute}}

上記の <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px> をクリックすると, 右下のターミナルでコマンドが実行されます

作業ディレクトリの移動と, Phoenix 実行に必要なライブラリ (inotify-tools) のインストールを行います

`cd /work && ./setting_up.sh`{{execute}}

## 複数列のデータ

iex を起動します

`iex`{{execute}}

表形式のデータを作成します

`data = [
  %{ "name" => "enぺだーし", "age" => 49, "team" => "有限会社デライトシステムズ", "position" => "代表取締役、性能探求者" }, 
  %{ "name" => "ざっきー", "age" => 45, "team" => "公立大学法人 北九州市立大学", "position" => "准教授、カーネルハッカー" }, 
  %{ "name" => "つちろー", "age" => 34, "team" => "カラビナテクノロジー株式会社", "position" => "リードエンジニア、アプリマイスター" }, 
  %{ "name" => "ゆじかわ", "age" => 30, "team" => "カラビナテクノロジー株式会社", "position" => "リードエンジニア、グロースハッカー" }, 
  %{ "name" => "piacere", "age" => 43, "team" => "カラビナテクノロジー株式会社", "position" => "CTO、福岡Elixirプログラマ、重力プログラマ、技術顧問" }
]`{{execute}}

- `[..]` : リスト, 行の並び
- `%{..}` : マップ, キーと値のペア
- マップリスト : マップをリストで包んでいるので

## 複数列データから「列の抽出」

- `Enum.map()` : 列の抽出
- `Enum.map(fn(変数) -> 変数を含んだ処理 end)` 結果はリストで返ります

マップの特定列を指定する[ "～" ]を使って、複数行から、名前だけを抽出します

`data |> Enum.map( fn( record ) -> record[ "name" ] end )`{{execute}}

結果をマップリストで返るようにしてみます

`data |> Enum.map( fn( record ) -> %{ "name" => record[ "name" ] } end )`{{execute}}

他の列も抽出します

`data |> Enum.map( fn( record ) -> %{ "name" => record[ "name" ], "age" => record[ "age" ] } end )`{{execute}}

`for` を利用した場合の例

`for record <- data do
   %{ "name" => record[ "name" ], "age" => record[ "age" ] }
end`{{execute}}

注意点

- for中で変数代入しても次のループではその代入は消えてしまう
- Enum.map()のように、パイプを繋いで使えない


>>Q1: 確認 `data` から `age` のみを抽出し, マップリストで返すスクリプトを入力してください<<
=~= data |> Enum.map( fn( record ) -> %{ "age" => record[ "age" ] } end )

