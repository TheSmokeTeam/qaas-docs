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

Follow the installation instructions in that repository, then create a project with:

```bash
dotnet new qaas-mocker -n MyCompany.QaaS.Mocker
```

The generated project includes:

- `Program.cs` wired to `QaaS.Mocker.Bootstrap.New(...)`
- `mocker.qaas.yaml`
- `Dockerfile`
- `NuGet.config`
- GitHub Actions CI
