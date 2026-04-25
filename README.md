# devoir-tifosi-mysql

Projet réalisé dans le cadre du devoir de conception d'une base de données MySQL pour le site Tifosi.

## Prérequis

- MySQL
- phpMyAdmin via XAMPP ou MySQL Workbench
- Encodage UTF-8 / utf8mb4

## Structure du projet

- `docs/01-inventaire-metier.md`
- `docs/02-dictionnaire-donnees.md`
- `docs/03-mcd-mld.md`
- `sql/00_setup.sql`
- `sql/01_schema_tifosi.sql`
- `sql/02_peuplement_tifosi.sql`
- `sql/03_verification.sql`
- `04_rapport_verification.md`

## Ordre d'exécution

1. Exécuter `sql/00_setup.sql` avec un compte administrateur.
2. Exécuter `sql/01_schema_tifosi.sql`.
3. Exécuter `sql/02_peuplement_tifosi.sql`.
4. Exécuter `sql/03_verification.sql`.
5. Vérifier les résultats dans `04_rapport_verification.md`.

## Livrables attendus

- Un script SQL de création du schéma
- Un script SQL d'insertion des données de test
- Un script SQL d'exécution des requêtes de test
- Un dépôt GitHub public

## Périmètre retenu

Le projet s'appuie sur les données fournies pour les focaccias, les ingrédients, les boissons et les marques.
Il intègre aussi les éléments du modèle conceptuel afin de proposer une base plus complète et cohérente.

Le modèle retenu repose sur les tables suivantes :
- `focaccia`
- `ingredient`
- `marque`
- `boisson`
- `focaccia_ingredient`
- `client`
- `menu`
- `menu_boisson`
- `achat`

## Remarques

La table `focaccia_ingredient` est une table de liaison entre les focaccias et les ingrédients.
Elle permet aussi de stocker la quantité utilisée pour chaque ingrédient dans chaque recette.

La table `menu_boisson` est une table de liaison entre les menus et les boissons.

La table `achat` permet d'associer un client à un menu acheté tout en conservant la date d'achat.