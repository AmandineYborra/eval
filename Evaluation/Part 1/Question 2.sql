USE evaluation_laferme;

DROP TABLE IF EXISTS precipitations;
CREATE TABLE precipitations(
idprecipitations INT(10) AUTO_INCREMENT NOT NULL,
qtx_precipitations FLOAT,
saison ENUM ('hiver', 'printemps', 'été', 'automne'),
idterrain INT(10) UNSIGNED,
CONSTRAINT PRIMARY KEY PK (idprecipitations),
CONSTRAINT FK_idterrain_precipitations FOREIGN KEY (idterrain) REFERENCES terrain (idterrain)
);

DROP TABLE IF EXISTS temperature;
CREATE TABLE temperature(
idtemperature INT(10) AUTO_INCREMENT NOT NULL,
temp_min FLOAT,
temp_max FLOAT,
temp_moy FLOAT,
date_releve DATE,
idterrain INT(10) UNSIGNED,
CONSTRAINT PRIMARY KEY PK (idtemperature),
CONSTRAINT FK_idterrain_temperature FOREIGN KEY (idterrain) REFERENCES terrain (idterrain)
); 

ALTER TABLE terrain 
ADD idprecipitations INT(10),
ADD idtemperature INT(10),
ADD CONSTRAINT FK_idprecipitations_terrain FOREIGN KEY (idprecipitations) REFERENCES precipitations (idprecipitations),
ADD CONSTRAINT FK_idtemperature_terrain FOREIGN KEY (idtemperature) REFERENCES temperature (idtemperature);