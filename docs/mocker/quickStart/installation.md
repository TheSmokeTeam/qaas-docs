# Installation

## Prerequisites

- `.NET 10 SDK`
- A `NuGet.config` that can resolve the packages your mock project uses

## Add `QaaS.Mocker` to an Existing Project

```bash
dotnet add package QaaS.Mocker
```

If your mock uses shared processors or generators, add the matching companion packages to the same project.

## Create a New Project from the Template Pack

The [QaaS.Mocker.Template](https://github.com/TheSmokeTeam/QaaS.Mocker.Template) repository publishes the template pack used for new mocker projects.

- Template pack ID: `QaaS.Mocker.Template`
- Template short name: `qaas-mocker`

You can install the template pack from a downloaded release asset or from a local clone.

Install a downloaded `.nupkg`:

```bash
dotnet new install .\QaaS.Mocker.Template.<version>.nupkg
```

Install from a local clone of the template repository:

```bash
dotnet new install .
```

Verify the template is available:

```bash
dotnet new list qaas-mocker
```

Then create a project with:

```bash
dotnet new qaas-mocker -n MyCompany.QaaS.Mocker
```

The generated project includes:

- `Program.cs` wired to `QaaS.Mocker.Bootstrap.New(...)`
- `mocker.qaas.yaml`
- `Dockerfile`
- `NuGet.config`
- a local package source under `.nuget/local-packages` so the generated project can restore the current mocker package chain
- GitHub Actions CI

Before the first build, restore with the generated `NuGet.config`.
