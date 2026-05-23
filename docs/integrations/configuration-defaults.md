---
id: integrations.configuration-defaults
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, framework]
keywords: [configuration defaults, elastic, reportportal, artifactory, qaas configuration]
summary: "Use QaaS.Configuration to provide fallback Elastic and ReportPortal defaults through a NuGet package."
---
<!-- Verified-against: QaaS.ElasticBootstrap\README.md -->
<!-- Verified-against: QaaS.ElasticBootstrap\QaaS.Configuration\ConfigurationBootstrap.cs -->
<!-- Verified-against: QaaS.ElasticBootstrap\QaaS.Configuration\ElasticDefaults.cs -->
<!-- Verified-against: QaaS.ElasticBootstrap\QaaS.Configuration\ReportPortalDefaults.cs -->
<!-- Verified-against: QaaS.ElasticBootstrap\QaaS.Configuration.Tools\Program.cs -->
<!-- Verified-against: QaaS.ElasticBootstrap\QaaS.Configuration.Tools\README.md -->

# Configuration Defaults

> TL;DR — `QaaS.Configuration` supplies fallback Elastic and ReportPortal values through a NuGet package, while explicit runner or framework settings keep priority.

## When to use {: #when-to-use}

- You need default logging or reporting settings to travel with restored QaaS packages.
- You maintain an air-gapped feed and need environment-specific fallback values without changing every test repository.
- You want the public package to stay safe to publish while a private feed serves a package with the same ID and version but different fallback values.

The repository is still named `QaaS.ElasticBootstrap`, but the package and namespace are `QaaS.Configuration`. The current public API names are `ElasticDefaults`, `ReportPortalDefaults`, and `ConfigurationBootstrap`.

## YAML configuration {: #yaml-configuration}

No QaaS YAML is required to install the defaults package. The fallback values are used only when the run did not already provide explicit Elastic settings such as `send-logs`, `elastic-uri`, `elastic-username`, or `elastic-password`.

```yaml
# Runner YAML can still override package defaults explicitly.
MetaData:
  Team: Platform
  System: Checkout

Sessions: []
Assertions: []
```

## C# (CAC) usage {: #c-cac-usage}

The package registers defaults at startup through `ConfigurationBootstrap.Register()`. The registration path calls `QaaS.Framework.Executions.ExecutionLogging.RegisterDefaults(...)` when that framework type is available.

```csharp
using QaaS.Configuration;

ConfigurationBootstrap.Register();
```

Most consumers get the registration through the package's `buildTransitive` initializer, so application code usually does not need to call it directly.

## Minimal example {: #minimal-example}

Build a package with explicit fallback values, but do not push it:

```powershell
dotnet run `
  --project .\QaaS.Configuration.Tools\QaaS.Configuration.Tools.csproj `
  -- `
  --package-version 1.0.0 `
  --send-logs true `
  --elastic-uri http://elastic.local:9200 `
  --reportportal-enabled true `
  --reportportal-uri https://reportportal.local
```

The tool writes package artifacts under `artifacts/internal-package`.

## Realistic example {: #realistic-example}

Build the same package ID and version for an air-gapped feed, then push it to the higher-priority Artifactory source:

```powershell
dotnet run `
  --project .\QaaS.Configuration.Tools\QaaS.Configuration.Tools.csproj `
  -- `
  --package-version 1.0.0 `
  --send-logs true `
  --elastic-uri http://elastic.airgap.local:9200 `
  --elastic-username qaas-logs `
  --elastic-password $env:QAAS_ELASTIC_PASSWORD `
  --reportportal-enabled true `
  --reportportal-uri https://reportportal.airgap.local `
  --reportportal-api-key $env:QAAS_REPORTPORTAL_API_KEY `
  --push-to-artifactory true `
  --artifactory-source $env:QAAS_ARTIFACTORY_SOURCE_URL `
  --artifactory-api-key $env:QAAS_ARTIFACTORY_API_KEY
```

The tool copies the repository to a disposable staging directory, rewrites `ElasticDefaults.cs` and `ReportPortalDefaults.cs`, packs `QaaS.Configuration`, and pushes the generated packages when Artifactory publishing is enabled.

## Edge cases {: #edge-cases}

- Public package defaults keep `ElasticDefaults.SendLogs` disabled and leave Elastic connection values null.
- `ReportPortalDefaults.Enabled` is true by default, while the ReportPortal URI and API key remain null in the public package.
- The consuming NuGet source order matters: the feed containing the environment-specific package must be resolved before the public mirror.
- The former public names `QaaS.ElasticBootstrap`, `ElasticBootstrapDefaults`, and `Bootstrap` were renamed; use the current `QaaS.Configuration` names in new docs and code.

## See also {: #see-also}

- [CI Pipeline](ci-pipeline.md)
- [PackageMirror](package-mirror.md)
- [Runner configuration resolution priority](../qaas/userInterfaces/runner/configurationResolutionPriority.md)
