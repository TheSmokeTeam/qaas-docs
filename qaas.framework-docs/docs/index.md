# QaaS.Framework

`QaaS.Framework` is the shared runtime layer used by `QaaS.Runner`, `QaaS.Mocker`, and all QaaS plugin packages. If you are writing custom generators, assertions, probes, processors, or protocol integrations, this is the part of the ecosystem that defines the contracts and the execution model.

The framework is split into focused packages:

- [`QaaS.Framework.SDK`](./projects/sdk.md) for core runtime objects and hook contracts
- [`QaaS.Framework.Configurations`](./projects/configuration.md) for YAML loading, binding, validation, and reference resolution
- [`QaaS.Framework.Executions`](./projects/executions.md) for runner-style loading, logging, and execution orchestration
- [`QaaS.Framework.Infrastructure`](./projects/infrastructure.md) for shared utility helpers
- [`QaaS.Framework.Policies`](./projects/policies.md) for rate, timeout, and stage-based execution control
- [`QaaS.Framework.Protocols`](./projects/protocols.md) for protocol abstractions and implementations
- [`QaaS.Framework.Providers`](./projects/providers.md) for hook discovery and DI registration
- [`QaaS.Framework.Serialization`](./projects/serialization.md) for serializer and deserializer support

Read the SDK page first when you need to understand hook base classes or shared data structures. Read Configurations and Executions next when you need to understand how YAML, command-line options, references, and loaders produce the final runtime behavior.
