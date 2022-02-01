## 一般ユーザで接続

`psql -d dvdrental`{{execute}}

## SELECT コマンド

`SELECT first_name FROM customer;`{{execute}}

<pre>
SELECT
  first_name,
  last_name,
  email
FROM
  customer;
</pre>

`SELECT * FROM customer;`{{execute}}

<pre>
SELECT
  first_name || ' ' || last_name,
  email
FROM
  customer;
</pre>

`SELECT 5 * 3;`{{execute}}
