## 目標
master のコミットをまとめる

この操作は squash, コミットをまとめるなどと表現されます

### git config で git の動作を調整する

今回のシナリオでは, 動作しませんが, git のエディタを VSCode にすると, 便利です

`git config --global core.editor 'code --wait'`

今回のシナリオでは, vim というエディタを使います

`git config --global core.editor "vim"`{{execute}}

### master のコミットの状況を確認する

GitHub 上では, Commit のリンクをクリックすることで, 過去のコミットを見ることができます

<img src='https://i.gyazo.com/9fccfe72a8156d13ed81070fbe90ce03.png'>


`git status`{{execute}}

上記のコマンドで `master` ブランチにいることを確認します

### master のコミットログからまとめるコミットを検討する

`git log --oneline -n 11`{{execute}}

<img src='https://i.gyazo.com/c3132934679b88bfb0d04ca2f39c01a5.png'>

矢印の範囲のコミットをまとめます

### まとめるコミットの一つ手前のコミット ID を控える

<img src='https://i.gyazo.com/545f5897ce1d45279fad252509cf0891.png'>

<img src='https://i.gyazo.com/bf7f06026e4604a577249055aac8e001.png'>

`d989443`

### git rebase -i を実行する

`git rebase -i d989443`{{execute}}

### どのコミットにまとめるのかを編集する

<img src='https://i.gyazo.com/5ddf9ffed41ccd9fff78924e1057a7fc.png'>

- `pick` まとめるもととなるコミット指定
- `s`, or `squash` コミットを pick コミットにまとめる指定

- vim の操作
    - ノーマルモード
        - 保存や終了などのコマンド入力が可能
        - ノーマルモードへの移行, [ESC] キーを押す
        - 終了方法, [ESC] キーを押す. `:` キー, `q` キーを入力した後エンターを押す
        - 保存して終了, [ESC] キーを押す. `:wq` エンターを押す
        - h: (左移動), j: (下移動), k: (上移動), l: (右移動)
        - カーソル上の文字の削除 `x`
        - カーソル上の行全体を削除 `dd`
    - インサートモード
        - 文字を入力するインサートモードへの移行, `i` キーを入力
        - インサートモードから, ノーマルモードへの移行, [ESC] キーを入力

### コミットメッセージを編集する

<img src='https://i.gyazo.com/715bb54f8110b81b22647e9b6efa940d.png'>

まとめたコミットのコミットメッセージがすべて表示されます

ブランチ上にはそれぞれ残るので, 最後の 'finish review' 以外は削除します

`#` で始まる行は, コメントであり, コミットメッセージには影響しませんので, 編集の必要はありません

### git log で master のコミット状況を確認する

<img src='https://i.gyazo.com/611b91e263cb772e1cb1f341a46cff8d.png'>

まとめたコミットが一つになっていることを確認する

`git log --oneline -n 3`{{execute}}

`d989443` の ID のコミットの直後に 'finish rebiew' がメッセージとなるコミットが存在しています

### リモートリポジトリに反映させる

GitHub にあるリモートリポジトリのコミットログを変更するので, `--force` オプションが必要です

`git push --force origin master`
