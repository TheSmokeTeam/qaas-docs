# Contexts: Contexts

> TL;DR: Reference page for Contexts: Contexts.

This page mirrors the `Contexts` section from [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md).

## `ContextBuilder`

Source file, signature, and docstring

**Member** `ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`

**Kind** `constructor`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
```

**Docstring**

Creates a context builder that starts from a base QaaS configuration file.

Use this constructor when the context should load its initial configuration from a file path before overwrite sources and reference resolution are applied.

## `ContextBuilder`

Source file, signature, and docstring

**Member** `ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`

**Kind** `constructor`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
```

**Docstring**

Creates a context builder that starts from an existing configuration builder pipeline.

Use this constructor when configuration sources are assembled externally and should be handed to the QaaS context pipeline as-is.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
