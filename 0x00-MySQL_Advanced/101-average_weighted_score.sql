-- creates a stored procedure that calculates the average  weighted score for a student 
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
	UPDATE users u
	SET average_score = (SELECT SUM(c.score * p.weight) / SUM(p.weight) 
		AS average_score FROM corrections c JOIN projects p ON p.id = c.project_id
		WHERE c.user_id = u.id);
END$$
DELIMITER ;
