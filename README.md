# QaaS Documentation

[![CI](https://github.com/TheSmokeTeam/qaas-docs/actions/workflows/ci.yml/badge.svg)](https://github.com/TheSmokeTeam/qaas-docs/actions/workflows/ci.yml)

Unified documentation for the Quality as a Service (QaaS) platform and its components.

## Sections

| Section | Description |
| ------- | ----------- |
| Runner | Main test orchestration, quick starts, configuration reference, commands, and builders |
| Mocker | Mock server setup, runtime control, configuration reference, commands, and builders |
| Hooks | Assertions, generators, probes, and processors with generated configuration reference |
| Framework | Shared SDK, infrastructure, policies, data sources, and configuration helpers |

## Docs Site

The published docs site is available at:

<https://TheSmokeTeam.github.io/qaas-docs/>

## Local Development

Install dependencies:

```bash
pip install -r requirements.txt
```

Build the site:

```bash
mkdocs build
```

Run a local preview:

```bash
mkdocs serve
```

## Deterministic Reference Docs

Runner, Mocker, and Framework reference pages are generated deterministically.

- Family schema contracts come from `QaaS.PackageMirror`.
- The renderer lives in the external `QaaS.Docs.Generator` repository and is included here as the `tools/QaaS.Docs.Generator` git submodule.
- CLI reference pages come from committed snapshots under `tools/QaaS.Docs.Generator/Snapshots/`.
- Function reference pages come from source-level XML doc comments plus `qaas-docs` placement tags in the sibling product repositories.
- Hook configuration reference pages come from the mirrored family schema hook catalogs.
- Schema assets are mirrored into `docs/assets/` so both the site and the Docker image include downloadable schema files.

Regenerate and validate the reference docs locally:

```powershell
git submodule update --init --recursive
.\scripts\Generate-ReferenceDocs.ps1
.\scripts\Generate-ReferenceDocs.ps1 -Check -BuildSite
```

## Repository Layout

```text
qaas-docs/
|-- docs/                         Source markdown and generated reference docs
|-- docs/assets/                  Mirrored schema and state assets bundled into the site
|-- mkdocs.yml                    MkDocs configuration
|-- scripts/                      Docs generation helpers
|-- tools/QaaS.Docs.Generator/    Generator submodule
`-- .github/workflows/ci.yml      Unified docs CI, deploy, Docker publish, and overview update workflow
```

## Automation

The docs repository uses a single workflow: [`.github/workflows/ci.yml`](.github/workflows/ci.yml)

It handles:

- site validation on pushes and pull requests
- GitHub Pages deployment on pushes to the default branch
- Docker image publish on tag pushes and manual dispatch
- GitHub repository overview updates from this README on tag pushes and manual dispatch

### Required Secrets And Variables

Docker image publish uses these secrets:

- `DOCKER_USERNAME` or `DOCKERHUB_USERNAME`
- `DOCKER_PASSWORD` or `DOCKERHUB_TOKEN`

Repository overview sync uses:

- `REPOSITORY_OVERVIEW_TOKEN`

This token must be able to update repository metadata for `TheSmokeTeam/qaas-docs`.

Optional variable:

- `DOCKERHUB_REPOSITORY`

If `DOCKERHUB_REPOSITORY` is not set, CI uses `${DOCKER_USERNAME}/${repo-name}`.

## Docker

Build locally:

```bash
docker build -t qaas-docs .
docker run -p 8000:8000 qaas-docs
```

The container builds the docs site at startup, so `QAAS_DOCS_LINK_*` environment overrides are applied without rebuilding the image.
