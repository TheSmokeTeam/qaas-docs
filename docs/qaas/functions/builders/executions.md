---
id: qaas.functions.builders.executions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, executions]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs -->

# Executions

> TL;DR — This page lists the public Runner functions in the `Executions` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Data source selection {: #data-source-selection}

### `AddDataSource` {: #adddatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner execution builder instance.

### `UpdateDataSource` {: #updatedatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner execution builder instance.

### `RemoveDataSource` {: #removedatasource}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner execution builder instance.

### `RemoveDataSourceAt` {: #removedatasourceat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveDataSourceAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveDataSourceAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source at the specified index from the current Runner execution builder instance.

## Session selection {: #session-selection}

### `AddSession` {: #addsession}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddSession(SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied session to the current Runner execution builder instance.

### `UpdateSession` {: #updatesession}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateSession(string sessionName, SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured session stored on the current Runner execution builder instance.

### `RemoveSession` {: #removesession}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveSession(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveSession(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session from the current Runner execution builder instance.

### `RemoveSessionAt` {: #removesessionat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveSessionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveSessionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session at the specified index from the current Runner execution builder instance.

## Links {: #links}

### `AddLink` {: #addlink}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied link to the current Runner execution builder instance.

### `UpdateLinkAt` {: #updatelinkat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateLinkAt(int index, LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateLinkAt(int index, LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Updates the configured link at the specified index on the current Runner execution builder instance.

### `RemoveLink` {: #removelink}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveLink(string linkName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveLink(string linkName)
    ```
    
    **Docstring**
    
    Removes the configured link from the current Runner execution builder instance.

### `RemoveLinkAt` {: #removelinkat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveLinkAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveLinkAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured link at the specified index from the current Runner execution builder instance.

## Storages {: #storages}

### `AddStorage` {: #addstorage}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStorage(StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStorage(StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied storage to the current Runner execution builder instance.

### `UpdateStorageAt` {: #updatestorageat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStorageAt(int index, StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStorageAt(int index, StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Updates the configured storage at the specified index on the current Runner execution builder instance.

### `RemoveStorageAt` {: #removestorageat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveStorageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveStorageAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured storage at the specified index from the current Runner execution builder instance.

## Assertions {: #assertions}

### `AddAssertion` {: #addassertion}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddAssertion(AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied assertion to the current Runner execution builder instance.

### `UpdateAssertion` {: #updateassertion}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured assertion stored on the current Runner execution builder instance.

### `RemoveAssertion` {: #removeassertion}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveAssertion(string assertionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveAssertion(string assertionName)
    ```
    
    **Docstring**
    
    Removes the configured assertion from the current Runner execution builder instance.

### `RemoveAssertionAt` {: #removeassertionat}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.RemoveAssertionAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder RemoveAssertionAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured assertion at the specified index from the current Runner execution builder instance.

## Reporters {: #reporters}

### `UpdateReporters` {: #updatereporters}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateReporters(ReporterBuilder reporterBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateReporters(ReporterBuilder reporterBuilder)
    ```
    
    **Docstring**
    
    Updates the reporter configuration stored on the current Runner execution builder instance.

## Executions {: #executions_1}

### `ExecutionType` {: #executiontype}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.ExecutionType(ExecutionType executionType)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ExecutionType(ExecutionType executionType)
    ```
    
    **Docstring**
    
    Sets the execution type used when the runner execution is built.

### `SetExecutionId` {: #setexecutionid}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetExecutionId(string executionId)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetExecutionId(string executionId)
    ```
    
    **Docstring**
    
    Sets the execution identifier stored on the built context.
    
    The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

## Configuration {: #configuration}

### `WithGlobalDict` {: #withglobaldict}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithGlobalDict(Dictionary<string, object?> globalDict)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithGlobalDict(Dictionary<string, object?> globalDict)
    ```
    
    **Docstring**
    
    Replaces the global dictionary stored on the runner execution context.

### `SetCase` {: #setcase}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetCase(string caseName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetCase(string caseName)
    ```
    
    **Docstring**
    
    Sets the case file applied by the context builder.
    
    Case files are used as the final scenario-specific overlay that shapes the runtime configuration for a specific execution.

### `WithMetadata` {: #withmetadata}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithMetadata(MetaDataConfig metaDataConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithMetadata(MetaDataConfig metaDataConfig)
    ```
    
    **Docstring**
    
    Sets the metadata configuration stored on the execution.

## General {: #general}

### `Build` {: #build}

??? info "Source file, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Source File** `QaaS.Runner/ExecutionBuilder.cs`
    
    **Signature**
    ```csharp
    public override Execution Build()
    ```
    
    **Docstring**
    
    Builds the configured Runner execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.

## See also {: #see-also}

- [Runner Functions](../index.md)
