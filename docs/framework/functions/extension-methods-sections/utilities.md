---
id: framework.functions.extension.methods.sections.utilities
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, utilities]
summary: "Reference page for Extension Methods: Utilities."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->

# Extension Methods: Utilities

This page mirrors the `Utilities` section from [Extension Methods](../extension-methods.md).

## Enumerables

### `AsSingle<TItem>`

??? info "Source file, signature, and docstring"
    **Member**
    `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable)`
    
    **Kind** `function`
    
    **Declaring Type** `EnumerableExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs`
    
    **Signature**
    ```csharp
    public static TItem AsSingle<TItem>(this IEnumerable<TItem> enumerable)
    ```
    
    **Docstring**
    
    Returns the single item contained in the provided sequence.
    
    The helper enforces the invariant that exactly one item must be present and throws when the sequence is empty or contains more than one value.
