<!-- generated hash:48b4196e8461 sources:Runner, functions, Configuration as Code, Publishers -->

# Publishers

Source-driven reference for `Runner` functions in the `Configuration as Code / Publishers` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:37`
    
    **Signature**
    ```csharp
    public PublisherBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AtStage`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:50`
    
    **Signature**
    ```csharp
    public PublisherBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `FilterData`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:63`
    
    **Signature**
    ```csharp
    public PublisherBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSerializer`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.WithSerializer(SerializeConfig serializeConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:76`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithSerializer(SerializeConfig serializeConfig)
    ```
    
    **Docstring**
    
    Sets the serializer configuration used by the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithIterations`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.WithIterations(int iterations)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:89`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithIterations(int iterations)
    ```
    
    **Docstring**
    
    Sets how many iterations the transaction should execute.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.AddDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:102`
    
    **Signature**
    ```csharp
    public PublisherBuilder AddDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.CreateDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:117`
    
    **Signature**
    ```csharp
    public PublisherBuilder CreateDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source entry on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSources`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.ReadDataSources()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:129`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSources()
    ```
    
    **Docstring**
    
    Returns the configured data sources currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateDataSource(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:141`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateDataSource(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.DeleteDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:164`
    
    **Signature**
    ```csharp
    public PublisherBuilder DeleteDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.AddDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:177`
    
    **Signature**
    ```csharp
    public PublisherBuilder AddDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Adds the supplied data source pattern to the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.CreateDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:192`
    
    **Signature**
    ```csharp
    public PublisherBuilder CreateDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source pattern entry on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSourcePatterns`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.ReadDataSourcePatterns()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:204`
    
    **Signature**
    ```csharp
    public IReadOnlyList<string> ReadDataSourcePatterns()
    ```
    
    **Docstring**
    
    Returns the configured data source patterns currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateDataSourcePattern(string existingValue, string newValue)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:216`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateDataSourcePattern(string existingValue, string newValue)
    ```
    
    **Docstring**
    
    Updates the configured data source pattern stored on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSourcePattern`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.DeleteDataSourcePattern(string dataSourcePattern)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:239`
    
    **Signature**
    ```csharp
    public PublisherBuilder DeleteDataSourcePattern(string dataSourcePattern)
    ```
    
    **Docstring**
    
    Removes the configured data source pattern from the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `InLoops`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.InLoops()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:252`
    
    **Signature**
    ```csharp
    public PublisherBuilder InLoops()
    ```
    
    **Docstring**
    
    Marks the transaction to execute continuously in loop mode.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithSleep`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.WithSleep(ulong sleepTimeMs)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:265`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithSleep(ulong sleepTimeMs)
    ```
    
    **Docstring**
    
    Sets the delay applied between transaction iterations.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithChunks`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.WithChunks(Chunks chunks)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:278`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithChunks(Chunks chunks)
    ```
    
    **Docstring**
    
    Configures chunks on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddPolicy`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.AddPolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:291`
    
    **Signature**
    ```csharp
    public PublisherBuilder AddPolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Adds the supplied policy to the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreatePolicy`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.CreatePolicy(PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:306`
    
    **Signature**
    ```csharp
    public PublisherBuilder CreatePolicy(PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Creates or adds the configured policy entry on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadPolicies`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.ReadPolicies()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:318`
    
    **Signature**
    ```csharp
    public IReadOnlyList<PolicyBuilder> ReadPolicies()
    ```
    
    **Docstring**
    
    Returns the configured policies currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdatePolicyAt`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdatePolicyAt(int index, PolicyBuilder policy)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:330`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdatePolicyAt(int index, PolicyBuilder policy)
    ```
    
    **Docstring**
    
    Updates the configured policy at the specified index on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeletePolicyAt`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.DeletePolicyAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:348`
    
    **Signature**
    ```csharp
    public PublisherBuilder DeletePolicyAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured policy at the specified index from the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithParallelism`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.WithParallelism(int parallelism)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:366`
    
    **Signature**
    ```csharp
    public PublisherBuilder WithParallelism(int parallelism)
    ```
    
    **Docstring**
    
    Configures parallelism on the current Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.CreateConfiguration(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:379`
    
    **Signature**
    ```csharp
    public PublisherBuilder CreateConfiguration(ISenderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Create`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.Create(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:391`
    
    **Signature**
    ```csharp
    public PublisherBuilder Create(ISenderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.ReadConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:403`
    
    **Signature**
    ```csharp
    public ISenderConfig? ReadConfiguration()
    ```
    
    **Docstring**
    
    Returns the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:425`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(Func<ISenderConfig, ISenderConfig> update)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:439`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(ISenderConfig config)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.UpdateConfiguration(object configuration)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:453`
    
    **Signature**
    ```csharp
    public PublisherBuilder UpdateConfiguration(object configuration)
    ```
    
    **Docstring**
    
    Updates the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConfiguration`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.DeleteConfiguration()`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:467`
    
    **Signature**
    ```csharp
    public PublisherBuilder DeleteConfiguration()
    ```
    
    **Docstring**
    
    Clears the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure`

??? info "Location, signature, and docstring"
    **Member**
    `PublisherBuilder.Configure(ISenderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `PublisherBuilder`
    
    **Location** `QaaS.Runner.Sessions/Actions/Publishers/Builders/PublisherBuilderLogic.cs:495`
    
    **Signature**
    ```csharp
    public PublisherBuilder Configure(ISenderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner publisher builder instance.
    
    Use this method when working with the documented Runner publisher builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
