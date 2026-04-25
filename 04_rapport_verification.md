# Rapport de vérification - Tifosi

Ce document regroupe les résultats obtenus après exécution des 10 requêtes de contrôle sur la base `tifosi`.

Les résultats attendus ci-dessous ont été déduits du jeu de données inséré.
Les résultats obtenus proviennent de l'exécution des requêtes dans phpMyAdmin.

Le schéma final contient aussi les tables `client`, `menu`, `menu_boisson` et `achat`, mais les 10 requêtes de vérification portent principalement sur les focaccias, les ingrédients, les boissons et les marques.

Pour chaque requête, on retrouve :
- son objectif ;
- le code SQL utilisé ;
- le résultat attendu ;
- le résultat obtenu ;
- un commentaire.

---

## Q1 - Liste des noms des focaccias par ordre alphabétique croissant

**But :** afficher la liste des focaccias triées par ordre alphabétique croissant.

**SQL :**
```sql
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;
```

**Résultat attendu :**
- Américaine
- Emmentalaccia
- Gorgonzollaccia
- Hawaienne
- Mozaccia
- Paysanne
- Raclaccia
- Tradizione

**Résultat obtenu :**
- Américaine
- Emmentalaccia
- Gorgonzollaccia
- Hawaienne
- Mozaccia
- Paysanne
- Raclaccia
- Tradizione

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q2 - Nombre total d'ingrédients

**But :** compter le nombre total d'ingrédients enregistrés.

**SQL :**
```sql
SELECT COUNT(*) AS nombre_total_ingredients
FROM ingredient;
```

**Résultat attendu :**
- 25

**Résultat obtenu :**
- 25

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q3 - Prix moyen des focaccias

**But :** calculer le prix moyen des focaccias.

**SQL :**
```sql
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccias
FROM focaccia;
```

**Résultat attendu :**
- 10.38

**Résultat obtenu :**
- 10.38

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q4 - Liste des boissons avec leur marque

**But :** afficher la liste des boissons avec leur marque, triée par nom de boisson.

**SQL :**
```sql
SELECT b.nom_boisson, m.nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom_boisson ASC, m.nom_marque ASC;
```

**Résultat attendu :**
- Capri-sun | Coca-cola
- Coca-cola original | Coca-cola
- Coca-cola zéro | Coca-cola
- Eau de source | Cristalline
- Fanta citron | Coca-cola
- Fanta orange | Coca-cola
- Lipton Peach | Pepsico
- Lipton zéro citron | Pepsico
- Monster energy ultra blue | Monster
- Monster energy ultra gold | Monster
- Pepsi | Pepsico
- Pepsi Max Zéro | Pepsico

**Résultat obtenu :**
- Capri-sun | Coca-cola
- Coca-cola original | Coca-cola
- Coca-cola zéro | Coca-cola
- Eau de source | Cristalline
- Fanta citron | Coca-cola
- Fanta orange | Coca-cola
- Lipton Peach | Pepsico
- Lipton zéro citron | Pepsico
- Monster energy ultra blue | Monster
- Monster energy ultra gold | Monster
- Pepsi | Pepsico
- Pepsi Max Zéro | Pepsico

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q5 - Ingrédients d'une Raclaccia

**But :** afficher la liste des ingrédients de la focaccia Raclaccia.

**SQL :**
```sql
SELECT i.nom_ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.nom_focaccia = 'Raclaccia'
ORDER BY i.nom_ingredient ASC;
```

**Résultat attendu :**
- Ail
- Base Tomate
- Champignon
- Cresson
- Parmesan
- Poivre
- Raclette

**Résultat obtenu :**
- Ail
- Base Tomate
- Champignon
- Cresson
- Parmesan
- Poivre
- Raclette

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q6 - Nombre d'ingrédients par focaccia

**But :** afficher le nom de chaque focaccia et son nombre d'ingrédients.

**SQL :**
```sql
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY f.nom_focaccia ASC;
```

**Résultat attendu :**
- Américaine | 8
- Emmentalaccia | 7
- Gorgonzollaccia | 8
- Hawaienne | 9
- Mozaccia | 10
- Paysanne | 12
- Raclaccia | 7
- Tradizione | 9

**Résultat obtenu :**
- Américaine | 8
- Emmentalaccia | 7
- Gorgonzollaccia | 8
- Hawaienne | 9
- Mozaccia | 10
- Paysanne | 12
- Raclaccia | 7
- Tradizione | 9

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q7 - Focaccia avec le plus d'ingrédients

**But :** afficher la focaccia qui possède le plus grand nombre d'ingrédients.

**SQL :**
```sql
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY nombre_ingredients DESC, f.nom_focaccia ASC
LIMIT 1;
```

**Résultat attendu :**
- Paysanne | 12

**Résultat obtenu :**
- Paysanne | 12

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q8 - Focaccias contenant de l'ail

**But :** afficher les focaccias qui contiennent l'ingrédient Ail.

**SQL :**
```sql
SELECT DISTINCT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE i.nom_ingredient = 'Ail'
ORDER BY f.nom_focaccia ASC;
```

**Résultat attendu :**
- Gorgonzollaccia
- Mozaccia
- Paysanne
- Raclaccia

**Résultat obtenu :**
- Gorgonzollaccia
- Mozaccia
- Paysanne
- Raclaccia

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q9 - Ingrédients inutilisés

**But :** afficher les ingrédients qui ne sont utilisés dans aucune focaccia.

**SQL :**
```sql
SELECT i.nom_ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON fi.id_ingredient = i.id_ingredient
WHERE fi.id_focaccia IS NULL
ORDER BY i.nom_ingredient ASC;
```

**Résultat attendu :**
- Salami
- Tomate cerise

**Résultat obtenu :**
- Salami
- Tomate cerise

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.

---

## Q10 - Focaccias sans champignons

**But :** afficher les focaccias qui ne contiennent pas de champignons.

**SQL :**
```sql
SELECT f.nom_focaccia
FROM focaccia f
WHERE NOT EXISTS (
    SELECT 1
    FROM focaccia_ingredient fi
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
    WHERE fi.id_focaccia = f.id_focaccia
      AND i.nom_ingredient = 'Champignon'
)
ORDER BY f.nom_focaccia ASC;
```

**Résultat attendu :**
- Américaine
- Hawaienne

**Résultat obtenu :**
- Américaine
- Hawaienne

**Commentaire :**
Aucun écart constaté entre le résultat attendu et le résultat obtenu.