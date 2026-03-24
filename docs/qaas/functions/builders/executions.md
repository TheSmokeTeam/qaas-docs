# Executions

Source-driven reference for `Runner` functions in the `Builders / Executions` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `WithGlobalDict`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithGlobalDict(Dictionary<string, object?> globalDict)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:241`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithGlobalDict(Dictionary<string, object?> globalDict)
    ```
    
    **Docstring**
    
    Replaces the global dictionary stored on the runner execution context.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddSession`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddSession(SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:254`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddSession(SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied session to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateSession`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateSession(SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:267`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateSession(SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured session entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadSessions`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadSessions()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:279`
    
    **Signature**
    ```csharp
    public IReadOnlyList<SessionBuilder> ReadSessions()
    ```
    
    **Docstring**
    
    Returns the configured sessions currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateSession`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateSession(string sessionName, SessionBuilder sessionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:291`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateSession(string sessionName, SessionBuilder sessionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured session stored on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteSession`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteSession(string sessionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:304`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteSession(string sessionName)
    ```
    
    **Docstring**
    
    Removes the configured session from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddAssertion`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddAssertion(AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:317`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddAssertion(AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied assertion to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateAssertion`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateAssertion(AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:330`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateAssertion(AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured assertion entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadAssertions`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadAssertions()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:342`
    
    **Signature**
    ```csharp
    public IReadOnlyList<AssertionBuilder> ReadAssertions()
    ```
    
    **Docstring**
    
    Returns the configured assertions currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateAssertion`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:354`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateAssertion(string assertionName, AssertionBuilder assertionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured assertion stored on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteAssertion`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteAssertion(string assertionName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:367`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteAssertion(string assertionName)
    ```
    
    **Docstring**
    
    Removes the configured assertion from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddStorage`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddStorage(StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:380`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddStorage(StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied storage to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateStorage`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateStorage(StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:393`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateStorage(StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured storage entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadStorages`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadStorages()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:405`
    
    **Signature**
    ```csharp
    public IReadOnlyList<StorageBuilder> ReadStorages()
    ```
    
    **Docstring**
    
    Returns the configured storages currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateStorageAt`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateStorageAt(int index, StorageBuilder storageBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:417`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateStorageAt(int index, StorageBuilder storageBuilder)
    ```
    
    **Docstring**
    
    Updates the configured storage at the specified index on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteStorageAt`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteStorageAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:430`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteStorageAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured storage at the specified index from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:443`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied data source to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateDataSource(DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:456`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateDataSource(DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured data source entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadDataSources`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadDataSources()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:468`
    
    **Signature**
    ```csharp
    public IReadOnlyList<DataSourceBuilder> ReadDataSources()
    ```
    
    **Docstring**
    
    Returns the configured data sources currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:480`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateDataSource(string dataSourceName, DataSourceBuilder dataSourceBuilder)
    ```
    
    **Docstring**
    
    Updates the configured data source stored on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteDataSource`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteDataSource(string dataSourceName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:493`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteDataSource(string dataSourceName)
    ```
    
    **Docstring**
    
    Removes the configured data source from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddLink`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.AddLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:506`
    
    **Signature**
    ```csharp
    public ExecutionBuilder AddLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied link to the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateLink`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.CreateLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:519`
    
    **Signature**
    ```csharp
    public ExecutionBuilder CreateLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured link entry on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadLinks`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadLinks()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:531`
    
    **Signature**
    ```csharp
    public IReadOnlyList<LinkBuilder> ReadLinks()
    ```
    
    **Docstring**
    
    Returns the configured links currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadMetaData`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ReadMetaData()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:543`
    
    **Signature**
    ```csharp
    public MetaDataConfig? ReadMetaData()
    ```
    
    **Docstring**
    
    Returns the metadata currently stored on the Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateLinkAt`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.UpdateLinkAt(int index, LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:555`
    
    **Signature**
    ```csharp
    public ExecutionBuilder UpdateLinkAt(int index, LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Updates the configured link at the specified index on the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteLinkAt`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.DeleteLinkAt(int index)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:568`
    
    **Signature**
    ```csharp
    public ExecutionBuilder DeleteLinkAt(int index)
    ```
    
    **Docstring**
    
    Removes the configured link at the specified index from the current Runner execution builder instance.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ExecutionType`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.ExecutionType(ExecutionType executionType)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:581`
    
    **Signature**
    ```csharp
    public ExecutionBuilder ExecutionType(ExecutionType executionType)
    ```
    
    **Docstring**
    
    Sets the execution type used when the runner execution is built.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `SetCase`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetCase(string caseName)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:600`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetCase(string caseName)
    ```
    
    **Docstring**
    
    Sets the case file applied by the context builder.
    
    Case files are used as the final scenario-specific overlay that shapes the runtime configuration for a specific execution.

## `SetExecutionId`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.SetExecutionId(string executionId)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:613`
    
    **Signature**
    ```csharp
    public ExecutionBuilder SetExecutionId(string executionId)
    ```
    
    **Docstring**
    
    Sets the execution identifier stored on the built context.
    
    The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

## `WithMetadata`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.WithMetadata(MetaDataConfig metaDataConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:626`
    
    **Signature**
    ```csharp
    public ExecutionBuilder WithMetadata(MetaDataConfig metaDataConfig)
    ```
    
    **Docstring**
    
    Sets the metadata configuration stored on the execution.
    
    Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Build`

??? info "Location, signature, and docstring"
    **Member**
    `ExecutionBuilder.Build()`
    
    **Kind** `function`
    
    **Declaring Type** `ExecutionBuilder`
    
    **Location** `QaaS.Runner/ExecutionBuilder.cs:921`
    
    **Signature**
    ```csharp
    public override Execution Build()
    ```
    
    **Docstring**
    
    Builds the configured Runner execution builder output from the current state.
    
    Call this after the fluent configuration is complete. The method validates the accumulated state and materializes the runtime or immutable configuration object represented by the builder.
