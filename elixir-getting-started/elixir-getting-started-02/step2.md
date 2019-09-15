## Phoenix のインストール

iex を起動している場合は, `CTRL C` を２回押して iex を終了してください

Web で表示するために Phoenix をインストールします

`mix archive.install hex phx_new`{{execute}}

いくつか, 質問が発生します

![](https://i.gyazo.com/9dd4fafce9c5054485d18cc305350075.png)

![](https://i.gyazo.com/1eec6421152364fb86a74223a71f334c.png)

アプリケーションを作成します

`cd /work && mix phx.new sample --no-webpack --no-ecto`{{execute}}

ここでも質問が発生します

![](https://i.gyazo.com/22daa0b4361e27940bd7c8fa1bce4b00.png)

作成したアプリケーションディレクトリに入ります

`cd /work/sample`{{execute}}

依存ライブラリをインストールします

`mix deps.get`{{execute}}

Phoenix サーバを立ち上げます

`iex -S mix phx.server`{{execute}}


ブラウザでアクセスして確認します

下記の URL もしくは, <img src='https://i.gyazo.com/9259b8ce25ee92b5ae817bab8032a7c5.png' width=100px'> をクリックして確認できます

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## Katacoda Editor

右上半分に エディタ画面が, 立ち上がっています

ディレクトリツリーをたどり, ファイル名をクリックすると, エディタ内に内容が表示されます

![](https://i.gyazo.com/f587cc8f79369d0096b14bd1e14921ee.png)

画面左柱の説明中にある各コード右上の <img src='https://i.gyazo.com/36732319491cd2b4ebeeb1a9ef0e0356.png' width=120px> をクリックすることで, 対象ファイルへ内容をコピーできます

save は自動的に行われます

## 複数列データのWeb表示

ファイル名: `./lib/sample_web/templates/page/index.html.eex`

<pre class="file" data-filename="/work/sample/lib/sample_web/templates/page/index.html.eex" data-target="replace">
&lt;%
data = 
[
  %{ "name" =&gt; "enぺだーし", "age" =&gt; 49, "team" =&gt; "有限会社デライトシステムズ", "position" =&gt; "代表取締役、性能探求者" }, 
  %{ "name" =&gt; "ざっきー", "age" =&gt; 45, "team" =&gt; "公立大学法人 北九州市立大学", "position" =&gt; "准教授、カーネルハッカー" }, 
  %{ "name" =&gt; "つちろー", "age" =&gt; 34, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "リードエンジニア、アプリマイスター" }, 
  %{ "name" =&gt; "ゆじかわ", "age" =&gt; 30, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "リードエンジニア、グロースハッカー" }, 
  %{ "name" =&gt; "piacere", "age" =&gt; 43, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "CTO、福岡Elixirプログラマ、重力プログラマ、技術顧問" }
]
%&gt;
&lt;table border="1"&gt;
&lt;%= for record &lt;- data do %&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;%= record[ "name" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "age" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "team" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "position" ] %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;% end %&gt;
&lt;/table&gt;
</pre>

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## Web上での複数列データの「フィルタ」

ファイル名: `./lib/sample_web/templates/page/index.html.eex`

<pre class="file" data-filename="/work/sample/lib/sample_web/templates/page/index.html.eex" data-target="replace">
&lt;%
data = 
[
  %{ "name" =&gt; "enぺだーし", "age" =&gt; 49, "team" =&gt; "有限会社デライトシステムズ", "position" =&gt; "代表取締役、性能探求者" }, 
  %{ "name" =&gt; "ざっきー", "age" =&gt; 45, "team" =&gt; "公立大学法人 北九州市立大学", "position" =&gt; "准教授、カーネルハッカー" }, 
  %{ "name" =&gt; "つちろー", "age" =&gt; 34, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "リードエンジニア、アプリマイスター" }, 
  %{ "name" =&gt; "ゆじかわ", "age" =&gt; 30, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "リードエンジニア、グロースハッカー" }, 
  %{ "name" =&gt; "piacere", "age" =&gt; 43, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "CTO、福岡Elixirプログラマ、重力プログラマ、技術顧問" }
]
|&gt; Enum.filter( fn( record ) -&gt; record[ "age" ] &gt;= 43 end )
%&gt;
&lt;table border="1"&gt;
&lt;%= for record &lt;- data do %&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;%= record[ "name" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "age" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "team" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "position" ] %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;% end %&gt;
&lt;/table&gt;
</pre>

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

## Web上での複数列データの「並べ替え」

ファイル名: `./lib/sample_web/templates/page/index.html.eex`

<pre class="file" data-filename="/work/sample/lib/sample_web/templates/page/index.html.eex" data-target="replace">
&lt;%
data = 
[
  %{ "name" =&gt; "enぺだーし", "age" =&gt; 49, "team" =&gt; "有限会社デライトシステムズ", "position" =&gt; "代表取締役、性能探求者" }, 
  %{ "name" =&gt; "ざっきー", "age" =&gt; 45, "team" =&gt; "公立大学法人 北九州市立大学", "position" =&gt; "准教授、カーネルハッカー" }, 
  %{ "name" =&gt; "つちろー", "age" =&gt; 34, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "リードエンジニア、アプリマイスター" }, 
  %{ "name" =&gt; "ゆじかわ", "age" =&gt; 30, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "リードエンジニア、グロースハッカー" }, 
  %{ "name" =&gt; "piacere", "age" =&gt; 43, "team" =&gt; "カラビナテクノロジー株式会社", "position" =&gt; "CTO、福岡Elixirプログラマ、重力プログラマ、技術顧問" }
]
|&gt; Enum.sort( fn( record_current, record_next ) -&gt; record_current[ "age" ] < record_next[ "age" ] end )
%&gt;
&lt;table border="1"&gt;
&lt;%= for record &lt;- data do %&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;%= record[ "name" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "age" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "team" ] %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%= record[ "position" ] %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;% end %&gt;
&lt;/table&gt;
</pre>

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

