
CREATE TABLE IF NOT EXISTS joueurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS parties (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_partie DATETIME NOT NULL
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
    heure_arrivee DATETIME NOT NULL,
    heure_depart DATETIME,
    PRIMARY KEY (id_partie, id_personnage, id_piece),
    FOREIGN KEY (id_partie) REFERENCES parties(id),
    FOREIGN KEY (id_personnage) REFERENCES personnages(id),
    FOREIGN KEY (id_piece) REFERENCES pieces(id)
);
