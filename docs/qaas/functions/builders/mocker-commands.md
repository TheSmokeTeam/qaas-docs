<!-- generated hash:362c67567cb9 sources:Runner, functions, Builders, Mocker Commands -->

# Mocker Commands

Source-driven reference for `Runner` functions in the `Builders / Mocker Commands` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:55`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AtStage`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:68`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithServerName`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithServerName(string serverName)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:81`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithServerName(string serverName)
    ```
    
    **Docstring**
    
    Configures server name on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithRedis`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRedis(RedisConfig redis)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:94`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRedis(RedisConfig redis)
    ```
    
    **Docstring**
    
    Configures redis on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithRequestDurationMs`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRequestDurationMs(int requestDurationMs)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:107`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRequestDurationMs(int requestDurationMs)
    ```
    
    **Docstring**
    
    Configures request duration ms on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithRequestRetries`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithRequestRetries(int requestRetries)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:120`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithRequestRetries(int requestRetries)
    ```
    
    **Docstring**
    
    Configures request retries on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Configure(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:133`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Configure(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithCommand`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.WithCommand(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:146`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder WithCommand(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Configures command on the current Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.CreateConfiguration(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:158`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder CreateConfiguration(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.Create(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:170`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder Create(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:182`
    
    **Signature**
    ```csharp
    public MockerCommandConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:194`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder UpdateConfiguration(Func<MockerCommandConfig, MockerCommandConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.UpdateConfiguration(MockerCommandConfig command)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:208`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder UpdateConfiguration(MockerCommandConfig command)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:223`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `MockerCommandBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerCommandBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/MockerCommands/MockerCommandBuilder.cs:238`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner mocker command builder instance.
    
    Use this method when working with the documented Runner mocker command builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
