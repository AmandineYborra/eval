DELIMITER $$
DROP FUNCTION IF EXISTS augmenteRefTerrain $$

CREATE FUNCTION augmenteRefTerrain() RETURNS INT(10)
DETERMINISTIC
BEGIN
	UPDATE culture
	SET fkterrain = fkterrain + 25
	WHERE fkterrain < 26 ;
	RETURN fkterrain;
END $$

DELIMITER ;