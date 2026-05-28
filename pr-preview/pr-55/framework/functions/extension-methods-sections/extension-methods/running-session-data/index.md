# Extension Methods: Extension Methods / Running session data

> TL;DR — Reference page for Extension Methods: Extension Methods / Running session data.

This page mirrors the `Extension Methods / Running session data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md).

## `GetInputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `RunningSessionDataExtensions.GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)`

**Kind** `function`

**Declaring Type** `RunningSessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`

**Signature**

```csharp
public static RunningCommunicationData<TInput> GetInputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string inputName)
```

**Docstring**

Retrieves an input RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

## `GetOutputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `RunningSessionDataExtensions.GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)`

**Kind** `function`

**Declaring Type** `RunningSessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/RunningSessionDataExtensions.cs`

**Signature**

```csharp
public static RunningCommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this RunningSessionData<TInput, TOutput>? runningSessionData, string outputName)
```

**Docstring**

Retrieves an output RunningCommunicationData{TData} from RunningSessionData{TInput,TOutput} by its name

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
