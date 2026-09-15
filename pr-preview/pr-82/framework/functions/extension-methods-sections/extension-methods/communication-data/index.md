# Extension Methods: Extension Methods / Communication data

> TL;DR — This page mirrors the `Extension Methods / Communication data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `GetCommunicationDataByName<TData>`

Source file, signature, and docstring

**Member** `CommunicationDataExtensions.GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)`

**Kind** `function`

**Declaring Type** `CommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TData> GetCommunicationDataByName<TData>(this IEnumerable<CommunicationData<TData>>? communicationDataEnumerable, string communicationDataName, string? communicationDataType = null)
```

**Docstring**

Retrieves a CommunicationData from an enumerable of CommunicationData by its name

### `CastCommunicationData<TCastTo>`

Source file, signature, and docstring

**Member** `CommunicationDataExtensions.CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)`

**Kind** `function`

**Declaring Type** `CommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TCastTo> CastCommunicationData<TCastTo>(this CommunicationData<object> communicationData, string? communicationDataType = null)
```

**Docstring**

Casts a CommunicationData to a different type

### `GetDataByIoMatchIndex<TData>`

Source file, signature, and docstring

**Member** `CommunicationDataExtensions.GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)`

**Kind** `function`

**Declaring Type** `CommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/CommunicationDataExtensions.cs`

**Signature**

```csharp
public static DetailedData<TData> GetDataByIoMatchIndex<TData>(this CommunicationData<TData> communicationData, int ioMatchIndex)
```

**Docstring**

Retrieves data by its IoMatchIndex from a CommunicationData object

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
