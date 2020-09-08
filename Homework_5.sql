-- 1 задание 
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  first_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  last_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id)
) COMMENT='Пользователи';

INSERT INTO 
	users (first_name, last_name, created_at, updated_at)
VALUES 
	('Иван', 'Давыдов', NULL, NULL),
	('Илья', 'Абрамов', NULL, NULL),
	('Павел', 'Астахов', NULL, NULL),
	('Дарья', 'Рыжова', NULL, NULL);

SELECT * FROM users;

UPDATE users
SET 
	created_at = NOW(),
	updated_at = NOW();

-- 2 задание 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  first_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  last_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  created_at varchar(100) COMMENT 'Время создания строки',
  updated_at varchar(100) COMMENT 'Время обновления строки',
  PRIMARY KEY (id)
) COMMENT='Пользователи';

INSERT INTO 
	users (first_name, last_name, created_at, updated_at)
VALUES 
	('Иван', 'Давыдов', '04.08.2000 14:05', '04.08.2000 15:50'),
	('Илья', 'Абрамов', '24.10.2010 17:05', '15.11.2011 22:10'),
	('Павел', 'Астахов', '01.03.2014 10:37', '04.09.2015 14:05'),
	('Дарья', 'Рыжова', '25.07.2018 11:45', '19.02.2019 18:48');

SELECT * FROM users;

SELECT created_at, str_to_date(created_at, '%d.%m.%Y %k:%i') FROM users;

UPDATE 
	users 
SET
	created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
	updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

-- 3 задание
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
	value int unsigned COMMENT 'Кол-во товара',
	PRIMARY KEY (id)
) COMMENT='Cклад товаров';

INSERT INTO 
	storehouses_products (value)
VALUES 
	(0),
	(2600),
	(1500),
	(842),
	(0),
	(0),
	(2541),
	(25);

SELECT * FROM storehouses_products
ORDER BY if(value>0, 0, 1), value;

-- 4 задание
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  first_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  birthday date COMMENT 'Дата рождения',
  created_at varchar(100) COMMENT 'Время создания строки',
  updated_at varchar(100) COMMENT 'Время обновления строки',
  PRIMARY KEY (id)
) COMMENT='Пользователи';

INSERT INTO 
	users (first_name, birthday, created_at, updated_at)
VALUES 
	('Иван', '1963-05-04', '04.08.2000 14:05', '04.08.2000 15:50'),
	('Илья', '1952-04-15', '24.10.2010 17:05', '15.11.2011 22:10'),
	('Павел', '1961-09-25', '01.03.2014 10:37', '04.09.2015 14:05'),
	('Дарья', '1990-08-12', '25.07.2018 11:45', '19.02.2019 18:48'),
	('Мария', '1995-05-21', '25.07.2018 11:45', '19.02.2019 18:48');

SELECT * FROM users
WHERE DATE_FORMAT(birthday, '%M') in ('may', 'august');

-- 5 задание
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя каталога',
  created_at varchar(100) COMMENT 'Время создания строки',
  updated_at varchar(100) COMMENT 'Время обновления строки',
  PRIMARY KEY (id)
) COMMENT='Каталоги';

INSERT INTO 
	catalogs (name, created_at, updated_at)
VALUES 
	('Товары', '04.08.2000 14:05', '04.08.2000 15:50'),
	('Телефоны', '24.10.2010 17:05', '15.11.2011 22:10'),
	('Поставщики', '01.03.2014 10:37', '04.09.2015 14:05'),
	('Посылки', '25.07.2018 11:45', '19.02.2019 18:48'),
	('Владельцы', '25.07.2018 11:45', '19.02.2019 18:48');

SELECT * FROM catalogs 
WHERE id in (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);

-- Агрегация данных
-- 1 задание
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS age FROM users;

-- 2 задание
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday), DAY(birthday))),'%W') AS day, count(*) FROM users
GROUP BY day
ORDER BY count(*), day;

-- 3 задание
SELECT EXP(SUM(LN(id))) FROM users;

	






