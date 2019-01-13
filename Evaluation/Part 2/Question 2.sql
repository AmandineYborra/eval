LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/evaluation/pluie.csv' 
INTO TABLE precipitations
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(saison, @var2, @var1, @var3)
SET terrain = IF(@var1 = 'soixante sept', 67,
				IF(@var1 = 'dix sept', 17,
				IF(@var1 = 'treize', 13,
				IF(@var1 = 'vingt cinq', 25,
				IF(@var1 = 'trente trois', 33,
				IF(@var1 = 'quarante sept', 47,
				IF(@var1 = 'quinze', 15,
				IF(@var1 = 'quarante quatre', 44,
				IF(@var1 = 'quarante et un', 41,
				IF(@var1 = 'quatre vingt', 80,
				IF(@var1 = 'soixante neuf', 69,
				@var1
				))))))))))),
annee = STR_TO_DATE(@var2, "%y"),
precipitation = nullif(@var3, 0);