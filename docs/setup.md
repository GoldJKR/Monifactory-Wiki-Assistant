# Setup

## Editing content
- Edit files under `docs/`
- Use standard Markdown
- Update navigation in `mkdocs.yml` under `nav:`

## Local preview without installing Python (Docker one-liner)
Run from the repo root:
```bash
docker run --rm -it -p 8000:8000 -v "$PWD:/work" -w /work python:3.12-slim \
  sh -c "pip install mkdocs-material && mkdocs serve -a 0.0.0.0:8000"
```
Open http://127.0.0.1:8000

## Production (Docker)
- Build: `docker build -t monifactory-wiki:latest .`
- Run: `docker run -d --name monifactory-wiki -p 8080:80 monifactory-wiki:latest`
- Open: http://127.0.0.1:8080