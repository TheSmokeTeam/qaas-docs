# Troubleshooting

## `Unrecognised theme name: 'material'`

Cause: the old site under `qaas-docs/_docs/v4` depended on `mkdocs-material`, but the local machine only had stock MkDocs themes installed.

What changed:

- the canonical site is now the root `mkdocs.yml`
- it uses the built-in `mkdocs` theme
- `qaas-docs/_docs/v4/mkdocs.yml` now points back to the root docs and hook files so the old path works too

Use either command:

```powershell
cd D:\QaaS\qaas-docs
mkdocs serve -o
```

or:

```powershell
cd D:\QaaS\qaas-docs\qaas-docs\_docs\v4
mkdocs serve -o
```

## `Hook ... was not found`

Cause: the configured hook name does not match a compiled hook class that the runner can discover.

Check:

- the class name in code
- the `Generator`, `Assertion`, or `Probe` value in YAML
- that the test project builds successfully

## Cases are not being applied

Check:

- the `-c` path points to the folder, not a single file
- `-n` values match the discovered relative case names
- whether `--resolve-cases-last` changed the expected merge order

Render the final config:

```powershell
dotnet run -- template test.qaas.yaml -c Cases
```

## `act` works but `assert` fails

Usually this means:

- storage is not configured consistently
- the wrong session data names are referenced by the assertion
- the run and assert phases are not using the same cases or overwrite files

## The report does not open

`-s` only serves results when Allure CLI is installed and available on `PATH`.

If needed:

```powershell
allure serve
```

## Environment overrides are surprising

If values are changing without being present in YAML, rerun with:

```powershell
dotnet run -- template test.qaas.yaml --no-env
```

That strips environment-variable enrichment out of the loading process and usually makes the drift obvious.
