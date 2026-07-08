# Policies: General

> TL;DR — This page mirrors the `General` section from [Policies](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/builders/policies/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `Configure`

Source file, signature, and docstring

**Member** `PolicyBuilder.Configure(IPolicyConfig config)`

**Kind** `function`

**Declaring Type** `PolicyBuilder`

**Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`

**Signature**

```csharp
public PolicyBuilder Configure(IPolicyConfig config)
```

**Docstring**

Sets the configuration currently stored on the Framework policy builder instance.

### `Build`

Source file, signature, and docstring

**Member** `PolicyBuilder.Build()`

**Kind** `function`

**Declaring Type** `PolicyBuilder`

**Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`

**Signature**

```csharp
public Policy Build()
```

**Docstring**

Builds the configured Framework policy builder output from the current state.

Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

### `BuildPolicies`

Source file, signature, and docstring

**Member** `PolicyBuilder.BuildPolicies(PolicyBuilder[]? policyBuilders)`

**Kind** `function`

**Declaring Type** `PolicyBuilder`

**Source File** `QaaS.Framework.Policies/PolicyBuilder.cs`

**Signature**

```csharp
public static Policy? BuildPolicies(PolicyBuilder[]? policyBuilders)
```

**Docstring**

Builds a policy chain from the supplied policy builder collection.

This helper lets callers collapse several fluent policy builders into the policy chain consumed by the runtime configuration surface.

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Policies](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/builders/policies/index.md)
