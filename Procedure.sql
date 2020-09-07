-- Процедура считает общую сумму одного заказа
DELIMITER //
CREATE PROCEDURE sum_order(IN id_order INT)
BEGIN
  DECLARE id, sum_order INT(6) DEFAULT 0;
  SET @sum_order = (SELECT SUM(oa.count_autopart * a.price) price FROM orders o 
JOIN orders_autopart oa 
ON o.id = oa.order_id 
JOIN autopart a 
ON oa.autopart_id = a.id
WHERE o.id = id_order
GROUP BY o.id);
END //

DELIMITER ;
CALL sum_order(1);
SELECT @sum_order;