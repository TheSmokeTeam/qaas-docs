# Extension Methods: Extension Methods / Running communication data

> TL;DR — This page mirrors the `Extension Methods / Running communication data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `GetRunningCommunicationDataByName<TData>`

Source file, signature, and docstring

**Member** `RunningCommunicationDataExtensions.GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)`

**Kind** `function`

**Declaring Type** `RunningCommunicationDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/RunningCommunicationDataExtensions.cs`

**Signature**

```csharp
public static RunningCommunicationData<TData> GetRunningCommunicationDataByName<TData>(this IEnumerable<RunningCommunicationData<TData>>? runningCommunicationDataEnumerable, string runningCommunicationDataName, string? runningCommunicationDataType = null)
```

**Docstring**

Retrieves a RunningCommunicationData{TData} from an enumerable of RunningCommunicationData{TData} by its name

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
