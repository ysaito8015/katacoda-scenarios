## DISTINCT を使った SELECT
- 重複した行をひとつにまとめる

`
 CREATE TABLE distinct_demo (
   id serial NOT NULL PRIMARY KEY,
   bcolor VARCHAR,
   fcolor VARCHAR
 );
`{{execute}]
 
`
 INSERT INTO
   distinct_demo (bcolor, fcolor)
 VALUES
   ('red', 'red'),
   ('red', 'red'),
   ('red', NULL),
   (NULL, 'red'),
   ('red', 'green'),
   ('red', 'blue'),
   ('green', 'red'),
   ('green', 'blue'),
   ('green', 'green'),
   ('blue', 'red'),
   ('blue', 'green'),
   ('blue', 'bule');
`{{execute}]

`
 SELECT
   id,
   bcolor,
   fcolor
 FROM
   distinct_demo;
`{{execute}]
 
`
 SELECT
   DISTINCT bcolor
 FROM
   distinct_demo
 ORDER BY
   bcolor;
`{{execute}]

`
 SELECT
   DISTINCT bcolor,
   fcolor
 FROM
   distinct_demo
 ORDER BY
   bcolor,
   fcolor;
`{{execute}]

`
 SELECT
   DISTINCT ON (bcolor) bcolor,
   fcolor
 FROM
   distinct_demo
 ORDER BY
   bcolor,
   fcolor;
`{{execute}]
