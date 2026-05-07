import { assertEquals } from "@std/assert";
import * as sqlite from "@db/sqlite";

const db = new sqlite.Database("opentrivia.db");

function checkSql(sql: string, filename: string) {
    if (!sql) {
        throw new Error(`${filename} ist leer`);
    }
    if (!sqlite.isComplete(sql)) {
        throw new Error(`${filename} enthält fehlerhaftes SQL`);
    }
}

Deno.test("a.sql", (tc) => {
    const answer = [{ anzahl: 4741 }];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("b.sql", (tc) => {
    const answer = [
        { name: "Animals" },
        { name: "Art" },
        { name: "Celebrities" },
        { name: "Entertainment: Board Games" },
        { name: "Entertainment: Books" },
        { name: "Entertainment: Cartoon & Animations" },
        { name: "Entertainment: Comics" },
        { name: "Entertainment: Film" },
        { name: "Entertainment: Japanese Anime & Manga" },
        { name: "Entertainment: Music" },
        { name: "Entertainment: Musicals & Theatres" },
        { name: "Entertainment: Television" },
        { name: "Entertainment: Video Games" },
        { name: "General Knowledge" },
        { name: "Geography" },
        { name: "History" },
        { name: "Mythology" },
        { name: "Politics" },
        { name: "Science & Nature" },
        { name: "Science: Computers" },
        { name: "Science: Gadgets" },
        { name: "Science: Mathematics" },
        { name: "Sports" },
        { name: "Vehicles" },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("c.sql", (tc) => {
    const answer = [{ anzahl: 717 }];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("d.sql", (tc) => {
    const answer = [
        { difficulty: "medium", anzahl: 2165 },
        { difficulty: "easy", anzahl: 1588 },
        { difficulty: "hard", anzahl: 988 },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("e.sql", (tc) => {
    const answer = [
        {
            question:
                "During the  early parts of the Vietnam War the M16 had a record for having bad reliability",
            answer: "True",
        },
        {
            question:
                "Which of the following cellular device companies is NOT headquartered in Asia?",
            answer: "Nokia",
        },
        {
            question:
                "Which of the following is the standard THX subwoofer crossover frequency?",
            answer: "80 Hz",
        },
        {
            question: "Which of the following is used to measure blood pressure?",
            answer: "Sphygmomanometer",
        },
        {
            question: "Which round does a WW2 M1 Garand fire?",
            answer: ".30-06",
        },
        {
            question: "Who built the first laser?",
            answer: "Theodore Harold Maiman",
        },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("f.sql", (tc) => {
    const answer = [
        { kategorie: "Entertainment: Video Games", anzahl: 1106 },
        { kategorie: "Entertainment: Music", anzahl: 419 },
        { kategorie: "General Knowledge", anzahl: 401 },
        { kategorie: "History", anzahl: 352 },
        { kategorie: "Geography", anzahl: 300 },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("g.sql", (tc) => {
    const answer = [
        {
            question:
                "&quot;Stadium of Light&quot; is the home stadium for which soccer team?",
            answer: "Sunderland FC",
        },
        {
            question:
                "How many players are there in an association football/soccer team?",
            answer: "11",
        },
        {
            question:
                "How many points did LeBron James score in his first NBA game?",
            answer: "25",
        },
        {
            question:
                "How many soccer players should be on the field at the same time?",
            answer: "22",
        },
        {
            question:
                "In Baseball, how many times does the ball have to be pitched outside of the strike zone before the batter is walked?",
            answer: "4",
        },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("h.sql", (tc) => {
    const answer = [
        { answer: "Kimi Raikkonen" },
        { answer: "Lewis Hamilton" },
        { answer: "Sebastian Vettel" },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("i.sql", (tc) => {
    const answer = [
        {
            question:
                "What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?",
            answer: "Grand Banks",
            type: "correct",
        },
        {
            question:
                "What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?",
            answer: "Great Barrier Reef",
            type: "wrong",
        },
        {
            question:
                "What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?",
            answer: "Hudson Bay",
            type: "wrong",
        },
        {
            question:
                "What is the name of the formerly rich fishing grounds off the island of Newfoundland, Canada?",
            answer: "Mariana Trench",
            type: "wrong",
        },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});

Deno.test("j.sql", (tc) => {
    const answer = [
        { answer: "3", anzahl: 40 },
        { answer: "5", anzahl: 40 },
        { answer: "6", anzahl: 38 },
    ];
    const sql = Deno.readTextFileSync(tc.name);
    checkSql(sql, tc.name);
    const result = db.prepare(sql).all();
    assertEquals(result, answer);
});
