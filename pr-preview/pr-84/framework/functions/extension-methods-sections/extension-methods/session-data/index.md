# Extension Methods: Extension Methods / Session data

> TL;DR — This page mirrors the `Extension Methods / Session data` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `GetSessionDataByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static GenericSessionData<TInput, TOutput> GetSessionDataByName<TInput, TOutput>(this IEnumerable<GenericSessionData<TInput, TOutput>>? sessionDataEnumerable, string sessionName)
```

**Docstring**

Retrieves a SessionData from an enumerable of SessionData by its name

### `GetInputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TInput> GetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName)
```

**Docstring**

Retrieves an input CommunicationData from SessionData by its name

### `TryGetInputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static bool TryGetInputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string inputName, out CommunicationData<TInput>? inputValue)
```

**Docstring**

Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

### `GetOutputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TOutput> GetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName)
```

**Docstring**

Retrieves an output CommunicationData from SessionData by its name

### `TryGetOutputByName<TInput, TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static bool TryGetOutputByName<TInput, TOutput>(this GenericSessionData<TInput, TOutput>? sessionData, string outputName, out CommunicationData<TOutput>? outputValue)
```

**Docstring**

Retrieves an input CommunicationData{TData} from SessionData by its name to inputValue

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
