-- ������� ��������� ������� � ����� ������� �� ��������� ���������� � ������  
SELECT cm.car_model, cy.car_year FROM car_�ategory cc
JOIN car_brand cb 
ON cc.id = cb.category_id
JOIN car_model cm 
ON cb.id = cm.brand_id 
JOIN car_year cy 
ON cm.id = cy.model_id
WHERE cc.car_�ategory = '��������' AND cb.car_brand = 'BMW';

-- ������� ��������� ������������� �� ���������� �� ����������: ���������, �����, ������, ��� �������.
SELECT a.autopart, a.article, (SELECT autopart_category FROM autopart_category ac WHERE ac.id = a.autopart_category_id) FROM autopart a
JOIN 
(SELECT cy.id FROM car_�ategory cc
JOIN car_brand cb 
ON cc.id = cb.category_id
JOIN car_model cm 
ON cb.id = cm.brand_id 
JOIN car_year cy 
ON cm.id = cy.model_id
WHERE cc.car_�ategory = '��������' AND cb.car_brand = 'BMW' AND cm.car_model = 'incidunt' AND cy.car_year = 2012) car_id
ON a.car_year_id  = car_id.id;

-- ������� email ������� �����������, ����������� ����� 2� �������
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









