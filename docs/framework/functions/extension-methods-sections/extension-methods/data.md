---
id: framework.functions.extension.methods.sections.extension.methods.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, data]
summary: "Reference page for Extension Methods: Extension Methods / Data."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\DataExtensions.cs -->

# Extension Methods: Extension Methods / Data

> TL;DR — This page mirrors the `Extension Methods / Data` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `CastObjectData<TCasted>` {: #castobjectdata-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectData<TCasted>(this Data<object> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static Data<TCasted> CastObjectData<TCasted>(this Data<object> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException

### `CastToObjectData<TData>` {: #casttoobjectdata-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectData<TData>(this Data<TData> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static Data<object> CastToObjectData<TData>(this Data<TData> data)
    ```
    
    **Docstring**
    
    Casts a `Data` of any type to a Data of type object, if the cast is not valid will throw InvalidCastException

### `CastObjectDetailedData<TCasted>` {: #castobjectdetaileddata-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TCasted> CastObjectDetailedData<TCasted>(this DetailedData<object> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException

### `CastToObjectDetailedData<TData>` {: #casttoobjectdetaileddata-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<object> CastToObjectDetailedData<TData>(this DetailedData<TData> detailedData)
    ```
    
    **Docstring**
    
    Casts a `DetailedData` of any type to a DetailedData of type object, if the cast is not valid will throw InvalidCastException

### `FilterData<TData>` {: #filterdata-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> FilterData<TData>(this DetailedData<TData> dataItemToFilter, DataFilter dataFilter) where TData : class
    ```
    
    **Docstring**
    
    Filters the data of a detailed data item according to the given DataFilter

### `TryCastObjectData<TCasted>` {: #trycastobjectdata-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.TryCastObjectData<TCasted>(this Data<object> data, [NotNullWhen(true)] out Data<TCasted>? casted)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryCastObjectData<TCasted>(this Data<object> data, [NotNullWhen(true)] out Data<TCasted>? casted)
    ```
    
    **Docstring**
    
    Attempts to cast a `Data` of type object to another type, never throws
    
    Example: `if (data.TryCastObjectData<byte[]>(out var bytesData)) { ... }`

### `TryCastObjectDetailedData<TCasted>` {: #trycastobjectdetaileddata-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.TryCastObjectDetailedData<TCasted>(this DetailedData<object> detailedData, [NotNullWhen(true)] out DetailedData<TCasted>? casted)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryCastObjectDetailedData<TCasted>(this DetailedData<object> detailedData, [NotNullWhen(true)] out DetailedData<TCasted>? casted)
    ```
    
    **Docstring**
    
    Attempts to cast a `DetailedData` of type object to another type, never throws
    
    Example: `if (detailedData.TryCastObjectDetailedData<byte[]>(out var bytesItem)) { ... }`

### `GetBodyAs<TBody>` {: #getbodyas-tbody}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.GetBodyAs<TBody>(this Data<object> data)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static TBody? GetBodyAs<TBody>(this Data<object> data)
    ```
    
    **Docstring**
    
    Retrieves the body of a `Data` (or `DetailedData`) of type object directly as the requested type, removing the need to cast the whole Data wrapper in order to reach a typed body
    
    Example: `byte[]? raw = detailedData.GetBodyAs<byte[]>();`

### `TryGetBodyAs<TBody>` {: #trygetbodyas-tbody}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.TryGetBodyAs<TBody>(this Data<object> data, out TBody? body)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetBodyAs<TBody>(this Data<object> data, out TBody? body)
    ```
    
    **Docstring**
    
    Attempts to retrieve the body of a `Data` (or `DetailedData`) of type object directly as the requested type, never throws
    
    Example: `if (detailedData.TryGetBodyAs<string>(out var text)) { ... }`

### `ConvertBodyTo<TBody>` {: #convertbodyto-tbody}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.ConvertBodyTo<TBody>(this Data<object> data, SerializationType serializationType)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static TBody? ConvertBodyTo<TBody>(this Data<object> data, SerializationType serializationType)
    ```
    
    **Docstring**
    
    Converts the body of a `Data` (or `DetailedData`) of type object to the requested type regardless of its current representation: bodies that already are are returned as-is, byte[] bodies are deserialized, and any other representation (e.g. JsonNode, yaml dictionaries) is round-tripped through the given serialization type into
    
    Example: `Order? order = detailedData.ConvertBodyTo<Order>(SerializationType.Json);`

### `ConvertData<TBody>` {: #convertdata-tbody}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.ConvertData<TBody>(this Data<object> data, SerializationType serializationType)`
    
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

### `ConvertDetailedData<TBody>` {: #convertdetaileddata-tbody}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.ConvertDetailedData<TBody>(this DetailedData<object> detailedData, SerializationType serializationType)`
    
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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
