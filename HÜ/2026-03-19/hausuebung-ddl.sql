-- Hausübung vom 19. März – DDL & Constraints
-- Thema: Integritätsregeln (Constraints) in SQLite

-- Aufgabe 1: E-Commerce Inventar
-- Erstelle ein einfaches Inventarsystem mit zwei Tabellen

-- Lösche existierende Tabellen falls vorhanden
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

-- Tabelle categories
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Tabelle products
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL DEFAULT 0.0,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Aufgabe 2: CHECK Constraint
-- Füge einen CHECK Constraint auf price hinzu, damit dieser niemals negativ sein kann

-- In SQLite kann man CHECK Constraints bei CREATE TABLE hinzufügen oder später mit ALTER TABLE
-- Da die Tabelle bereits erstellt ist, verwenden wir ALTER TABLE
ALTER TABLE products ADD CONSTRAINT check_price CHECK (price >= 0);

-- Aufgabe 3: Foreign Keys testen
-- Aktiviere Foreign Keys mit PRAGMA foreign_keys = ON;
PRAGMA foreign_keys = ON;

-- Versuche ein Produkt mit ungültiger category_id (z.B. 999) einzufügen
-- Dies sollte fehlschlagen, da category_id 999 nicht in categories existiert
-- INSERT INTO products (name, price, category_id) VALUES ('Test Product', 10.0, 999);
-- Fehlermeldung: FOREIGN KEY constraint failed

-- Um zu testen, fügen wir zuerst eine gültige Kategorie ein
INSERT INTO categories (name) VALUES ('Electronics');

-- Dann ein gültiges Produkt
INSERT INTO products (name, price, category_id) VALUES ('Laptop', 999.99, 1);

-- Jetzt testen wir das ungültige Einfügen (auskommentiert, da es fehlschlägt)
-- INSERT INTO products (name, price, category_id) VALUES ('Invalid Product', 10.0, 999);
-- Erwartete Fehlermeldung: FOREIGN KEY constraint failed