# Codex 5.3 Prompt Series (Autonomous Execution)

Last Updated: 2026-02-21  
Status: Active

This document provides a deterministic prompt series for Codex 5.3 to execute the project without requiring user intervention between stories.

## Operating Contract

- Model target: GPT-5.3-Codex.
- Work unit: exactly one `Story` (`x.y.z`) per run.
- Edit surface: target 1-3 files; justify if larger.
- Validation: run the smallest gate-aligned checks from `docs/EXECUTION.md`.
- Evidence: record pass/fail and minimal proof in `docs/DELIVERY-LOG.md`.
- Truthfulness: label planned work as planned; do not state planned scope as implemented.

## Required Inputs Per Run

- `docs/PRD.md`
- `docs/WBS.md`
- `docs/EXECUTION.md`
- `docs/CHANGELOG.md`
- `docs/DELIVERY-LOG.md`

## Prompt Header (Use for Every Story)

```text
You are Codex 5.3 executing one story in Monifactory Wiki Assistant.

Rules:
- Execute exactly one WBS story ID.
- Keep changes bounded to the allowed file list.
- Run validation mapped to the story gate.
- Record evidence in docs/DELIVERY-LOG.md.
- Update docs/CHANGELOG.md only when behavior/process/scope changes.

Story:
- WBS ID: <x.y.z>
- Queue: <Qx>
- Objective: <one sentence>
- Allowed files: <explicit list>
- Validation: <test IDs/commands>
- Done when: <binary conditions>

Output:
- Summary
- Files changed
- Validation result
- Evidence entry written
```

## Prompt Series

### Prompt 01 — Autonomous Delivery Bootstrap (Now)

Objective:
- Establish repeatable autonomous run tracking.

Story mapping:
- `2.1.1` Story completion rubric (planned governance expansion).

Required edits:
- Create `docs/DELIVERY-LOG.md` with run entry template.
- Add first `RUN-001` entry.
- Reference delivery log from `docs/EXECUTION.md`.

Validation:
- Link/path sanity in docs.
- Entry exists with WBS ID, gate, pass/fail, and handoff.

### Prompt 02 — Evidence Annotation Standard

Objective:
- Standardize evidence recording fields for every run.

Story mapping:
- `2.1.2` Evidence annotation standard.

Required edits:
- Expand `docs/DELIVERY-LOG.md` schema.
- Align language in `docs/EXECUTION.md` run packet.

Validation:
- Delivery log schema includes commands/tests + outcomes + artifact paths.

Implementation status:
- Completed on 2026-02-21 as `RUN-002`.
- Next handoff prompt: Prompt 03 (`WBS 2.2.1`).

### Prompt 03 — Decision Taxonomy Alignment

Objective:
- Enforce consistent decision/change/release classification.

Story mapping:
- `2.2.1` Decision type taxonomy.

Required edits:
- Tighten `docs/CHANGELOG.md` entry rules.
- Add examples for each type.

Validation:
- New entries conform to taxonomy without ambiguity.

Implementation status:
- Completed on 2026-02-21 as `RUN-003`.
- Next handoff prompt: Prompt 04 (`WBS 2.2.2`).

### Prompt 04 — Traceability Back-links

Objective:
- Require direct traceability from WBS story to evidence and changelog.

Story mapping:
- `2.2.2` Traceability back-links.

Required edits:
- Add mandatory traceability fields in `docs/DELIVERY-LOG.md`.
- Link story IDs in changelog evidence lines when applicable.

Validation:
- Sample completed run has full traceability chain.

Implementation status:
- Completed on 2026-02-21 as `RUN-004`.
- Next handoff prompt: Prompt 05 (`WBS 3.1.1`) when unblocked by content-scope activation.

### Prompt 05 — Start-path Content Expansion (When unblocked)

Objective:
- Begin planned content expansion with one bounded content story.

Story mapping:
- `3.1.1` Start-path content set.

Required edits:
- Add one start-path content page using `docs/CONTENT.md` template.
- Update `docs/index.md` links as needed.

Validation:
- T9 content/discoverability checks for the new page.

Implementation status:
- Completed on 2026-02-21 as `RUN-005`.
- Stop condition reached per user instruction after Prompt 05 completion.

## Autonomous Execution Loop

For each run:
1. Select next unblocked story from `docs/WBS.md`.
2. Execute with prompt header + bounded files.
3. Run gate-aligned validation.
4. Write delivery evidence (`docs/DELIVERY-LOG.md`).
5. Update changelog if process/scope/behavior changed.
6. Handoff next story ID.

## Stop Conditions

- Missing prerequisite artifact for the selected story.
- Validation failure with unresolved blocker.
- Merge conflict requiring human priority decision.

When stopped, record blocker and recommended next action in `docs/DELIVERY-LOG.md`.
