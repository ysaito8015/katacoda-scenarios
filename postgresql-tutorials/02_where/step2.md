## Where 句

- "FROM" -> "WHERE" -> "SELECT" -> "ORDER BY"


| 演算子     | 詳細                                                           |
| :--------: | :------------------------------------------------------------- |
| =          | 等しい                                                         |
| >          | より大きい                                                     |
| <          | 未満                                                           |
| >=         | 以上                                                           |
| <=         | 以下                                                           |
| <> , !=    | と等しくない                                                   |
| AND        | 論理演算子としての AND                                         |
| OR         | 論理演算子としての OR                                          |
| IN         | 与えられた値がリストにある場合に true を返す                   |
| BETWEEN    | 与えられた値が, 指定した値と値の間にある場合に true を返す     |
| LIKE       | 与えられた値が, 指定したパターンにマッチした場合に true を返す |
| IS NULL    | 与えられた値が, NULL の場合に true を返す                      |
| NOT        | 他の演算子の結果を否定する                                     |


### = 演算子の例

`
SELECT
  last_name,
  first_name
FROM
  customer
WHERE
  first_name = 'Jamie';
`{{execute}}

### AND 演算子の例

`
SELECT
  last_name,
  first_name
FROM
  customer
WHERE
  first_name = 'Jamie' AND
  last_name = 'Rice';
`{{execute}}


### OR 演算子の例

`
SELECT
  first_name,
  last_name
FROM
  customer
WHERE
  last_name = 'Rodriguez' OR
  first_name = 'Adam';
`{{execute}}

### In 演算子の例

`
SELECT
  first_name,
  last_name
FROM
  customer
WHERE
  first_name IN ('Ann', 'Anne', 'Annie');
`{{execute}}

### LIKE 演算子の例

`
SELECT
  first_name,
  last_name
FROM
  customer
WHERE
  first_name LIKE 'Ann%';
`{{execute}}

### BETWEEN 演算子の例

`
SELECT
  first_name,
  LENGTH(first_name) name_length
FROM
  customer
WHERE
  first_name LIKE 'A%' AND
  LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
  name_length;
`{{execute}}

### <> 演算子の例

`
SELECT
  first_name,
  last_name
FROM
  customer
WHERE
  first_name LIKE 'Bra%' AND
  last_name <> 'Motlery';
`{{execute}}
