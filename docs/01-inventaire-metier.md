# Inventaire métier - Tifosi

## Sujet du devoir

Le devoir consiste à concevoir une base de données MySQL pour le site Tifosi.

## Livrables obligatoires

- Le script SQL de création du schéma de la base de données
- Le script SQL d'insertion des données de test
- Le script SQL d'exécution des requêtes de test
- Le lien vers le dépôt GitHub du projet

## Points d'attention

- Présentation du code
- Pertinence des commentaires
- Cohérence entre le modèle, les données et les requêtes
- Dépôt GitHub public

## Vocabulaire métier

- Focaccia
- Ingrédient
- Boisson
- Marque
- Menu
- Client
- Achat
- Prix
- Quantité
- Composition
- Nom
- Identifiant

## Données certaines

Les fichiers fournis permettent d'identifier clairement :
- des focaccias avec un nom et un prix ;
- des ingrédients avec un identifiant et un nom ;
- des boissons avec un nom et une marque ;
- des marques ;
- une composition entre focaccia et ingrédient avec une quantité.

Le schéma conceptuel fourni dans le brief ajoute aussi :
- des clients ;
- des menus ;
- une relation d'achat avec une date ;
- une relation entre menu et boisson.

## Périmètre retenu

Le rendu final intègre :
- les tables nécessaires aux fichiers fournis ;
- les tables supplémentaires présentes dans le schéma conceptuel.

Le modèle retenu permet de répondre aux 10 requêtes demandées tout en restant cohérent avec le modèle du brief.

## Tables retenues

- `focaccia`
- `ingredient`
- `marque`
- `boisson`
- `focaccia_ingredient`
- `client`
- `menu`
- `menu_boisson`
- `achat`

## Relations retenues

- Une marque peut être associée à plusieurs boissons.
- Une boisson appartient à une seule marque.
- Une focaccia contient plusieurs ingrédients.
- Un ingrédient peut être utilisé dans plusieurs focaccias.
- Un menu est associé à une seule focaccia.
- Une focaccia peut apparaître dans plusieurs menus.
- Un menu peut contenir plusieurs boissons.
- Une boisson peut apparaître dans plusieurs menus.
- Un client peut effectuer plusieurs achats.
- Un achat concerne un seul client.
- Un achat concerne un seul menu.
- Un menu peut apparaître dans plusieurs achats.
- La relation d'achat conserve la date d'achat.

## Organisation des données

- Le nom et le prix d'une focaccia sont stockés dans la table `focaccia`.
- Le nom d'un ingrédient est stocké dans la table `ingredient`.
- Le nom d'une marque est stocké dans la table `marque`.
- Le nom d'une boisson est stocké dans la table `boisson`.
- Les informations d'un client sont stockées dans la table `client`.
- Le nom, le prix et la focaccia associée d'un menu sont stockés dans la table `menu`.
- La liste des ingrédients d'une focaccia ne doit pas rester dans une seule colonne texte.
- La composition d'une focaccia doit être stockée dans une table de liaison.
- L'association entre menu et boisson doit être stockée dans une table de liaison.
- L'achat doit être stocké dans une table dédiée car il porte une date.

## Attributs retenus

- `focaccia(id_focaccia, nom_focaccia, prix)`
- `ingredient(id_ingredient, nom_ingredient)`
- `marque(id_marque, nom_marque)`
- `boisson(id_boisson, nom_boisson, id_marque)`
- `focaccia_ingredient(id_focaccia, id_ingredient, quantite)`
- `client(id_client, nom_client, email_client, code_postal)`
- `menu(id_menu, nom_menu, prix, id_focaccia)`
- `menu_boisson(id_menu, id_boisson)`
- `achat(id_achat, id_client, id_menu, date_achat)`

## Clés principales

- `focaccia` : `id_focaccia`
- `ingredient` : `id_ingredient`
- `marque` : `id_marque`
- `boisson` : `id_boisson`
- `focaccia_ingredient` : `(id_focaccia, id_ingredient)`
- `client` : `id_client`
- `menu` : `id_menu`
- `menu_boisson` : `(id_menu, id_boisson)`
- `achat` : `id_achat`

## Cardinalités

- Une marque peut avoir plusieurs boissons : `1,n`
- Une boisson appartient à une seule marque : `1,1`
- Une focaccia peut contenir plusieurs ingrédients : `n,n`
- Un ingrédient peut être utilisé dans plusieurs focaccias : `n,n`
- Une focaccia peut apparaître dans plusieurs menus : `1,n`
- Un menu est lié à une seule focaccia : `1,1`
- Un menu peut contenir plusieurs boissons : `n,n`
- Une boisson peut apparaître dans plusieurs menus : `n,n`
- Un client peut effectuer plusieurs achats : `1,n`
- Un achat concerne un seul client : `1,1`
- Un menu peut apparaître dans plusieurs achats : `1,n`
- Un achat concerne un seul menu : `1,1`

## Pourquoi des tables de liaison

La relation entre `focaccia` et `ingredient` est une relation plusieurs-à-plusieurs.
Il faut donc une table de liaison `focaccia_ingredient`.
Cette table permet aussi de stocker la quantité utilisée pour chaque ingrédient dans chaque focaccia.

La relation entre `menu` et `boisson` est aussi une relation plusieurs-à-plusieurs.
Il faut donc une table de liaison `menu_boisson`.

La relation entre `client` et `menu` porte l'information `date_achat`.
Il faut donc une table `achat`.

## Requêtes de vérification attendues

1. Afficher la liste des noms des focaccias par ordre alphabétique croissant.
2. Afficher le nombre total d'ingrédients.
3. Afficher le prix moyen des focaccias.
4. Afficher la liste des boissons avec leur marque, triée par nom de boisson.
5. Afficher la liste des ingrédients pour une Raclaccia.
6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia.
7. Afficher le nom de la focaccia qui a le plus d'ingrédients.
8. Afficher la liste des focaccias qui contiennent de l'ail.
9. Afficher la liste des ingrédients inutilisés.
10. Afficher la liste des focaccias qui n'ont pas de champignons.