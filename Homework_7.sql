-- 1 задание
SELECT DISTINCT us.id, us.name, us.birthday_at 
FROM users us
JOIN orders o
ON us.id = o.user_id;

-- 2 задание
SELECT prod.id, prod.name, prod.desription, prod.price, cat.name 
FROM products prod
LEFT JOIN catalogs cat
ON prod.catalog_id = cat.id;

-- 3 задание
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_city VARCHAR(255) COMMENT 'Город вылета',
  to_city VARCHAR(255) COMMENT 'Город прилета',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Рейсы';

INSERT INTO flights (from_city, to_city) VALUES
	('Moscow', 'Omsk'),
	('Novgorod', 'Kazan'),
	('Irkutsk', 'Moscow'),
	('Omsk', 'Irkutsk'),
	('Moscow', 'Kazan');

CREATE TABLE cities (
  label VARCHAR(255) COMMENT 'Английское название',
  name VARCHAR(255) COMMENT 'Русское название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Словарь городов';

INSERT INTO cities (label, name) VALUES
	('Moscow', 'Москва'),
	('Irkutsk', 'Иркутск'),
	('Novgorod', 'Новгород'),
	('Kazan', 'Казань'),
	('Omsk', 'Омск');

-- 1 способ решения
SELECT (SELECT name FROM cities WHERE label = from_city) from_city, 
		(SELECT name FROM cities WHERE label = to_city) to_city 
	FROM flights;

-- 2 способ решения
SELECT (SELECT DISTINCT ct.name FROM flights fl
        LEFT JOIN cities ct 
        ON ct.label = fl.from_city
        WHERE fl.from_city = flights.from_city) from_city, 
		(SELECT DISTINCT ct.name FROM flights fl
        LEFT JOIN cities ct 
        ON ct.label = fl.to_city
        WHERE fl.to_city = flights.to_city) to_city
	FROM flights;






