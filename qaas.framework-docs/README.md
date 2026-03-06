# QaaS Framework Docs

The QaaS Framework docs are written in this repository as `md` files under [/docs](./docs/).

They are versioned with `git tags` that follow this convention: `<qaas-framework-version>-docs.<docs-version-for-this-qaas-framework-version>`.

For **example**:
`QaaS.Framework` version `1.0.0` with the 3rd version of its docs will have the git tag `1.0.0-docs.3`.

## Local Serve

```bash
mkdocs serve
```

## Private Feeds And Images

The Dockerfile accepts build arguments that make air-gapped builds easier:

- `MKDOCS_BUILDER_IMAGE`
- `HTTP_SERVER_IMAGE`
- `PIP_INDEX_URL`
- `PIP_EXTRA_INDEX_URL`
