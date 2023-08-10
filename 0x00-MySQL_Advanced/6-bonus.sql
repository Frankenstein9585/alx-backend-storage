-- creates a stored procedure that adds a new correction for a student
DELIMITER $$
CREATE PROCEDURE AddBonus(user_id INT, project_name VARCHAR(255), score FLOAT)
BEGIN
	IF NOT EXISTS (SELECT * FROM projects WHERE name = project_name) THEN
		INSERT INTO projects (name) VALUES (project_name);
	END IF;
	DECLARE project_id INT;
	SET project_id = (SELECT id FROM projects WHERE name = project_name);
	UPDATE corrections
	SET score = score 
	WHERE user_id = user_id AND project_id = project_id;

END$$
DELIMITER ;
