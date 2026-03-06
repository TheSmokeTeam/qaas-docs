# QaaS Zero to Hero

QaaS is a .NET-based test and mock ecosystem for protocol-heavy systems. The practical path is:

1. Install the feed and packages in [Environment Setup](quick-start/installation.md).
2. Write one runnable test in [Write a Test in YAML](quick-start/write-test-yaml.md) or [Write a Test in Code](quick-start/write-test-code.md).
3. Run it with [Run a Test](quick-start/run-test.md).
4. Make it maintainable with [Keep Tests Maintainable](quick-start/make-test-maintainable.md).
5. Use [Mocker Usage](user-guide/mocker.md) when the system under test needs controllable dependencies.

## What This Site Covers

| Area | Why it exists | Main repo |
| --- | --- | --- |
| `QaaS.Runner` | Executes tests defined in YAML or C# builders | [QaaS.Runner]([[repo:runner]]) |
| `QaaS.Framework.*` | Shared configuration, SDK, protocol, policy, and serialization building blocks | [QaaS.Framework]([[repo:framework]]) |
| `QaaS.Mocker` | Runs HTTP, gRPC, and socket mocks with optional Redis control | [QaaS.Mocker]([[repo:mocker]]) |
| `QaaS.Common.*` | Reusable hooks: assertions, generators, probes, processors | [Workspace Components](user-guide/components.md) |
| `QaaS.Mocker.CommunicationObjects` | Contracts used by runner-issued mocker commands | [CommunicationObjects]([[repo:mocker-communication-objects]]) |

## Local Docs Workflow

Serve the unified site from the repository root:

```powershell
mkdocs serve -o
```

Build the static site:

```powershell
mkdocs build --clean
```

The old `qaas-docs/_docs/v4` entrypoint is kept as a compatibility shim, but the root `mkdocs.yml` is now the canonical source.

## Fast Mental Model

```text
Test project (YAML or C#)
  -> QaaS.Runner
    -> QaaS.Framework (config + SDK + protocols + policies + serialization)
    -> QaaS.Common.Assertions / Generators / Probes
    -> optional QaaS.Mocker commands
      -> QaaS.Mocker
        -> QaaS.Common.Processors
        -> QaaS.Mocker.CommunicationObjects
```

## Source-First Links

All external repository and package links in this site are generated from environment variables. Defaults point to GitHub and NuGet, but you can override them for a private Git server or Artifactory in [Air-Gapped Deployment](operations/air-gapped.md).
