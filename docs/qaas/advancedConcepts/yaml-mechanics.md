---
id: qaas.advancedconcepts.yaml-mechanics
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, mocker]
keywords: [yaml, anchors, aliases, merge-keys, references, placeholders, cases, push-references]
summary: "Authoritative reference for YAML anchors, aliases, merge keys, reference files, placeholders, overlays, cases, and push-references in QaaS."
---
# YAML Mechanics

> TL;DR — A single page that defines every YAML niche QaaS reads at template time: anchors, aliases, merge keys, reference files, placeholders, overlays, cases, and `-p/--push-references`.

## When to use {: #when-to-use}

- You are writing a non-trivial Runner or Mocker YAML and want to share fragments.
- You are debugging why `template` did not produce the YAML you expected.
- You are reviewing test maintenance changes that move shared fragments into reference files.

## Resolution order {: #order}

When the Runner or Mocker reads a configuration file, it resolves content in this order:

1. **YAML parse** — anchors and aliases are expanded by the YAML parser.
2. **Reference resolution** — `Reference:` entries are loaded and merged.
3. **Environment overlay** — `Variables/<env>.yaml` is overlaid when `--env` is set.
4. **Push-references** — `-p/--push-references` overlays additional reference files.
5. **Case overlay** — when `--resolve-cases-last` is set, case overlays are applied after the environment overlay; otherwise they apply before it.
6. **Placeholder substitution** — `${...}` placeholders are resolved against the merged dictionary.

The output of step 6 is the **effective configuration**. The `template` command writes this output and is the authoritative view of what the Runner or Mocker will execute.

## Anchors and aliases {: #anchors-aliases}

Before:

```yaml
DataSources:
  - &CommonPayload
    Name: PayloadA
    Generator: RandomString
    GeneratorConfiguration:
      Length: 16
  - <<: *CommonPayload
    Name: PayloadB
    GeneratorConfiguration:
      Length: 32
```

Command:

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- template my-test.qaas.yaml --no-env
```

Effective YAML after template:

```yaml
DataSources:
  - Name: PayloadA
    Generator: RandomString
    GeneratorConfiguration:
      Length: 16
  - Name: PayloadB
    Generator: RandomString
    GeneratorConfiguration:
      Length: 32
```

Misuse: anchors only apply inside the same file. Reaching an anchor across files requires a reference file (see below).

## Merge keys {: #merge-keys}

The `<<` merge key copies mapping entries from the source anchor into the target mapping. Local keys override merged keys.

```yaml
defaults: &http-defaults
  Method: GET
  BaseAddress: http://localhost:5050
  Route: /default

Sessions:
  - Name: Fast
    Transactions:
      - Name: FastCall
        TimeoutMs: 5000
        Http:
          <<: *http-defaults
          Route: /fast
```

Effective `Http` after template:

```yaml
Http:
  Method: GET
  BaseAddress: http://localhost:5050
  Route: /fast
```

Misuse: `<<` only merges **mappings**. Merging into a sequence is a parse error.

## Reference files {: #reference-files}

Reference files live alongside the test file and are loaded with `Reference:`:

```yaml
# spec:fragment
DataSources:
  - Reference: References/payloads.yaml
```

`References/payloads.yaml`:

```yaml
- Name: PayloadA
  Generator: RandomString
  GeneratorConfiguration:
    Length: 16
```

Effective output replaces the `Reference:` entry with the loaded sequence.

## Push references {: #push-references}

`-p/--push-references` injects an extra reference file at the end of resolution. Use it to layer environment-specific stubs without editing the main file.

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- template my-test.qaas.yaml -p References/local-overrides.yaml
```

Misuse: pushed references must contain the same shape as the section they extend. A list cannot replace a mapping.

## Placeholders {: #placeholders}

Placeholders use `${...}` syntax and resolve against the merged dictionary built from variables, environment overlays, and pushed references.

```yaml
Sessions:
  - Name: HttpSession
    Transactions:
      - Name: HelloCall
        TimeoutMs: 5000
        Http:
          BaseAddress: ${app.base_url}
          Route: /hello
```

Resolution order for `${app.base_url}`:

1. Case overlay (when `--resolve-cases-last` is **not** set).
2. Environment overlay (`Variables/<env>.yaml`).
3. Case overlay (when `--resolve-cases-last` **is** set).
4. Default block in the test file's `Variables` mapping.

Misuse: unresolved placeholders are a hard template error. Either provide a default in `Variables:` or supply the value via overlay.

## Case overlays {: #cases}

Cases let one Runner file parameterise itself for multiple invocations. Each case is a small overlay on the base file:

```yaml
Cases:
  - Name: smoke
    Variables:
      app.base_url: http://localhost:5050
  - Name: staging
    Variables:
      app.base_url: https://staging.example.org
```

Use `--resolve-cases-last` to apply cases after environment overlays. Default is to apply cases first, which lets environment overlays still override case values.

## Variables overlay {: #env-overlay}

`Variables/local.yaml` and `Variables/k8s.yaml` are environment overlays. Select with `--env local` or `--env k8s`. Secrets must never live in committed overlays; load secrets via runtime environment variables resolved into placeholders.

## Forbidden patterns {: #forbidden}

These patterns look reasonable but fail at template time:

- Anchor in file A referenced from file B without a reference file.
- `<<: *foo` where `foo` is a sequence rather than a mapping.
- Placeholders without defaults and without an overlay supplying the value.
- `Reference:` to a file outside the repository (the Runner requires repo-relative paths).
- Pushed reference shape mismatch (list pushed into a mapping section).
- Mixed case names that differ only in capitalization.

## When template output is authoritative {: #authoritative}

`template` is the source of truth for what the Runner or Mocker executes. If the templated output is correct but the execution misbehaves, the bug is in the hook or the code under test. If the templated output is wrong, the bug is in your YAML or in the overlays you supplied.

## See also {: #see-also}

- [Configuration resolution priority](../userInterfaces/runner/configurationResolutionPriority.md)
- [Make tests maintainable](../quickStart/makeTestMoreMaintainable.md)
- [Runner template command](../userInterfaces/runner/commands/template.md)
