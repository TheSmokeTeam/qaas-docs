---
id: framework.functions.extension.methods.sections.extension.methods.communication.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, communication, data]
summary: "Reference page for Extension Methods: Extension Methods / Communication data."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\CommunicationDataExtensions.cs -->

# Extension Methods: Extension Methods / Communication data

> TL;DR — This page mirrors the `Extension Methods / Communication data` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `GetCommunicationDataByName<TData>` {: #getcommunicationdatabyname-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TData> GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Retrieves a CommunicationData from an enumerable of CommunicationData by its name

### `CastCommunicationData<TCastTo>` {: #castcommunicationdata-tcastto}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TCastTo> CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)
    ```
    
    **Docstring**
    
    Casts a CommunicationData to a different type. When a body is a deserialized representation of the target type instead of the target type itself (e.g. a JsonNode produced by json deserialization without a configured type), the cast automatically converts that body using the CommunicationData's own SerializationType when it has one, or the serialization type inferred from the body's runtime type otherwise (see TryInferSerializationType)

### `GetDataByIoMatchIndex<TData>` {: #getdatabyiomatchindex-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<TData> GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)
    ```
    
    **Docstring**
    
    Retrieves data by its IoMatchIndex from a CommunicationData object

### `TryGetCommunicationDataByName<TData>` {: #trygetcommunicationdatabyname-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.TryGetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, [NotNullWhen(true)] out CommunicationData<TData>? communicationDataValue)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, [NotNullWhen(true)] out CommunicationData<TData>? communicationDataValue)
    ```
    
    **Docstring**
    
    Attempts to retrieve a CommunicationData from an enumerable of CommunicationData by its name, never throws
    
    Example: `if (sessionData.Outputs.TryGetCommunicationDataByName("orders_output", out var output)) { ... }`

### `TryCastCommunicationData<TCastTo>` {: #trycastcommunicationdata-tcastto}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.TryCastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, [NotNullWhen(true)] out CommunicationData<TCastTo>? casted)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryCastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, [NotNullWhen(true)] out CommunicationData<TCastTo>? casted)
    ```
    
    **Docstring**
    
    Attempts to cast a CommunicationData to a different type, never throws. Bodies that are deserialized representations of the target type (e.g. JsonNode) are automatically converted the same way CastCommunicationData{TCastTo} converts them
    
    Example: `if (communication.TryCastCommunicationData<byte[]>(out var bytesCommunication)) { ... }`

### `TryGetDataByIoMatchIndex<TData>` {: #trygetdatabyiomatchindex-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.TryGetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex, [NotNullWhen(true)] out DetailedData<TData>? data)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static bool TryGetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex, [NotNullWhen(true)] out DetailedData<TData>? data)
    ```
    
    **Docstring**
    
    Attempts to retrieve data by its IoMatchIndex from a CommunicationData object, never throws
    
    Example: `if (communication.TryGetDataByIoMatchIndex(0, out var firstMatch)) { ... }`

### `GetBodies<TData>` {: #getbodies-tdata}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetBodies<TData>(this CommunicationData<TData> communicationData)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TData?> GetBodies<TData>(this CommunicationData<TData> communicationData)
    ```
    
    **Docstring**
    
    Retrieves the bodies of all data items of a CommunicationData, removing the need to project the Data list manually when only the contents matter
    
    Example: `IList<object?> bodies = communication.GetBodies();`

### `GetBodiesAs<TCasted>` {: #getbodiesas-tcasted}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.GetBodiesAs<TCasted>(this CommunicationData<object> communicationData)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static IList<TCasted?> GetBodiesAs<TCasted>(this CommunicationData<object> communicationData)
    ```
    
    **Docstring**
    
    Retrieves the bodies of all data items of a CommunicationData of type object directly as the requested type. Bodies that are deserialized representations of the target type (e.g. JsonNode bodies) are automatically converted using the CommunicationData's own SerializationType when it has one, or the serialization type inferred from each body's runtime type otherwise
    
    Example: `IList<string?> bodies = communication.GetBodiesAs<string>();`

### `ConvertCommunicationData<TConverted>` {: #convertcommunicationdata-tconverted}

??? info "Source file, signature, and docstring"
    **Member**
    `CommunicationDataExtensions.ConvertCommunicationData<TConverted>(this CommunicationData<object> communicationData, SerializationType? serializationTypeOverride = null)`
    
    **Kind** `function`
    
    **Declaring Type** `CommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static CommunicationData<TConverted> ConvertCommunicationData<TConverted>(this CommunicationData<object> communicationData, SerializationType? serializationTypeOverride = null)
    ```
    
    **Docstring**
    
    Converts a CommunicationData of type object to a CommunicationData of the requested type regardless of the current representation of its bodies, using the CommunicationData's own SerializationType by default: bodies that already are TConverted are kept as-is, byte[] bodies are deserialized, and any other representation (e.g. JsonNode, yaml dictionaries) is round-tripped through the serialization type into TConverted. When no serialization type is available falls back to a plain cast (same behavior as CastCommunicationData{TCastTo})
    
    Example: `CommunicationData<Order> typed = communication.ConvertCommunicationData<Order>();`

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
