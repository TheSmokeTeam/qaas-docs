# Global Dictionary

The Runner global dictionary is the shared mutable state that lives alongside the built execution. Use it when values must be available at runtime across hooks, [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md), [Assertions](../userInterfaces/runner/configurationSections/assertions/overview.md), and other execution components.

This is the recommended replacement for the old Framework-specific Variables runtime helper. YAML `variables` still remain a valid configuration section for placeholders, but if you want those values inside runtime code, project that section into the global dictionary.

Runner now does that projection automatically by default. When a built execution has a root `variables` section, Runner copies it into the shared global dictionary under `Variables`.

## What It Is For

Use the global dictionary when you need to:

- share values between hooks during one Runner invocation
- keep runtime state separate from the immutable YAML shape
- preload configuration sections such as `variables` into code-visible state
- seed values before execution starts
- let custom hooks and related runtime steps persist recovery state and shared defaults between earlier and later phases of the same execution

## Hook Usage

The global dictionary is meant for runtime coordination between hooks and other execution steps in the same run.

That is useful when:

- setup logic discovers values that later runtime steps should reuse
- cleanup logic needs IDs, tokens, or recovery state captured earlier in the execution
- [Probes](../../probes/index.md) or other hook packages want to fall back to previously captured values instead of duplicating configuration

Hook-specific keys, fallback rules, and recovery behavior belong to the hook documentation itself. For probe-specific behavior, see the relevant [Probes](../../probes/index.md) page and the individual probe pages under it.

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
- IDs returned from [Publishers](../userInterfaces/runner/configurationSections/sessions/types/publishers.md), [Consumers](../userInterfaces/runner/configurationSections/sessions/types/consumers.md), or [Probes](../userInterfaces/runner/configurationSections/sessions/types/probes.md)
- data that later [Assertions](../userInterfaces/runner/configurationSections/assertions/overview.md) or cleanup hooks need

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
