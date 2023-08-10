-- creates a stored procedure that adds a new correction for a student
DELIMITER $$
CREATE PROCEDURE AddBonus(user_id INT, project_name VARCHAR(255), score INT)
BEGIN
	IF NOT EXISTS (SELECT * FROM projects WHERE name = project_name) THEN
		INSERT INTO projects (name) VALUES (project_name);
	END IF;
	DECLARE project_id INT;
	SET project_id = (SELECT id FROM projects WHERE name = project_name);
	INSERT INTO corrections VALUES (user_id, project_id, score);

END$$
DELIMITER ;
