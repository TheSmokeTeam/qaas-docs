# Extension Methods: Extension Methods / Data source

This page mirrors the `Extension Methods / Data source` section from [Extension Methods](../../extension-methods.md).

## `GetDataSourceByName`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceExtensions.GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`
    
    **Signature**
    ```csharp
    public static DataSource GetDataSourceByName(this IEnumerable<DataSource>? dataSourceEnumerable, string dataSourceName)
    ```
    
    **Docstring**
    
    Retrieves a DataSource from an enumerable of DataSources by its name

## `RetrieveAndCast<TCastTo>`

??? info "Source file, signature, and docstring"
    **Member**
    `DataSourceExtensions.RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataSourceExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/DataSourceExtensions.cs`
    
    **Signature**
    ```csharp
    public static IEnumerable<Data<TCastTo>> RetrieveAndCast<TCastTo>(this DataSource dataSource, IImmutableList<SessionData>? ranSessionsDataList = null)
    ```
    
    **Docstring**
    
    Casts a DataSource to a different type
