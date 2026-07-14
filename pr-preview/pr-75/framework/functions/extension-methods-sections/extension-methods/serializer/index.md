# Extension Methods: Extension Methods / Serializer

> TL;DR — This page mirrors the `Extension Methods / Serializer` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `SerializeToString`

Source file, signature, and docstring

**Member** `SerializerExtensions.SerializeToString(this ISerializer serializer, object? data)`

**Kind** `function`

**Declaring Type** `SerializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static string? SerializeToString(this ISerializer serializer, object? data)
```

**Docstring**

Serializes the given data and returns the result as a UTF-8 string, most useful for the text based formats (Json, Yaml, Xml, XmlElement)

Example: `string? json = SerializationType.Json.BuildSerializer().SerializeToString(order);`

### `TrySerialize`

Source file, signature, and docstring

**Member** `SerializerExtensions.TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)`

**Kind** `function`

**Declaring Type** `SerializerExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationExtensions.cs`

**Signature**

```csharp
public static bool TrySerialize(this ISerializer serializer, object? data, out byte[]? serialized)
```

**Docstring**

Attempts to serialize the given data, never throws

Example: `if (serializer.TrySerialize(order, out var payload)) { ... }`

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
