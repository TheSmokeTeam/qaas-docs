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

Casts a `Data` of type object to another type, if the cast is not valid will throw InvalidCastException

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

Casts a `DetailedData` of type object to another type, if the cast is not valid will throw InvalidCastException

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

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
