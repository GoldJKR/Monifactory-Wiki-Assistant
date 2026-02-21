# Monifactory Wiki Assistant

A private, self-hosted Monifactory wiki “shell” that serves:
- the wiki SPA,
- a planning dashboard,
- a one-page PRD viewer.

## Quick Start

### Prerequisites
- Docker + Docker Compose

### Run (Docker)

```bash
./scripts/site_start.sh
```

Open:
- http://127.0.0.1:8080/
- http://127.0.0.1:8080/dashboard
- http://127.0.0.1:8080/prd.html

To stop:

```bash
./scripts/site_stop.sh
```

### Privacy default
The service binds to `127.0.0.1` by default (see `docker-compose.yml`).

## Project Structure

```
.
├── docker-compose.yml
├── Dockerfile
├── scripts/                # start/stop/status/logs
├── docs/                   # single canonical documentation source
│   ├── README.md           # compact documentation hub
│   ├── PRODUCT.md          # scope, roadmap, milestones
│   ├── EXECUTION.md        # WBS/queue/run packet/QA policy
│   ├── CONTENT.md          # information architecture + writing template
│   ├── OPERATIONS.md       # runtime + maintenance + release safety
│   └── CHANGELOG.md        # decisions + notable changes
│   ├── PRD.md              # technical full-scope PRD (active)
│   └── archive/            # archived legacy docs
├── sources/                # external/supporting sources and evidence
│   ├── configs/            # minimal redacted config evidence
│   └── external_links.md   # "Further reading" URLs + notes
├── site/                   # Docusaurus shell
│   ├── src/pages/          # iframe shell routes (/ and /dashboard)
│   └── static/             # wiki-app.html, dashboard.html, prd.html, prd_v6.md
```

## Implemented Surfaces

These endpoints are present in the current repository runtime:

- `/` → shell page embedding `site/static/wiki-app.html`
- `/dashboard` → shell page embedding `site/static/dashboard.html`
- `/prd.html` → one-page PRD viewer from `site/static/prd.html`
- `/wiki-app.html` and `/dashboard.html` → standalone static app surfaces

## Documentation Model (Current)

- Canonical governance/product/ops docs are the six files in `docs/`.
- External/supporting material is separated under `sources/`.
- Legacy consolidated folders (`context/`, `evidence/`, `docs/archive/`) are intentionally removed.

## Planned Scope (Not Yet Guaranteed in Code)

Planned phases are tracked in canonical docs and technical PRD, including:
- retrieval-ready package,
- assistant MVP and hardening,
- expanded QA/metrics/release gates.

## Legacy PRD Reference

- Historical PRD v6 content is preserved at `docs/archive/prd_v6.md`.

## Prior Vision Snapshot (Historical)

The table below captures legacy target content categories and is retained for historical planning context.

| Tab | Content |
|-----|---------|
| Getting Started | Installation, pack modes overview, first steps |
| Pack Modes | 20 feature flags with Normal/Hard/Expert truth table |
| Progression | 4-stage Normal mode guide (ULV → Creative Chest) |
| Systems | 8 Monifactory-exclusive systems (Steam Foundry, HNN, Microminer, etc.) |
| Machines | 6 machine category pages |
| Ores & Materials | Ore index + processing chains |
| Recipes | GT CEu, Crafting Table, Extended Crafting, mode-gated recipes |
| Power & Storage | EU voltage tiers, RF↔EU conversion, AE2, LaserIO |
| Worldgen | Ore vein distribution, Lost Cities |
| Optional Mods | 9 optional compat mods |
| Reference | Glossary, FAQ, Known Issues, Mod List, Questbook Colors, Changelog |

