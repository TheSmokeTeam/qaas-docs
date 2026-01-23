# Installation

## Prerequisites

- .NET 10 SDK
- A global `NuGet.Config` file configured with the following feed URLs:

```xml
<add key="Feed_A" value="REDA" />
<add key="Feed_B" value="REDA" />
<add key="Feed_C" value="REDA" />
```

## Packages

Install the required packages using NuGet.

### QaaS.Runner

The core package used to run QaaS Runner projects.

```bash
nuget install QaaS.Runner
```

### QaaS.Common.Assertions

Contains all standard assertions available in the QaaS ecosystem.

```bash
nuget install QaaS.Common.Assertions
```

### QaaS.Common.Generators

Contains all standard generators available in the QaaS ecosystem.

```bash
nuget install QaaS.Common.Generators
```

### QaaS.Common.Probes

Contains all standard probes available in the QaaS ecosystem.

```bash
nuget install QaaS.Common.Probes
```

## QaaS Project Templates

QaaS provides .NET project templates to simplify the creation of new QaaS projects. These templates are available at:

[QaaS Project Templates Repository](REDA)

### Install Templates

```bash
dotnet new -i "QaaS.ProjectTemplates"
```

### Uninstall Templates

```bash
dotnet new -u "QaaS.ProjectTemplates"
```

## Allure CLI

The Allure CLI tool, along with installation instructions, can be found at:

[Allure CLI Repository](REDA/allure-cli.git)
