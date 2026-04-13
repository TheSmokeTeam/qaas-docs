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

## `WeatherToSaveSessionData`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveSessionData(bool weatherToSaveSessionData)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveSessionData(bool weatherToSaveSessionData)
    ```
    
    **Docstring**
    
    Configures whether session data is saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveLogs`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveLogs(bool weatherToSaveLogs)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveLogs(bool weatherToSaveLogs)
    ```
    
    **Docstring**
    
    Configures whether logs are saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveConfigurationTemplate`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveConfigurationTemplate(bool weatherToSaveConfigurationTemplate)
    ```
    
    **Docstring**
    
    Configures whether the rendered configuration template is saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToSaveAttachments`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToSaveAttachments(bool weatherToSaveAttachments)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToSaveAttachments(bool weatherToSaveAttachments)
    ```
    
    **Docstring**
    
    Configures whether attachments are saved with the assertion result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WeatherToDisplayTrace`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.WeatherToDisplayTrace(bool weatherToDisplayTrace)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder WeatherToDisplayTrace(bool weatherToDisplayTrace)
    ```
    
    **Docstring**
    
    Configures whether the assertion trace is displayed with the result.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Assertions'.
