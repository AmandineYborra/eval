SELECT c.annee, typT.nom AS Nom_Typ, ter.idterrain, ter.surface, pl.nom AS Nom_Plante, MIN(c.rendement) AS Rendement_Min, MAX(c.rendement) AS Rendement_Max, AVG(c.rendement) AS Rendement_Moyen,
	VARIANCE(c.rendement) AS Ecart_Type_Rend
FROM type_terre AS typT
INNER JOIN terrain AS ter ON typT.idtype_terre = ter.fktype_terre
INNER JOIN culture AS c ON ter.idterrain = c.fkterrain
INNER JOIN plante AS pl ON c.fkplante = pl.idplante
GROUP BY typT.nom, pl.nom
ORDER BY annee;