SELECT c.idculture, trait.qtx, prod.nom
FROM culture AS c
INNER JOIN traitement AS trait ON c.idculture = trait.fkculture
INNER JOIN produit AS prod ON trait.fkproduit = prod.idproduit
GROUP BY idculture, idproduit;
