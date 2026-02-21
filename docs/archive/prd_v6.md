# PRD v6.0 (Detailed) — Monifactory Wiki Assistant

**Version:** 6.0  
**Date:** 2026-02-19  
**Status:** Draft (active)  
**Supersedes:** PRD v5.0  

## 1) Executive summary (the original one-page)

### Product in one sentence
A private, self-hosted Monifactory “one stop shop” wiki website (TypeScript docs site) that makes it easy to find the right answer fast, with Discord integration as a secondary interface.

### Why now
- Knowledge is scattered; users lose time searching and re-validating.
- The fastest path to value is a reliable, searchable, curated website that is easy to maintain.

### Target users
- New players: onboarding and “what do I do next” guidance.
- Power users: quick access to precise reference pages.
- Maintainers: fast curation workflow and low operational burden.

### Non-negotiables
- **Private/self-hosted first:** not publicly hosted; default deploy binds to localhost.
- **Repo is source of truth:** the wiki shell, static apps, and planning docs are version-controlled.
- **Curation over automation:** manual PR-reviewed imports.
- **No proprietary game asset redistribution:** do not ingest/republish vanilla/proprietary assets.

### Scope
**In scope (Now — Website-first)**
- Docusaurus “shell” site served by NGINX in Docker.
- The shell embeds a standalone wiki SPA and a planning dashboard.
- Information architecture improvements (sidebar, “start here” paths).
- Curated content growth loop (turn repeated questions into docs pages).
- Rolling docs changelog page: [What changed](what_changed.md).

**In scope (Secondary — Discord)**
- Discord bot that:
  - answers **only when it can cite** docs links,
  - suggests doc links from keywords,
  - creates GitHub Issues for missing topics.
- Restricted channels only.

**In scope (Later)**
- Assistant API (retrieval + grounded generation + citations).
- Automated ingestion/indexing.

**Out of scope (for now)**
- Accounts/SSO, personalization, complex admin UI.

### Core features (MVP set)
1) **Findability**
- Clear onboarding path (Start Here → Setup → Usage)
- Consistent page templates (Purpose → Steps → Common mistakes → Links)

2) **Curation workflow**
- A lightweight method to record “missing topic” requests (GitHub Issues).
- A repeatable way to turn issues/Discord threads into doc PRs.

3) **Operational simplicity**
- `docker build .` works on a clean machine.
- `docker compose up --build -d` runs the site locally.
  - Default URL: http://127.0.0.1:8080/

### Success metrics
- Users can reach the correct page in ≤ 2 clicks from the sidebar for top onboarding tasks.
- “What changed” stays current (at least weekly updates when docs change).
- Site can be deployed privately with one compose file and no external services.

### Roadmap
**10.0 Website foundation (Now)**
10.1 Confirm private hosting defaults (localhost bind)  
10.2 Improve sidebar/IA for onboarding-first flows  
10.3 Publish core page set (Start Here, Core Concepts, Early Game)  
10.4 Create/standardize page templates for new content

**20.0 Curation loop (Now)**
20.1 Define doc request labels + issue template  
20.2 Add contributor workflow: request → PR → “What changed” entry

**30.0 Discord integration (Secondary)**
30.1 Define bot commands + response format (short answer + citations)  
30.2 Missing-topic → GitHub Issue creation  
30.3 Restricted-channel rollout + basic rate limiting

**40.0 Assistant API (Later)**
40.1 Decide retrieval approach and grounding policy  
40.2 Implement `/ask` with citations once content baseline is strong

### Acceptance criteria (Now)
- Website builds and serves locally and privately via Docker/compose.
- Navigation provides an obvious “Start Here” path.
- Maintainers have a documented workflow to capture missing topics and convert them into docs.

---

## 2) Problem statement

Monifactory knowledge exists across long guides, evolving “best practices”, and repeated Q&A threads. The result is that:
- New players stall because they cannot quickly determine the next correct step.
- Power users lose time re-validating details (especially when updates change patterns).
- Maintainers repeat themselves and cannot systematically turn Q&A into durable documentation.

This project solves that by making the docs the canonical source of truth, making them easy to serve privately, and then layering in assisted Q&A that always points back to sources.

## 3) Goals and non-goals

### 3.1 Goals
- **Fast findability:** the “right page” is discoverable quickly.
- **High trust:** content and assistant outputs are grounded in the docs.
- **Low ops burden:** the site is easy to build and run in Docker.
- **Sustainable growth:** repeated questions become pages, and changes are tracked.

### 3.2 Non-goals (explicitly not building)
- Public hosting, public user accounts, personalization.
- A complex admin UI.
- A “general AI chatbot” that answers without citations.
- Redistribution of proprietary/vanilla assets.

## 4) Personas and primary use cases

### 4.1 Personas
- **New Player (Onboarding):** needs an opinionated path and common error fixes.
- **Power User (Reference):** wants quick, precise reference pages.
- **Maintainer (Curator):** turns repeated questions into docs and keeps nav consistent.
- **Support/Moderator:** wants fast, linkable answers for a restricted community.

### 4.2 Top use cases
Website:
- Browse: follow a “Start Here” path to get running.
- Search: type a phrase and land on the correct section.
- Share: copy stable links to pages/sections.

Discord (secondary):
- Ask: get a short answer **only when it can cite docs**.
- Suggest: get doc links from keywords.
- Capture: file missing topics into GitHub Issues.

Assistant (sooner than project completion, phased):
- Ask in the website UI and get grounded answers with source links.
- Avoid hallucinations: if the docs can’t support it, say so.

## 5) Product scope (detailed)

### 5.1 In scope — Website-first (MVP)
- Docusaurus shell under `site/`.
- Standalone static apps in `site/static/` (wiki SPA, dashboard, PRD viewer).
- Clear information architecture: onboarding-first nav and topic hubs.
- Page templates to make new pages consistent.
- “What changed” as the living changelog.
- Private local deployment via Docker/compose (bind to localhost by default).

### 5.2 In scope — Discord integration (secondary)
- A Discord bot deployed in restricted channels.
- Bot responses must include doc links; no citations = no answer.
- “Missing topic” → GitHub Issue creation.

### 5.3 In scope — Assistant/Q&A on the website (phased, earlier than end)
Phase A (retrieval-ready):
- A stable process to retrieve the right sources (indexing + evaluation set).

Phase B (assistant MVP):
- Ask UI + grounded answers + citations + fallback behavior.

Phase C (hardening):
- Regression evaluation and guardrails so quality doesn’t drift.

### 5.4 Out of scope
- Public SaaS hosting.
- User accounts.
- Uploading arbitrary files as sources (docs-only at first).

## 6) Functional requirements

### 6.1 Documentation and content system
- Planning and reference docs live in `docs/` and `context/` as Markdown.
- The served site is the Docusaurus shell under `site/`.
- Shell navigation is maintained in `site/docusaurus.config.ts` and route pages under `site/src/pages/`.
- New pages follow a consistent template (purpose → steps → common mistakes → links).
- Cross-links use relative links.

### 6.2 Website UX (SPA)
- Users can browse pages by sidebar navigation.
- Users can search and open results into the doc reader.
- Pages have reliable URLs.
- Clear empty states: no results, missing page, load failure.

### 6.3 Search
- Search supports simple keyword queries.
- Results include the page and (where possible) the section.
- Search performance is acceptable for local usage.

### 6.4 Discord bot (secondary)
- Commands and responses are short and consistent.
- Bot posts doc links; refuses when sources are insufficient.
- Bot can file a GitHub Issue for missing topics.

### 6.5 Website Assistant/Q&A
- Q&A UI exists on the website.
- Answers are grounded in retrieved docs content.
- Every answer includes source links to pages/sections.
- Clear refusal / “not enough info” behavior.
- Rate limiting / cost controls exist so it can’t be abused.

## 7) Non-functional requirements

### 7.1 Privacy and hosting
- Default hosting is private and binds to localhost (no accidental public exposure).
- Logs must not include secrets.

### 7.2 Maintainability
- Content edits are simple Markdown changes.
- Build/run steps are documented and reproducible.

### 7.3 Reliability
- Health checks exist for the deployed container.
- A broken docs build is caught before release.

### 7.4 Security
- No proprietary asset redistribution.
- Dependencies are pinned/managed in a normal Node workflow.

### 7.5 Performance
- Page loads are fast locally.
- Search results appear quickly for typical queries.

## 8) Success metrics (detailed)

MVP (website):
- On the top onboarding tasks, users reach the correct page in ≤ 2 clicks from the sidebar.
- Common startup questions are answered by a doc page with a stable link.

Assistant MVP:
- Answers include citations/links or refuse.
- A small “golden questions” set is maintained and run as a regression check.

Operations:
- A clean machine can run `docker compose up --build -d` successfully.

## 9) Milestones and exit criteria

### M1 — Website MVP live
Exit criteria:
- Site builds in Docker and serves locally.
- Sidebar has a clear onboarding-first flow.
- Core page set exists (Start Here + Setup + Usage + early game/core concepts).

### M2 — Retrieval-ready
Exit criteria:
- There is a defined evaluation set (golden questions).
- Retrieval can be measured (pass/fail, plus basic telemetry).

### M3 — Assistant MVP live
Exit criteria:
- Website Q&A UI exists.
- Assistant answers are grounded and cite sources.
- Refusal behavior is present.
- Basic cost/abuse controls are in place.

### M4 — Hardening complete
Exit criteria:
- Regression checks exist and run consistently.
- Operational runbook exists and is accurate.

## 10) Risks and mitigations

- **Risk: assistant hallucination reduces trust.**
  - Mitigation: citations required; refusal behavior; regression golden set.

- **Risk: docs sprawl / inconsistent structure.**
  - Mitigation: templates, nav rules, review checklist, and “What changed”.

- **Risk: private hosting accidentally exposed.**
  - Mitigation: bind to localhost by default; document how to change it intentionally.

- **Risk: Discord bot becomes a general chatbot.**
  - Mitigation: “no citations = no answer”; restricted channels.

## 11) Open items (tracked outside the PRD)

The following should be tracked in separate documents/logs so the PRD stays stable:
- Detailed schedule and owners (IMS, RACI)
- Risks/issues/dependencies (RAID)
- Assistant evaluation thresholds and cost guardrails
