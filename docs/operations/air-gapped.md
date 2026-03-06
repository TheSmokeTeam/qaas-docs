# Air-Gapped Deployment

This unified docs site is designed so you can retarget external links and build inputs without rewriting markdown.

## Canonical Local Commands

Serve locally:

```powershell
mkdocs serve -o
```

Build the static site:

```powershell
mkdocs build --clean
```

Build the container image:

```powershell
docker build -t qaas-docs:local .
```

## Environment-Driven Links

Markdown links in this site use a small MkDocs hook that replaces tokens at build time.

### Repository link variables

| Variable | Default |
| --- | --- |
| `QAAS_REPO_DOCS_URL` | `https://github.com/TheSmokeTeam/qaas-docs` |
| `QAAS_REPO_RUNNER_URL` | `https://github.com/TheSmokeTeam/QaaS.Runner` |
| `QAAS_REPO_FRAMEWORK_URL` | `https://github.com/TheSmokeTeam/QaaS.Framework` |
| `QAAS_REPO_MOCKER_URL` | `https://github.com/TheSmokeTeam/QaaS.Mocker` |
| `QAAS_REPO_ASSERTIONS_URL` | `https://github.com/TheSmokeTeam/QaaS.Common.Assertions` |
| `QAAS_REPO_GENERATORS_URL` | `https://github.com/TheSmokeTeam/QaaS.Common.Generators` |
| `QAAS_REPO_PROBES_URL` | `https://github.com/TheSmokeTeam/QaaS.Common.Probes` |
| `QAAS_REPO_PROCESSORS_URL` | `https://github.com/eldarush/QaaS.Common.Processors` |
| `QAAS_REPO_MOCKER_COMMUNICATION_OBJECTS_URL` | `https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects` |

### Package and dependency link variables

| Variable | Default |
| --- | --- |
| `QAAS_NUGET_BASE_URL` | `https://www.nuget.org/packages` |
| `QAAS_DOTNET_INSTALL_URL` | `https://dotnet.microsoft.com/download/dotnet/10.0` |
| `QAAS_ALLURE_CLI_URL` | `https://allurereport.org/docs/install/` |

If your environment has no internet access, point these values at your internal Git server, package mirror, or documentation mirror before you run `mkdocs build`.

## NuGet Feed Variables

For test projects and CI, keep package source values outside the markdown:

```powershell
$env:QAAS_NUGET_SOURCE = "https://artifactory.example.local/api/nuget/qaas"
$env:QAAS_RUNNER_VERSION = "0.0.0"
```

Then use them in commands such as:

```powershell
dotnet add package QaaS.Runner --version $env:QAAS_RUNNER_VERSION --source $env:QAAS_NUGET_SOURCE
```

## Container Build Inputs

The root `Dockerfile` supports build-time overrides so you can use mirrored base images and mirrored Python package indexes.

| Build arg | Default | Why you override it |
| --- | --- | --- |
| `QAAS_DOCS_PYTHON_BASE_IMAGE` | `python:3.12-slim` | Use a mirrored base image from your private registry |
| `PIP_INDEX_URL` | `https://pypi.org/simple` | Point pip at your Python package mirror |
| `PIP_EXTRA_INDEX_URL` | empty | Add a second package mirror if needed |

Example:

```powershell
$env:QAAS_DOCS_PYTHON_BASE_IMAGE = "registry.local/python:3.12-slim"
$env:PIP_INDEX_URL = "https://artifactory.example.local/api/pypi/python/simple"

docker build `
  --build-arg QAAS_DOCS_PYTHON_BASE_IMAGE=$env:QAAS_DOCS_PYTHON_BASE_IMAGE `
  --build-arg PIP_INDEX_URL=$env:PIP_INDEX_URL `
  -t registry.local/qaas-docs:latest .
```

Run the image:

```powershell
docker run --rm -p 8080:8080 registry.local/qaas-docs:latest
```

## Relative Internal Links

Internal docs links are relative and do not depend on a public `site_url`. That makes the generated site portable across:

- local `mkdocs serve`
- a static web server under a path prefix
- the container image in this repository
- an offline export copied into another environment
