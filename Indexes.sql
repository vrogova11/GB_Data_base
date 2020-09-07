-- Создаем индексы
SELECT * FROM autopart;
CREATE INDEX autopart_autopart_idx ON autopart(autopart);
CREATE INDEX autopart_article_idx ON autopart(article);
CREATE INDEX autopart_autopart_category_id_idx ON autopart(autopart_category_id);

SELECT * FROM orders;
CREATE INDEX orders_buyer_id_idx ON orders(buyer_id);

SELECT * FROM buyers;
CREATE UNIQUE INDEX buyers_email_uq ON buyers(email);
CREATE UNIQUE INDEX buyers_legal_person_name_idx ON buyers(legal_person_name);

SELECT * FROM provider;
CREATE INDEX provider_city_idx ON provider(city);
CREATE INDEX provider_provider_idx ON provider(provider);

SELECT * FROM car_brand;
CREATE INDEX car_brand_car_brand_idx ON car_brand (car_brand);

SELECT * FROM car_model;
CREATE INDEX car_model_car_model_idx ON car_model(car_model);

SELECT * FROM car_year;
CREATE INDEX car_yaer_idx ON car_year(car_year);

SELECT * FROM manufacturer;
CREATE INDEX manufacturer_manufacturer_idx ON manufacturer(manufacturer);




