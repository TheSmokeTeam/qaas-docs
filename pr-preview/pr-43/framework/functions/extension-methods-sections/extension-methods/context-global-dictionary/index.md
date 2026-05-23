# Extension Methods: Extension Methods / Context global dictionary

> TL;DR — This page mirrors the `Extension Methods / Context global dictionary` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>`

Source file, signature, and docstring

**Member** `ContextGlobalDictionaryExtensions.LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null)`

**Kind** `function`

**Declaring Type** `ContextGlobalDictionaryExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/ContextGlobalDictionaryExtensions.cs`

**Signature**

```csharp
public static void LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null) where TExecutionData : class, IExecutionData, new()
```

**Docstring**

Loads the requested configuration section into the context global dictionary. Use "variables" as the section path to project the root variables section into runtime state without relying on a dedicated Variables API. Numeric child sections are normalized to lists so YAML list sections do not appear as dictionaries with stringified indexes such as "0" and "1" .

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
