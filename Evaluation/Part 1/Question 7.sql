USE evaluation_laferme;

DELIMITER $$
DROP FUNCTION IF EXISTS qtxPlantesConsommees $$

CREATE FUNCTION qtxPlantesConsommees(plante int(10), elevage INT(10)) RETURNS INT(10)
DETERMINISTIC
BEGIN
    DECLARE Qtx INT;
    SELECT sum(alimentation.qtx )INTO Qtx
    FROM alimentation 
    INNER JOIN animal ON alimentation.fkanimal = animal.idanimal
    INNER JOIN elevage ON elevage.fkanimal = animal.idanimal
    INNER JOIN plante ON alimentation.fkplante = plante.idplante
    WHERE plante.idplante = plante AND elevage.idelevage =elevage group by idplante;
    RETURN Qtx;
END $$
 
 SELECT qtxPlantesConsommees(2, '13')