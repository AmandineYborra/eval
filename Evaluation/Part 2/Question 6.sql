SELECT c. annee, c.idculture, c.rendement, emp.nom
FROM culture AS c
INNER JOIN employe AS emp on c.fkresponsable = emp.idemploye
GROUP BY c.idculture
 