# QaaS Common Processors Docs

The QaaS common processors docs are written in this repository as `md` files under [/_docs/v3/docs](./_docs/v3/docs/).

They are versioned with `git tags` that follow this convention: `<qaas-common-processors-version>-docs.<docs-version-for-this-qaas-common-processors-version>`.

For **example**:
`QaaS.Common.Processors` version `1.0.0` with the 3rd version of its docs will have the git tag `1.0.0-docs.3`.

## Local Serve

```bash
cd _docs/v3
mkdocs serve
```

## Private Feeds And Images

The docs pages intentionally avoid hardcoding NuGet feed URLs. Keep those in your environment-specific `NuGet.Config`.

The Dockerfile accepts build arguments that make air-gapped builds easier:

- `MKDOCS_BUILDER_IMAGE`
- `HTTP_SERVER_IMAGE`
- `PIP_INDEX_URL`
- `PIP_EXTRA_INDEX_URL`
