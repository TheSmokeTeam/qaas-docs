# Installation

## Prerequisites

- .NET 10 SDK
- Access to the NuGet feeds that host the QaaS packages

The docs intentionally do not hardcode feed URLs here. Keep those values in your local or global `NuGet.Config` so the same docs can be used in connected and air-gapped environments.

## Packages

Install the main mocker package:

```bash
dotnet add package QaaS.Mocker
```

Optional shared plugins:

```bash
dotnet add package QaaS.Common.Processors
dotnet add package QaaS.Common.Generators
```

Use `QaaS.Common.Processors` when you want ready-made processors. Use `QaaS.Common.Generators` only if your mocker data sources need generator hooks from that package.

## QaaS Project Templates

The project templates are the fastest way to create a new mocker project with the expected solution layout and starter YAML file.

### Install

```bash
dotnet new install QaaS.ProjectTemplates
```

### Uninstall

```bash
dotnet new uninstall QaaS.ProjectTemplates
```
