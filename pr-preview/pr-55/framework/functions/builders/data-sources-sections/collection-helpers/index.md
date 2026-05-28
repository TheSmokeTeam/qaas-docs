# Data Sources: Collection helpers

> TL;DR — Reference page for Data Sources: Collection helpers.

This page mirrors the `Collection helpers` section from [Data Sources](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/builders/data-sources/index.md).

## `RemoveConfiguration`

Source file, signature, and docstring

**Member** `DataSourceBuilder.RemoveConfiguration()`

**Kind** `function`

**Declaring Type** `DataSourceBuilder`

**Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`

**Signature**

```csharp
public DataSourceBuilder RemoveConfiguration()
```

**Docstring**

Clears the current generator configuration.

After this call, the builder holds an empty configuration until a new one is supplied.

## `UpdateConfiguration`

Source file, signature, and docstring

**Member** `DataSourceBuilder.UpdateConfiguration(object configuration)`

**Kind** `function`

**Declaring Type** `DataSourceBuilder`

**Source File** `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`

**Signature**

```csharp
public DataSourceBuilder UpdateConfiguration(object configuration)
```

**Docstring**

Merges the supplied patch into the generator configuration stored on the current Framework data source builder instance.

Use this method when only part of the generator configuration should change. Fields omitted from the patch are preserved from the current GeneratorConfiguration tree.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
