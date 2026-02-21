# Monifactory Wiki Assistant — Technical Product Requirements Document

Last Updated: 2026-02-21  
Status: Active

## 1. Purpose

Define the technical product requirements for the Monifactory Wiki Assistant repository, using only repository-verifiable statements plus explicitly labeled planned scope.

This PRD governs the project at the system level. It does not replace the legacy PRD content in `docs/archive/prd_v6.md`.

## 2. Document Guarantees

- `docs/archive/prd_v6.md` is preserved in its original tracked form and remains available for historical/reference use.
- This PRD is technical-first and separates:
	- **Implemented (repo-verified)** requirements,
	- **Planned (not yet implemented)** requirements.

## 3. System Context

### 3.1 Product Definition

Monifactory Wiki Assistant is a private, Docker-hosted documentation shell that serves:
- a standalone wiki SPA (`/wiki-app.html`),
- a planning dashboard (`/dashboard.html`),
- a one-page PRD viewer (`/prd.html`),
through a Docusaurus shell and NGINX runtime.

### 3.2 Deployment Boundary

- Runtime service: `wiki` in `docker-compose.yml`.
- Container port: `80`.
- Host bind default: `127.0.0.1:8080:80` (local-only by default).

## 4. Repository Architecture (Implemented)

### 4.1 Build and Runtime Stack

- Build stage uses `node:20-alpine` and runs `npm run build` in `site/`.
- Runtime stage uses `nginx:alpine`.
- NGINX config is supplied via `nginx/default.conf`.
- Static output from Docusaurus build is copied into `/usr/share/nginx/html`.

### 4.2 Routing Behavior

- Root route uses SPA fallback: `try_files $uri $uri/ /index.html`.
- `absolute_redirect off;` is enabled to preserve host/port during redirects.

### 4.3 Docusaurus Shell Contract

- `docs` plugin is disabled (`docs: false`).
- `pages` plugin is enabled and serves routes from `site/src/pages`.
- Active shell routes:
	- `/` embeds `/wiki-app.html` via iframe,
	- `/dashboard` embeds `/dashboard.html` via iframe.
- Navbar includes links to `Wiki`, `Dashboard`, `PRD`, and `Standalone SPA`.

### 4.4 Operations Scripts

Repository includes operational scripts:
- `scripts/site_start.sh`
- `scripts/site_stop.sh`
- `scripts/site_status.sh`
- `scripts/site_logs.sh`

Each script resolves Docker Compose command compatibility (`docker compose` preferred, fallback `docker-compose`).

## 5. Documentation Governance Model (Implemented)

### 5.1 Canonical Documentation Source

Canonical source is the compact six-file set under `docs/`:
- `docs/README.md`
- `docs/PRODUCT.md`
- `docs/EXECUTION.md`
- `docs/CONTENT.md`
- `docs/OPERATIONS.md`
- `docs/CHANGELOG.md`

### 5.2 External Source Separation

Supporting artifacts are separated under `sources/`:
- `sources/external_links.md`
- `sources/configs/README.md`
- `sources/configs/SOURCES.md`

### 5.3 Consolidation Policy

- Legacy consolidated folders `context/`, `evidence/`, and `docs/archive/` are removed from active structure.
- New governance/process additions should extend canonical docs first rather than reintroducing parallel plan trees.

## 6. Functional Requirements

### 6.1 FR-Implemented (Current)

- FR-I-01: Build the Docusaurus shell into static output with `npm run build` from `site/`.
- FR-I-02: Serve built output from NGINX through Docker Compose as a single service.
- FR-I-03: Expose shell and embedded app surfaces at `/`, `/dashboard`, `/wiki-app.html`, `/dashboard.html`, and `/prd.html`.
- FR-I-04: Keep local deployment private-by-default via loopback bind.
- FR-I-05: Provide start/stop/status/log operator scripts for local lifecycle management.
- FR-I-06: Provide issue intake template for questbook capture at `.github/ISSUE_TEMPLATE/questbook-capture.yml`.
- FR-I-07: Maintain canonical documentation in compact `docs/` structure and keep external supporting data in `sources/`.

### 6.2 FR-Planned (Documented, Not Yet Guaranteed in Code)

The following are documented in canonical docs and are roadmap scope, not implementation guarantees at this time:
- FR-P-01: Retrieval-ready package and evaluation loop.
- FR-P-02: Assistant MVP with grounded answers and hardening phases.
- FR-P-03: Expanded QA/metrics/release gate execution beyond current shell operations.

Planned scope should be treated as backlog until concrete implementation artifacts exist.

## 7. Non-Functional Requirements

### 7.1 Privacy and Exposure

- NFR-01: Default deployment must remain non-public by binding host interface to `127.0.0.1`.

### 7.2 Reproducibility

- NFR-02: Containerized build/runtime must remain derivable from repository-contained Docker and site config.

### 7.3 Operational Ergonomics

- NFR-03: Common operator actions (start/stop/status/logs) must remain script-accessible.

### 7.4 Configuration Integrity

- NFR-04: Reverse-proxy redirect behavior must preserve host/port in local non-80 deployments (`absolute_redirect off`).

### 7.5 Documentation Integrity

- NFR-05: Canonical documentation must avoid split-brain sources and duplicate governance tracks.

## 8. Interfaces and Contracts

### 8.1 Runtime Interface

- Protocol: HTTP
- Host/Port default: `127.0.0.1:8080`
- Main shell endpoints:
	- `/`
	- `/dashboard`
	- `/prd.html`
	- `/wiki-app.html`
	- `/dashboard.html`

### 8.2 Governance Interface

Execution policy contract lives in `docs/EXECUTION.md` and includes:
- queue model (`Q1`-`Q11`),
- run packet requirements,
- QA baseline identifiers (`T1`-`T11`).

## 9. Validation and Acceptance

### 9.1 Current Acceptance Baseline

The project is considered operationally acceptable when:
- service builds and starts via Docker workflow,
- shell routes and embedded pages are reachable,
- operator scripts execute without contract regressions,
- canonical docs remain internally consistent.

### 9.2 Known Validation Limitation

In this environment snapshot, recent local `docker compose up --build -d` attempts reported non-zero exit; root cause is not asserted in this PRD without additional logs.

## 10. Risks and Controls

- R-01: Documentation drift across multiple sources.
	- Control: six-file canonical docs model.
- R-02: Local deploy regressions from Docker/Compose differences.
	- Control: Compose command fallback logic in scripts.
- R-03: Redirect/route behavior inconsistencies on non-default ports.
	- Control: explicit NGINX redirect policy and SPA fallback.
- R-04: Planned-scope confusion presented as implemented feature.
	- Control: explicit separation of implemented vs planned requirements in this PRD.

## 11. Out of Scope (Current)

- Public hosting as default behavior.
- Multi-tenant/user-account platform features.
- Any claim requiring proprietary/vanilla asset redistribution.

## 12. Traceability Map

- Runtime and network binding: `docker-compose.yml`
- Build/runtime images: `Dockerfile`
- Reverse proxy behavior: `nginx/default.conf`
- Shell routing/navigation: `site/docusaurus.config.ts`, `site/src/pages/index.tsx`, `site/src/pages/dashboard.tsx`
- Local operations: `scripts/site_start.sh`, `scripts/site_stop.sh`, `scripts/site_status.sh`, `scripts/site_logs.sh`
- Canonical governance docs: `docs/README.md`, `docs/PRODUCT.md`, `docs/EXECUTION.md`, `docs/CONTENT.md`, `docs/OPERATIONS.md`, `docs/CHANGELOG.md`
- External/source evidence model: `sources/README.md`, `sources/external_links.md`, `sources/configs/README.md`, `sources/configs/SOURCES.md`
- Historical PRD preserved: `docs/archive/prd_v6.md`
