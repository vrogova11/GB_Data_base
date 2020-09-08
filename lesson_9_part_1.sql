-- 1
SELECT * FROM shop.users;
SELECT * FROM sample.users;

INSERT INTO shop.users
SELECT * FROM sample.users;

DELETE FROM sample.users 
WHERE id = 1;

START TRANSACTION;
  INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
  DELETE FROM shop.users WHERE id = 1;
COMMIT;

SELECT * FROM shop.users;

-- 2
SELECT * FROM products p;
SELECT * FROM catalogs c;

CREATE OR REPLACE VIEW product AS
SELECT p.name product, c.name catalog FROM products AS p
JOIN catalogs AS c 
ON p.catalog_id = c.id;

-- 3
CREATE TABLE IF NOT EXISTS date_august
(id SERIAL PRIMARY KEY,
created_at DATE NOT NULL);

INSERT INTO date_august VALUES
(NULL, '2018-08-01'),
(NULL, '2018-08-04'),
(NULL, '2018-08-16'),
(NULL, '2018-08-17');

CREATE TEMPORARY TABLE last_days (
  day INT
);

INSERT INTO last_days VALUES
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT
  DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day,
  NOT ISNULL(da.created_at) AS order_exist
FROM
  last_days AS l
LEFT JOIN
  date_august AS da
ON
  DATE(DATE('2018-08-31') - INTERVAL l.day DAY) = da.created_at
ORDER BY
  day;
 
 -- 4
INSERT INTO date_august VALUES
(NULL, '2018-08-10'),
(NULL, '2018-08-26'),
(NULL, '2018-08-21'),
(NULL, '2018-08-03'),
(NULL, '2018-08-30'),
(NULL, '2018-08-22'),
(NULL, '2018-08-29'),
(NULL, '2018-08-19'),
(NULL, '2018-08-15');

DELETE
  date_august
FROM
  date_august
JOIN
 (SELECT
    created_at
  FROM
    date_august
  ORDER BY
    created_at DESC
  LIMIT 5, 1) AS delpst
ON
  date_august.created_at <= delpst.created_at;

SELECT * FROM date_august da ;







