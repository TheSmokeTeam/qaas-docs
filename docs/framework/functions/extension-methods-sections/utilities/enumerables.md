# Extension Methods: Utilities / Enumerables

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
