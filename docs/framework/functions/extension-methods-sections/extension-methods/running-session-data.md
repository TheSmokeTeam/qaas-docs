---
id: framework.functions.extension.methods.sections.extension.methods.running.session.data
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, running, session, data]
summary: "Reference page for Extension Methods: Extension Methods / Running session data."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\RunningSessionDataExtensions.cs -->

# Extension Methods: Extension Methods / Running session data

> TL;DR — This page mirrors the `Extension Methods / Running session data` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `GetInputByName<TInput, TOutput>` {: #getinputbynametinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `RunningSessionDataExtensions.GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningSessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TInput> GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)
    ```
    
    **Docstring**
    
    Retrieves an input RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

### `GetOutputByName<TInput, TOutput>` {: #getoutputbynametinput-toutput}

??? info "Source file, signature, and docstring"
    **Member**
    `RunningSessionDataExtensions.GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)`
    
    **Kind** `function`
    
    **Declaring Type** `RunningSessionDataExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`
    
    **Signature**
    ```csharp
    public static RunningCommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)
    ```
    
    **Docstring**
    
    Retrieves an output RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
