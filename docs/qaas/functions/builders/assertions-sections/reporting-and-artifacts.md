---
id: qaas.functions.builders.assertions.sections.reporting.and.artifacts
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, assertions, sections, reporting, and, artifacts]
summary: "Reference page for Assertions: Reporting and artifacts."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Assertions\ConfigurationObjects\AssertionBuilder.cs -->

# Assertions: Reporting and artifacts

> TL;DR — This page mirrors the `Reporting and artifacts` section from [Assertions](../assertions.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Assertions](../assertions.md)
