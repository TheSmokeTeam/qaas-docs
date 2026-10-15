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
python tools/write_runtime_link_defaults.py docs/assets/javascripts/qaas-docs-build-defaults.js
mkdocs build
```

Run a local preview:

```bash
mkdocs serve
```

Install the tracked pre-commit hook:

```bash
git config core.hooksPath .githooks
```

The hook runs `markdownlint-cli2`, strict MkDocs build, `llms.txt` validation,
and offline `lychee` against the rendered site check root.

## Maintenance documentation

Reference generation, deployment configuration, Docker, Helm, and offline packaging are documented in the [site maintenance guide](docs/site-maintenance.md).
