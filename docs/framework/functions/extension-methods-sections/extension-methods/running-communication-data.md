---
id: framework.functions.extension.methods.sections.extension.methods.running.communication.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, running, communication, data]
summary: "Reference page for Extension Methods: Extension Methods / Running communication data."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningCommunicationDataExtensions.cs -->

# Extension Methods: Extension Methods / Running communication data

> TL;DR: Reference page for Extension Methods: Extension Methods / Running communication data.

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
