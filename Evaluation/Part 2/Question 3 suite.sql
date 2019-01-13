DELIMITER $$
DROP TRIGGER IF EXISTS nouvellesPrecipitations $$
CREATE TRIGGER nouvellesPrecipitations
BEFORE INSERT ON precipitations
FOR EACH ROW
BEGIN
	IF NEW.precipitation SELECT  COUNT(*) AS nbr_doublon, saison, annee, terrain, precipitation FROM precipitations 
		GROUP BY saison, annee, terrain, precipitation HAVING  count(*)>1 THEN
		SET NEW. = (NEW.temp_min + NEW.temp_max)/2;
	END IF;
END $$

DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS valeursHorsNomrmes $$

CREATE TRIGGER valeursHorsNomrmes
BEFORE INSERT ON precipitations
FOR EACH ROW
BEGIN
	IF 2300 < NEW.precipitaion < 5500 THEN
		IF NEW.saison = 'automne' THEN 
			SET NEW.precipitation = NEW.precipitation/10;
		END IF;
		IF NEW.saison = 'été' THEN
			SET NEW.precipitation = NEW.precipitation/100;
		END IF;
	END IF;
    IF NEW.precipitation > 5500 THEN
		SET NEW.precipitation = AVG(NEW.precipitation);
	END IF;
END $$

DELIMITER ;
