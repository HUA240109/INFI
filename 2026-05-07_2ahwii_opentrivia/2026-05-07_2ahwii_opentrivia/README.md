# Praktische Leistungsfeststellung – SQL

## 2ahwii – 7. Mai 2026

**Datenbank**: `opentrivia.db` (Open Trivia Database – Quizfragen)

In die jeweiligen (am Anfang leeren) Dateien `a.sql`, `b.sql` usw. sind die
entsprechenden SQL-Lösungen einzutragen.

**Selbstkontrolle**: Im Terminal – wechsle in dieses Verzeichnis – das Kommando
`deno task test` zeigt Dir, welches SQL bereits richtig ist.

**Schwierigkeit**: Die Aufgaben sind unterschiedlich schwer, suche Dir zu Beginn
die, welche Dir leicht fallen.

**Beurteilung**: positiv ab 6 grünen Tests.

---

## Tabellenübersicht

| Tabelle | Beschreibung |
|---------|-------------|
| `Question` | Quizfragen (`id`, `question`, `correct_answer_id`, `categoryId`, `difficultyId`, `typeId`) |
| `Category` | Kategorien (`id`, `name`, `opentdb_id`) – z.B. "Sports", "Geography" |
| `Difficulty` | Schwierigkeitsgrade (`id`, `level`) – "easy", "medium", "hard" |
| `Type` | Fragentypen (`id`, `type`) – "multiple", "boolean" |
| `Answer` | Antworten (`id`, `answer`) |
| `_IncorrectAnswers` | Falsche Antworten pro Frage (`A` = Answer-ID, `B` = Question-ID) |

---

## Aufgabe a.sql: Wie viele Fragen gibt es? (★)

Wie viele Fragen enthält die Tabelle `Question` insgesamt?

Spaltenbenennung: `anzahl`.

## Aufgabe b.sql: Alle Kategorien (★)

Gib alle Kategorienamen aus, sortiert alphabetisch aufsteigend.

Spaltenbenennung: `name`.

## Aufgabe c.sql: Boolean-Fragen zählen (★)

Wie viele Fragen haben den Typ "boolean"?

Spaltenbenennung: `anzahl`.

## Aufgabe d.sql: Fragen pro Schwierigkeitsgrad (★)

Gib die Schwierigkeitsstufe und die Anzahl der Fragen pro Stufe aus.
Sortiere nach Anzahl absteigend.

Spaltenbenennung: `difficulty`, `anzahl`.

## Aufgabe e.sql: Harte Gadget-Fragen (★★)

Gib den Fragentext und die richtige Antwort für alle "hard"-Fragen aus der
Kategorie "Science: Gadgets" aus. Sortiere nach Fragentext aufsteigend.

Spaltenbenennung: `question`, `answer`.

## Aufgabe f.sql: Große Kategorien (★★)

Welche Kategorien haben **mindestens 300** Fragen? Gib den Kategorienamen und
die Anzahl aus. Sortiere nach Anzahl absteigend.

Spaltenbenennung: `kategorie`, `anzahl`.

## Aufgabe g.sql: Leichte Sportfragen (★★)

Gib den Fragentext und die richtige Antwort der ersten 5 "easy"-Fragen aus der
Kategorie "Sports" aus. Sortiere nach Fragentext aufsteigend.

Spaltenbenennung: `question`, `answer`.

## Aufgabe h.sql: Falsche Antworten (★★★)

Gib alle falschen Antworten (als Text) zur Frage
"Who won the 2018 Monaco Grand Prix?" aus. Sortiere alphabetisch aufsteigend.

Spaltenbenennung: `answer`.

## Aufgabe i.sql: Alle Antworten einer Frage (★★★)

Die Frage lautet: "What is the name of the formerly rich fishing grounds off
the island of Newfoundland, Canada?"

Gib zu dieser Frage **alle** Antworten (richtig und falsch) aus – jede Antwort
in einer eigenen Zeile. Markiere mit der Spalte `type`:
`'correct'` für die richtige Antwort, `'wrong'` für falsche Antworten.

Sortiere nach `type` aufsteigend, dann nach `answer` aufsteigend.

Spaltenbenennung: `question`, `answer`, `type`.

**Tipp**: `UNION ALL` kombiniert die Ergebnisse zweier SELECT-Abfragen.

## Aufgabe j.sql: Häufigste falsche Antworten (★★★)

Gib die **3** am häufigsten vorkommenden falschen Antworten aus, ausgenommen
"True" und "False". Sortiere nach Häufigkeit absteigend, bei Gleichstand
alphabetisch aufsteigend.

Spaltenbenennung: `answer`, `anzahl`.

---

### Punkteschlüssel

Bei jeder Aufgabe sind 4 Punkte möglich (insgesamt 40 Punkte).

```text
  ____       _                ____      _ _                           _
 / ___|_   _| |_ ___  ___    / ___| ___| (_)_ __   __ _  ___ _ __    | |
| |  _| | | | __/ _ \/ __|  | |  _ / _ \ | | '_ \ / _` |/ _ \ '_ \   | |
| |_| | |_| | ||  __/\__ \  | |_| |  __/ | | | | | (_| |  __/ | | |  |_|
 \____|\__,_|\__\___||___/   \____|\___|_|_|_| |_|\__, |\___|_| |_|  (_)
                                                   |___/
```
