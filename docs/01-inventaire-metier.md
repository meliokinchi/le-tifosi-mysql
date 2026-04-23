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