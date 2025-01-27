# sql-cluedo (TP 6)

## Dictionnaire de données

| Nom  | Type de données | Taille | Description
| ----------------- | --------------- | -- | --------------------------------------
| id_partie         | INTEGER         | 11 | Identifiant unique de la partie
| date_partie       | DATETIME            | - | Date à laquelle la partie a été jouée
| id_joueur       | INTEGER            | 11 | Identifiant unique du joueur
| nom_joueur       | VARCHAR            | 30 | Nom du joueur
| role_joueur       | VARCHAR            | 30 | Rôle du joueur
| id_personnage       | INTEGER            | 11 | Identifiant unique du personnage
| nom_personnage       | VARCHAR            | 30 | Nom du personnage
| id_piece       | INTEGER            | 11 | Identifiant unique de la pièce
| nom_piece       | VARCHAR            | 30 | Nom de la pièce
| id_objet       | INTEGER            | 11 | Identifiant unique de l'objet
| nom_objet       | VARCHAR            | 30 | Nom de l'objet (ex: "Poignard")
