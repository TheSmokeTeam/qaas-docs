## QaaS.Mocker.CommunicationObjects Zero-to-Hero

### Overview

[`QaaS.Mocker.CommunicationObjects`](https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects) holds the shared contracts used when `QaaS.Runner` controls `QaaS.Mocker` at runtime.

It covers two concerns:

- deterministic channel naming through `CommunicationMethods`,
- payload contracts for ping and command messages.

### Architecture & Connections

- `QaaS.Runner` uses this package when session actions send mocker commands.
- `QaaS.Mocker.Controller` uses the same package to deserialize incoming requests and serialize responses.
- The package depends only on `QaaS.Framework.SDK`, which keeps the shared contract surface small.

### Quick Start

```bash
dotnet restore D:/QaaS/Qaas.Mocker.CommunicationObjects/Qaas.Mocker.CommunicationObjects.sln
dotnet build D:/QaaS/Qaas.Mocker.CommunicationObjects/Qaas.Mocker.CommunicationObjects.sln -c Release --no-restore
dotnet test D:/QaaS/Qaas.Mocker.CommunicationObjects/Qaas.Mocker.CommunicationObjects.sln -c Release --no-restore --maxcpucount
dotnet add package QaaS.Mocker.CommunicationObjects
```

### Technical Reference

- `CommunicationMethods` generates the Redis channel names used by the runner and mocker.
- `CommandRequest` and `CommandResponse` carry command traffic.
- `PingRequest` and `PingResponse` carry liveness checks.
- `ChangeActionStub`, `TriggerAction`, and `Consume` are the supported command payloads.

### Troubleshooting & Links

- Version skew between runner and mocker shows up here first. If commands deserialize incorrectly, compare package versions before debugging Redis.
- Channel naming is deterministic and lower-cased. If traffic disappears, inspect channel construction rather than the controller handlers first.

- Source: [TheSmokeTeam/Qaas.Mocker.CommunicationObjects](https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects)
- NuGet: [QaaS.Mocker.CommunicationObjects](https://www.nuget.org/packages/QaaS.Mocker.CommunicationObjects/)
