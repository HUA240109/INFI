import { PrismaClient } from "model";

const prisma = new PrismaClient();

await prisma.nutzer.create({
  data: {
    benutzername: "max",
    email: "max@example.com",
    premium: true,
    playlists: {
      create: [
        {
          name: "Meine Lieblingssongs",
          erstellungsdatum: new Date(),
          songs: {
            create: [
              { titel: "Song A", interpret: "Band A", dauerSek: 210 },
              { titel: "Song B", interpret: "Band B", dauerSek: 185 }
            ]
          }
        }
      ]
    }
  }
});

console.log("Seed-Daten wurden geschrieben.");
