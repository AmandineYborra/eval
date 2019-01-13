SELECT annee, idelevage, an.nom AS Nom_Animal, quantite / capacite AS rendement, MIN(quantite / capacite) AS Rendement_Min, MAX(quantite / capacite) AS Rendement_Max, 
AVG(quantite / capacite) AS Rendement_Moyen, VARIANCE(quantite / capacite) AS Ecart_Type_Rendement
FROM productionviande
INNER JOIN elevage ON fkelevage = idelevage
INNER JOIN animal AS an ON fkanimal = an.idanimal
GROUP BY annee, idelevage
ORDER BY annee;