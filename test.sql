
INSERT INTO joueurs (nom) VALUES
    ('Joueur 1'),
    ('Joueur 2'),
    ('Joueur 3'),
    ('Joueur 4'),
    ('Joueur 5'),
    ('Joueur 6');

INSERT INTO parties (date_partie) VALUES (NOW());

SET @partie_id = LAST_INSERT_ID(); /* Je récupère l'id de la partie que je viens de créer */

INSERT INTO jouer (id_partie, id_joueur, id_personnage, role) VALUES
    (@partie_id, 1, 1, 'Maître du jeu'),
    (@partie_id, 2, 2, 'Utilisateur'),
    (@partie_id, 3, 3, 'Utilisateur'),
    (@partie_id, 4, 4, 'Utilisateur'),
    (@partie_id, 5, NULL, 'Observateur'),
    (@partie_id, 6, NULL, 'Observateur');

INSERT INTO presence (id_partie, id_personnage, id_piece, heure_arrivee, heure_depart) VALUES
    (@partie_id, 1, 1, '08:00:00', '08:30:00'),
    (@partie_id, 2, 2, '08:05:00', '08:35:00'),
    (@partie_id, 3, 3, '08:10:00', '08:40:00'),
    (@partie_id, 4, 4, '08:15:00', '08:45:00');

INSERT INTO posseder (id_partie, id_piece, id_objet) VALUES
    (@partie_id, 1, 1),
    (@partie_id, 1, 2),
    (@partie_id, 2, 3),
    (@partie_id, 3, 4),
    (@partie_id, 4, 5),
    (@partie_id, 5, 6);