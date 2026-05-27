# Extension Methods: Extension Methods / Communication data

> TL;DR: Reference page for Extension Methods: Extension Methods / Communication data.

This page mirrors the `Extension Methods / Communication data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md).

## `GetCommunicationDataByName<TData>`

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

## `CastCommunicationData<TCastTo>`

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

## `GetDataByIoMatchIndex<TData>`

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
