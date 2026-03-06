# QaaS Docs

This package is the documentation home for the QaaS ecosystem and the `QaaS.Runner` repository.

## Source Layout

- Current published content lives under [`_docs/v4`](./_docs/v4/).
- The site is built with `mkdocs-material` and versioned with `mike`.
- The content now focuses on a code-audited zero-to-hero path instead of the legacy page tree.

## Local Build

```bash
docker build -t qaas-docs .
```

If you want to preview the content without Docker, use the same `mkdocs.yml` under [`_docs/v4`](./_docs/v4/).
