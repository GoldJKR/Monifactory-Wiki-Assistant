# Full Context Work Breakdown Structure (WBS)

Last Updated: 2026-02-21  
Status: Active

This document is the detailed delivery decomposition for the Monifactory Wiki Assistant and is aligned to `docs/PRD.md` and `docs/EXECUTION.md`.

## WBS Scope Contract

- `1.x` covers currently implemented runtime/documentation baseline work.
- `2.x`-`11.x` define planned/backlog execution tracks unless implemented artifacts are merged.
- Every story should map to one primary validation gate and one handoff target.

## WBS Hierarchy

| WBS ID | Level | Work Package | Scope Type | Primary Output | Validation Gate |
|---|---|---|---|---|---|
| 1.0 | Epic | Platform Runtime Baseline | Implemented | Local shell runtime and operator scripts | T1-T7 |
| 1.1 | Feature | Docker Build/Serve Pipeline | Implemented | Reproducible build + NGINX runtime | T1, T2 |
| 1.1.1 | Story | Build shell static output | Implemented | `site` build artifact served by image | T1 |
| 1.1.2 | Story | Enforce local-only bind default | Implemented | `127.0.0.1:8080:80` compose mapping | T1 |
| 1.2 | Feature | Shell Route Surfaces | Implemented | `/`, `/dashboard`, `/prd.html`, static endpoints | T2, T7 |
| 1.2.1 | Story | Wiki iframe route | Implemented | `/` embeds `/wiki-app.html` | T2 |
| 1.2.2 | Story | Dashboard iframe route | Implemented | `/dashboard` embeds `/dashboard.html` | T2 |
| 1.2.3 | Story | Navbar route integrity | Implemented | Wiki/Dashboard/PRD/SPA links | T7 |
| 1.3 | Feature | Local Operations Scripts | Implemented | Start/stop/status/log commands | T3, T4 |
| 1.3.1 | Story | Compose command compatibility | Implemented | `docker compose` + `docker-compose` fallback | T3 |
| 1.3.2 | Story | Operator troubleshooting baseline | Implemented | Script-driven lifecycle checks | T4 |
| 1.4 | Feature | Canonical Documentation Model | Implemented | Six-file docs hub + separated `sources/` | T8 |
| 1.4.1 | Story | Canonical docs consolidation | Implemented | `docs/README,PRODUCT,EXECUTION,CONTENT,OPERATIONS,CHANGELOG` | T8 |
| 1.4.2 | Story | PRD placement policy | Implemented | Active PRD in `docs/PRD.md`, legacy in archive | T8 |
| 2.0 | Epic | Documentation Governance Expansion | Planned | Stronger governance lifecycle and review quality | T8-T11 |
| 2.1 | Feature | Change-control templates | Planned | Run packet/checklist hardening | T10 |
| 2.1.1 | Story | Story completion rubric | Planned | Uniform done criteria per story | T10 |
| 2.1.2 | Story | Evidence annotation standard | Planned | Minimal reproducible evidence in PRs | T10 |
| 2.2 | Feature | Decision log automation | Planned | Structured decision entries per change class | T10 |
| 2.2.1 | Story | Decision type taxonomy | Planned | Decision/change/release consistency | T10 |
| 2.2.2 | Story | Traceability back-links | Planned | PR/commit/ref linkage convention | T10 |
| 3.0 | Epic | Content System Expansion | Planned | Content pages beyond canonical governance docs | T8-T9 |
| 3.1 | Feature | IA rollout (onboarding/progression) | Planned | Structured gameplay content map | T9 |
| 3.1.1 | Story | Start-path content set | Planned | `start_here/setup/usage` style pages | T9 |
| 3.1.2 | Story | Domain cluster content set | Planned | Ore/fluids/storage/farming clusters | T9 |
| 3.2 | Feature | Authoring quality controls | Planned | Template and link-density consistency | T9 |
| 3.2.1 | Story | Template conformance checks | Planned | TL;DR → steps → mistakes → next links | T9 |
| 3.2.2 | Story | Placeholder governance | Planned | Owner + trigger + exit condition marking | T9 |
| 4.0 | Epic | Search and Retrieval Readiness | Planned | Indexable content retrieval baseline | T8-T10 |
| 4.1 | Feature | Retrieval data contract | Planned | Chunking/index schema for docs sources | T10 |
| 4.1.1 | Story | Content chunk strategy | Planned | Deterministic section-level indexing | T10 |
| 4.1.2 | Story | Retrieval metadata fields | Planned | Source path + confidence + timestamp | T10 |
| 4.2 | Feature | Golden-question evaluation | Planned | Repeatable retrieval quality gate | T10 |
| 4.2.1 | Story | Golden set definition | Planned | Stable set of representative questions | T10 |
| 4.2.2 | Story | Evaluation report format | Planned | pass/fail + top sources + misses | T10 |
| 5.0 | Epic | Assistant MVP Delivery | Planned | Grounded Q&A with citation behavior | T10-T11 |
| 5.1 | Feature | Ask interface contract | Planned | Request/response UX and failure states | T11 |
| 5.1.1 | Story | Input/output schema | Planned | Prompt + answer + source references | T11 |
| 5.1.2 | Story | Refusal behavior | Planned | “insufficient evidence” response policy | T11 |
| 5.2 | Feature | Safety and cost controls | Planned | Rate/cost guardrails | T11 |
| 5.2.1 | Story | Throttling thresholds | Planned | Basic request controls | T11 |
| 5.2.2 | Story | Usage telemetry baseline | Planned | Minimum observability for Q&A calls | T11 |
| 6.0 | Epic | Assistant Hardening | Planned | Quality stability and regression control | T10-T11 |
| 6.1 | Feature | Prompt/version management | Planned | Versioned prompt artifacts | T10 |
| 6.1.1 | Story | Prompt artifact naming/versioning | Planned | Reproducible prompt references | T10 |
| 6.1.2 | Story | Prompt change review gate | Planned | Controlled rollout of prompt changes | T10 |
| 6.2 | Feature | Regression suite expansion | Planned | Prevent quality drift | T11 |
| 6.2.1 | Story | Regression test matrix | Planned | Coverage for core Q&A scenarios | T11 |
| 6.2.2 | Story | Release quality threshold | Planned | explicit go/hold criteria | T11 |
| 7.0 | Epic | QA and Release Maturity | Planned | Broader release confidence and rollback readiness | T10-T11 |
| 7.1 | Feature | Smoke checklist formalization | Planned | Standard pre-release checks | T11 |
| 7.1.1 | Story | Environment sanity checks | Planned | runtime/route/dependency checks | T11 |
| 7.1.2 | Story | Rollback drill procedure | Planned | tested rollback sequence | T11 |
| 7.2 | Feature | Metrics and health reporting | Planned | Operational and quality trend visibility | T10 |
| 7.2.1 | Story | KPI baseline selection | Planned | measurable delivery/quality indicators | T10 |
| 7.2.2 | Story | Health report cadence | Planned | weekly release-health snapshots | T10 |
| 8.0 | Epic | External Sources and Evidence Operations | Planned | Controlled evidence ingest and traceability | T9-T10 |
| 8.1 | Feature | Evidence intake workflow | Planned | Add/validate supporting artifacts under `sources/` | T9 |
| 8.1.1 | Story | Config evidence standard | Planned | minimal redacted snippets with provenance | T9 |
| 8.1.2 | Story | External link qualification | Planned | optional/non-canonical source labeling | T9 |
| 8.2 | Feature | Source traceability enforcement | Planned | Clear evidence-to-claim mapping | T10 |
| 8.2.1 | Story | Claim-to-source pointer format | Planned | consistent references in docs pages | T10 |
| 8.2.2 | Story | Evidence freshness checks | Planned | stale evidence identification process | T10 |
| 9.0 | Epic | Developer Experience and Operations | Planned | Faster onboarding and lower ops friction | T3-T4 |
| 9.1 | Feature | Local workflow hardening | Planned | Reliable setup/start diagnostics | T3 |
| 9.1.1 | Story | Common failure diagnostics | Planned | clear operator failure tree | T4 |
| 9.1.2 | Story | Build troubleshooting expansion | Planned | remediation for build/runtime errors | T4 |
| 9.2 | Feature | Runbook completeness | Planned | complete operator/developer runbook | T4 |
| 9.2.1 | Story | Runbook section coverage | Planned | startup, deploy, monitor, rollback | T4 |
| 9.2.2 | Story | Incident response checklist | Planned | incident triage/containment steps | T4 |
| 10.0 | Epic | Documentation Productization | Planned | Contributor/user/operator docs maturity | T8-T10 |
| 10.1 | Feature | Contributor documentation | Planned | contribution and review guidance | T9 |
| 10.1.1 | Story | PR template alignment | Planned | template fields match active policy | T9 |
| 10.1.2 | Story | Reviewer checklist alignment | Planned | consistent content + technical review | T9 |
| 10.2 | Feature | User-facing docs quality | Planned | clearer access paths and reference clarity | T8 |
| 10.2.1 | Story | Landing/index optimization | Planned | concise entry and reference map | T8 |
| 10.2.2 | Story | Changelog readability | Planned | decision/change visibility improvements | T8 |
| 11.0 | Epic | Program Governance and Backlog Control | Planned | deterministic prioritization and sequencing | T10 |
| 11.1 | Feature | Backlog scoring model | Planned | objective prioritization criteria | T10 |
| 11.1.1 | Story | Effort/impact weighting rules | Planned | consistent backlog ranking | T10 |
| 11.1.2 | Story | Dependency gate checks | Planned | no invalid sequence starts | T10 |
| 11.2 | Feature | Delivery cadence governance | Planned | repeatable planning/review rhythm | T10 |
| 11.2.1 | Story | Weekly planning packet | Planned | queue + blocker + risk snapshot | T10 |
| 11.2.2 | Story | Milestone readiness review | Planned | evidence-backed gate decisions | T10 |

## Queue Mapping (Execution Alignment)

| Queue | Primary WBS Coverage | Intent |
|---|---|---|
| Q1 | 1.0-1.4 | Runtime/document baseline (implemented) |
| Q2 | 2.0-2.2 | Governance and execution control hardening |
| Q3 | 3.0-3.2 | Content system expansion |
| Q4 | 4.0-4.2 | Retrieval readiness |
| Q5 | 5.0-5.2 | Assistant MVP delivery |
| Q6 | 6.0-6.2 | Assistant hardening |
| Q7 | 7.0-7.2 | QA/release maturity |
| Q8 | 8.0-8.2 | Evidence/source operations |
| Q9 | 9.0-9.2 | Developer/operations workflow hardening |
| Q10 | 10.0-10.2 | Documentation productization |
| Q11 | 11.0-11.2 | Program governance and backlog control |

## Story Execution Packet (Required Per Story)

- WBS ID: exact story ID (`x.y.z`)
- Objective: one-sentence desired outcome
- Allowed Files: explicit edit set
- Validation: primary gate(s) and command/check references
- Evidence: minimal output proving completion
- Handoff: next unblocked story or blocker statement
