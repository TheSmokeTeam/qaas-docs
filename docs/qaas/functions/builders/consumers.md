<!-- generated hash:90b8caf0a235 sources:Runner, functions, Builders, Consumers -->

# Consumers

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:34`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AtStage`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:47`
    
    **Signature**
    ```csharp
    public ConsumerBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeout`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.WithTimeout(int timeoutMs)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:60`
    
    **Signature**
    ```csharp
    public ConsumerBuilder WithTimeout(int timeoutMs)
    ```
    
    **Docstring**
    
    Configures timeout on the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `FilterData`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:73`
    
    **Signature**
    ```csharp
    public ConsumerBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithDeserializer`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:86`
    
    **Signature**
    ```csharp
    public ConsumerBuilder WithDeserializer(DeserializeConfig deserializeConfig)
    ```
    
    **Docstring**
    
    Sets the deserializer configuration used by the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddPolicy`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.AddPolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:99`
    
    **Signature**
    ```csharp
    public ConsumerBuilder AddPolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Adds the supplied policy to the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreatePolicy`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.CreatePolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:114`
    
    **Signature**
    ```csharp
    public ConsumerBuilder CreatePolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Creates or adds the configured policy entry on the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadPolicies`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.ReadPolicies()`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:126`
    
    **Signature**
    ```csharp
    public IReadOnlyList<PolicyBuilder> ReadPolicies()
    ```
    
    **Docstring**
    
    Returns the configured policies currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdatePolicyAt`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:138`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeletePolicyAt`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.DeletePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:156`
    
    **Signature**
    ```csharp
    public ConsumerBuilder DeletePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.CreateConfiguration(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:174`
    
    **Signature**
    ```csharp
    public ConsumerBuilder CreateConfiguration(IReaderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.Create(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:186`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Create(IReaderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:198`
    
    **Signature**
    ```csharp
    public IReaderConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:219`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(Func<IReaderConfig, IReaderConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:233`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(IReaderConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:247`
    
    **Signature**
    ```csharp
    public ConsumerBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:261`
    
    **Signature**
    ```csharp
    public ConsumerBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `ConsumerBuilder.Configure(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs:288`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Configure(IReaderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
