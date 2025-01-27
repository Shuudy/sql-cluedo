# sql-cluedo (TP 6)

## Dictionnaire de données

| Nom  | Type de données | Taille | Description | Contraintes
| ----------------- | --------------- | -- | -------------------------------------- | ----- |
| id_partie         | INTEGER         | 11 | Identifiant unique de la partie | PRIMARY KEY, AUTOINCREMENT |
| date_partie       | DATETIME            | - | Date à laquelle la partie a été jouée | - |
| id_joueur       | INTEGER            | 11 | Identifiant unique du joueur | PRIMARY KEY, AUTOINCREMENT |
| nom_joueur       | VARCHAR            | 30 | Nom du joueur | - |
| role_joueur       | VARCHAR            | 30 | Rôle du joueur | CHECK (role_joueur IN ('Maître du jeu', 'Utilisateur', 'Observateur')) |
| id_personnage       | INTEGER            | 11 | Identifiant unique du personnage | PRIMARY KEY, AUTOINCREMENT |
| nom_personnage       | VARCHAR            | 30 | Nom du personnage | - |
| id_piece       | INTEGER            | 11 | Identifiant unique de la pièce | PRIMARY KEY, AUTOINCREMENT |
| nom_piece       | VARCHAR            | 30 | Nom de la pièce | - |
| id_objet       | INTEGER            | 11 | Identifiant unique de l'objet | PRIMARY KEY, AUTOINCREMENT |
| nom_objet       | VARCHAR            | 30 | Nom de l'objet (ex: "Poignard") | - |
