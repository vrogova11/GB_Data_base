-- 1 ������� 
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT '������������� ������',
  first_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '��� ������������',
  last_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '������� ������������',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����� �������� ������',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����� ���������� ������',
  PRIMARY KEY (id)
) COMMENT='������������';

INSERT INTO 
	users (first_name, last_name, created_at, updated_at)
VALUES 
	('����', '�������', NULL, NULL),
	('����', '�������', NULL, NULL),
	('�����', '�������', NULL, NULL),
	('�����', '������', NULL, NULL);

SELECT * FROM users;

UPDATE users
SET 
	created_at = NOW(),
	updated_at = NOW();

-- 2 ������� 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT '������������� ������',
  first_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '��� ������������',
  last_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '������� ������������',
  created_at varchar(100) COMMENT '����� �������� ������',
  updated_at varchar(100) COMMENT '����� ���������� ������',
  PRIMARY KEY (id)
) COMMENT='������������';

INSERT INTO 
	users (first_name, last_name, created_at, updated_at)
VALUES 
	('����', '�������', '04.08.2000 14:05', '04.08.2000 15:50'),
	('����', '�������', '24.10.2010 17:05', '15.11.2011 22:10'),
	('�����', '�������', '01.03.2014 10:37', '04.09.2015 14:05'),
	('�����', '������', '25.07.2018 11:45', '19.02.2019 18:48');

SELECT * FROM users;

SELECT created_at, str_to_date(created_at, '%d.%m.%Y %k:%i') FROM users;

UPDATE 
	users 
SET
	created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
	updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

-- 3 �������
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id int unsigned NOT NULL AUTO_INCREMENT COMMENT '������������� ������',
	value int unsigned COMMENT '���-�� ������',
	PRIMARY KEY (id)
) COMMENT='C���� �������';

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

-- 4 �������
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT '������������� ������',
  first_name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '��� ������������',
  birthday date COMMENT '���� ��������',
  created_at varchar(100) COMMENT '����� �������� ������',
  updated_at varchar(100) COMMENT '����� ���������� ������',
  PRIMARY KEY (id)
) COMMENT='������������';

INSERT INTO 
	users (first_name, birthday, created_at, updated_at)
VALUES 
	('����', '1963-05-04', '04.08.2000 14:05', '04.08.2000 15:50'),
	('����', '1952-04-15', '24.10.2010 17:05', '15.11.2011 22:10'),
	('�����', '1961-09-25', '01.03.2014 10:37', '04.09.2015 14:05'),
	('�����', '1990-08-12', '25.07.2018 11:45', '19.02.2019 18:48'),
	('�����', '1995-05-21', '25.07.2018 11:45', '19.02.2019 18:48');

SELECT * FROM users
WHERE DATE_FORMAT(birthday, '%M') in ('may', 'august');

-- 5 �������
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT '������������� ������',
  name varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '��� ��������',
  created_at varchar(100) COMMENT '����� �������� ������',
  updated_at varchar(100) COMMENT '����� ���������� ������',
  PRIMARY KEY (id)
) COMMENT='��������';

INSERT INTO 
	catalogs (name, created_at, updated_at)
VALUES 
	('������', '04.08.2000 14:05', '04.08.2000 15:50'),
	('��������', '24.10.2010 17:05', '15.11.2011 22:10'),
	('����������', '01.03.2014 10:37', '04.09.2015 14:05'),
	('�������', '25.07.2018 11:45', '19.02.2019 18:48'),
	('���������', '25.07.2018 11:45', '19.02.2019 18:48');

SELECT * FROM catalogs 
WHERE id in (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);

-- ��������� ������
-- 1 �������
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS age FROM users;

-- 2 �������
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday), DAY(birthday))),'%W') AS day, count(*) FROM users
GROUP BY day
ORDER BY count(*), day;

-- 3 �������
SELECT EXP(SUM(LN(id))) FROM users;

	






