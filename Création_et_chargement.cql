// Chargement des lignes de la table crimes_aplatis.csv dans Neo4j
LOAD CSV
WITH HEADERS FROM 'file: ///crimes_2021.csv' AS row
// Préparation des champs
WITH
row.`CGD/CSP` AS equipe,
row.Service AS service,
row.`Titre crime` AS crime,
row.Département AS departement,
row.Périmètre AS perimetre,
toInteger(row.Année) AS annee,
toInteger(row.Valeur) AS valeur

// Création des nœuds
MERGE (a:Année { val: annee })
MERGE (d:Département { nom: departement })
 SET d.perimetre = perimetre
MERGE (c:Crime { nom: crime })
MERGE (s:Service { equipe: equipe, service: service })

// Relations statiques
MERGE (s)-[:PATROUILLE]->(d)
MERGE (c)-[:A_LIEU]->(d)
MERGE (c)-[:A_ÉTÉ_RÉALISÉ]->(a)

// Relation avec propriété "frequence"
MERGE (s)-[r:TRAITE { annee: annee, departement: departement }]->(c)
 SET r.frequence = valeur
