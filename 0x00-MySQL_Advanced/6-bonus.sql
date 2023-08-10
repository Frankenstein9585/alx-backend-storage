-- creates a stored procedure that adds a new correction for a student
DELIMITER $$
CREATE PROCEDURE AddBonus(user_id INT, project_name VARCHAR(255), score FLOAT)
BEGIN
	IF NOT EXISTS (SELECT FROM projects WHERE name = project_name) THEN
		INSERT INTO projects VALUES (project_name);
	END IF;
	SET project_id = (SELECT id FROM projects WHERE name = project_name);
	UPDATE corrections
	SET corrections.score = score 
	WHERE corrections.user_id = user_id AND corrections.project_id = project_id;

END
DELIMITER ;
