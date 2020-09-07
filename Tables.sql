-- ������ ��
CREATE DATABASE autodoc;

-- ������ � �������
USE autodoc;

-- ������� ��������� ����
CREATE TABLE car_�ategory (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  car_�ategory VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� ���������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "��������� �����������";

-- ������� ������� ����
CREATE TABLE car_brand (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  car_brand VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� ������",
  category_id INT UNSIGNED NOT NULL COMMENT "������ �� ��������� ����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "������ �����������";

-- ������� ������� ����
CREATE TABLE car_model (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  car_model VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� ������",
  brand_id INT UNSIGNED NOT NULL COMMENT "������ �� ����� ����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "������ �����������";

-- ������� ����� ������� ����
CREATE TABLE car_year (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  car_year YEAR NOT NULL COMMENT "��� �������",
  model_id INT UNSIGNED NOT NULL COMMENT "������ �� ������ ����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "���� ������� �����������";

-- ������� ��������� �������������
CREATE TABLE autopart_category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  autopart_category VARCHAR(150) NOT NULL COMMENT "�������� ��������� ������������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "��������� �������������";

-- ������� �������������
CREATE TABLE autopart (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  autopart VARCHAR(150) NOT NULL COMMENT "�������� ������������",
  car_year_id INT UNSIGNED NOT NULL COMMENT "������ �� ��� ������� ����",
  autopart_category_id INT UNSIGNED NOT NULL COMMENT "������ ��������� ������������",
  manufacturer_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������� ������������",
  article VARCHAR(150) NOT NULL COMMENT "�������",
  provider_id INT UNSIGNED NOT NULL COMMENT "������ �� ����������",
  price FLOAT UNSIGNED NOT NULL COMMENT "����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "������������";

-- ������� ��������������
CREATE TABLE manufacturer (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  manufacturer VARCHAR(150) NOT NULL COMMENT "�������� �������������",
  about_of TEXT NOT NULL COMMENT "���������� � �������������",
  adress VARCHAR(150) NOT NULL COMMENT "����� �������������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "�������������";

-- ������� �����������
CREATE TABLE provider (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  provider VARCHAR(150) NOT NULL COMMENT "�������� ����������",
  city VARCHAR(100) NOT NULL COMMENT "�����",
  about_of TEXT NOT NULL COMMENT "���������� � ����������",
  website VARCHAR(100) NOT NULL COMMENT "������� ����������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "����������";

-- ������� ��������� �����������
CREATE TABLE buyer_category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  buyer_category VARCHAR(100) NOT NULL COMMENT "�������� ��������� ������������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "��������� �������������";

-- ������� �����������
CREATE TABLE buyers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  buyer_category_id INT UNSIGNED NOT NULL COMMENT "������ �� ��������� ����������",
  first_name VARCHAR(100) NOT NULL COMMENT "��� ������������(���������� ����)",
  last_name VARCHAR(100) NOT NULL COMMENT "������� ������������(���������� ����)",
  email VARCHAR(100) NOT NULL COMMENT "�����(��)",
  phone VARCHAR(100) NOT NULL COMMENT "�������(��)",
  adress VARCHAR(150) NOT NULL COMMENT "�����",
  legal_person_name VARCHAR(150) COMMENT "������������ ������������ ����",
  inn VARCHAR(50) COMMENT "���(��)",
  kpp VARCHAR(50) COMMENT "���(��)",
  payment_account VARCHAR(50) COMMENT "�/�(��)",
  bank VARCHAR(150) COMMENT "����(��)",
  bic VARCHAR(50) COMMENT "���(��)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����������";  

-- ������� �������
CREATE TABLE orders (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  buyer_id INT UNSIGNED NOT NULL COMMENT "������ �� ����������",
  order_sum FLOAT UNSIGNED NOT NULL COMMENT "����� ������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������";  

-- ������� ����� ������� � �������������
CREATE TABLE orders_autopart (
  order_id INT UNSIGNED NOT NULL COMMENT "������ �� �����",
  autopart_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������",
  count_autopart INT UNSIGNED NOT NULL COMMENT "���-�� �������������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (order_id, autopart_id) COMMENT "��������� ��������� ����"
) COMMENT "������������, �������� � �����. ����� ����� ������� � ��������������";








