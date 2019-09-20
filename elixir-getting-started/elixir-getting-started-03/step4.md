## データベースアクセスモジュールを作る

`util` ディレクトリを作ります

`mkdir -p ./lib/util`{{execute}}

モジュールを作ります

ファイル名: `./lib/util/db.ex`

`touch ./lib/util/db.ex`{{execute}}

<pre class="file" data-filename="/work/sample_db/lib/util/db.ex" data-target="replace">
defmodule Db do
  def query( sql ) when sql != "" do
    { :ok, result } = Ecto.Adapters.SQL.query( SampleDb.Repo, sql, [] )
    result
  end
  def columns_rows( result ) do
    result
    |> rows
    |> Enum.map( fn row -> Enum.into( List.zip( [ columns( result ), row ] ), %{} ) end )
  end
  def rows( %{ rows: rows } = _result ), do: rows
  def columns( %{ columns: columns } = _result ), do: columns
end
</pre>

## データを Web で表示する

ファイル名: `./lib/sample_db_web/templates/page/index.html.eex`

<pre class="file" data-filename="./lib/sample_db_web/templates/page/index.html.eex" data-target="replace">
&lt;%
result = Db.query( "select * from members" )
data = result |&gt; Db.columns_rows
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

Phoenix サーバを起動します

`iex -S mix phx.server`{{execute}}

ブラウザでアクセスして確認します

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

