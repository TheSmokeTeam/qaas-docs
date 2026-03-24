<!-- generated hash:9a9a79977f43 sources:Framework, functions, Functions, Enumerables -->

# Enumerables

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `AsSingle<TItem>`

??? info "Location, signature, and docstring"
    **Member**
    `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable)`
    
    **Kind** `function`
    
    **Declaring Type** `EnumerableExtensions (extension type)`
    
    **Location** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:17`
    
    **Signature**
    ```csharp
    public static TItem AsSingle<TItem>(this IEnumerable<TItem> enumerable)
    ```
    
    **Docstring**
    
    Returns the single item contained in the provided sequence.
    
    The helper enforces the invariant that exactly one item must be present and throws when the sequence is empty or contains more than one value.

## `GetFilteredConfigurationObjectList<TData, TPattern>`

??? info "Location, signature, and docstring"
    **Member**
    `EnumerableExtensions.GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList)`
    
    **Kind** `function`
    
    **Declaring Type** `EnumerableExtensions`
    
    **Location** `QaaS.Framework.SDK/Extensions/EnumerableExtensions.cs:44`
    
    **Signature**
    ```csharp
    public static IList<TData> GetFilteredConfigurationObjectList<TData, TPattern>(IImmutableList<TData> dataList, IEnumerable<TPattern>? conditionFieldItemEnumerable, Func<TData, TPattern, bool> filter, string nameOfDataList)
    ```
    
    **Docstring**
    
    Filters configuration objects by the supplied conditions and returns the matching items.
    
    Throws when a requested condition does not match any item so callers can fail fast on invalid configuration references.
