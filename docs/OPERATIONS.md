# Operations (Canonical)

Last Updated: 2026-02-21
Status: Active

## Runtime Commands
- Start: `./scripts/site_start.sh`
- Stop: `./scripts/site_stop.sh`
- Status: `./scripts/site_status.sh`
- Logs: `./scripts/site_logs.sh`
- Fallback run: `docker compose up --build -d`

## Build/Serve Model
- Build Docusaurus shell from `site/`.
- Include static apps from `site/static/`.
- Serve output with NGINX via Docker Compose.

## Validation Workflow
- Run the smallest relevant QA checks first.
- Record test IDs + pass/fail + minimal evidence.
- Escalate blockers with explicit repro steps.

Current validation baseline:
- Prioritize shell/runtime checks tied to Docker start and route availability.
- Treat advanced parser/assistant checks as planned unless implementation artifacts exist.

## Common Failures
- Docker daemon not running.
- Port `8080` already in use.
- Compose/plugin mismatch between v1 and v2.
- Stale containers/images after config changes.

## Maintenance Cadence
- Keep change log updated every run.
- Triage stale/missing links and doc drift weekly.
- Track deferred automation activation by trigger gate.

## Release Safety
- Use smoke checklist before release decisions.
- Keep rollback path documented and quick to execute.
- Treat runtime, routing, and documentation-integrity defects as high priority.

## Alignment Notes
- Operational requirements are constrained by `PRD.md` implemented scope.
- Planned operations work must be labeled explicitly in updates and release notes.
