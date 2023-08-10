-- creates a trigger that resets the valid_email attribute after the email has been changed
DELIMITER $$
CREATE TRIGGER reset_attribute
AFTER UPDATE ON users
FOR EACH ROW
	NEW.valid_email = 0$$
DELIMITER ;
