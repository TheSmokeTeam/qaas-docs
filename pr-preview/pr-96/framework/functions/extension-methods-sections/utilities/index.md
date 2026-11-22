# Extension Methods: Utilities

> TL;DR — This page mirrors the `Utilities` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### Enumerables

#### `AsSingle<TItem>`

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

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
