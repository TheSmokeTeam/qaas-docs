# Best Practices

This page outlines the best practices for naming conventions and file structures within qaas projects.

## 1. Project Directory

* The project directory should be named after the application being tested, followed by "Tests".

**Example**: If the application name is for example "Adapter", the project directory should be named "AdapterTests".

## 2. Folders

* All folders within the project should be named using `PascalCase`.

**Example**: "MyFolder", "TestData", "Samples", "Variables".

## 3. YAML Files

* Any **YAML** configuration file should be named using `camelCase`.

**Example**: "k8sItems.yaml"

### 3.1 QaaS Runner YAML File

* All **YAML** configuration files containing qaas runner configurations should have a suffix of `.yaml`.

**Example**: "test.qaas.yaml"

## 4. YAML File Contents

### 4.1 QaaS Configuration Fields

* All qaas related configuration fields within the **YAML** files should be written in `PascalCase`.

**Example**:

```yaml
Sessions: []
Assertions: []
```

### 4.2 QaaS Runner Configuration Sections Order

* All used qaas runner configuration sections should be configured in the logical running order with the metadata sections on the top which will be `Links` -> `Storage` -> `DataSources` -> `Sessions` -> `Assertions`.
* There should be a single empty line between the end of a configuration section and the start of the next one.

**Example**:

```yaml
Links: ...

Storage: ...

DataSources: ...

Sessions: ...

Assertions: ...
```

### 4.3 Anchor Fields

* All anchors in the qaas **YAML** file should be written at the top of the file under the field `anchors`.
* All anchor fields within the **YAML** file should be written in `camelCase`.

**Example**:

```yaml
anchors:
  rabbitHost: &rabbitHost rabbitmq
  rabbitPort: &rabbitPort 5672

...
```

### 4.4 Variable PlaceHolders

* You should have 1 variables file for running locally and one for running on k8s.
* All variable placeholders in the qaas **YAML** file should be written in an additional **YAML** file under a folder called `Variables` called `{runnableFromInCamelCase}.yaml` under `variables` section.
* All variable place holders fields within the **YAML** file should be written in `camelCase`.

**Example**:

`Variables/local.yaml`

```yaml
variables:
  rabbitmq:
    host: REDA
    port: REDA
```

`Variables/k8s.yaml`

```yaml
variables:
  rabbitmq:
    host: rabbitmq
    port: 5672
```
