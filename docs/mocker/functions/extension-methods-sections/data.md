---
id: mocker.functions.extension.methods.sections.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, extension, methods, sections, data]
summary: "Reference page for Extension Methods: Data."
---
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\Extensions\DataExtensions.cs -->

# Extension Methods: Data

> TL;DR: Reference page for Extension Methods: Data.

This page mirrors the `Data` section from [Extension Methods](../extension-methods.md).

## `CloneDetailed`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CloneDetailed(this Data<object> data, DateTime? datetime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<object> CloneDetailed(this Data<object> data, DateTime? datetime = null)
    ```
    
    **Docstring**
    
    Clones a payload into a DetailedData{T} instance with a capture timestamp.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
