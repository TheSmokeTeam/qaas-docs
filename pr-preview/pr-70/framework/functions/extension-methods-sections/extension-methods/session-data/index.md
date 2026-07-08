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

### `GetInputAs<TInput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TInput> GetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)
```

**Docstring**

Retrieves an input CommunicationData from SessionData by its name with all its data bodies converted to the requested type in a single call, using the input's own SerializationType by default (see ConvertCommunicationData{TConverted} for the conversion rules)

Example: `CommunicationData<OrderRequest> input = sessionData.GetInputAs<OrderRequest>("orders_input");`

### `GetOutputAs<TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static CommunicationData<TOutput> GetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)
```

**Docstring**

Retrieves an output CommunicationData from SessionData by its name with all its data bodies converted to the requested type in a single call, using the output's own SerializationType by default (see ConvertCommunicationData{TConverted} for the conversion rules)

Example: `CommunicationData<Order> output = sessionData.GetOutputAs<Order>("orders_output");`

### `TryGetInputAs<TInput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.TryGetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, [NotNullWhen(true)] out CommunicationData<TInput>? inputValue, SerializationType? serializationTypeOverride = null)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static bool TryGetInputAs<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, [NotNullWhen(true)] out CommunicationData<TInput>? inputValue, SerializationType? serializationTypeOverride = null)
```

**Docstring**

Attempts to retrieve an input CommunicationData from SessionData by its name with all its data bodies converted to the requested type, never throws

Example: `if (sessionData.TryGetInputAs<OrderRequest>("orders_input", out var input)) { ... }`

### `TryGetOutputAs<TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.TryGetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, [NotNullWhen(true)] out CommunicationData<TOutput>? outputValue, SerializationType? serializationTypeOverride = null)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static bool TryGetOutputAs<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, [NotNullWhen(true)] out CommunicationData<TOutput>? outputValue, SerializationType? serializationTypeOverride = null)
```

**Docstring**

Attempts to retrieve an output CommunicationData from SessionData by its name with all its data bodies converted to the requested type, never throws

Example: `if (sessionData.TryGetOutputAs<Order>("orders_output", out var output)) { ... }`

### `GetInputBodies<TInput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetInputBodies<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static IList<TInput?> GetInputBodies<TInput>(this GenericSessionData<object, object>? sessionData, string inputName, SerializationType? serializationTypeOverride = null)
```

**Docstring**

Retrieves the typed bodies of all data items of an input found by its name in a single call, the shortest path from a SessionData to the actual contents of an input (see GetInputAs{TInput} for the conversion rules)

Example: `IList<OrderRequest?> requests = sessionData.GetInputBodies<OrderRequest>("orders_input");`

### `GetOutputBodies<TOutput>`

Source file, signature, and docstring

**Member** `SessionDataExtensions.GetOutputBodies<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)`

**Kind** `function`

**Declaring Type** `SessionDataExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/SessionDataExtensions.cs`

**Signature**

```csharp
public static IList<TOutput?> GetOutputBodies<TOutput>(this GenericSessionData<object, object>? sessionData, string outputName, SerializationType? serializationTypeOverride = null)
```

**Docstring**

Retrieves the typed bodies of all data items of an output found by its name in a single call, the shortest path from a SessionData to the actual contents of an output (see GetOutputAs{TOutput} for the conversion rules)

Example: `IList<Order?> orders = sessionData.GetOutputBodies<Order>("orders_output");`

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
