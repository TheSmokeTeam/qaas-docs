# Extension Methods: Data

This page mirrors the `Data` section from [Extension Methods](../extension-methods.md).

## `CloneDetailed`

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CloneDetailed(this Data<object> data, DateTime? datetime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<object> CloneDetailed(this Data<object> data, DateTime? datetime = null)
    ```
    
    **Docstring**
    
    Clones a payload into a DetailedData{T} instance with a capture timestamp.
