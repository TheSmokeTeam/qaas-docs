# QaaS Common Generators Docs

The common generators documentation source lives under [/_docs/docs](./_docs/docs/) and is served with [/_docs/mkdocs.yml](./_docs/mkdocs.yml).

## Local Serve

```bash
pip install -r requirements.txt
cd _docs
mkdocs serve
```

## Deployment Notes

This package keeps its own `Dockerfile`, but the full multi-product deployment flow is documented in the repository [README](../README.md).

For private or air-gapped builds, the package Dockerfile accepts:

- `MKDOCS_BUILDER_IMAGE`
- `HTTP_SERVER_IMAGE`
- `PIP_INDEX_URL`
- `PIP_EXTRA_INDEX_URL`

The docs intentionally avoid hardcoding NuGet feeds. Keep those endpoints in your environment-specific `NuGet.Config`.
