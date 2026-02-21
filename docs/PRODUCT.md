# Product Documentation (Canonical)

Last Updated: 2026-02-21
Status: Active

## Purpose
- Build and maintain a private, self-hosted Monifactory wiki assistant.
- Keep operational and governance guidance accurate, compact, and easy to execute.
- Treat repository docs in this folder as the single source of truth.

## Scope (Implemented)
- Private local-first website shell served via Docker.
- Shell surfaces for wiki app, dashboard, and PRD viewer.
- Canonical six-file documentation model plus separated `sources/` evidence model.

## Scope (Planned)
- Retrieval-ready package and evaluation loop.
- Assistant MVP and hardening phases.
- Expanded QA/metrics/release gates beyond current shell baseline.

## Out of Scope (Current)
- Public hosting and multi-tenant deployments.
- Heavy feature expansion before core docs are stable.
- Proprietary/vanilla asset redistribution.

## MVP Success Criteria
- Runtime is reproducible with documented start/stop/status flow.
- Shell endpoints are reachable and operational checks are executable.
- Governance and change history remain synchronized.

## Roadmap (Condensed)
- Phase 1: Stable shell + core docs + QA baseline.
- Phase 2: Retrieval-ready package and evaluation loop.
- Phase 3: Assistant MVP and hardening.
- Phase 4: Deferred upgrades after stable operations.

## Milestone Gates
- M1: Local runtime stable.
- M2: Documentation and plans aligned.
- M3: Core documentation baseline ready.
- M4: Retrieval-ready package validated.
- M5: Assistant MVP validated with grounding rules.
- M6: Hardening, rollback, and routine release readiness.

## Alignment Notes
- Active technical requirements are defined in `PRD.md`.
- `docs/archive/prd_v6.md` remains preserved historical PRD content.

## Core Doc Set Required Before Active Development
- `docs/README.md`
- `docs/PRODUCT.md`
- `docs/EXECUTION.md`
- `docs/CONTENT.md`
- `docs/OPERATIONS.md`
- `docs/CHANGELOG.md`
