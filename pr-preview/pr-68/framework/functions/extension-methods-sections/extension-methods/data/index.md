# Extension Methods: Extension Methods / Data

> TL;DR — This page mirrors the `Extension Methods / Data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `CastObjectData<TCasted>`

Source file, signature, and docstring

**Member** `DataExtensions.CastObjectData<TCasted>(this Data<object> data)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static Data<TCasted> CastObjectData<TCasted>(this Data<object> data)
```

**Docstring**

Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException. A null body always casts successfully and produces the default value of the target type (null for reference types, the zero value for value types). When the body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the cast automatically converts the body through its inferred serialization type (see TryInferSerializationType)

### `CastToObjectData<TData>`

Source file, signature, and docstring

**Member** `DataExtensions.CastToObjectData<TData>(this Data<TData> data)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static Data<object> CastToObjectData<TData>(this Data<TData> data)
```

**Docstring**

Casts a `Data` of any type to a Data of type object, if the cast is not valid will throw InvalidCastException

### `CastObjectDetailedData<TCasted>`

Source file, signature, and docstring

**Member** `DataExtensions.CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TCasted> CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)
```

**Docstring**

Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException. A null body always casts successfully and produces the default value of the target type (null for reference types, the zero value for value types). When the body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the cast automatically converts the body through its inferred serialization type (see TryInferSerializationType)

### `CastToObjectDetailedData<TData>`

Source file, signature, and docstring

**Member** `DataExtensions.CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<object> CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)
```

**Docstring**

Casts a `DetailedData` of any type to a DetailedData of type object, if the cast is not valid will throw InvalidCastException

### `FilterData<TData>`

Source file, signature, and docstring

**Member** `DataExtensions.FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TData> FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter) where TData : class
```

**Docstring**

Filters the data of a detailed data item according to the given DataFilter

### `TryCastObjectData<TCasted>`

Source file, signature, and docstring

**Member** `DataExtensions.TryCastObjectData<TCasted>(this Data<object> data, [NotNullWhen(true)] out Data<TCasted>? casted)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static bool TryCastObjectData<TCasted>(this Data<object> data, [NotNullWhen(true)] out Data<TCasted>? casted)
```

**Docstring**

Attempts to cast a `Data` of type object to another type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way CastObjectData{TCasted} converts them

Example: `if (data.TryCastObjectData<byte[]>(out var bytesData)) { ... }`

### `TryCastObjectDetailedData<TCasted>`

Source file, signature, and docstring

**Member** `DataExtensions.TryCastObjectDetailedData<TCasted>(this DetailedData<object> detailedData, [NotNullWhen(true)] out DetailedData<TCasted>? casted)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static bool TryCastObjectDetailedData<TCasted>(this DetailedData<object> detailedData, [NotNullWhen(true)] out DetailedData<TCasted>? casted)
```

**Docstring**

Attempts to cast a `DetailedData` of type object to another type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way CastObjectDetailedData{TCasted} converts them

Example: `if (detailedData.TryCastObjectDetailedData<byte[]>(out var bytesItem)) { ... }`

### `GetBodyAs<TBody>`

Source file, signature, and docstring

**Member** `DataExtensions.GetBodyAs<TBody>(this Data<object> data)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static TBody? GetBodyAs<TBody>(this Data<object> data)
```

**Docstring**

Retrieves the body of a `Data` (or `DetailedData`) of type object directly as the requested type, removing the need to cast the whole Data wrapper in order to reach a typed body. When the body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the body is automatically converted through its inferred serialization type (see TryInferSerializationType)

Example: `byte[]? raw = detailedData.GetBodyAs<byte[]>();`

### `TryGetBodyAs<TBody>`

Source file, signature, and docstring

**Member** `DataExtensions.TryGetBodyAs<TBody>(this Data<object> data, out TBody? body)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static bool TryGetBodyAs<TBody>(this Data<object> data, out TBody? body)
```

**Docstring**

Attempts to retrieve the body of a `Data` (or `DetailedData`) of type object directly as the requested type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way GetBodyAs{TBody} converts them

Example: `if (detailedData.TryGetBodyAs<string>(out var text)) { ... }`

### `ConvertBodyTo<TBody>`

Source file, signature, and docstring

**Member** `DataExtensions.ConvertBodyTo<TBody>(this Data<object> data, SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static TBody? ConvertBodyTo<TBody>(this Data<object> data, SerializationType serializationType)
```

**Docstring**

Converts the body of a `Data` (or `DetailedData`) of type object to the requested type regardless of its current representation: bodies that already are TBody are returned as-is, byte[] bodies are deserialized, and any other representation (e.g. JsonNode, yaml dictionaries) is round-tripped through the given serialization type into TBody

Example: `Order? order = detailedData.ConvertBodyTo<Order>(SerializationType.Json);`

### `ConvertData<TBody>`

Source file, signature, and docstring

**Member** `DataExtensions.ConvertData<TBody>(this Data<object> data, SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static Data<TBody> ConvertData<TBody>(this Data<object> data, SerializationType serializationType)
```

**Docstring**

Converts a `Data` of type object to a `Data` of the requested type regardless of its current body representation, preserving its MetaData (see ConvertBodyTo{TBody} for the conversion rules)

Example: `Data<Order> typed = data.ConvertData<Order>(SerializationType.Json);`

### `ConvertDetailedData<TBody>`

Source file, signature, and docstring

**Member** `DataExtensions.ConvertDetailedData<TBody>(this DetailedData<object> detailedData, SerializationType serializationType)`

**Kind** `function`

**Declaring Type** `DataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TBody> ConvertDetailedData<TBody>(this DetailedData<object> detailedData, SerializationType serializationType)
```

**Docstring**

Converts a `DetailedData` of type object to a `DetailedData` of the requested type regardless of its current body representation, preserving its MetaData and Timestamp (see ConvertBodyTo{TBody} for the conversion rules)

Example: `DetailedData<Order> typed = detailedData.ConvertDetailedData<Order>(SerializationType.Json);`

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
