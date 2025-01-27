
CREATE TABLE IF NOT EXISTS joueurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS parties (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_partie DATETIME NOT NULL
    heure_fin TIME,
);

CREATE TABLE IF NOT EXISTS personnages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    couleur VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS pieces (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS objets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS jouer (
    id_partie INT,
    id_joueur INT,
    id_personnage INT,
    role VARCHAR(30) NOT NULL CHECK (role IN ('Maître du jeu', 'Utilisateur', 'Observateur')),
    PRIMARY KEY (id_partie, id_joueur),
    FOREIGN KEY (id_partie) REFERENCES parties(id),
    FOREIGN KEY (id_joueur) REFERENCES joueurs(id),
    FOREIGN KEY (id_personnage) REFERENCES personnages(id)
);

CREATE TABLE IF NOT EXISTS presence (
    id_partie INT,
    id_personnage INT,
    id_piece INT,
    heure_arrivee TIME NOT NULL,
    heure_depart TIME,
    PRIMARY KEY (id_partie, id_personnage, id_piece),
    FOREIGN KEY (id_partie) REFERENCES parties(id),
    FOREIGN KEY (id_personnage) REFERENCES personnages(id),
    FOREIGN KEY (id_piece) REFERENCES pieces(id)
);

CREATE TABLE IF NOT EXISTS posseder (
    id_piece INT,
    id_objet INT,
    PRIMARY KEY (id_piece, id_objet),
    FOREIGN KEY (id_piece) REFERENCES pieces(id),
    FOREIGN KEY (id_objet) REFERENCES objets(id)
);

DELIMITER //
CREATE TRIGGER before_jouer_insert
BEFORE INSERT ON jouer
FOR EACH ROW
BEGIN
    IF (NEW.role = 'Maître du jeu') THEN
        IF (SELECT COUNT(*) FROM jouer WHERE id_partie = NEW.id_partie AND role = 'Maître du jeu') > 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il ne peut y avoir qu\'un seul Maître du jeu par partie';
        END IF;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_jouer_update
BEFORE UPDATE ON jouer
FOR EACH ROW
BEGIN
    IF (NEW.role = 'Maître du jeu') THEN
        IF (SELECT COUNT(*) FROM jouer WHERE id_partie = NEW.id_partie AND role = 'Maître du jeu' AND id_joueur != NEW.id_joueur) > 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il ne peut y avoir qu\'un seul Maître du jeu par partie';
        END IF;
    END IF;
END;
//
DELIMITER ;