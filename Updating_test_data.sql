-- Дорабатываем тестовые данные
UPDATE autopart
SET article = FLOOR(1 + (RAND() * 500));
UPDATE autopart
SET autopart_category_id = FLOOR(1 + (RAND() * 10));
UPDATE autopart
SET manufacturer_id = FLOOR(1 + (RAND() * 100));
UPDATE autopart
SET car_year_id = FLOOR(1 + (RAND() * 100));
UPDATE autopart
SET price = FLOOR(50 + (RAND() * 100000));
UPDATE autopart
SET provider_id = FLOOR(1 + (RAND() * 5));
UPDATE orders
SET buyer_id = FLOOR(1 + (RAND() * 100));
UPDATE orders_autopart 
SET count_autopart = FLOOR(1 + (RAND() * 50));
UPDATE buyer_category
SET buyer_category = 'Физическое лицо'
WHERE id = 1;
UPDATE buyer_category
SET buyer_category = 'Юридическое лицо'
WHERE id = 2;
UPDATE buyers b
SET legal_person_name = NULL, inn = NULL, kpp = NULL, payment_account = NULL, bank = NULL, bic = NULL
WHERE buyer_category_id = 1;