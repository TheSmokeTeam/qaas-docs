# Assertions: Reporting and artifacts

This page mirrors the `Reporting and artifacts` section from [Assertions](../assertions.md).

## `ReportOnlyStatuses`

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
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ShouldSaveSessionData`

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
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ShouldSaveLogs`

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
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ShouldSaveConfigurationTemplate`

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
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ShouldSaveAttachments`

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
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ShouldDisplayTrace`

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
    
    Use this method when working with the documented Runner assertion builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Assertions'.
