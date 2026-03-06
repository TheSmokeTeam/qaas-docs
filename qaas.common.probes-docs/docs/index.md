## QaaS.Common.Probes Zero-to-Hero

### Overview

[`QaaS.Common.Probes`](https://github.com/TheSmokeTeam/QaaS.Common.Probes) packages operational hooks used inside runner sessions to change environment state or clean supporting systems before, during, or after a test flow.

Probe families:

| Family | Typical use |
| --- | --- |
| OpenShift / Kubernetes | scale pods, update images, edit config maps, execute commands |
| RabbitMQ | create, delete, bind, purge exchanges and queues |
| Redis | flush databases or delete keys in batches |
| S3 | empty or delete buckets |
| SQL | truncate tables in MSSQL, PostgreSQL, or Oracle |
| Elasticsearch | empty matching indices |

### Architecture & Connections

- Probes implement `IProbe` contracts from `QaaS.Framework.Executions`.
- `QaaS.Runner.Sessions.ProbeBuilder` resolves them by name and can scope them to a session.
- Most probes rely on client adapters exposed by `QaaS.Framework.Protocols` or on external infrastructure SDKs directly.

### Quick Start

```bash
dotnet restore D:/QaaS/QaaS.Common.Probes/QaaS.Common.Probes.sln
dotnet build D:/QaaS/QaaS.Common.Probes/QaaS.Common.Probes.sln -c Release --no-restore
dotnet test D:/QaaS/QaaS.Common.Probes/QaaS.Common.Probes.sln -c Release --no-build
dotnet add package QaaS.Common.Probes
```

### Technical Reference

- OpenShift probes all inherit `OsProbeConfig`, which carries the target cluster identity.
- RabbitMQ probes share connection settings through `BaseRabbitMqConfig`.
- Redis probes share `RedisDataBaseProbeBaseConfig`.
- S3 and SQL probes expose narrow task-specific configs rather than one generic catch-all object.

Dependency notes:

- [Kubernetes .NET client](https://github.com/kubernetes-client/csharp)
- [AWS SDK for .NET](https://docs.aws.amazon.com/sdk-for-net/v4/developer-guide/welcome.html)
- [RabbitMQ .NET client](https://www.rabbitmq.com/client-libraries/dotnet-api-guide)

### Troubleshooting & Links

- If an OpenShift probe hangs, inspect the desired-state polling fields first.
- Batch Redis cleanup is safer than `FLUSHALL` in shared environments.
- SQL truncate probes assume the target credentials can modify every listed table.

- Source: [TheSmokeTeam/QaaS.Common.Probes](https://github.com/TheSmokeTeam/QaaS.Common.Probes)
- NuGet: [QaaS.Common.Probes](https://www.nuget.org/packages/QaaS.Common.Probes/)
