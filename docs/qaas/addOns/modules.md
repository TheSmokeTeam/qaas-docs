# QaaS Module Packages

`QaaS Module Packages` are bundles of folders containing YAML files, uploaded as artifacts to Artifactory (`{{ links.artifactory }}`). In the context of `QaaS`, each such artifact is referred to as a **module**. These modules can be used interchangeably with any YAML file within the QaaS framework.

## Publishing Your Own Modules

After creating your own modules, you should publish them to Artifactory.
You can do it by urself or use a tool we created named [`VAP`](`{{ links.repository_vap }}`) - Versioned Artifactory Publisher, which is a CLI tool that automates the process of publishing modules to Artifactory.

### Publishing Conventions

- Place modules under `{{ links.artifactory }}`
- Module directory names must be in **PascalCase**
- Inside the module directory, create a version-named subdirectory such as `0.1.0`
- Place your YAML files inside the version directory

**Structure Example:**

```plaintext
{{ links.artifactory }}
└── CommonModule/
    └── 0.1.0/
        └── commons.yaml
```

---

## Publishing via CI

Automate module publishing using the `VAP` CI step (`{{ links.repository_vap }}`) in GitLab CI templates.

---

## Using Modules from Artifactory

To use a YAML file from Artifactory in a `qaas` command, replace the local file path with the full URL to the file in Artifactory.

### Example: Using `commons.yaml` from `CommonModule` v0.1.0

1. Open the target module file in the Artifactory UI.
2. Copy the URL to the file, for example `{{ links.artifactory }}/commons.yaml`.
3. Use it in a `run` command via the `-w` (`--with-files`) flag:

```bash
dotnet run -- run test.qaas.yaml -w {{ links.artifactory }}/commons.yaml
```
