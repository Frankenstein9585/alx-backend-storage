-- creates a trigger that resets the valid_email attribute after the email has been changed
DELIMITER $$
CREATE TRIGGER reset_attribute
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF NEW.email != OLD.email THEN
		SET NEW.valid_email = 0$$
	END IF;
END$$
DELIMITER ;
