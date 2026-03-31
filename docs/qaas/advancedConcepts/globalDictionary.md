# Global Dictionary

The Runner global dictionary is the shared mutable state that lives alongside the built execution. Use it when values must be available at runtime across hooks, sessions, assertions, and other execution components.

This is the recommended replacement for the old Framework-specific Variables runtime helper. YAML `variables` still remain a valid configuration section for placeholders, but if you want those values inside runtime code, project that section into the global dictionary.

Runner now does that projection automatically by default. When a built execution has a root `variables` section, Runner copies it into the shared global dictionary under `Variables`.

## What It Is For

Use the global dictionary when you need to:

- share values between hooks during one Runner invocation
- keep runtime state separate from the immutable YAML shape
- preload configuration sections such as `variables` into code-visible state
- seed values before execution starts
- let selected probes persist recovery state and shared defaults between related probe steps in the same execution and session

## Probe Global Dictionary Fallback

Selected probes in `QaaS.Common.Probes` can now opt into global-dictionary-backed configuration fallback through:

```yaml
ProbeConfiguration:
  UseGlobalDict: true
```

When `UseGlobalDict` is `true`, the probe merges configuration in this order:

1. probe-global-dictionary defaults and recovery payloads
2. local YAML or code configuration
3. normal bind and validation

This merge is based on raw key presence, not typed defaults. That means an omitted key can come from the global dictionary, but an explicit local value such as `false`, `0`, `""`, or an empty collection still wins and keeps current behavior.

When `UseGlobalDict` is `false`, the current behavior remains unchanged: the probe reads only its local configuration and does not use probe-global-dictionary state.

## Probe Storage Paths

Probe-global-dictionary writes are scoped uniquely per execution, session, and probe:

```text
__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>
```

`<execution-scope>` follows the Runner artifact convention:

- `ExecutionId::CaseName` when those values exist
- `context::<hash>` only as a fallback for direct in-memory usage outside the normal Runner execution flow

Family aliases then point to those canonical entries:

```text
__ProbeGlobalDict/Aliases/<execution-scope>/<session-name>/...
```

The alias is what later probes read. The canonical scoped path is what keeps every probe execution isolated, even when several probes in the same session use the same family alias.

## Recovery Example: Delete Then Recreate RabbitMQ Exchanges

One intended use case is recovery testing:

1. `DeleteRabbitMqExchanges` runs with `UseGlobalDict: true`
2. it writes the resolved broker defaults under the session-scoped `RabbitMq/AmqpDefaults` alias
3. it writes the deleted exchange list under `RabbitMq/Recovery/Exchanges`
4. `CreateRabbitMqExchanges` later runs in the same execution and session with `UseGlobalDict: true`
5. if local `Host`, `Port`, `Username`, `Password`, `VirtualHost`, or `Exchanges` keys are missing, the create probe restores them from those aliases

Example:

```yaml
Sessions:
  - Name: RecoverySession
    Probes:
      - Name: DeleteExchanges
        Probe: DeleteRabbitMqExchanges
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          Username: guest
          Password: guest
          Port: 5672
          VirtualHost: /
          ExchangeNames:
            - orders.exchange

      - Name: RecreateExchanges
        Probe: CreateRabbitMqExchanges
        ProbeConfiguration:
          UseGlobalDict: true
```

The second probe can omit the exchange list because the first probe already captured it in the scoped probe global dictionary for that execution and session.

## Which Probes Use It

The first pass enables probe-global-dictionary fallback for:

- RabbitMQ lifecycle and definitions probes
- OpenShift deployment and stateful-set mutation probes, plus config-map editing
- Redis maintenance and command probes
- Elasticsearch cleanup probes
- MongoDB cleanup probes
- S3 bucket maintenance probes
- SQL truncate probes

Two OpenShift probes are intentionally excluded in this first pass because they do not have a meaningful reusable recovery payload:

- `OsRestartPods`
- `OsExecuteCommandsInContainers`

For the exact Framework API surface, see [Context global dictionary](../../framework/functions/extension-methods-sections/extension-methods/context-global-dictionary.md) and [ExecutionBuilder configuration helpers](../functions/builders/executions-sections/configuration.md).

## Placeholder Values vs Runtime State

These two concepts are related but not the same:

- the YAML `variables` section is part of configuration and is mainly used by placeholder resolution such as `${variables:rabbitmq:host}`
- the global dictionary is mutable runtime state stored on the execution context

By default, Runner also loads that configuration section into runtime state under `Variables`, so runtime code can read the same values without relying on a separate Variables feature.

## Runner Default: Auto-Load `variables` Into `Variables`

If the loaded configuration contains:

```yaml
variables:
  rabbitmq:
    host: localhost
    port: 5672
```

Runner builds each execution with:

```csharp
var host = context.GetValueFromGlobalDictionary(["Variables", "rabbitmq", "host"]);
var port = context.GetValueFromGlobalDictionary(["Variables", "rabbitmq", "port"]);
```

The default is controlled by `Runner.LoadVariablesIntoGlobalDict`, which starts as `true`.

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
runner.LoadVariablesIntoGlobalDict = false;
```

Custom runner types can also override that property:

```csharp
public sealed class MyRunner : Runner
{
    public override bool LoadVariablesIntoGlobalDict { get; set; } = false;
}
```

Turn it off only if you want to keep `variables` available for placeholder resolution but do not want those values copied into mutable runtime state.

## Load the `variables` Section Into the Global Dictionary Manually

Inside a hook or any place where you already have access to the current context:

```csharp
using QaaS.Framework.SDK.Extensions;

context.LoadConfigurationSectionIntoGlobalDictionary("variables");
```

That projects:

```yaml
variables:
  rabbitmq:
    host: localhost
    port: 5672
```

into a runtime path that can be read as:

```csharp
var host = context.GetValueFromGlobalDictionary(["variables", "rabbitmq", "host"]);
var port = context.GetValueFromGlobalDictionary(["variables", "rabbitmq", "port"]);
```

Use the manual form when:

- you disabled `Runner.LoadVariablesIntoGlobalDict`
- you want to load the section later in the runtime flow instead of during build
- you want the runtime path to stay lowercase `variables` for compatibility with older hook code

## Load a Section Into a Different Runtime Path

You are not limited to reusing the configuration path as-is. You can project a section into any destination path:

```csharp
using QaaS.Framework.SDK.Extensions;

context.LoadConfigurationSectionIntoGlobalDictionary(
    "variables:rabbitmq",
    ["runtime", "rabbitmq"]);
```

Then read it from:

```csharp
var host = context.GetValueFromGlobalDictionary(["runtime", "rabbitmq", "host"]);
```

Use this when:

- several configuration sections should be normalized under one runtime root
- a hook wants a shorter or more domain-specific path
- you want to keep the original configuration path separate from the runtime path

## Seed Values Before Execution Starts

If you already know runtime values before the execution is built, preload them through the execution builder:

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

executionBuilder.WithGlobalDict(new Dictionary<string, object?>
{
    ["environment"] = new Dictionary<string, object?>
    {
        ["name"] = "local"
    }
});
```

Runner pushes one shared global dictionary into the execution builders that belong to the same runner invocation, so this is the right place for per-run state that should already exist before hooks start.

## Add or Update Runtime Values During Execution

You can create or overwrite paths at any time:

```csharp
context.InsertValueIntoGlobalDictionary(
    ["runtime", "tokens", "accessToken"],
    accessToken);
```

This is useful for:

- values discovered during setup
- IDs returned from publishers, consumers, or probes
- data that later assertions or cleanup hooks need

## Read Runtime Values Safely

```csharp
var correlationId = context.GetValueFromGlobalDictionary(
    ["runtime", "correlation", "id"]);
```

If the path does not exist, QaaS throws a `KeyNotFoundException`. That is usually preferable to silently continuing with the wrong runtime state.

## Recommended Pattern for Variables Files

If your project already uses overwrite files such as `Variables/local.yaml` and `Variables/k8s.yaml`, keep doing that for placeholder resolution. When runtime code also needs those values:

1. load the YAML or overwrite files through the normal Runner bootstrap path
2. rely on the default Runner auto-load into `["Variables", ...]`, or call `context.LoadConfigurationSectionIntoGlobalDictionary("variables")` yourself if you disabled that default
3. read the values from the global dictionary in later hooks

This keeps one source of truth for environment-specific values while removing the need for a dedicated Variables runtime object.

## Example

```csharp
using QaaS.Framework.SDK.Extensions;
using QaaS.Runner;

var runner = Bootstrap.New(["run", "test.qaas.yaml"]);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

executionBuilder.WithGlobalDict(new Dictionary<string, object?>
{
    ["runtime"] = new Dictionary<string, object?>
    {
        ["startedBy"] = Environment.UserName
    }
});

var rabbitMqHost = context.GetValueFromGlobalDictionary(["Variables", "rabbitmq", "host"]);
```

This gives you both:

- immutable configuration values coming from YAML and overwrite files
- mutable runtime values stored in one shared global dictionary
