-- ============================================================================
-- HAUSAUFGABE: N-zu-M-Beziehungen mit Zwischentabellen
-- Thema: Bibliotheksverwaltung mit Ausleihen
-- Geschätzter Bearbeitungsaufwand: ca. 50 Minuten
-- ============================================================================
--
-- AUFGABENSTELLUNG:
-- -----------------
-- Du sollst ein Datenbankmodell für eine Bibliothek erstellen.
-- Die Bibliothek verwaltet Bücher und Leser.
-- Ein Leser kann mehrere Bücher ausleihen.
-- Ein Buch kann von mehreren Lesern ausgeliehen werden (nacheinander).
-- Zusätzlich soll festgehalten werden, wie viele Tage ein Buch ausgeliehen wurde.
--
-- ERSTELLE FOLGENDE TABELLEN:
--   1. Tabelle "leser" für die Bibliotheksbenutzer
--   2. Tabelle "buch" für die Bücher
--   3. Tabelle "ausleihe" als Zwischentabelle mit N-zu-M-Beziehung
--
-- ============================================================================

-- HINWEIS: Lösche existierende Tabellen am Anfang (falls vorhanden)
DROP TABLE IF EXISTS ausleihe;
DROP TABLE IF EXISTS buch;
DROP TABLE IF EXISTS leser;

-- ============================================================================
-- AUFGABE 1: LESER-TABELLE (5 Punkte, ca. 5 Min.)
-- ============================================================================
-- Erstelle die Tabelle "leser" mit folgenden Anforderungen:
--   - id: INTEGER, PRIMARY KEY, AUTOINCREMENT
--   - name: TEXT, NOT NULL
--   - email: TEXT, NOT NULL, UNIQUE (jede Email darf nur einmal vorkommen)
--   - mitglied_seit: DATE (TEXT in SQLite), NOT NULL
--
CREATE TABLE leser (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    mitglied_seit TEXT NOT NULL
);


-- ============================================================================
-- AUFGABE 2: BUCH-TABELLE (5 Punkte, ca. 5 Min.)
-- ============================================================================
-- Erstelle die Tabelle "buch" mit folgenden Anforderungen:
--   - id: INTEGER, PRIMARY KEY, AUTOINCREMENT
--   - titel: TEXT, NOT NULL
--   - autor: TEXT, NOT NULL
--   - isbn: TEXT, UNIQUE (ISBN soll eindeutig sein, kann aber NULL sein falls unbekannt)
--   - erscheinungsjahr: INTEGER
--
CREATE TABLE buch (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    isbn TEXT UNIQUE,
    erscheinungsjahr INTEGER
);


-- ============================================================================
-- AUFGABE 3: AUSLEIHE-ZWISCHENTABELLE (20 Punkte, ca. 20 Min.)
-- ============================================================================
-- Erstelle die Tabelle "ausleihe" als Zwischentabelle für die N-zu-M-Beziehung.
--
-- ANFORDERUNGEN:
--   Spalten:
--   - leser_id: INTEGER, NOT NULL
--   - buch_id: INTEGER, NOT NULL
--   - ausleih_datum: DATE (TEXT), NOT NULL
--   - rueckgabe_datum: DATE (TEXT), kann NULL sein (noch nicht zurückgegeben)
--   - anzahl_tage: INTEGER, NOT NULL
--
--   Constraints:
--   - PRIMARY KEY: Zusammengesetzt aus (leser_id, buch_id, ausleih_datum)
--     ERKLÄRUNG: Derselbe Leser kann dasselbe Buch mehrfach ausleihen, 
--     aber zu unterschiedlichen Zeitpunkten!
--   
--   - FOREIGN KEY leser_id → leser(id):
--     * ON DELETE RESTRICT (Verhindere Löschen, wenn noch Ausleihen existieren)
--     * ON UPDATE CASCADE
--   
--   - FOREIGN KEY buch_id → buch(id):
--     * ON DELETE RESTRICT (Verhindere Löschen, wenn noch Ausleihen existieren)
--     * ON UPDATE CASCADE
--   
--   - CHECK: anzahl_tage muss größer als 0 sein
--
CREATE TABLE ausleihe (
    leser_id INTEGER NOT NULL,
    buch_id INTEGER NOT NULL,
    ausleih_datum TEXT NOT NULL,
    rueckgabe_datum TEXT,
    anzahl_tage INTEGER NOT NULL,
    PRIMARY KEY (leser_id, buch_id, ausleih_datum),
    FOREIGN KEY (leser_id) REFERENCES leser(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (buch_id) REFERENCES buch(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (anzahl_tage > 0)
);


-- ============================================================================
-- AUFGABE 4: INDEXE ERSTELLEN (5 Punkte, ca. 5 Min.)
-- ============================================================================
-- Erstelle sinnvolle Indexe für folgende Anwendungsfälle:
--
--   a) Schnelle Suche nach Leser-Namen
--   b) Schnelle Suche nach Buch-Titeln
--   c) Schnelle Abfrage: Welche Bücher sind aktuell ausgeliehen?
--      (rueckgabe_datum IS NULL)
--
-- ERKLÄRUNG: Begründe in einem Kommentar, warum jeder Index sinnvoll ist!
--
-- a) Schnelle Suche nach Leser-Namen
CREATE INDEX idx_leser_name ON leser(name);
-- Dieser Index beschleunigt Suchen nach Lesernamen, da Namen häufig abgefragt werden.

-- b) Schnelle Suche nach Buch-Titeln
CREATE INDEX idx_buch_titel ON buch(titel);
-- Dieser Index ermöglicht schnelle Suchen nach Buchtiteln, was bei der Buchsuche nützlich ist.

-- c) Schnelle Abfrage: Welche Bücher sind aktuell ausgeliehen? (rueckgabe_datum IS NULL)
CREATE INDEX idx_ausleihe_rueckgabe ON ausleihe(rueckgabe_datum);
-- Dieser Index beschleunigt Abfragen nach aktuell ausgeliehenen Büchern, da er die NULL-Werte in rueckgabe_datum filtert.


-- ============================================================================
-- AUFGABE 5: BEISPIELDATEN EINFÜGEN (5 Punkte, ca. 5 Min.)
-- ============================================================================
-- Füge folgende Testdaten ein:
--
-- LESER:
--   1, 'Max Mustermann', 'max@email.de', '2023-01-15'
--   2, 'Maria Musterfrau', 'maria@email.de', '2023-03-20'
--   3, 'Peter Schmidt', 'peter@email.de', '2024-01-10'
--
-- BÜCHER:
--   1, 'Der Herr der Ringe', 'J.R.R. Tolkien', '978-3608939791', 1954
--   2, 'Harry Potter 1', 'J.K. Rowling', '978-3551551679', 1997
--   3, 'Die Verwandlung', 'Franz Kafka', '978-3150099007', 1915
--   4, '1984', 'George Orwell', '978-3548234106', 1949
--
-- AUSLEIHEN:
--   Max hat "Der Herr der Ringe" am '2024-01-10' für 14 Tage ausgeliehen,
--   zurückgegeben am '2024-01-24'
--
--   Max hat "Harry Potter 1" am '2024-02-01' für 10 Tage ausgeliehen,
--   noch nicht zurückgegeben (rueckgabe_datum = NULL)
--
--   Maria hat "1984" am '2024-01-15' für 7 Tage ausgeliehen,
--   zurückgegeben am '2024-01-22'
--
--   Maria hat "Der Herr der Ringe" am '2024-02-05' für 21 Tage ausgeliehen,
--   noch nicht zurückgegeben
--
--   Peter hat "Die Verwandlung" am '2024-01-20' für 5 Tage ausgeliehen,
--   zurückgegeben am '2024-01-25'
--
INSERT INTO leser (id, name, email, mitglied_seit) VALUES
(1, 'Max Mustermann', 'max@email.de', '2023-01-15'),
(2, 'Maria Musterfrau', 'maria@email.de', '2023-03-20'),
(3, 'Peter Schmidt', 'peter@email.de', '2024-01-10');

INSERT INTO buch (id, titel, autor, isbn, erscheinungsjahr) VALUES
(1, 'Der Herr der Ringe', 'J.R.R. Tolkien', '978-3608939791', 1954),
(2, 'Harry Potter 1', 'J.K. Rowling', '978-3551551679', 1997),
(3, 'Die Verwandlung', 'Franz Kafka', '978-3150099007', 1915),
(4, '1984', 'George Orwell', '978-3548234106', 1949);

INSERT INTO ausleihe (leser_id, buch_id, ausleih_datum, rueckgabe_datum, anzahl_tage) VALUES
(1, 1, '2024-01-10', '2024-01-24', 14),
(1, 2, '2024-02-01', NULL, 10),
(2, 4, '2024-01-15', '2024-01-22', 7),
(2, 1, '2024-02-05', NULL, 21),
(3, 3, '2024-01-20', '2024-01-25', 5);


-- ============================================================================
-- AUFGABE 6: ABFRAGEN SCHREIBEN (10 Punkte, ca. 10 Min.)
-- ============================================================================
-- Schreibe SQL-Abfragen für folgende Fragestellungen:
--
-- a) Zeige alle Ausleihen mit Lesernamen, Buchtitel und Ausleihzeitraum
--    Sortiert nach Ausleihdatum (neueste zuerst)
--
-- b) Welche Bücher sind aktuell ausgeliehen? 
--    (Titel, Lesername, seit wann ausgeliehen)
--
-- c) Wie oft wurde jedes Buch insgesamt ausgeliehen?
--    (Titel + Anzahl der Ausleihen)
--
-- d) Welcher Leser hat die meisten Bücher insgesamt ausgeliehen?
--    (Hinweis: zähle alle Ausleihen pro Leser)
--
-- a) Zeige alle Ausleihen mit Lesernamen, Buchtitel und Ausleihzeitraum
--    Sortiert nach Ausleihdatum (neueste zuerst)
SELECT l.name AS lesername, b.titel AS buchtitel, a.ausleih_datum, a.rueckgabe_datum
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
JOIN buch b ON a.buch_id = b.id
ORDER BY a.ausleih_datum DESC;

-- b) Welche Bücher sind aktuell ausgeliehen? 
--    (Titel, Lesername, seit wann ausgeliehen)
SELECT b.titel, l.name AS lesername, a.ausleih_datum
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
JOIN buch b ON a.buch_id = b.id
WHERE a.rueckgabe_datum IS NULL;

-- c) Wie oft wurde jedes Buch insgesamt ausgeliehen?
--    (Titel + Anzahl der Ausleihen)
SELECT b.titel, COUNT(*) AS anzahl_ausleihen
FROM ausleihe a
JOIN buch b ON a.buch_id = b.id
GROUP BY b.id, b.titel;

-- d) Welcher Leser hat die meisten Bücher insgesamt ausgeliehen?
--    (Hinweis: zähle alle Ausleihen pro Leser)
SELECT l.name, COUNT(*) AS anzahl_ausleihen
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
GROUP BY l.id, l.name
ORDER BY anzahl_ausleihen DESC
LIMIT 1;


-- ============================================================================
-- BONUSAUFGABE (Optional, +5 Punkte)
-- ============================================================================
-- Erstelle eine VIEW (Sicht) namens "aktuelle_ausleihen", die alle 
-- aktuell ausgeliehenen Bücher mit Lesernamen, Buchtitel und Ausleihdatum zeigt.
--
CREATE VIEW aktuelle_ausleihen AS
SELECT l.name AS lesername, b.titel AS buchtitel, a.ausleih_datum
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
JOIN buch b ON a.buch_id = b.id
WHERE a.rueckgabe_datum IS NULL;