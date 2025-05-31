
# 📘 README – Création automatique d’un graphe Neo4j à partir des crimes Police/Gendarmerie

## 🎯 Objectif

Importer un fichier Excel contenant les enregistrements de crimes/délits par service (Police ou Gendarmerie) et par département, puis créer un **graphe relationnel dans Neo4j** représentant les interactions entre services, départements, crimes et années.

---

##  Pipeline d’ingestion

*Cf le fichier [Traitement](/Traitement_fichier.ipynb)*

### 1. 📥 Lecture et fusion du fichier Excel

* Chargement du fichier
* Extraction des données et transformation sous ce format 

  ``
"CGD/CSP", "Service", "Titre crime", "Département", "Périmètre", "Année", "Valeur"

  ``

---
### 2. 🧼 Nettoyage et transformation

* Gestion des données manquantes en raison des différences entre les données Gendarme et police.
* Agrégation des doublons 


### 3.  Ingestion Neo4j avec Cypher

*Cf le fichier [Cypher](/Création_et_chargement.cql)*

##  Réponses aux questions

*Cf le fichier [Réponses](/Reponse.md)*
