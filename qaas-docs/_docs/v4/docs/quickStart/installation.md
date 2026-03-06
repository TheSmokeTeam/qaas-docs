# Installation

## Prerequisites

- .NET 10 SDK
- Access to the NuGet feeds that host the QaaS packages

The docs intentionally do not hardcode feed URLs here. Keep those values in your local or global `NuGet.Config` so the same docs can be used in connected and air-gapped environments.

## Packages

Install the packages your test project needs. In most cases that means the runner plus the common plugins you want to use.

### QaaS.Runner

The main runtime package for YAML-driven or code-driven QaaS test projects.

```bash
dotnet add package QaaS.Runner
```

### QaaS.Common.Assertions

Reusable assertion hooks such as hermeticity, delay, status-code, schema, and output-shape checks.

```bash
dotnet add package QaaS.Common.Assertions
```

### QaaS.Common.Generators

Reusable generator hooks for filesystem, JSON, schema, S3, and composed data-source scenarios.

```bash
dotnet add package QaaS.Common.Generators
```

### QaaS.Common.Probes

Reusable probes for environment setup and cleanup, including OpenShift, RabbitMQ, Redis, S3, SQL, and Elastic operations.

```bash
dotnet add package QaaS.Common.Probes
```

## QaaS Project Templates

The project templates are the fastest way to create a new runner project with the expected solution layout, starter YAML file, and sample variable files.

### Install Templates

```bash
dotnet new install QaaS.ProjectTemplates
```

### Uninstall Templates

```bash
dotnet new uninstall QaaS.ProjectTemplates
```

## Allure CLI

Install Allure CLI if you want `-s` / `--serve-results` to open the report automatically after a run. QaaS writes raw result files into `allure-results`; the CLI is only needed to render and serve them locally.
