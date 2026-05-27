---
id: qaas.functions.extension.methods.sections.detailed.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, extension, methods, sections, detailed, data]
summary: "Reference page for Extension Methods: Detailed data."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\DetailedDataExtensions.cs -->

# Extension Methods: Detailed data

This page mirrors the `Detailed data` section from [Extension Methods](../extension-methods.md).

## `AddIoMatchIndexToDetailedData<T>`

??? info "Source file, signature, and docstring"
    **Member**
    `DetailedDataExtensions.AddIoMatchIndexToDetailedData<T>(this DetailedData<T> data, int index)`
    
    **Kind** `function`
    
    **Declaring Type** `DetailedDataExtensions (extension type)`
    
    **Source File** `QaaS.Runner.Sessions/Extensions/DetailedDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<T> AddIoMatchIndexToDetailedData<T>(this DetailedData<T> data, int index)
    ```
    
    **Docstring**
    
    Adds an index to a detailed data object
