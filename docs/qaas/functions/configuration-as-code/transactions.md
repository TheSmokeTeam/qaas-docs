<!-- generated hash:3cbd05311370 sources:Runner, functions, Configuration as Code, Transactions -->

# Transactions

Source-driven reference for `Runner` functions in the `Configuration as Code / Transactions` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:75`
    
    **Signature**
    ```csharp
    public TransactionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AtStage`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:88`
    
    **Signature**
    ```csharp
    public TransactionBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeout`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.WithTimeout(int timeoutMs)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:101`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithTimeout(int timeoutMs)
    ```
    
    **Docstring**
    
    Configures timeout on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `FilterInputData`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.FilterInputData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:114`
    
    **Signature**
    ```csharp
    public TransactionBuilder FilterInputData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the input data filter used by the transaction.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `FilterOutputData`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.FilterOutputData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:127`
    
    **Signature**
    ```csharp
    public TransactionBuilder FilterOutputData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the output data filter used by the transaction.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithDeserializer`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.WithDeserializer(DeserializeConfig deserializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:140`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithDeserializer(DeserializeConfig deserializeConfig)
    ```
    
    **Docstring**
    
    Sets the deserializer configuration used by the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSerializer`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.WithSerializer(SerializeConfig serializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:153`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithSerializer(SerializeConfig serializeConfig)
    ```
    
    **Docstring**
    
    Sets the serializer configuration used by the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithIterations`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.WithIterations(int iterations)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:166`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithIterations(int iterations)
    ```
    
    **Docstring**
    
    Sets how many iterations the transaction should execute.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.AddDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:179`
    
    **Signature**
    ```csharp
    public TransactionBuilder AddDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.CreateDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:194`
    
    **Signature**
    ```csharp
    public TransactionBuilder CreateDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source entry on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:206`
    
    **Signature**
    ```csharp
    public TransactionBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.CreateDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:221`
    
    **Signature**
    ```csharp
    public TransactionBuilder CreateDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source pattern entry on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `InLoops`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.InLoops()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:233`
    
    **Signature**
    ```csharp
    public TransactionBuilder InLoops()
    ```
    
    **Docstring**
    
    Marks the transaction to execute continuously in loop mode.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSleep`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.WithSleep(ulong sleepTimeMs)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:246`
    
    **Signature**
    ```csharp
    public TransactionBuilder WithSleep(ulong sleepTimeMs)
    ```
    
    **Docstring**
    
    Sets the delay applied between transaction iterations.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddPolicy`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.AddPolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:259`
    
    **Signature**
    ```csharp
    public TransactionBuilder AddPolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Adds the supplied policy to the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreatePolicy`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.CreatePolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:274`
    
    **Signature**
    ```csharp
    public TransactionBuilder CreatePolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Creates or adds the configured policy entry on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadPolicies`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.ReadPolicies()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:286`
    
    **Signature**
    ```csharp
    public IReadOnlyList<PolicyBuilder> ReadPolicies()
    ```
    
    **Docstring**
    
    Returns the configured policies currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdatePolicyAt`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:298`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeletePolicyAt`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.DeletePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:316`
    
    **Signature**
    ```csharp
    public TransactionBuilder DeletePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSources`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.ReadDataSources()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:334`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSources()
    ```
    
    **Docstring**
    
    Returns the configured data sources currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdateDataSource(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:346`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdateDataSource(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.DeleteDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:369`
    
    **Signature**
    ```csharp
    public TransactionBuilder DeleteDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourcePatterns`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.ReadDataSourcePatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:382`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourcePatterns()
    ```
    
    **Docstring**
    
    Returns the configured data source patterns currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:394`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdateDataSourcePattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source pattern stored on the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.DeleteDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:417`
    
    **Signature**
    ```csharp
    public TransactionBuilder DeleteDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.CreateConfiguration(ITransactorConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:430`
    
    **Signature**
    ```csharp
    public TransactionBuilder CreateConfiguration(ITransactorConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.Create(ITransactorConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:442`
    
    **Signature**
    ```csharp
    public TransactionBuilder Create(ITransactorConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:454`
    
    **Signature**
    ```csharp
    public ITransactorConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdateConfiguration(Func<ITransactorConfig, ITransactorConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:466`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdateConfiguration(Func<ITransactorConfig, ITransactorConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdateConfiguration(ITransactorConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:480`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdateConfiguration(ITransactorConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:494`
    
    **Signature**
    ```csharp
    public TransactionBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:508`
    
    **Signature**
    ```csharp
    public TransactionBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `TransactionBuilder.Configure(ITransactorConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `TransactionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Transactions/Builders/TransactionBuilder.cs:527`
    
    **Signature**
    ```csharp
    public TransactionBuilder Configure(ITransactorConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner transaction builder instance.
    
    Use this method when working with the documented Runner transaction builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
