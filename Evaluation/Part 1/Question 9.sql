SELECT c.idculture, trait.qtx, prod.nom, ter.idterrain, ter.surface, trait.qtx/ter.surface AS "QTX/SURFACE"
FROM culture AS c
INNER JOIN traitement AS trait ON c.idculture = trait.fkculture
INNER JOIN produit AS prod ON trait.fkproduit = prod.idproduit
INNER JOIN terrain AS ter ON c.fkterrain = ter.idterrain
ORDER BY idterrain;
