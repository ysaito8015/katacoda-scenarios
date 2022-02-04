## LIMIT clause

### LIMIT で行を制限する例

`
SELECT
  film_id,
  title,
  release_year
FROM
  film
ORDER BY
  film_id
LIMIT 5;
`{{execute}}

### LIMIT と OFFSET で行を制限しかつずらして表示する例

`
SELECT
  film_id,
  title,
  release_year
FROM
  film
ORDER BY
  film_id
LIMIT 4 OFFSET 3;
`{{execute}}

### LIMIT と ORDER BY を利用してトップ１０を表示する

`
SELECT
  film_id,
  title,
  rental_rate
FROM
  film
ORDER BY
  rental_rate DESC
LIMIT 10;
`{{execute}}
