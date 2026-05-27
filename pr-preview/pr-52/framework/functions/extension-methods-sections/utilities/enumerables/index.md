# Extension Methods: Utilities / Enumerables

> TL;DR: Reference page for Extension Methods: Utilities / Enumerables.

This page mirrors the `Utilities / Enumerables` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md).

## `AsSingle<TItem>`

Source file, signature, and docstring

**Member** `EnumerableExtensions.AsSingle<TItem>(this IEnumerable<TItem> enumerable)`

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
