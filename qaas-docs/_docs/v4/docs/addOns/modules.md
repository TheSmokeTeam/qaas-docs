# QaaS Module Packages

QaaS module packages are versioned bundles of YAML files that can be reused across projects. In practice, a module is just a curated set of QaaS configuration fragments stored in a shared artifact repository.

## Why Modules Exist

Use modules when the same YAML is reused in many places, for example:

- shared session templates
- common links or metadata blocks
- standard probes or assertion groups
- organization-wide defaults for storage or observability

## How They Are Consumed

Any place that accepts a YAML path can also consume a module file from a reachable artifact URL. A common pattern is using `-w` / `--with-files` to layer shared YAML on top of a project-local test file.

Example:

```bash
dotnet run -- run test.qaas.yaml -w https://your-artifact-host/modules/common/commons.yaml
```

## Publishing Guidance

Keep module publishing conventions simple and predictable:

- group files by module name
- version the module directory, not only the file names
- keep YAML file names stable so project references stay readable

One reasonable layout is:

```txt
CommonModule/
|-- 0.1.0/
|   |-- commons.yaml
```

## Practical Advice

- treat modules like source code: version them, review them, and document breaking changes
- keep environment-specific values out of shared modules when possible
- prefer smaller focused modules over one very large catch-all module
