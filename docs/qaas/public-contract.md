---
id: qaas.public-contract
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, mocker, framework, assertions, generators, probes, processors, jsonschema, packagemirror]
keywords: [contract, public, schemas, citations, evidence, source-only]
summary: "Defines the public QaaS user contract: this docs tree plus the generated family schemas under docs/assets/schemas/."
---
# QaaS Public Documentation Contract

> TL;DR — The public contract for QaaS users is this docs tree plus the generated family schemas under `docs/assets/schemas/`. Source code is verifier evidence for maintainers, not a user-accessible capability.

## When to use {: #when-to-use}

- You are writing a test plan, README, migration note, or automation script and need to cite an authoritative reference.
- You are evaluating whether a behaviour is supported, deprecated, or undocumented.
- You are deciding whether to add a workaround or open a docs request.

## The contract {: #contract}

The supported QaaS surface for users without source access is exactly:

1. Pages published under this site (everything reachable from the top-level nav `Runner`, `Mocker`, `Hooks`, `Framework`, `Integrations`).
2. JSON schemas shipped under `docs/assets/schemas/`:
    - `runner-family-schema.json`
    - `mocker-family-schema.json`
    - `assertions.schema.json`
    - `generators.schema.json`
    - `probes.schema.json`
    - `processors.schema.json`
3. Generated CLI help printed by `qaas-runner template --help`, `qaas-runner run --help`, etc., and the equivalent Mocker commands.
4. Build-time and runtime environment variables documented in [Configuration Defaults](../integrations/configuration-defaults.md) and the [Dockerfile](https://github.com/TheSmokeTeam/qaas-docs/blob/feature/document-actions/Dockerfile).

Anything that is not in those four buckets is **not** a supported user feature, even if it exists in the source repositories.

## Schema map {: #schema-map}

| Family | Schema | Reference page |
|---|---|---|
| Runner configuration | `docs/assets/schemas/runner-family-schema.json` | [Runner family schema](../assets/schemas/runner-family-schema.md) |
| Mocker configuration | `docs/assets/schemas/mocker-family-schema.json` | [Mocker family schema](../assets/schemas/mocker-family-schema.md) |
| Built-in assertions | `docs/assets/schemas/assertions.schema.json` | [Hook family schemas](../assets/schemas/hook-family-schemas.md) |
| Built-in generators | `docs/assets/schemas/generators.schema.json` | [Hook family schemas](../assets/schemas/hook-family-schemas.md) |
| Built-in probes | `docs/assets/schemas/probes.schema.json` | [Hook family schemas](../assets/schemas/hook-family-schemas.md) |
| Built-in processors | `docs/assets/schemas/processors.schema.json` | [Hook family schemas](../assets/schemas/hook-family-schemas.md) |

The [Schemas index](../assets/schemas/index.md) lists all six schemas with stable links and minimal valid examples.

## How to cite docs evidence {: #cite-evidence}

In plans, READMEs, migration notes, and automation prompts, prefer this evidence form:

```text
Evidence: docs/qaas/userInterfaces/runner/configurationSections/sessions/overview.md#stages
Schema: docs/assets/schemas/runner-family-schema.json#/$defs/Session
```

A citation is acceptable only if the referenced page or schema entry exists in the current docs tree. Validate before submitting:

```bash
python tools/validate_docs_contract_links.py
```

## Source-only behaviour {: #source-only}

Some QaaS source repositories expose internal classes, builders, or runtime hooks that are not part of the public docs contract. When a tool, plan, or report needs to mention such behaviour, use the following wording exactly:

```text
Source-only: blocked; documented fallback: <path-or-link-to-supported-alternative>
```

Reasons to mark a behaviour source-only:

- The behaviour exists only in `internal` or `private` types.
- The behaviour has no schema entry and no docs page outside `docs/_generated/`.
- The behaviour requires building from source rather than consuming published artifacts.

Do not present source-only behaviour as if a user could rely on it from the published QaaS packages.

## How automation and skills use this contract {: #for-automation}

Automation pipelines (CI generators, validation scripts, planning tools) treat this contract as the cite-allowed list:

- Plans only reference paths under `docs/` and `docs/assets/schemas/`.
- Public-surface audits reject paths that point at QaaS source files unless the page is explicitly a maintainer note.
- Validators in `tools/validate_docs_*.py` enforce that every fenced YAML example marked as Runner or Mocker validates against the shipped schemas.

## Acceptance signals {: #acceptance}

- `mkdocs build --strict` succeeds.
- `python tools/validate_docs_contract_links.py` reports zero forbidden source citations.
- The public-surface audit (`audit_public_surface.py`) reports zero forbidden source authority.
- New pages link back to this contract page when they introduce schemas or new public surfaces.

## See also {: #see-also}

- [Schemas index](../assets/schemas/index.md)
- [YAML mechanics](advancedConcepts/yaml-mechanics.md)
- [Migration: index](migration/index.md)
- [Configuration Defaults](../integrations/configuration-defaults.md)
