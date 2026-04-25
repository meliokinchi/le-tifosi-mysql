# MCD et MLD - Tifosi

## MCD

### Entités retenues

- Focaccia
- Ingrédient
- Boisson
- Marque
- Client
- Menu

### Attributs principaux

- Focaccia : id_focaccia, nom_focaccia, prix
- Ingrédient : id_ingredient, nom_ingredient
- Boisson : id_boisson, nom_boisson
- Marque : id_marque, nom_marque
- Client : id_client, nom_client, email_client, code_postal
- Menu : id_menu, nom_menu, prix

### Relations

- Une focaccia contient plusieurs ingrédients.
- Un ingrédient peut être utilisé dans plusieurs focaccias.
- Une boisson appartient à une marque.
- Une marque peut regrouper plusieurs boissons.
- Un menu est associé à une focaccia.
- Un menu peut contenir plusieurs boissons.
- Un client peut effectuer plusieurs achats.
- Un achat concerne un menu et conserve une date d'achat.

### Cardinalités

- Focaccia ↔ Ingrédient : `n,n`
- Marque ↔ Boisson : `1,n`
- Boisson ↔ Marque : `1,1`
- Focaccia ↔ Menu : `1,n`
- Menu ↔ Focaccia : `1,1`
- Menu ↔ Boisson : `n,n`
- Client ↔ Achat : `1,n`
- Menu ↔ Achat : `1,n`

### Remarque

La relation entre `focaccia` et `ingredient` porte aussi l'information `quantite`.
Cette information appartient à la relation elle-même, ce qui justifie l'utilisation d'une table de liaison dans le modèle relationnel.

La relation entre `client` et `menu` porte l'information `date_achat`.
Elle doit donc être matérialisée dans une table dédiée.

## MLD

### Tables relationnelles

- `focaccia(id_focaccia, nom_focaccia, prix)`
- `ingredient(id_ingredient, nom_ingredient)`
- `marque(id_marque, nom_marque)`
- `boisson(id_boisson, nom_boisson, id_marque)`
- `focaccia_ingredient(id_focaccia, id_ingredient, quantite)`
- `client(id_client, nom_client, email_client, code_postal)`
- `menu(id_menu, nom_menu, prix, id_focaccia)`
- `menu_boisson(id_menu, id_boisson)`
- `achat(id_achat, id_client, id_menu, date_achat)`

### Clés primaires

- `focaccia` : `id_focaccia`
- `ingredient` : `id_ingredient`
- `marque` : `id_marque`
- `boisson` : `id_boisson`
- `focaccia_ingredient` : `(id_focaccia, id_ingredient)`
- `client` : `id_client`
- `menu` : `id_menu`
- `menu_boisson` : `(id_menu, id_boisson)`
- `achat` : `id_achat`

### Clés étrangères

- `boisson.id_marque` référence `marque.id_marque`
- `focaccia_ingredient.id_focaccia` référence `focaccia.id_focaccia`
- `focaccia_ingredient.id_ingredient` référence `ingredient.id_ingredient`
- `menu.id_focaccia` référence `focaccia.id_focaccia`
- `menu_boisson.id_menu` référence `menu.id_menu`
- `menu_boisson.id_boisson` référence `boisson.id_boisson`
- `achat.id_client` référence `client.id_client`
- `achat.id_menu` référence `menu.id_menu`

### Périmètre du rendu

Le rendu final conserve les données directement exploitables à partir des fichiers fournis pour les focaccias, les ingrédients, les boissons et les marques.
Il ajoute aussi les tables `client`, `menu`, `menu_boisson` et `achat` pour rester cohérent avec le schéma conceptuel.
Les 10 requêtes de vérification restent centrées sur les données principales demandées.