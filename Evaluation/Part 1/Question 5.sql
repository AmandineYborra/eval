SELECT quantite / capacite AS rendement, idanimal, nom  
FROM productionviande AS P
INNER JOIN elevage AS E ON P.fkelevage = E.idelevage
INNER JOIN animal AS A ON E.fkanimal = A.idanimal;
