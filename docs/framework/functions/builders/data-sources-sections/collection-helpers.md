---
id: framework.functions.builders.data-sources-sections.collection-helpers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, builders, data, sources, sections]
summary: "This page mirrors the Collection helpers section from Data Sources."
---
# Data Sources: Collection helpers

This page mirrors the `Collection helpers` section from [Data Sources](../data-sources.md).

## `RemoveConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.RemoveConfiguration()`
    
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

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceBuilder.UpdateConfiguration(object configuration)`
    
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
