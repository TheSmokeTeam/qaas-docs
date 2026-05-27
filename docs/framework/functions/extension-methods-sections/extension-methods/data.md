# Extension Methods: Extension Methods / Data

This page mirrors the `Extension Methods / Data` section from [Extension Methods](../../extension-methods.md).

## `CastObjectData<TCasted>`

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

## `CastToObjectData<TData>`

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

## `CastObjectDetailedData<TCasted>`

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

## `CastToObjectDetailedData<TData>`

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

## `FilterData<TData>`

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
