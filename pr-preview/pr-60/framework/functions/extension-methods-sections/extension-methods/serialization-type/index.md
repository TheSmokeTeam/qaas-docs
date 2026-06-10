# Extension Methods: Extension Methods / Serialization type

> TL;DR — This page mirrors the `Extension Methods / Serialization type` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `BuildSerializer`

Source file, signature, and docstring

**Member** `SerializationTypeExtensions.BuildSerializer(this SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `SerializationTypeExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationTypeExtensions.cs`

**Signature**

```csharp
public static ISerializer BuildSerializer(this SerializationType serializationType)
```

**Docstring**

Builds the serializer that matches this serialization type

Example: `var serializer = SerializationType.Yaml.BuildSerializer();`

### `BuildDeserializer`

Source file, signature, and docstring

**Member** `SerializationTypeExtensions.BuildDeserializer(this SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `SerializationTypeExtensions (extension type)`

**Source File** `QaaS.Framework.Serialization/SerializationTypeExtensions.cs`

**Signature**

```csharp
public static IDeserializer BuildDeserializer(this SerializationType serializationType)
```

**Docstring**

Builds the deserializer that matches this serialization type

Example: `var deserializer = SerializationType.Yaml.BuildDeserializer();`

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
