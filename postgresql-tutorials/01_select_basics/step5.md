## ORDER BY による並べ替え
- 昇順

`
SELECT
  first_name,
  last_name
FROM
  customer
ORDER BY
  first_name ASC;
`{{execute}}

`
SELECT
  first_name,
  last_name
FROM
  customer
ORDER BY
  first_name;
`{{execute}}

- 降順

`
SELECT
  first_name,
  last_name
FROM
  customer
ORDER BY
  last_name DESC;
`{{execute}}

`
SELECT
  first_name,
  last_name
FROM
  customer
ORDER BY
  first_name ASC,
  last_name DESC;
`{{execute}}

`
SELECT
  first_name,
  LENGTH(first_name) len
FROM
  customer
ORDER BY
  len DESC;
`{{execute}}

## NULL を含む列への ORDER BY

`
CREATE TABLE sort_demo(
  num INT
);
`{{execute}}

`
INSERT INTO sort_demo(num)
VALUES
  (1), (2), (3), (null);
`{{execute}}

`
SELECT
  num
FROM
  sort_demo
ORDER BY
  num;
`{{execute}}

`
SELECT
  num
FROM
  sort_demo
ORDER BY
  num NULLS LAST;
`{{execute}}

`
SELECT
  num
FROM
  sort_demo
ORDER BY
  num NULLS FIRST;
`{{execute}}

`
SELECT
  num
FROM
  sort_demo
ORDER BY
  num DESC;
`{{execute}}

`
SELECT
  num
FROM
  sort_demo
ORDER BY
  num DESC NULLS LAST;
`{{execute}}
