SELECT annee, pl.nom AS Nom_Plante, MIN(rendement) AS Rendement_Min, MAX(rendement) AS Rendement_Max, AVG(rendement) AS Rendement_Moyen,
	VARIANCE(rendement) AS Ecart_Type_Rend
FROM culture
INNER JOIN plante AS pl ON fkplante = idplante
GROUP BY annee, pl.nom
ORDER BY annee;
