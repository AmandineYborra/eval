SELECT typt.idtype_terre, typt.nom, SUM(ter.surface) AS "Surface Totale"
FROM type_terre AS typt
INNER JOIN terrain AS ter ON typt.idtype_terre = ter.fktype_terre
GROUP BY typt.idtype_terre;