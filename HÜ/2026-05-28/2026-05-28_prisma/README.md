# 2026-05-28_prisma

Dieses Verzeichnis enthält das heutige Prisma-Datenmodell.

## Setup

1. `deno init` ist hier vorbereitet.
2. `deno add npm:prisma@6`
3. `deno add npm:@prisma/client@6`
4. Prisma-Client generieren:
   `deno run -A prisma generate --schema=prisma/schema.prisma`

## Start

- `deno task dev`
- oder `deno run --allow-read --allow-write seed.ts`

## Aufgabe

- Ergänze das Modell in `prisma/schema.prisma`.
- Füge Beispiel-Daten in `seed.ts` hinzu.
