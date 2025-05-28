// Chargement des lignes de la table crimes_aplatis.csv dans Neo4j
LOAD CSV
WITH HEADERS FROM 'crimes_aplatis.csv' AS row
WITH
row.`CDG/CSP` AS equipe,
row.Service AS service,
row.`Titre crime` AS crime,
row.Département AS departement,
row.Périmètre AS perimetre,
toInteger(row.Année) AS annee,
toInteger(row.Valeur) AS valeur

// Agrégation des doublons avant la création des relations
WITH
equipe, service, crime, departement, perimetre, annee,
sum(valeur) AS total_valeur

// Noeuds
MERGE (a:Année { val: annee })
MERGE (d:Département { nom: departement })
 SET d.perimetre = perimetre
MERGE (c:Crime { nom: crime })
MERGE (s:Service { type: service, equipe: equipe })

// Relations statiques
MERGE (s)-[:PATROUILLE]->(d)
MERGE (c)-[:A_LIEU]->(d)
MERGE (c)-[:A_ÉTÉ_RÉALISÉ]->(a)

// Relation avec propriétés dynamiques + agrégation
MERGE (s)-[r:TRAITE { annee: annee, departement: departement }]->(c)
 SET r.frequence = coalesce(r.frequence, 0) + total_valeur
