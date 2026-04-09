
die lösungen

versuche den code zu verstehen vro (ja du)

create table leser(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    mitglied_seit TEXT NOT NULL
);

CREATE TABLE buch (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    isbn TEXT UNIQUE,
    erscheinungsjahr INTEGER
);

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

-- Index für Leser-Namen: Beschleunigt Suchen nach Lesernamen in der leser-Tabelle.
CREATE INDEX idx_leser_name ON leser(name);

-- Index für Buch-Titel: Beschleunigt Suchen nach Buchtiteln in der buch-Tabelle.
CREATE INDEX idx_buch_titel ON buch(titel);

-- Index für Rückgabedatum: Ermöglicht effiziente Abfragen für aktuell ausgeliehene Bücher (rueckgabe_datum IS NULL).
CREATE INDEX idx_ausleihe_rueckgabe_datum ON ausleihe(rueckgabe_datum);

SELECT l.name AS leser_name, b.titel AS buch_titel, a.ausleih_datum, a.rueckgabe_datum
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
JOIN buch b ON a.buch_id = b.id
ORDER BY a.ausleih_datum DESC;

-- b)
SELECT b.titel AS buch_titel, l.name AS leser_name, a.ausleih_datum
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
JOIN buch b ON a.buch_id = b.id
WHERE a.rueckgabe_datum IS NULL;

-- c)
SELECT b.titel AS buch_titel, COUNT(*) AS anzahl_ausleihen
FROM ausleihe a
JOIN buch b ON a.buch_id = b.id
GROUP BY b.id, b.titel;

-- d)
SELECT l.name AS leser_name, COUNT(*) AS anzahl_ausleihen
FROM ausleihe a
JOIN leser l ON a.leser_id = l.id
GROUP BY l.id, l.name
ORDER BY anzahl_ausleihen DESC
LIMIT 1;