---
id: qaas.bestpractices
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, bestpractices]
summary: "Naming conventions and file-structure guidelines for QaaS projects."
---
# Best Practices

> TL;DR — Naming conventions and file-structure guidelines for QaaS projects.

Naming conventions and file-structure guidelines for QaaS projects.

## 1. Project Directory {: #1-project-directory}

* The project directory should be named after the application being tested, followed by "Tests".

**Example**: If the application name is for example "Adapter", the project directory should be named "AdapterTests".

## 2. Folders {: #2-folders}

* All folders within the project should be named using `PascalCase`.

**Example**: "MyFolder", "TestData", "Samples", "Variables".

## 3. YAML Files {: #3-yaml-files}

* Any **YAML** configuration file should be named using `camelCase`.

**Example**: "k8sItems.yaml"

### 3.1 QaaS Runner YAML File {: #31-qaas-runner-yaml-file}

* All **YAML** configuration files containing qaas runner configurations should have a suffix of `.yaml`.

**Example**: "test.qaas.yaml"

## 4. YAML File Contents {: #4-yaml-file-contents}

### 4.1 QaaS Configuration Fields {: #41-qaas-configuration-fields}

* All qaas related configuration fields within the **YAML** files should be written in `PascalCase`.

**Example**:

```yaml
Sessions: []
Assertions: []
```

### 4.2 QaaS Runner Configuration Sections Order {: #42-qaas-runner-configuration-sections-order}

* All used qaas runner configuration sections should be configured in the logical running order with the metadata sections on the top which will be [Links](userInterfaces/runner/configurationSections/links/overview.md) -> [Storages](userInterfaces/runner/configurationSections/storages/overview.md) -> [DataSources](userInterfaces/runner/configurationSections/dataSources/overview.md) -> [Sessions](userInterfaces/runner/configurationSections/sessions/overview.md) -> [Assertions](userInterfaces/runner/configurationSections/assertions/overview.md).
* There should be a single empty line between the end of a configuration section and the start of the next one.

**Example**:

```yaml
MetaData:
  Team: Platform
  System: Checkout

Links: []

Storages: []

DataSources: []

Sessions: []

Assertions: []
```

### 4.3 Anchor Fields {: #43-anchor-fields}

* All anchors in the qaas **YAML** file should be written at the top of the file under the field `anchors`.
* All anchor fields within the **YAML** file should be written in `camelCase`.

**Example**:

```yaml
anchors:
  rabbitHost: &rabbitHost rabbitmq
  rabbitPort: &rabbitPort 5672

...
```

### 4.4 Variable PlaceHolders {: #44-variable-placeholders}

* You should have 1 variables file for running locally and one for running on k8s.
* All variable placeholders in the qaas **YAML** file should be written in an additional **YAML** file under a folder called `Variables` called `{runnableFromInCamelCase}.yaml` under `variables` section.
* All variable placeholders fields within the **YAML** file should be written in `camelCase`.

**Example**:

`Variables/local.yaml`

```yaml
variables:
  rabbitmq: # credentials for running locally.
    host: <clusterHostname>
    port: <nodePort>
```

`Variables/k8s.yaml`

```yaml
variables:
  rabbitmq: # credentials for running inside k8s cluster.
    host: rabbitmq
    port: 5672
```

## See also {: #see-also}

* [QaaS Runner](index.md)
