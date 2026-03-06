# qaas-docs

Unified documentation workspace for the QaaS ecosystem.

## Canonical Site

Serve locally from the repository root:

```powershell
mkdocs serve -o
```

Build the static site:

```powershell
mkdocs build --clean
```

The root `mkdocs.yml` is the source of truth. The legacy `qaas-docs/_docs/v4/mkdocs.yml` file now points back to the root docs and hook files so older local workflows do not break.

## What Changed

- one MkDocs site for the whole workspace
- built-in MkDocs theme only, so no `mkdocs-material` dependency is required for local serve
- quick-start content kept and rewritten around current runner and mocker source
- external repository and package links are driven by environment variables for private Git and Artifactory deployments
- one root `Dockerfile` for a single deployable docs image

## Important Files

- `mkdocs.yml`
- `hooks.py`
- `docs/`
- `Dockerfile`
- `docs/operations/air-gapped.md`
