## 一般ユーザで接続

`psql -d dvdrental`{{execute}}

## SELECT コマンド

`SELECT first_name FROM customer;`{{execute}}


`SELECT
  first_name,
  last_name,
  email
FROM
  customer;`{{execute}}

`SELECT * FROM customer;`{{execute}}

`SELECT
  first_name || ' ' || last_name,
  email
FROM
  customer;`{{execute}}

`SELECT 5 * 3;`{{execute}}
