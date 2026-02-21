# Sources to export into `sources/configs/`

This repo does **not** currently contain the Monifactory pack’s gameplay config folders. When you’re ready to add verified evidence for wiki claims (v0.13.2 baseline), export **minimal, relevant** files/excerpts from the pack into `sources/configs/`.

## High-value sources (typical pack paths)

Export only what you need to support specific wiki statements:

- `kubejs/startup_scripts/` (mode flags / feature toggles)
- `kubejs/server_scripts/` (recipe overrides and progression gates)
- `kubejs/data/**/worldgen/` (worldgen JSONs, if used)
- `config/` (mod configs that materially change behavior)
- `defaultconfigs/` (server defaults that affect progression)
- `ftbquests/` (quest definitions; ensure this is permissible for your use)

## How to use

- Put the smallest relevant file/excerpt into `sources/configs/`.
- In the related Questbook Capture issue, reference it as:
  - `Config (repo): sources/configs/<file>`
- If the claim depends on multiple sources, list each.

## Constraints

- Do not add binaries (mod JARs, modpack ZIPs).
- Do not add proprietary/vanilla assets.
- Redact personal paths/usernames.
