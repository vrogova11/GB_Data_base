-- 1 �������
SELECT DISTINCT us.id, us.name, us.birthday_at 
FROM users us
JOIN orders o
ON us.id = o.user_id;

-- 2 �������
SELECT prod.id, prod.name, prod.desription, prod.price, cat.name 
FROM products prod
LEFT JOIN catalogs cat
ON prod.catalog_id = cat.id;

-- 3 �������
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_city VARCHAR(255) COMMENT '����� ������',
  to_city VARCHAR(255) COMMENT '����� �������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '�����';

INSERT INTO flights (from_city, to_city) VALUES
	('Moscow', 'Omsk'),
	('Novgorod', 'Kazan'),
	('Irkutsk', 'Moscow'),
	('Omsk', 'Irkutsk'),
	('Moscow', 'Kazan');

CREATE TABLE cities (
  label VARCHAR(255) COMMENT '���������� ��������',
  name VARCHAR(255) COMMENT '������� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������� �������';

INSERT INTO cities (label, name) VALUES
	('Moscow', '������'),
	('Irkutsk', '�������'),
	('Novgorod', '��������'),
	('Kazan', '������'),
	('Omsk', '����');

-- 1 ������ �������
SELECT (SELECT name FROM cities WHERE label = from_city) from_city, 
		(SELECT name FROM cities WHERE label = to_city) to_city 
	FROM flights;

-- 2 ������ �������
SELECT (SELECT DISTINCT ct.name FROM flights fl
        LEFT JOIN cities ct 
        ON ct.label = fl.from_city
        WHERE fl.from_city = flights.from_city) from_city, 
		(SELECT DISTINCT ct.name FROM flights fl
        LEFT JOIN cities ct 
        ON ct.label = fl.to_city
        WHERE fl.to_city = flights.to_city) to_city
	FROM flights;






