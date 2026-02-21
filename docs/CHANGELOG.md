# Documentation Changelog & Decisions (Canonical)

Last Updated: 2026-02-21
Status: Active

## Entry Format
- Date: YYYY-MM-DD
- Type: Change | Decision | Release
- Summary: one sentence
- Rationale: why the change happened
- Impact: what changed for contributors/users
- Evidence: file paths, issue links, or commit refs

## Latest Entries
- Date: 2026-02-21
  - Type: Decision
  - Summary: Consolidated documentation into a single canonical source under `docs/`.
  - Rationale: Remove drift between legacy split documentation sets and keep planning compact.
  - Impact: Active governance now lives in six canonical docs; consolidated legacy files were removed.
  - Evidence: `docs/README.md`, `docs/PRODUCT.md`, `docs/EXECUTION.md`, `docs/CONTENT.md`, `docs/OPERATIONS.md`.

- Date: 2026-02-21
  - Type: Decision
  - Summary: Created dedicated `sources/` folder for external links and evidence artifacts.
  - Rationale: Separate external source material from canonical documentation.
  - Impact: External references moved out of docs governance flow.
  - Evidence: `sources/README.md`, `sources/external_links.md`, `sources/configs/`.

- Date: 2026-02-21
  - Type: Decision
  - Summary: Aligned canonical docs language to technical PRD implemented/planned scope boundaries.
  - Rationale: Prevent planned roadmap content from being presented as implemented functionality.
  - Impact: Canonical docs now consistently separate current runtime behavior from backlog phases.
  - Evidence: `docs/PRD.md`, `docs/README.md`, `docs/PRODUCT.md`, `docs/EXECUTION.md`, `docs/CONTENT.md`, `docs/OPERATIONS.md`.
