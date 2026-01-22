# QaaS Module Packages

`QaaS Module Packages` are bundles of folders containing YAML files, uploaded as **artifacts** to the [Artifactory](REDA). In the context of `QaaS`, each such artifact is referred to as a **module**. These modules can be used interchangeably with any YAML file within the QaaS framework.

---

## QaaS.Common.Modules

QaaS provides a shared module library:  
[QaaS.Common.Modules](REDA)  
This repository contains reusable YAML configurations that can be leveraged across QaaS projects.

---

## Using Modules from Artifactory

To use a YAML file from Artifactory in a `qaas` command, replace the local file path with the full URL to the file in Artifactory.

### Example: Using `commons.yaml` from `CommonModule` v0.1.0

1. Navigate to the file in Artifactory:
   ![Artifactory](../assets/artifactory_yaml_file.png)

2. Copy the **URL to file** (e.g., `REDA/commons.yaml`).

3. Use it in a `run` command via the `-w` (overwrite) flag:

```bash
dotnet run -- run test.qaas.yaml -w REDA/commons.yaml
```

---

## Publishing Your Own Modules

To publish your own modules to Artifactory, use **[vap](REDA/versioned-artifact-publisher)** — the *Versioned Artifactory Publisher*.

### Publishing Conventions

- Place modules under:  
  `REDA`
- Module directory name must be in **PascalCase**.
- Inside the module directory, create a version-named subdirectory (e.g., `0.1.0`).
- Place your YAML files inside the version directory.

**Structure Example:**

```plaintext
REDA
└── CommonModule/
    └── 0.1.0/
        └── commons.yaml
```

---

## Publishing via CI

Automate module publishing using the [vap CI step](REDA) in GitLab CI templates.

### Example

See the implementation in the [QaaS.Common.Modules](REDA) repository for a real-world example.
