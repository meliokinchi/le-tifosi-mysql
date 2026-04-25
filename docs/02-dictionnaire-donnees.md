# Dictionnaire de données - Tifosi

## Table focaccia

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_focaccia | INT | NOT NULL | PK | Identifiant unique de la focaccia |
| nom_focaccia | VARCHAR(100) | NOT NULL | UNIQUE | Nom de la focaccia |
| prix | DECIMAL(5,2) | NOT NULL |  | Prix de la focaccia |

## Table ingredient

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_ingredient | INT | NOT NULL | PK | Identifiant unique de l'ingrédient |
| nom_ingredient | VARCHAR(100) | NOT NULL | UNIQUE | Nom de l'ingrédient |

## Table marque

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_marque | INT | NOT NULL | PK | Identifiant unique de la marque |
| nom_marque | VARCHAR(100) | NOT NULL | UNIQUE | Nom de la marque |

## Table boisson

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_boisson | INT | NOT NULL | PK | Identifiant unique de la boisson |
| nom_boisson | VARCHAR(100) | NOT NULL | UNIQUE | Nom de la boisson |
| id_marque | INT | NOT NULL | FK | Identifiant de la marque associée |

## Table focaccia_ingredient

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_focaccia | INT | NOT NULL | PK, FK | Identifiant de la focaccia concernée |
| id_ingredient | INT | NOT NULL | PK, FK | Identifiant de l'ingrédient concerné |
| quantite | DECIMAL(6,2) | NOT NULL |  | Quantité utilisée pour la recette |

## Table client

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_client | INT | NOT NULL | PK | Identifiant unique du client |
| nom_client | VARCHAR(100) | NOT NULL |  | Nom du client |
| email_client | VARCHAR(150) | NOT NULL | UNIQUE | Adresse e-mail du client |
| code_postal | VARCHAR(10) | NOT NULL |  | Code postal du client |

## Table menu

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_menu | INT | NOT NULL | PK | Identifiant unique du menu |
| nom_menu | VARCHAR(100) | NOT NULL | UNIQUE | Nom du menu |
| prix | DECIMAL(5,2) | NOT NULL |  | Prix du menu |
| id_focaccia | INT | NOT NULL | FK | Identifiant de la focaccia associée |

## Table menu_boisson

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_menu | INT | NOT NULL | PK, FK | Identifiant du menu concerné |
| id_boisson | INT | NOT NULL | PK, FK | Identifiant de la boisson concernée |

## Table achat

| Colonne | Type | Null | Clé | Description |
|---|---|---|---|---|
| id_achat | INT | NOT NULL | PK | Identifiant unique de l'achat |
| id_client | INT | NOT NULL | FK | Identifiant du client ayant effectué l'achat |
| id_menu | INT | NOT NULL | FK | Identifiant du menu acheté |
| date_achat | DATE | NOT NULL |  | Date de l'achat |

## Contraintes retenues

- Les noms sont obligatoires dans les tables principales.
- Les noms des focaccias, ingrédients, marques, boissons et menus sont uniques.
- L'adresse e-mail d'un client est unique.
- La table `boisson` dépend de la table `marque`.
- La table `menu` dépend de la table `focaccia`.
- La table `focaccia_ingredient` dépend des tables `focaccia` et `ingredient`.
- La table `menu_boisson` dépend des tables `menu` et `boisson`.
- La table `achat` dépend des tables `client` et `menu`.
- La clé primaire composite de `focaccia_ingredient` empêche d'ajouter deux fois le même ingrédient pour une même focaccia.
- La clé primaire composite de `menu_boisson` empêche d'ajouter deux fois la même boisson dans un même menu.