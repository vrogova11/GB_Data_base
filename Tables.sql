-- Создаём БД
CREATE DATABASE autodoc;

-- Делаем её текущей
USE autodoc;

-- Таблица категорий авто
CREATE TABLE car_сategory (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  car_сategory VARCHAR(150) NOT NULL UNIQUE COMMENT "Название категории",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Категории автомобилей";

-- Таблица брендов авто
CREATE TABLE car_brand (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  car_brand VARCHAR(150) NOT NULL UNIQUE COMMENT "Название бренда",
  category_id INT UNSIGNED NOT NULL COMMENT "Ссылка на категорию авто",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Бренды автомобилей";

-- Таблица моделей авто
CREATE TABLE car_model (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  car_model VARCHAR(150) NOT NULL UNIQUE COMMENT "Название модели",
  brand_id INT UNSIGNED NOT NULL COMMENT "Ссылка на бренд авто",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Бренды автомобилей";

-- Таблица годов выпуска авто
CREATE TABLE car_year (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  car_year YEAR NOT NULL COMMENT "Год выпуска",
  model_id INT UNSIGNED NOT NULL COMMENT "Ссылка на модель авто",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Годы выпуска автомобилей";

-- Таблица категорий автозапчастей
CREATE TABLE autopart_category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  autopart_category VARCHAR(150) NOT NULL COMMENT "Название категории автозапчасти",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Категории автозапчастей";

-- Таблица автозапчастей
CREATE TABLE autopart (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  autopart VARCHAR(150) NOT NULL COMMENT "Название автозапчасти",
  car_year_id INT UNSIGNED NOT NULL COMMENT "Ссылка на год выпуска авто",
  autopart_category_id INT UNSIGNED NOT NULL COMMENT "Ссылка категорию автозапчасти",
  manufacturer_id INT UNSIGNED NOT NULL COMMENT "Ссылка на производителя автозапчасти",
  article VARCHAR(150) NOT NULL COMMENT "Артикул",
  provider_id INT UNSIGNED NOT NULL COMMENT "Ссылка на поставщика",
  price FLOAT UNSIGNED NOT NULL COMMENT "Цена",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Автозапчасти";

-- Таблица производителей
CREATE TABLE manufacturer (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  manufacturer VARCHAR(150) NOT NULL COMMENT "Название производителя",
  about_of TEXT NOT NULL COMMENT "Информация о производителе",
  adress VARCHAR(150) NOT NULL COMMENT "Адрес производителя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Производители";

-- Таблица поставщиков
CREATE TABLE provider (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  provider VARCHAR(150) NOT NULL COMMENT "Название поставщика",
  city VARCHAR(100) NOT NULL COMMENT "Город",
  about_of TEXT NOT NULL COMMENT "Информация о поставщике",
  website VARCHAR(100) NOT NULL COMMENT "Вебсайт поставщика",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Поставщики";

-- Таблица категорий покупателей
CREATE TABLE buyer_category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  buyer_category VARCHAR(100) NOT NULL COMMENT "Название категории пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Категории пользователей";

-- Таблица покупателей
CREATE TABLE buyers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  buyer_category_id INT UNSIGNED NOT NULL COMMENT "Ссылка на категорию покупателя",
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя(контактное лицо)",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя(контактное лицо)",
  email VARCHAR(100) NOT NULL COMMENT "Почта(КЛ)",
  phone VARCHAR(100) NOT NULL COMMENT "Телефон(КЛ)",
  adress VARCHAR(150) NOT NULL COMMENT "Адрес",
  legal_person_name VARCHAR(150) COMMENT "Наименование юридического лица",
  inn VARCHAR(50) COMMENT "ИНН(ЮЛ)",
  kpp VARCHAR(50) COMMENT "КПП(ЮЛ)",
  payment_account VARCHAR(50) COMMENT "Р/с(ЮЛ)",
  bank VARCHAR(150) COMMENT "Банк(ЮЛ)",
  bic VARCHAR(50) COMMENT "БИК(ЮЛ)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Покупатели";  

-- Таблица заказов
CREATE TABLE orders (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  buyer_id INT UNSIGNED NOT NULL COMMENT "Ссылка на покупателя",
  order_sum FLOAT UNSIGNED NOT NULL COMMENT "Сумма заказа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Заказы";  

-- Таблица связи заказов и автозапчастей
CREATE TABLE orders_autopart (
  order_id INT UNSIGNED NOT NULL COMMENT "Ссылка на заказ",
  autopart_id INT UNSIGNED NOT NULL COMMENT "Ссылка на автозапчасть",
  count_autopart INT UNSIGNED NOT NULL COMMENT "Кол-во автозапчастей",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (order_id, autopart_id) COMMENT "Составной первичный ключ"
) COMMENT "Автозапчасти, вошедшие в заказ. Связь между заказом и автозапчастями";








