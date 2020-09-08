-- ƒобавл€ем внешние ключи
-- таблица car_brand
ALTER TABLE car_brand 
  ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES car_category (id);
-- таблица car_model
ALTER TABLE car_model 
  ADD CONSTRAINT brand_id_fk FOREIGN KEY (brand_id) REFERENCES car_brand (id);
-- таблица car_brand
ALTER TABLE car_year
  ADD CONSTRAINT model_id_fk FOREIGN KEY (model_id) REFERENCES car_model (id);
 -- таблица autopart
ALTER TABLE autopart
  ADD CONSTRAINT autopart_category_id_fk FOREIGN KEY (autopart_category_id) REFERENCES autopart_category (id);
ALTER TABLE autopart
  ADD CONSTRAINT car_year_id_fk FOREIGN KEY (car_year_id) REFERENCES car_year (id);
ALTER TABLE autopart
  ADD CONSTRAINT manufacturer_id_fk FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (id); 
ALTER TABLE autopart
  ADD CONSTRAINT provider_id_fk FOREIGN KEY (provider_id) REFERENCES provider (id); 
 -- таблица buyers
ALTER TABLE buyers
  ADD CONSTRAINT buyer_category_id_fk FOREIGN KEY (buyer_category_id) REFERENCES buyer_category (id);
  -- таблица orders
ALTER TABLE orders
  ADD CONSTRAINT buyer_id_fk FOREIGN KEY (buyer_id) REFERENCES buyers (id);
  -- таблица orders_autopart
ALTER TABLE orders_autopart
  ADD CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES orders (id);
ALTER TABLE orders_autopart
  ADD CONSTRAINT autopart_id_fk FOREIGN KEY (autopart_id) REFERENCES autopart (id);
