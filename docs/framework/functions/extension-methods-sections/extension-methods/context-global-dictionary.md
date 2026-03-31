# Extension Methods: Extension Methods / Context global dictionary

This page mirrors the `Extension Methods / Context global dictionary` section from [Extension Methods](../../extension-methods.md).

## `LoadConfigurationSectionIntoGlobalDictionary<TExecutionData>`

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
    
    Loads the requested configuration section into the context global dictionary. Use "variables" as the section path to project the root variables section into runtime state without relying on a dedicated Variables API.
