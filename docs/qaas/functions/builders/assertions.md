---
id: qaas.functions.builders.assertions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, builders, assertions]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\AssertionBuilder.cs -->

# Assertions

> TL;DR — This page lists the public Runner functions in the `Assertions` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection {: #identity-and-hook-selection}

### `Named` {: #named}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner assertion builder instance.

### `HookNamed` {: #hooknamed}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.HookNamed(string hookName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder HookNamed(string hookName)
    ```
    
    **Docstring**
    
    Sets the hook implementation name used by the current Runner assertion builder instance.

## Classification {: #classification}

### `WithCategory` {: #withcategory}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WithCategory(string category)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WithCategory(string category)
    ```
    
    **Docstring**
    
    Configures category on the current Runner assertion builder instance.

### `WithSeverity` {: #withseverity}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WithSeverity(AssertionSeverity severity)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WithSeverity(AssertionSeverity severity)
    ```
    
    **Docstring**
    
    Sets the severity associated with the assertion result.

## Data source selection {: #data-source-selection}

### `AddDataSourceName` {: #adddatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source name to the current Runner assertion builder instance.

### `RemoveDataSourceName` {: #removedatasourcename}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourceName(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourceName(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source name from the current Runner assertion builder instance.

### `RemoveDataSourceNameAt` {: #removedatasourcenameat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourceNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourceNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source name at the specified index from the current Runner assertion builder instance.

### `AddDataSourcePattern` {: #adddatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner assertion builder instance.

### `RemoveDataSourcePattern` {: #removedatasourcepattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner assertion builder instance.

### `RemoveDataSourcePatternAt` {: #removedatasourcepatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveDataSourcePatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveDataSourcePatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern at the specified index from the current Runner assertion builder instance.

## Session selection {: #session-selection}

### `AddSessionName` {: #addsessionname}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Adds the supplied session name to the current Runner assertion builder instance.

### `RemoveSessionName` {: #removesessionname}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionName(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionName(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session name from the current Runner assertion builder instance.

### `RemoveSessionNameAt` {: #removesessionnameat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionNameAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionNameAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session name at the specified index from the current Runner assertion builder instance.

### `AddSessionPattern` {: #addsessionpattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Adds the supplied session pattern to the current Runner assertion builder instance.

### `RemoveSessionPattern` {: #removesessionpattern}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionPattern(string sessionPattern)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionPattern(string sessionPattern)
    ```
    
    **Docstring**
    
    Removes the configured session pattern from the current Runner assertion builder instance.

### `RemoveSessionPatternAt` {: #removesessionpatternat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveSessionPatternAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveSessionPatternAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured session pattern at the specified index from the current Runner assertion builder instance.

## Links {: #links}

### `AddLink` {: #addlink}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.AddLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder AddLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied link to the current Runner assertion builder instance.

### `RemoveLink` {: #removelink}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveLink(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveLink(string name)
    ```
    
    **Docstring**
    
    Removes the configured link from the current Runner assertion builder instance.

### `RemoveLinkAt` {: #removelinkat}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveLinkAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveLinkAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured link at the specified index from the current Runner assertion builder instance.

## Reporting and artifacts {: #reporting-and-artifacts}

### `ReportOnlyStatuses` {: #reportonlystatuses}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ReportOnlyStatuses(IList<AssertionStatus> statusesToReport)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder ReportOnlyStatuses(IList<AssertionStatus> statusesToReport)
    ```
    
    **Docstring**
    
    Sets which assertion statuses should be included in reports.

### `ShouldSaveSessionData` {: #shouldsavesessiondata}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ShouldSaveSessionData(bool shouldSaveSessionData)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder ShouldSaveSessionData(bool shouldSaveSessionData)
    ```
    
    **Docstring**
    
    Configures whether session data is saved with the assertion result.

### `ShouldSaveLogs` {: #shouldsavelogs}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ShouldSaveLogs(bool shouldSaveLogs)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder ShouldSaveLogs(bool shouldSaveLogs)
    ```
    
    **Docstring**
    
    Configures whether logs are saved with the assertion result.

### `ShouldSaveConfigurationTemplate` {: #shouldsaveconfigurationtemplate}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ShouldSaveConfigurationTemplate(bool shouldSaveConfigurationTemplate)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder ShouldSaveConfigurationTemplate(bool shouldSaveConfigurationTemplate)
    ```
    
    **Docstring**
    
    Configures whether the rendered configuration template is saved with the assertion result.

### `ShouldSaveAttachments` {: #shouldsaveattachments}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ShouldSaveAttachments(bool shouldSaveAttachments)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder ShouldSaveAttachments(bool shouldSaveAttachments)
    ```
    
    **Docstring**
    
    Configures whether attachments are saved with the assertion result.

### `ShouldDisplayTrace` {: #shoulddisplaytrace}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ShouldDisplayTrace(bool shouldDisplayTrace)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder ShouldDisplayTrace(bool shouldDisplayTrace)
    ```
    
    **Docstring**
    
    Configures whether the assertion trace is displayed with the result.

## Collection helpers {: #collection-helpers}

### `UpdateConfiguration` {: #updateconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.

### `RemoveConfiguration` {: #removeconfiguration}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.RemoveConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder RemoveConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner assertion builder instance.

## General {: #general}

### `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.Configure(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder Configure(object configuration)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner assertion builder instance.

## See also {: #see-also}

- [Runner Functions](../index.md)
