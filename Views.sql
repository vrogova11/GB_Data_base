-- �������������, ��������������� ������ � ������ id, ����� � ������� ����������� � ���������� "���������� ����"
CREATE VIEW physical_persons AS 
SELECT b.id, b.first_name, b.last_name, b.email FROM buyers b
JOIN buyer_category bc
WHERE b.buyer_category_id = bc.id 
AND bc.buyer_category = '���������� ����';

-- �������������, ��������������� ������ � ������ id, ����� � ������� ���������� ����, ������������ ������
-- ����������� � ���������� "����������� ����"
CREATE VIEW legal_persons AS
SELECT b.id, b.first_name, b.last_name, b.legal_person_name, b.email FROM buyers b
JOIN buyer_category bc
WHERE b.buyer_category_id = bc.id 
AND bc.buyer_category = '����������� ����';

-- �������������, ��������������� ������ � ��������� �� ������������(�����, ������, ��� �������, 
-- �������� ������������, �������������, ����)
CREATE VIEW about_autopart AS
SELECT cb.car_brand, cm.car_model, cy.car_year, a.autopart, m.manufacturer, a.price FROM autopart a
JOIN car_year cy 
ON a.car_year_id = cy.id 
JOIN autopart_category ac 
ON a.autopart_category_id = ac.id 
JOIN car_model cm 
ON cm.id = cy.model_id 
JOIN car_brand cb
ON cb.id = cm.brand_id 
JOIN manufacturer m 
ON m.id = a.manufacturer_id
ORDER BY cb.car_brand, cy.car_year;

