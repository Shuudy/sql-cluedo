# sql-cluedo (TP 6)

## Explication

J'ai mis en place un système de "partie" et j'ai considéré qu'on pouvait avoir plusieurs parties de Cluedo. Chaque partie est identifiée de manière unique et peut inclure plusieurs joueurs, personnages, pièces et objets. Cela permet de suivre les différentes sessions de jeu et de gérer les données associées à chaque partie de manière indépendante.

## Dictionnaire de données

| Code  | Type de données | Taille | Description | Contraintes
| ----------------- | --------------- | -- | -------------------------------------- | ----- |
| id_partie         | INTEGER         | 11 | Identifiant unique de la partie | PRIMARY KEY, AUTOINCREMENT |
| date_partie       | DATETIME            | - | Date à laquelle la partie a été jouée | - |
| heure_fin       | TIME            | - | Heure à laquelle la partie a été terminée | - |
| id_joueur       | INTEGER            | 11 | Identifiant unique du joueur | PRIMARY KEY, AUTOINCREMENT |
| nom_joueur       | VARCHAR            | 30 | Nom du joueur | - |
| role_joueur       | VARCHAR            | 30 | Rôle du joueur | CHECK (role_joueur IN ('Maître du jeu', 'Utilisateur', 'Observateur')) |
| id_personnage       | INTEGER            | 11 | Identifiant unique du personnage | PRIMARY KEY, AUTOINCREMENT |
| nom_personnage       | VARCHAR            | 30 | Nom du personnage | - |
| couleur       | VARCHAR            | 15 | Couleur du pion | - |
| id_piece       | INTEGER            | 11 | Identifiant unique de la pièce | PRIMARY KEY, AUTOINCREMENT |
| nom_piece       | VARCHAR            | 30 | Nom de la pièce | - |
| id_objet       | INTEGER            | 11 | Identifiant unique de l'objet | PRIMARY KEY, AUTOINCREMENT |
| nom_objet       | VARCHAR            | 30 | Nom de l'objet (ex: "Poignard") | - |
| heure_arrivee       | TIME            | - | Heure de l'arrivée dans la pièce | - |
| heure_depart       | TIME            | - | Heure de départ dans la pièce | - |

## Ordre d'exécution des fichiers .sql

1. `creation.sql` : Ce fichier crée toutes les tables nécessaires pour le jeu Cluedo.
2. `peuplement.sql` : Ce fichier insère les données de base dans les tables (objets, pièces, personnages).
3. `test.sql` : Ce fichier insère des données de test pour simuler une partie.

## Requêtes à réaliser

1. Lister tous les personnages du jeu
     
    ```sql
    SELECT * FROM personnages;
    ```

2. Lister chaque joueur et son personnage associé

    ```sql
    SELECT joueurs.nom, personnages.nom 
    FROM jouer
    JOIN joueurs ON joueurs.id = jouer.id_joueur
    JOIN personnages ON jouer.id_personnage = personnages.id;
    ```

3. Afficher la liste des personnages présents dans la cuisine entre 08:00 et 09:00

    ```sql
    SELECT
    FROM presence
    JOIN personnages ON presence.id_personnage = personnages.id
    JOIN pieces ON presence.id_piece = pieces.id
    WHERE pieces.nom = 'Cuisine'
    AND presence.heure_arrivee BETWEEN '08:00:00' AND '09:00:00';
    ```

4. Afficher les pièces où aucun personnage n'est allé

    ```sql
    SELECT 
    FROM pieces
    WHERE pieces.id NOT IN (SELECT id_piece FROM presence);
    ```

5. Compter le nombre d'objets par pièce

    ```sql
    SELECT pieces.nom, COUNT(posseder.id_objet) AS nombre_objets
    FROM pieces
    LEFT JOIN posseder ON pieces.id = posseder.id_piece
    GROUP BY pieces.nom;
    ```

6. Ajouter une pièce

    ```sql
    INSERT INTO pieces (nom) VALUES ('Garage');
    ```

7. Modifier un objet

    ```sql
    UPDATE objets
    SET nom = 'Couteau tranchant'
    WHERE nom = 'Couteau';
    ```

8. Supprimer une pièce

    ```sql
    DELETE FROM presence
    WHERE id_piece = (SELECT id FROM pieces WHERE nom = 'Bureau');

    DELETE FROM posseder
    WHERE id_piece = (SELECT id FROM pieces WHERE nom = 'Bureau');

    DELETE FROM pieces
    WHERE nom = 'Bureau';
    ```
    Ici, nous sommes obligés de supprimer d'abord les enregistrements qui référencent la pièce, sinon une violation de contrainte de clé étrangère se produira.
    
Dans toutes les requêtes, je n'ai pas pris en compte la partie (trop répétitif). S'il avait fallu le faire, j'aurais simplement ajouté la condition suivante :
```sql
WHERE id_partie = 1
```