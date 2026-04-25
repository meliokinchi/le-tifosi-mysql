-- À exécuter connecté en compte admin (ex : root) dans phpMyAdmin.

-- 1) Créer la base si elle n'existe pas
CREATE DATABASE IF NOT EXISTS tifosi
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- 2) Créer l'utilisateur 'tifosi' local 
CREATE USER IF NOT EXISTS 'tifosi'@'localhost'
IDENTIFIED BY 'b64VsDc1tPcs';

-- 3) Donner tous les droits sur la base 'tifosi' à cet utilisateur
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

-- 4) Appliquer les changements
FLUSH PRIVILEGES;