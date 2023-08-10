-- creates a stored procedure that calculates the average  weighted score for a student 
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	UPDATE users
	SET average_score = (SELECT SUM(c.score * p.weight) / SUM(p.weight) 
		AS average_score FROM corrections c JOIN projects p ON p.id = c.project_id WHERE c.user_id = user_id)
	WHERE users.id = user_id;
END$$
DELIMITER ;
