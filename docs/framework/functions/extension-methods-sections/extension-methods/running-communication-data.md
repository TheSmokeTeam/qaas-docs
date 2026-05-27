# Extension Methods: Extension Methods / Running communication data

This page mirrors the `Extension Methods / Running communication data` section from [Extension Methods](../../extension-methods.md).

## `GetRunningCommunicationDataByName<TData>`

??? info "Source file, signature, and docstring"
    **Member**
    `RunningCommunicationDataExtensions.GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningCommunicationDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/RunningCommunicationDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TData> GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)
    ```
    
    **Docstring**
    
    Retrieves a RunningCommunicationData{TData} from an enumerable of RunningCommunicationData{TData} by its name
