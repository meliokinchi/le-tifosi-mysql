-- Insère les données de test dans la base tifosi.

USE tifosi;

-- Marques
INSERT INTO marque (nom_marque) VALUES
('Coca-cola'),
('Cristalline'),
('Monster'),
('Pepsico');

-- Ingrédients
INSERT INTO ingredient (nom_ingredient) VALUES
('Ail'),
('Ananas'),
('Artichaut'),
('Bacon'),
('Base Tomate'),
('Base Crème'),
('Champignon'),
('Chèvre'),
('Cresson'),
('Emmental'),
('Gorgonzola'),
('Jambon cuit'),
('Jambon fumé'),
('Oeuf'),
('Oignon'),
('Olive noire'),
('Olive verte'),
('Parmesan'),
('Piment'),
('Poivre'),
('Pomme de terre'),
('Raclette'),
('Salami'),
('Tomate cerise'),
('Mozzarella');

-- Focaccias
INSERT INTO focaccia (nom_focaccia, prix) VALUES
('Mozaccia', 9.80),
('Gorgonzollaccia', 10.80),
('Raclaccia', 8.90),
('Emmentalaccia', 9.80),
('Tradizione', 8.90),
('Hawaienne', 11.20),
('Américaine', 10.80),
('Paysanne', 12.80);

-- Clients
INSERT INTO client (nom_client, email_client, code_postal) VALUES
('Bilal Bolat', 'bilal.bolat@tifosi.test', '28100'),
('Alice Martin', 'alice.martin@tifosi.test', '75001'),
('Karim Yilmaz', 'karim.yilmaz@tifosi.test', '69002');

-- Boissons
INSERT INTO boisson (nom_boisson, id_marque) VALUES
('Coca-cola zéro', 1),
('Coca-cola original', 1),
('Fanta citron', 1),
('Fanta orange', 1),
('Capri-sun', 1),
('Pepsi', 4),
('Pepsi Max Zéro', 4),
('Lipton zéro citron', 4),
('Lipton Peach', 4),
('Monster energy ultra gold', 3),
('Monster energy ultra blue', 3),
('Eau de source', 2);

-- Menus
INSERT INTO menu (nom_menu, prix, id_focaccia) VALUES
('Menu Mozaccia', 12.90, 1),
('Menu Gorgonzollaccia', 13.90, 2),
('Menu Raclaccia', 11.90, 3),
('Menu Emmentalaccia', 12.90, 4),
('Menu Tradizione', 11.90, 5),
('Menu Hawaienne', 14.20, 6),
('Menu Américaine', 13.80, 7),
('Menu Paysanne', 15.90, 8);

-- Boissons des menus
INSERT INTO menu_boisson (id_menu, id_boisson) VALUES
(1, 1),
(2, 6),
(3, 12),
(4, 8),
(5, 2),
(6, 4),
(7, 7),
(8, 10);

-- Achats
INSERT INTO achat (id_client, id_menu, date_achat) VALUES
(1, 1, '2026-04-20'),
(1, 8, '2026-04-21'),
(2, 3, '2026-04-22'),
(2, 6, '2026-04-22'),
(3, 5, '2026-04-23');

-- Composition des focaccias
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
(1, 5, 200.00),
(1, 25, 50.00),
(1, 9, 20.00),
(1, 13, 80.00),
(1, 1, 2.00),
(1, 3, 20.00),
(1, 7, 40.00),
(1, 18, 50.00),
(1, 20, 1.00),
(1, 16, 20.00),

(2, 5, 200.00),
(2, 11, 50.00),
(2, 9, 20.00),
(2, 1, 2.00),
(2, 7, 40.00),
(2, 18, 50.00),
(2, 20, 1.00),
(2, 16, 20.00),

(3, 5, 200.00),
(3, 22, 50.00),
(3, 9, 20.00),
(3, 1, 2.00),
(3, 7, 40.00),
(3, 18, 50.00),
(3, 20, 1.00),

(4, 6, 200.00),
(4, 10, 50.00),
(4, 9, 20.00),
(4, 7, 40.00),
(4, 18, 50.00),
(4, 20, 1.00),
(4, 15, 20.00),

(5, 5, 200.00),
(5, 25, 50.00),
(5, 9, 20.00),
(5, 12, 80.00),
(5, 7, 80.00),
(5, 18, 50.00),
(5, 20, 1.00),
(5, 16, 10.00),
(5, 17, 10.00),

(6, 5, 200.00),
(6, 25, 50.00),
(6, 9, 20.00),
(6, 4, 80.00),
(6, 2, 40.00),
(6, 19, 2.00),
(6, 18, 50.00),
(6, 20, 1.00),
(6, 16, 20.00),

(7, 5, 200.00),
(7, 25, 50.00),
(7, 9, 20.00),
(7, 4, 80.00),
(7, 21, 40.00),
(7, 18, 50.00),
(7, 20, 1.00),
(7, 16, 20.00),

(8, 6, 200.00),
(8, 8, 50.00),
(8, 9, 20.00),
(8, 21, 80.00),
(8, 13, 80.00),
(8, 1, 2.00),
(8, 3, 20.00),
(8, 7, 40.00),
(8, 18, 50.00),
(8, 20, 1.00),
(8, 16, 20.00),
(8, 14, 50.00);