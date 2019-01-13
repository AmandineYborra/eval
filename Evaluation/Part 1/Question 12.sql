-- ALTER TABLE culture ADD FOREIGN KEY (fkresponsable) REFERENCES employe(idemploye);
DELIMITER $$
create trigger poste_assigne BEFORE UPDATE ON culture FOR EACH ROW
BEGIN 
UPDATE culture SET idculture = 112 OR idculture =232 
WHERE culture.fkresponsable = employe.fkposte AND employe.fkposte = poste.idposte AND poste.nom = 11;
END$$

DELIMITER ;