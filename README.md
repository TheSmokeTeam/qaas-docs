# QaaS Documentation Suite

This repository keeps each QaaS product's documentation as a separate MkDocs site, while still allowing you to publish everything together as one docs image.

## Packages

| Product | Package directory | Route in the combined image |
| --- | --- | --- |
| Runner | `qaas-docs` | `/runner/` |
| Framework | `qaas.framework-docs` | `/framework/` |
| Common Assertions | `qaas.common.assertions-docs` | `/assertions/` |
| Common Generators | `qaas.common.generators-docs` | `/generators/` |
| Common Probes | `qaas.common.probes-docs` | `/probes/` |
| Common Processors | `qaas.common.processors-docs` | `/processors/` |
| Mocker | `qaas-mocker-docs` | `/mocker/` |

Every package now uses the same layout:

```text
<package>/
|- _docs/
|  |- docs/
|  `- mkdocs.yml
|- README.md
|- Dockerfile
`- requirements.txt
```

## Local Workflows

### Serve one product

```bash
cd qaas-docs
pip install -r requirements.txt
cd _docs
mkdocs serve
```

Replace `qaas-docs` with any other package directory if you want to serve that product instead.

### Build one product

```bash
cd qaas-docs
pip install -r requirements.txt
mkdocs build -f _docs/mkdocs.yml
```

### Build and run the full documentation suite

```bash
docker build -t qaas-docs-suite .
docker run --rm -p 8080:8080 qaas-docs-suite
```

The suite image serves:

- `/` as a landing page
- `/runner/`
- `/framework/`
- `/assertions/`
- `/generators/`
- `/probes/`
- `/processors/`
- `/mocker/`

## Deployment Notes

The combined image is built from the root [Dockerfile](./Dockerfile). Each package also keeps its own `Dockerfile` if you want to publish only one product's documentation.

For private or air-gapped environments, the Docker builds honor these build arguments:

- `MKDOCS_BUILDER_IMAGE`
- `HTTP_SERVER_IMAGE`
- `PIP_INDEX_URL`
- `PIP_EXTRA_INDEX_URL`

Example:

```bash
docker build ^
  --build-arg MKDOCS_BUILDER_IMAGE=my-registry/python:3.12-slim ^
  --build-arg HTTP_SERVER_IMAGE=my-registry/python:3.12-slim ^
  --build-arg PIP_INDEX_URL=https://my-artifactory/api/pypi/python/simple ^
  --build-arg PIP_EXTRA_INDEX_URL=https://my-artifactory/api/pypi/python-extra/simple ^
  -t qaas-docs-suite .
```

Internal documentation links are relative so the combined site can be published behind a reverse proxy or under a sub-path without editing the markdown. External package feeds should stay environment-specific:

- Keep NuGet endpoints in your environment's `NuGet.Config`
- Keep Python package indexes in `PIP_INDEX_URL` and `PIP_EXTRA_INDEX_URL`
- Keep container registry selection in `MKDOCS_BUILDER_IMAGE` and `HTTP_SERVER_IMAGE`

## Theme

The docs sites use [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) with a shared dark-first palette and a shared product switcher banner. Hosted fonts are disabled so the generated site stays self-contained in air-gapped environments. The switcher override lives in [_shared/mkdocs/overrides/main.html](./_shared/mkdocs/overrides/main.html).
