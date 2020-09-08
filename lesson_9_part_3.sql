-- 1
DELIMITER //

CREATE FUNCTION hello ()
RETURNS TINYTEXT NO SQL
BEGIN
  DECLARE hour INT;
  SET hour = HOUR(NOW());
  CASE
    WHEN hour BETWEEN 0 AND 5 THEN
      RETURN "Äîáðîé íî÷è";
    WHEN hour BETWEEN 6 AND 11 THEN
      RETURN "Äîáðîå óòðî";
    WHEN hour BETWEEN 12 AND 17 THEN
      RETURN "Äîáðûé äåíü";
    WHEN hour BETWEEN 18 AND 23 THEN
      RETURN "Äîáðûé âå÷åð";
  END CASE;
END//

DELIMITER ;
SELECT NOW(), hello ();

-- 2

DELIMITER //

CREATE TRIGGER validate_name_description_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF NEW.name IS NULL AND NEW.desñription IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and description are NULL';
  END IF;
END//

INSERT INTO products
  (name, desñription, price, catalog_id)
VALUES
  (NULL, NULL, 9360.00, 2)//

INSERT INTO products
  (name, desñription, price, catalog_id)
VALUES
  ('ASUS PRIME Z370-P', 'HDMI, SATA3, PCI Express 3.0,, USB 3.1', 9360.00, 2)//

INSERT INTO products
  (name, desñription, price, catalog_id)
VALUES
  (NULL, 'HDMI, SATA3, PCI Express 3.0,, USB 3.1', 9360.00, 2)//

CREATE TRIGGER validate_name_description_update BEFORE UPDATE ON products
FOR EACH ROW BEGIN
  IF NEW.name IS NULL AND NEW.desñription IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and description are NULL';
  END IF;
END//