---
id: framework.functions.enumerables.sections.when.to.use
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [framework]
keywords: [framework, reference]
summary: "Reference page for Enumerables: When to use."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\EnumerableExtensions.cs -->

# Enumerables: When to use

> TL;DR — Reference page for Enumerables: When to use.

This page mirrors the `When to use` section from [Enumerables](../enumerables.md).

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `AsSingle<TItem>` {: #assingle-titem}

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

## `GetFilteredConfigurationObjectList<TData, TPattern>` {: #getfilteredconfigurationobjectlist-tdata-tpattern}

??? info "Source file, signature, and docstring"
    **Member**
    `EnumerableExtensions.GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList)`
    
    **Kind** `function`
    
    **Declaring Type** `EnumerableExtensions`
    
    **Source File** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TData> GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList)
    ```
    
    **Docstring**
    
    Filters configuration objects by the supplied conditions and returns the matching items.
    
    Throws when a requested condition does not match any item so callers can fail fast on invalid configuration references.

## See also {: #see-also}

- [Framework Functions](index.md)
