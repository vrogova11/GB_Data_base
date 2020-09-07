-- Триггер проверяет заполнены ли обязательные поля, для категории покупателя "Юридическое лицо", при вставке новой записи в таблицу buyers
-- В случае, если хотя бы одно из них не заполнено, выдает ошибку ввода.
DELIMITER //
CREATE TRIGGER TRIGGER `legal_person_insert` BEFORE INSERT ON `buyers` FOR EACH ROW BEGIN
  IF NEW.buyer_category_id = 2
  	AND (NEW.legal_person_name IS NULL OR NEW.inn IS NULL OR NEW.kpp IS NULL OR NEW.payment_account IS NULL OR NEW.bank IS NULL OR NEW.bic IS NULL) 
  	THEN
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = "Error adding buyers! Buyers table doesn't contain rows legal_person_name, inn, kpp, payment_account, bank, bic!";
  END IF;
END//

