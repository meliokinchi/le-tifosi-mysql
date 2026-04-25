-- Crée les tables et les relations de la base tifosi.

USE tifosi;

DROP TABLE IF EXISTS achat;
DROP TABLE IF EXISTS menu_boisson;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS focaccia_ingredient;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS marque;

CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL,
    CONSTRAINT uq_marque_nom UNIQUE (nom_marque)
) ENGINE=InnoDB;

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(100) NOT NULL,
    CONSTRAINT uq_ingredient_nom UNIQUE (nom_ingredient)
) ENGINE=InnoDB;

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    CONSTRAINT uq_focaccia_nom UNIQUE (nom_focaccia)
) ENGINE=InnoDB;

CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL,
    email_client VARCHAR(150) NOT NULL,
    code_postal VARCHAR(10) NOT NULL,
    CONSTRAINT uq_client_email UNIQUE (email_client)
) ENGINE=InnoDB;

CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(100) NOT NULL,
    id_marque INT NOT NULL,
    CONSTRAINT uq_boisson_nom UNIQUE (nom_boisson),
    CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom_menu VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_focaccia INT NOT NULL,
    CONSTRAINT uq_menu_nom UNIQUE (nom_menu),
    CONSTRAINT fk_menu_focaccia
        FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE focaccia_ingredient (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_focaccia_ingredient_focaccia
        FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_focaccia_ingredient_ingredient
        FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE menu_boisson (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_menu_boisson_menu
        FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_menu_boisson_boisson
        FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE achat (
    id_achat INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    CONSTRAINT fk_achat_client
        FOREIGN KEY (id_client) REFERENCES client(id_client)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_achat_menu
        FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;