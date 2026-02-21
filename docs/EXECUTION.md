# Execution Plan (Canonical)

Last Updated: 2026-02-21
Status: Active

Detailed decomposition reference: `docs/WBS.md`.
Prompt automation reference: `docs/CODEX-5_3-PROMPT-SERIES.md`.
Run evidence log: `docs/DELIVERY-LOG.md`.

## Execution Rules
- One story-sized unit of work per run.
- Preferred edit surface: 1-3 files.
- Reference explicit IDs and validation in each run.
- Capture evidence and handoff before closing a run.

## Queue Model
- Q1: Platform/runtime baseline.
- Q2-Q6: Parser/build integrity stream.
- Q7: Sync and workflow controls.
- Q8: UX/navigation/search/mobile.
- Q9: Content production.
- Q10: QA/metrics/release gates.
- Q11: Deferred phase backlog readiness.

Queue interpretation:
- `Q1` reflects currently implemented runtime baseline work.
- `Q2`-`Q11` are planned/backlog execution tracks unless specific implementation artifacts are merged.

## Run Packet (Required)
- Work ID: `<queue + story id>`
- Objective: one sentence
- Allowed files: explicit path list
- Validation Plan: QA IDs and/or command list
- Validation Output: pass/fail and minimal command output
- Evidence Artifacts: file paths, screenshots, log snippets, or diff references
- Traceability: links to WBS ID, delivery run ID, and changelog entry (if applicable)
- Stop condition: exact done condition
- Handoff: next unblocked story or blocker note

## QA Baseline IDs
- T1-T4: Build and shell runtime checks.
- T5-T7: UX and route checks.
- T8-T9: Content and discoverability checks.
- T10-T11: Maintenance/release smoke checks.

Current-state note:
- T1-T7 are directly tied to current shell/runtime behavior.
- T8-T11 may include planned governance/operations checks depending on active scope.

## Deferred Automation Policy
- Keep deferred controls documented, not hidden.
- Label deferred items with owner + trigger + required-by gate.
- Deferred controls are non-blocking until their trigger activates.

## Governance Source Policy
- This file defines active execution policy.
- If conflicts are found, resolve against `PRD.md` and then update this file.
