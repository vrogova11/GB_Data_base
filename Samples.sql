-- выборка имеющихся моделей и годов выпуска по категории автомобиля и бренду  
SELECT cm.car_model, cy.car_year FROM car_сategory cc
JOIN car_brand cb 
ON cc.id = cb.category_id
JOIN car_model cm 
ON cb.id = cm.brand_id 
JOIN car_year cy 
ON cm.id = cy.model_id
WHERE cc.car_сategory = 'Легковые' AND cb.car_brand = 'BMW';

-- выборка имеющихся автозапчастей на автомобиль по параметрам: категория, бренд, модель, год выпуска.
SELECT a.autopart, a.article, (SELECT autopart_category FROM autopart_category ac WHERE ac.id = a.autopart_category_id) FROM autopart a
JOIN 
(SELECT cy.id FROM car_сategory cc
JOIN car_brand cb 
ON cc.id = cb.category_id
JOIN car_model cm 
ON cb.id = cm.brand_id 
JOIN car_year cy 
ON cm.id = cy.model_id
WHERE cc.car_сategory = 'Легковые' AND cb.car_brand = 'BMW' AND cm.car_model = 'incidunt' AND cy.car_year = 2012) car_id
ON a.car_year_id  = car_id.id;

-- выборка email адресов покупателей, совершивших более 2х заказов
SELECT b.email, COUNT(DISTINCT o.id) total FROM orders o
LEFT JOIN buyers b
ON o.buyer_id = b.id
LEFT JOIN orders_autopart oa 
ON o.id = oa.order_id 
LEFT JOIN autopart a 
ON oa.autopart_id = a.id
GROUP BY b.id
HAVING COUNT(DISTINCT o.id) > 2 
ORDER BY email;









