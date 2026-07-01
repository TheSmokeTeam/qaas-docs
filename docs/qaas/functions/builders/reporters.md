---
id: qaas.functions.builders.reporters
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [runner]
keywords: [runner, reference]
summary: "Reference page for Reporters."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\ReporterBuilder.cs -->

# Reporters

> TL;DR — This page lists the public Runner functions in the `Reporters` category.

## When to use {: #when-to-use}

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Reporting and artifacts {: #reporting-and-artifacts}

### `ShouldSaveLogs` {: #shouldsavelogs}

??? info "Source file, signature, and docstring"
    **Member**
    `ReporterBuilder.ShouldSaveLogs(bool shouldSaveLogs)`
    
    **Kind** `function`
    
    **Declaring Type** `ReporterBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/ReporterBuilder.cs`
    
    **Signature**
    ```csharp
    public ReporterBuilder ShouldSaveLogs(bool shouldSaveLogs)
    ```
    
    **Docstring**
    
    Configures whether assertion session logs are saved with reporter results.

### `ShouldSaveAttachments` {: #shouldsaveattachments}

??? info "Source file, signature, and docstring"
    **Member**
    `ReporterBuilder.ShouldSaveAttachments(bool shouldSaveAttachments)`
    
    **Kind** `function`
    
    **Declaring Type** `ReporterBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/ReporterBuilder.cs`
    
    **Signature**
    ```csharp
    public ReporterBuilder ShouldSaveAttachments(bool shouldSaveAttachments)
    ```
    
    **Docstring**
    
    Configures whether assertion attachments are saved with reporter results.

### `ShouldSaveSessionData` {: #shouldsavesessiondata}

??? info "Source file, signature, and docstring"
    **Member**
    `ReporterBuilder.ShouldSaveSessionData(bool shouldSaveSessionData)`
    
    **Kind** `function`
    
    **Declaring Type** `ReporterBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/ReporterBuilder.cs`
    
    **Signature**
    ```csharp
    public ReporterBuilder ShouldSaveSessionData(bool shouldSaveSessionData)
    ```
    
    **Docstring**
    
    Configures whether assertion session data is saved with reporter results.

### `ShouldDisplayTrace` {: #shoulddisplaytrace}

??? info "Source file, signature, and docstring"
    **Member**
    `ReporterBuilder.ShouldDisplayTrace(bool shouldDisplayTrace)`
    
    **Kind** `function`
    
    **Declaring Type** `ReporterBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/ReporterBuilder.cs`
    
    **Signature**
    ```csharp
    public ReporterBuilder ShouldDisplayTrace(bool shouldDisplayTrace)
    ```
    
    **Docstring**
    
    Configures whether the assertion message trace is displayed in reporter results.

## General {: #general}

### `ConfigureReportPortal` {: #configurereportportal}

??? info "Source file, signature, and docstring"
    **Member**
    `ReporterBuilder.ConfigureReportPortal(ReportPortalConfig reportPortalConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ReporterBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/ReporterBuilder.cs`
    
    **Signature**
    ```csharp
    public ReporterBuilder ConfigureReportPortal(ReportPortalConfig reportPortalConfig)
    ```
    
    **Docstring**
    
    Sets the ReportPortal configuration used when creating a ReportPortal reporter.

### `ShouldSaveTemplate` {: #shouldsavetemplate}

??? info "Source file, signature, and docstring"
    **Member**
    `ReporterBuilder.ShouldSaveTemplate(bool shouldSaveTemplate)`
    
    **Kind** `function`
    
    **Declaring Type** `ReporterBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/ReporterBuilder.cs`
    
    **Signature**
    ```csharp
    public ReporterBuilder ShouldSaveTemplate(bool shouldSaveTemplate)
    ```
    
    **Docstring**
    
    Configures whether the rendered assertion configuration template is saved with reporter results.

## See also {: #see-also}

- [Runner Functions](../index.md)
