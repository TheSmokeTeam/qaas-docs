# Collectors

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:50`
    
    **Signature**
    ```csharp
    public CollectorBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `FilterData`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:63`
    
    **Signature**
    ```csharp
    public CollectorBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CollectInRange`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.CollectInRange(CollectionRange collectionRange)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:76`
    
    **Signature**
    ```csharp
    public CollectorBuilder CollectInRange(CollectionRange collectionRange)
    ```
    
    **Docstring**
    
    Configures collect in range on the current Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The behavior exposed here is part of the public surface that the generated function documentation groups under 'Configuration as Code / Collectors'.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.Create(IFetcherConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:89`
    
    **Signature**
    ```csharp
    public CollectorBuilder Create(IFetcherConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.CreateConfiguration(IFetcherConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:101`
    
    **Signature**
    ```csharp
    public CollectorBuilder CreateConfiguration(IFetcherConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:113`
    
    **Signature**
    ```csharp
    public IFetcherConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.UpdateConfiguration(Func<IFetcherConfig, IFetcherConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:125`
    
    **Signature**
    ```csharp
    public CollectorBuilder UpdateConfiguration(Func<IFetcherConfig, IFetcherConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.UpdateConfiguration(IFetcherConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:139`
    
    **Signature**
    ```csharp
    public CollectorBuilder UpdateConfiguration(IFetcherConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:153`
    
    **Signature**
    ```csharp
    public CollectorBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:167`
    
    **Signature**
    ```csharp
    public CollectorBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `CollectorBuilder.Configure(IFetcherConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `CollectorBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Collectors/CollectorBuilder.cs:185`
    
    **Signature**
    ```csharp
    public CollectorBuilder Configure(IFetcherConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner collector builder instance.
    
    Use this method when working with the documented Runner collector builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
