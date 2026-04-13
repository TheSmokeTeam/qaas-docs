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

When the loaded section contains YAML lists, numeric children are normalized to `List<object?>` values instead of dictionaries with `"0"`, `"1"`, and similar string keys. This keeps the global-dictionary shape aligned with the logical configuration shape.

Example:

```yaml
variables:
  connections:
    - name: primary
      host: localhost
    - name: secondary
      host: remote
```

After loading `variables`, the `connections` entry in the global dictionary is a list with two objects, not a dictionary keyed by `"0"` and `"1"`.
