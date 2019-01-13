DELIMITER $$
DROP TRIGGER IF EXISTS permutationTemperatures $$

CREATE TRIGGER permutationTemperatures
BEFORE INSERT ON temperature
FOR EACH ROW
BEGIN
	DECLARE temp FLOAT;
	IF NEW.temp_moy > NEW.temp_max THEN
		SET temp = NEW.temp_max, NEW.temp_max = NEW.temp_moy, NEW.temp_moy = temp;
	END IF;
END $$

DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS nouvellesMoyennes $$

CREATE TRIGGER nouvellesMoyennes
BEFORE INSERT ON temperature
FOR EACH ROW
BEGIN
	IF NEW.temp_moy = NEW.temp_max THEN
		SET NEW.temp_moy = (NEW.temp_min + NEW.temp_max)/2;
	END IF;
END $$

DELIMITER ;