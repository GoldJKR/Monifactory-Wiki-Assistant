# Documentation Hub (Single Source of Truth)

Last Updated: 2026-02-21
Status: Active

Use this folder as the only canonical documentation source.

Alignment source: `PRD.md` (technical full-scope PRD).

## Canonical Files
- `docs/README.md` — index and usage rules
- `docs/PRODUCT.md` — scope, roadmap, milestones, success criteria
- `docs/EXECUTION.md` — execution model, run packet, QA baseline
- `docs/CONTENT.md` — information architecture, template, writing rules
- `docs/OPERATIONS.md` — runtime, validation, maintenance, release safety
- `docs/CHANGELOG.md` — compact decisions and notable changes

## Structure Rules
- Keep docs compact and bullet-first.
- Prefer appending to canonical files over creating new standalone plans.
- Create a new doc only when a topic cannot fit cleanly in the six canonical files.
- Remove duplicated legacy docs instead of archiving them.
- Mark planned/backlog scope explicitly; do not present it as implemented behavior.

## Truthfulness Contract
- Implemented claims must map to concrete repository artifacts.
- Planned claims must be labeled as planned and tied to roadmap/backlog context.
- `docs/archive/prd_v6.md` is preserved historical content and not the active technical source of truth.
