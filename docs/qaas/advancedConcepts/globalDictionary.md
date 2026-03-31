# Global Dictionary

The Runner global dictionary is the shared mutable state that lives alongside the built execution. Use it when values must be available at runtime across hooks, sessions, assertions, and other execution components.

This is the recommended replacement for the old Framework-specific Variables runtime helper. YAML `variables` still remain a valid configuration section for placeholders, but if you want those values inside runtime code, project that section into the global dictionary.

## What It Is For

Use the global dictionary when you need to:

- share values between hooks during one Runner invocation
- keep runtime state separate from the immutable YAML shape
- preload configuration sections such as `variables` into code-visible state
- seed values before execution starts

For the exact Framework API surface, see [Context global dictionary](../../framework/functions/extension-methods-sections/extension-methods/context-global-dictionary.md) and [ExecutionBuilder configuration helpers](../functions/builders/executions-sections/configuration.md).

## Placeholder Values vs Runtime State

These two concepts are related but not the same:

- the YAML `variables` section is part of configuration and is mainly used by placeholder resolution such as `${variables:rabbitmq:host}`
- the global dictionary is mutable runtime state stored on the execution context

If you want the same `variables` values to be available inside your code, load that configuration section into the global dictionary explicitly.

## Load the `variables` Section Into the Global Dictionary

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
2. call `context.LoadConfigurationSectionIntoGlobalDictionary("variables")` once near the start of the runtime flow
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

// Later, inside a hook that has access to the current context:
context.LoadConfigurationSectionIntoGlobalDictionary("variables");
var rabbitMqHost = context.GetValueFromGlobalDictionary(["variables", "rabbitmq", "host"]);
```

This gives you both:

- immutable configuration values coming from YAML and overwrite files
- mutable runtime values stored in one shared global dictionary
