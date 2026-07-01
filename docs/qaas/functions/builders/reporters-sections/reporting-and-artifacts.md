---
id: qaas.functions.builders.reporters.sections.reporting.and.artifacts
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [runner]
keywords: [runner, reference]
summary: "Reference page for Reporters: Reporting and artifacts."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\ReporterBuilder.cs -->

# Reporters: Reporting and artifacts

> TL;DR — This page mirrors the `Reporting and artifacts` section from [Reporters](../reporters.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Reporters](../reporters.md)
