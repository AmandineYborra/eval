SELECT DISTINCT  Ali.annee, Pl.nom AS Nom_Plantes, Ali.qtx, Ani.nom AS Nom_Animal, E.idelevage
FROM plante AS Pl
INNER JOIN alimentation AS Ali ON Pl.idplante = Ali.fkplante
INNER JOIN elevage AS E ON Ali.fkanimal = E.fkanimal
INNER JOIN animal AS Ani ON E.fkanimal = Ani.idanimal
ORDER BY Ali.annee;