# Links

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

The functions on this page are grouped by responsibility so related operations stay together.

## Identity and hook selection

### `Named`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## Inspection

### `ReadConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public ILinkConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## Collection helpers

### `Create`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Create(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Create(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `CreateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.CreateConfiguration(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder CreateConfiguration(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(ILinkConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `UpdateConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

### `DeleteConfiguration`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## General

### `Configure`

??? info "Source file, signature, and docstring"
    **Member**
    `LinkBuilder.Configure(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs`
    
    **Signature**
    ```csharp
    public LinkBuilder Configure(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
