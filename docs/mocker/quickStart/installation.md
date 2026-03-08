# Installation

## Prerequisites

* `.NET 10 SDK`
* Global `NuGet.Config` file configured to the following feeds

```xml
<add key="Feed_A" value="REDA" />
<add key="Feed_B" value="REDA" />
<add key="Feed_C" value="REDA" />
```

## Packages

Install using `nuget`

### QaaS.Mocker

The main package used to run a QaaS Mocker project.

```bash
nuget install QaaS.Mocker
```

## QaaS Project Templates

QaaS has dotnet project templates that can be used to create new QaaS projects easily, those project templates can be found [Here](REDA/qaas.projecttemplates.git).

### Install

```bash
dotnet new -i "QaaS.ProjectTemplates"
```

### Uninstall

```bash
dotnet new -u "QaaS.ProjectTemplates"
```
