## Codex 5.2 Kickoff Prompt — Monifactory Wiki Assistant

Context
- Environment: VS Code on Windows using Remote – WSL to Ubuntu. Docker Desktop installed. Work in ~/projects/Monifactory-Wiki-Assistant.
- Hosting: Local container via Docker Compose (NGINX runtime, Python builder). Production hosting can be a VPS with Docker.
- Scope: Static documentation site built from Markdown with MkDocs + Material theme. Minimal coding only (YAML config, Docker, VS Code tasks).

Objectives
1) Ensure the site runs at http://127.0.0.1:8080 via docker compose up --build -d.
2) Provide a fast authoring workflow in VS Code (WSL), including optional live preview.
3) Add project documentation (handoff and this kickoff prompt) to the repo under docs/.
4) Keep architecture minimal and reproducible.

Acceptance Criteria
- Site builds and serves successfully on port 8080.
- docs/ contains index.md, setup.md, usage.md, faq.md.
- docs/ contains this kickoff prompt file and the VS Code handoff doc.
- mkdocs.yml nav includes Home, Getting Started (Setup, Usage), Reference (FAQ), Project Docs (Kickoff, Handoff).
- VS Code tasks exist to Up/Down/Rebuild and Dev Preview.

Architecture & Rationale (brief)
- Content: Markdown in docs/.
- Config: mkdocs.yml defines site name, theme, navigation.
- Build: python:3.12-slim runs mkdocs build (multi-stage Docker) → static HTML.
- Serve: nginx:alpine serves static HTML; smaller, safer runtime.
- Dev: VS Code Remote – WSL so Copilot, Docker, and files operate in Ubuntu seamlessly.

Required Files (if missing, create):
- mkdocs.yml (site config and navigation)
- docs/index.md (home page)
- docs/setup.md (how to edit, preview, build)
- docs/usage.md (writing pages, linking, images)
- docs/faq.md (basic Q&A)
- docker-compose.yml (service: wiki, ports: "8080:80")
- Dockerfile (builder: mkdocs, runtime: nginx)
- docker-compose.dev.yml (optional live preview)
- .vscode/extensions.json, .vscode/settings.json, .vscode/tasks.json (optional)

Actions for Codex 5.2
1) Verify environment:
   - docker --version; docker compose version
   - cd ~/projects/Monifactory-Wiki-Assistant; ls -la; ls -la docs
2) Ensure core files exist (create if missing). Use the contents from this repo and the documents below.
3) Update mkdocs.yml nav to include:
   - Home: index.md
   - Getting Started: Setup (setup.md), Usage (usage.md)
   - Reference: FAQ (faq.md)
   - Project Docs: Kickoff (codex-5_2-kickoff-prompt.md), Handoff (vscode-wsl-handoff.md)
4) Start site:
   - docker compose up --build -d
   - curl -I http://127.0.0.1:8080 → expect HTTP/1.1 200 OK
5) Add VS Code tasks (optional) and test:
   - Site: Up, Down, Rebuild; Dev Preview Up/Down.
6) Commit and push changes to main.

Troubleshooting quick checks
- Port conflict → change host port via compose override or stop the other service.
- Build errors → fix mkdocs.yml indentation or nav paths.
- WSL/Docker port-forward glitch → wsl --shutdown (PowerShell) and restart Docker Desktop.

Included Documents
- The next sections include the prior handoff plan and VS Code + WSL Handoff. Preserve them verbatim.

---

Monifactory Wiki Assistant — VS Code + WSL Ubuntu Handoff (previous plan)

What we’re building
- A static documentation site from Markdown in docs/.
- MkDocs (Material theme) builds the site inside a Python container.
- NGINX serves the built static files inside a runtime container.
- You edit Markdown in VS Code; Docker rebuilds and publishes locally.

Why these few config files exist (plain-speak)
- mkdocs.yml: a small list that sets the site title, theme, and menu. Not code—just structured text.
- Dockerfile: a short “recipe” that says “build the site with Python” then “serve it with NGINX.”
- docker-compose.yml: a one-file “run button” to start the container on a chosen port.
- docker-compose.dev.yml: a convenience file that runs mkdocs serve (live preview with auto-reload).
- .vscode/*.json: small VS Code configs for tasks and recommended extensions (no coding).

Phase 0 — Pre-checks (run in VS Code’s WSL terminal)
- Open VS Code on WSL Ubuntu:
  - In Ubuntu terminal: cd ~/projects/Monifactory-Wiki-Assistant && code .
  - If code is not found, install Visual Studio Code and Remote – WSL, then re-run.
- Confirm Docker & Compose:
  - docker --version
  - docker compose version
- Confirm repo files exist:
  - ls -la
  - ls -la docs

Phase 1 — VS Code setup (extensions)
- In VS Code (connected to WSL: Ubuntu), install:
  - Remote – WSL
  - GitHub Copilot
  - GitHub Copilot Chat
  - Docker (by Microsoft)
- Sign in to GitHub when prompted (GoldJKR) for Copilot.

Optional VS Code workspace configs
- These make tasks easy and recommend the right extensions.

.vscode/extensions.json
- Recommendations: Remote – WSL, Copilot, Copilot Chat, Docker

.vscode/settings.json
- Enable inline suggestions and good formatting defaults for YAML/Markdown.

.vscode/tasks.json
- Tasks: Site Up/Down/Rebuild, Dev Preview Up/Down.

Phase 2 — Core files (verify or add)
- mkdocs.yml
- docs/index.md
- Dockerfile
- docker-compose.yml
- Optional: docker-compose.dev.yml

Phase 3 — Build and run (from VS Code terminal)
- docker compose up --build -d
- http://127.0.0.1:8080
- Rebuild: docker compose build && docker compose up -d
- Down: docker compose down --remove-orphans

Phase 4 — Live preview (auto-reload while editing)
- docker compose -f docker-compose.dev.yml up
- http://127.0.0.1:8000
- Stop: docker compose -f docker-compose.dev.yml down --remove-orphans

Phase 5 — Content workflow in VS Code
- Create docs/roadmap.md, update mkdocs.yml nav, rebuild, view.

Phase 6 — Copilot usage in VS Code
- Inline suggestions in Markdown and YAML, Copilot Chat prompts for docs drafting.

Phase 7 — Troubleshooting
- curl -I 127.0.0.1:8080 → 200 OK
- docker compose ps; docker compose logs wiki
- docker compose exec wiki ls -la /usr/share/nginx/html
- Fix WSL/Docker port-forward issues by restarting WSL and Docker Desktop.

Phase 8 — Deployment
- VPS with Docker: copy repo and docker compose up --build -d.
- Add HTTPS via Caddy or NGINX + certbot.

Acceptance criteria
- Site serves on :8080, edits in docs/ reflected after rebuild, nav updates show.

---

Minimal-Coding Handoff (previous plan)

What we’re building (in simple terms)
- A website made from Markdown files.
- A tiny config file tells the builder what the menu looks like and what theme to use.
- Docker builds the site and runs a small web server to show it.
- You edit Markdown; rebuild the container to publish updates.

Why any “code” is needed (and why it’s minimal)
- mkdocs.yml (YAML): A simple list that tells MkDocs the site title, theme, and menu.
- Dockerfile: A recipe for Docker. It says “use Python to build the site” then “use NGINX to serve the site.”
- docker-compose.yml: A one-file “run button” that starts the container on a chosen port.

Architecture at a glance
- Content: Markdown in docs/
- Config: mkdocs.yml (navigation/theme)
- Build (inside container): python:3.12-slim runs mkdocs build → static HTML
- Serve (inside container): nginx:alpine serves the static site on port 80
- Host: Ubuntu shell for commands; Docker does the real work

Prompt series for receiving agent (summary)
- Confirm environment and repo state.
- Create docs/ and essential files.
- Add Docker files.
- Build and run with Compose.
- Validate in browser.
- Content workflow: add pages, update nav, rebuild.
- Optional dev preview for auto-reload.
- Deployment notes and maintenance.

End of included documents.
