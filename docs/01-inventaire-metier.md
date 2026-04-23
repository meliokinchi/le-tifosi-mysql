# Inventaire métier - Tifosi

## Livrables obligatoires
- Le script SQL de création du schéma de la base de données
- Le script SQL permettant l’insertion des données de test
- Le script SQL permettant d’exécuter les requêtes de test
- Le lien vers le dépôt GitHub du projet

## Points d’attention
- Présentation du code
- Pertinence des commentaires

## Vocabulaire métier
- Focaccia
- Ingrédient
- Boisson
- Marque
- Prix
- Quantité
- Composition
- Nom
- Identifiant
- Base tomate
- Base crème
- Fromage
- Viande
- Légume
- Commande
- Menu
- Client

## Futures tables
- focaccia
- ingredient
- boisson
- marque
- focaccia_ingredient

## Relations pressenties
- Une marque possède plusieurs boissons.
- Une boisson appartient à une marque.
- Une focaccia contient plusieurs ingrédients.
- Un ingrédient peut être utilisé dans plusieurs focaccias.

## Organisation des données
- Les informations simples sont stockées dans des colonnes dédiées.
- Le nom et le prix d’une focaccia appartiennent à la table focaccia.
- Le nom d’un ingrédient appartient à la table ingredient.
- Le nom d’une marque appartient à la table marque.
- Le nom d’une boisson appartient à la table boisson.
- La liste des ingrédients d’une focaccia ne doit pas être stockée dans une seule colonne texte.
- La composition d’une focaccia doit être séparée dans une table de liaison.

## Attributs pressentis
- focaccia(id_focaccia, nom_focaccia, prix)
- ingredient(id_ingredient, nom_ingredient)
- marque(id_marque, nom_marque)
- boisson(id_boisson, nom_boisson, id_marque)
- focaccia_ingredient(id_focaccia, id_ingredient, quantite)

## Clés principales envisagées
- focaccia : id_focaccia
- ingredient : id_ingredient
- marque : id_marque
- boisson : id_boisson
- focaccia_ingredient : (id_focaccia, id_ingredient)

## Cardinalités
- Une marque peut avoir plusieurs boissons : 1,n
- Une boisson appartient à une seule marque : 1,1
- Une focaccia peut contenir plusieurs ingrédients : n,n
- Un ingrédient peut être utilisé dans plusieurs focaccias : n,n
- La relation n,n entre focaccia et ingredient impose une table de liaison focaccia_ingredient