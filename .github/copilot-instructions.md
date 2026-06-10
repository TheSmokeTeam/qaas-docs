# Copilot instructions — qaas-docs

Read `AGENTS.md` at the repo root first — it maps the site layout and the generated-content boundaries.

Essentials:
- MkDocs Material site; build `mkdocs build --strict`; preview `mkdocs serve`; Python 3.11 + requirements.txt.
- `docs/_generated/` is produced by the QaaS.Docs.Generator submodule — never hand-edit; fix at the source (XML docs / placement tags in product repos).
- Pushes to `master` deploy to GitHub Pages — master is production.
- Pre-commit hooks (`git config core.hooksPath .githooks`): markdownlint-cli2, strict build, lychee link checks.
- Prefer `QAAS_DOCS_*` env vars over hardcoded URLs (build- and runtime-overridable).
- Conventional commits.
