---
id: framework.functions.extension.methods.sections.extension.methods.context.global.dictionary
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, context, global, dictionary]
summary: "Reference page for Extension Methods: Extension Methods / Context global dictionary."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\ContextGlobalDictionaryExtensions.cs -->

# Extension Methods: Extension Methods / Context global dictionary

> TL;DR — This page mirrors the `Extension Methods / Context global dictionary` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>` {: #loadconfigurationsectionintoglobaldictionary-texecutiondata}

??? info "Source file, signature, and docstring"
    **Member**
    `ContextGlobalDictionaryExtensions.LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextGlobalDictionaryExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/ContextGlobalDictionaryExtensions.cs`
    
    **Signature**
    ```csharp
    public static void LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>(this BaseContext<TExecutionData> context, string configurationSectionPath, List<string>? destinationPath = null) where TExecutionData : class, IExecutionData, new()
    ```
    
    **Docstring**
    
    Loads the requested configuration section into the context global dictionary. Use "variables" as the section path to project the root variables section into runtime state without relying on a dedicated Variables API. Numeric child sections are normalized to lists so YAML list sections do not appear as dictionaries with stringified indexes such as "0" and "1".

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
