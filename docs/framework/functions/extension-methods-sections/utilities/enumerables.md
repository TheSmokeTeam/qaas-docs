---
id: framework.functions.extension.methods.sections.utilities.enumerables
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, utilities, enumerables]
summary: "Reference page for Extension Methods: Utilities / Enumerables."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->

# Extension Methods: Utilities / Enumerables

> TL;DR: Reference page for Extension Methods: Utilities / Enumerables.

This page mirrors the `Utilities / Enumerables` section from [Extension Methods](../../extension-methods.md).

## `AsSingle<TItem>`

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
