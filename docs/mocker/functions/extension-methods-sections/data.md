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

> TL;DR — This page mirrors the `Data` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `CloneDetailed` {: #clonedetailed}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
