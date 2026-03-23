<!-- generated hash:703969b8184f sources:Runner, functions, Builders, Links -->

# Links

Source-driven reference for `Runner` functions in the `Builders / Links` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:35`
    
    **Signature**
    ```csharp
    public LinkBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.Create(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:48`
    
    **Signature**
    ```csharp
    public LinkBuilder Create(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.CreateConfiguration(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:60`
    
    **Signature**
    ```csharp
    public LinkBuilder CreateConfiguration(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:72`
    
    **Signature**
    ```csharp
    public ILinkConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:94`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(Func<ILinkConfig, ILinkConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:108`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(ILinkConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:122`
    
    **Signature**
    ```csharp
    public LinkBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:136`
    
    **Signature**
    ```csharp
    public LinkBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `LinkBuilder.Configure(ILinkConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `LinkBuilder`
    
    **Location** `QaaS.Runner.Assertions/ConfigurationObjects/LinkBuilder.cs:156`
    
    **Signature**
    ```csharp
    public LinkBuilder Configure(ILinkConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner link builder instance.
    
    Use this method when working with the documented Runner link builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
