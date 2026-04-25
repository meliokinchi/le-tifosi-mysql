-- Regroupe les 10 requêtes de vérification demandées.

USE tifosi;

-- Q1 : liste des focaccias par ordre alphabétique
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

-- Q2 : nombre total d'ingrédients
SELECT COUNT(*) AS nombre_total_ingredients
FROM ingredient;

-- Q3 : prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccias
FROM focaccia;

-- Q4 : boissons avec leur marque
SELECT b.nom_boisson, m.nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom_boisson ASC, m.nom_marque ASC;

-- Q5 : ingrédients de la Raclaccia
SELECT i.nom_ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.nom_focaccia = 'Raclaccia'
ORDER BY i.nom_ingredient ASC;

-- Q6 : nombre d'ingrédients par focaccia
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY f.nom_focaccia ASC;

-- Q7 : focaccia avec le plus d'ingrédients
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY nombre_ingredients DESC, f.nom_focaccia ASC
LIMIT 1;

-- Q8 : focaccias contenant de l'ail
SELECT DISTINCT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE i.nom_ingredient = 'Ail'
ORDER BY f.nom_focaccia ASC;

-- Q9 : ingrédients inutilisés
SELECT i.nom_ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON fi.id_ingredient = i.id_ingredient
WHERE fi.id_focaccia IS NULL
ORDER BY i.nom_ingredient ASC;

-- Q10 : focaccias sans champignons
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