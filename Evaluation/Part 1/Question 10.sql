-- Requête simple par Nombe de terrains
SELECT typt.idtype_terre, typt.nom, COUNT(DISTINCT ter.surface) AS "Nb Terrains"
FROM type_terre AS typt
INNER JOIN terrain AS ter ON typt.idtype_terre = ter.fktype_terre
HAVING COUNT(typt.idtype_terre);

-- Requête imbiquée par Surface de terrain
SELECT idtype_terre, nom, max(Surface_Totale)
FROM ( SELECT typt.idtype_terre, typt.nom, SUM(ter.surface) AS Surface_Totale
FROM type_terre AS typt
INNER JOIN terrain AS ter ON typt.idtype_terre = ter.fktype_terre
GROUP BY typt.idtype_terre) as s;