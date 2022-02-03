## Column Aliases

`
SELECT
  first_name,
  last_name
FROM
  customer;
`{{execute}}

`
SELECT
  first_name,
  last_name AS surname
FROM
  customer;
`{{execute}}

`
SELECT
  first_name,
  last_name surname
FROM
  customer;
`{{execute}}


`
SELECT
  first_name || ' ' || last_name
FROM
  customer;
`{{execute}}

`
SELECT
  first_name || ' ' || last_name AS full_name
FROM
  customer;
`{{execute}}

`
SELECT
  first_name || ' ' || last_name "full name"
FROM
  customer;
`{{execute}}
