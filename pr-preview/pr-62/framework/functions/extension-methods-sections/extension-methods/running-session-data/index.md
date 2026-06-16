# Extension Methods: Extension Methods / Running session data

> TL;DR — This page mirrors the `Extension Methods / Running session data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `GetInputByName<TInput, TOutput>`

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

### `GetOutputByName<TInput, TOutput>`

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

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
