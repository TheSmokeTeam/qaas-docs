<!-- generated hash:62c4d42381c7 sources:Runner, functions, Builders, Sessions -->

# Sessions

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Named`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.Named(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:25`
    
    **Signature**
    ```csharp
    public SessionBuilder Named(string name)
    ```
    
    **Docstring**
    
    Sets the name used for the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeoutBefore`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.WithTimeoutBefore(uint timeout)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:38`
    
    **Signature**
    ```csharp
    public SessionBuilder WithTimeoutBefore(uint timeout)
    ```
    
    **Docstring**
    
    Sets the timeout applied before the session runs.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithTimeoutAfter`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.WithTimeoutAfter(uint timeout)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:51`
    
    **Signature**
    ```csharp
    public SessionBuilder WithTimeoutAfter(uint timeout)
    ```
    
    **Docstring**
    
    Sets the timeout applied after the session runs.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AtStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AtStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:64`
    
    **Signature**
    ```csharp
    public SessionBuilder AtStage(int stage)
    ```
    
    **Docstring**
    
    Sets the stage used by the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `RunSessionUntilStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.RunSessionUntilStage(int stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:78`
    
    **Signature**
    ```csharp
    public SessionBuilder RunSessionUntilStage(int stage)
    ```
    
    **Docstring**
    
    Limits the session to run only until the specified stage.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DiscardData`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DiscardData()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:91`
    
    **Signature**
    ```csharp
    public SessionBuilder DiscardData()
    ```
    
    **Docstring**
    
    Disables data persistence for the configured session.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `WithinCategory`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.WithinCategory(string category)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:104`
    
    **Signature**
    ```csharp
    public SessionBuilder WithinCategory(string category)
    ```
    
    **Docstring**
    
    Sets the category used by the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddConsumer`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddConsumer(ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:117`
    
    **Signature**
    ```csharp
    public SessionBuilder AddConsumer(ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied consumer to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateConsumer`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreateConsumer(ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:130`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateConsumer(ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured consumer entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadConsumers`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadConsumers()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:142`
    
    **Signature**
    ```csharp
    public IReadOnlyList<ConsumerBuilder> ReadConsumers()
    ```
    
    **Docstring**
    
    Returns the configured consumers currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadConsumer`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadConsumer(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:154`
    
    **Signature**
    ```csharp
    public ConsumerBuilder? ReadConsumer(string name)
    ```
    
    **Docstring**
    
    Returns the configured consumer currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateConsumer`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateConsumer(string name, ConsumerBuilder consumerBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:166`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateConsumer(string name, ConsumerBuilder consumerBuilder)
    ```
    
    **Docstring**
    
    Updates the configured consumer stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateConsumer`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:179`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateConsumer(string name, Func<ConsumerBuilder, ConsumerBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured consumer stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteConsumer`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteConsumer(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:192`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteConsumer(string name)
    ```
    
    **Docstring**
    
    Removes the configured consumer from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddPublisher`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddPublisher(PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:205`
    
    **Signature**
    ```csharp
    public SessionBuilder AddPublisher(PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied publisher to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreatePublisher`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreatePublisher(PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:218`
    
    **Signature**
    ```csharp
    public SessionBuilder CreatePublisher(PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured publisher entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadPublishers`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadPublishers()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:230`
    
    **Signature**
    ```csharp
    public IReadOnlyList<PublisherBuilder> ReadPublishers()
    ```
    
    **Docstring**
    
    Returns the configured publishers currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadPublisher`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadPublisher(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:242`
    
    **Signature**
    ```csharp
    public PublisherBuilder? ReadPublisher(string name)
    ```
    
    **Docstring**
    
    Returns the configured publisher currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdatePublisher`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdatePublisher(string name, PublisherBuilder publisherBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:254`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdatePublisher(string name, PublisherBuilder publisherBuilder)
    ```
    
    **Docstring**
    
    Updates the configured publisher stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdatePublisher`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:267`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdatePublisher(string name, Func<PublisherBuilder, PublisherBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured publisher stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeletePublisher`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeletePublisher(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:280`
    
    **Signature**
    ```csharp
    public SessionBuilder DeletePublisher(string name)
    ```
    
    **Docstring**
    
    Removes the configured publisher from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddTransaction`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddTransaction(TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:293`
    
    **Signature**
    ```csharp
    public SessionBuilder AddTransaction(TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied transaction to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateTransaction`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreateTransaction(TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:306`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateTransaction(TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured transaction entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadTransactions`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadTransactions()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:318`
    
    **Signature**
    ```csharp
    public IReadOnlyList<TransactionBuilder> ReadTransactions()
    ```
    
    **Docstring**
    
    Returns the configured transactions currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadTransaction`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadTransaction(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:330`
    
    **Signature**
    ```csharp
    public TransactionBuilder? ReadTransaction(string name)
    ```
    
    **Docstring**
    
    Returns the configured transaction currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateTransaction`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateTransaction(string name, TransactionBuilder transactionBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:342`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateTransaction(string name, TransactionBuilder transactionBuilder)
    ```
    
    **Docstring**
    
    Updates the configured transaction stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateTransaction`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:355`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateTransaction(string name, Func<TransactionBuilder, TransactionBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured transaction stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteTransaction`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteTransaction(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:368`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteTransaction(string name)
    ```
    
    **Docstring**
    
    Removes the configured transaction from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddProbe`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddProbe(ProbeBuilder probeBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:381`
    
    **Signature**
    ```csharp
    public SessionBuilder AddProbe(ProbeBuilder probeBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied probe to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateProbe`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreateProbe(ProbeBuilder probeBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:394`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateProbe(ProbeBuilder probeBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured probe entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadProbes`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadProbes()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:406`
    
    **Signature**
    ```csharp
    public IReadOnlyList<ProbeBuilder> ReadProbes()
    ```
    
    **Docstring**
    
    Returns the configured probes currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadProbe`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadProbe(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:418`
    
    **Signature**
    ```csharp
    public ProbeBuilder? ReadProbe(string name)
    ```
    
    **Docstring**
    
    Returns the configured probe currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateProbe`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateProbe(string name, ProbeBuilder probeBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:430`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateProbe(string name, ProbeBuilder probeBuilder)
    ```
    
    **Docstring**
    
    Updates the configured probe stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateProbe`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateProbe(string name, Func<ProbeBuilder, ProbeBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:443`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateProbe(string name, Func<ProbeBuilder, ProbeBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured probe stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteProbe`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteProbe(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:456`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteProbe(string name)
    ```
    
    **Docstring**
    
    Removes the configured probe from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddCollector`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddCollector(CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:469`
    
    **Signature**
    ```csharp
    public SessionBuilder AddCollector(CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied collector to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateCollector`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreateCollector(CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:482`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateCollector(CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured collector entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadCollectors`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadCollectors()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:494`
    
    **Signature**
    ```csharp
    public IReadOnlyList<CollectorBuilder> ReadCollectors()
    ```
    
    **Docstring**
    
    Returns the configured collectors currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadCollector`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadCollector(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:506`
    
    **Signature**
    ```csharp
    public CollectorBuilder? ReadCollector(string name)
    ```
    
    **Docstring**
    
    Returns the configured collector currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateCollector`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateCollector(string name, CollectorBuilder collectorBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:518`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateCollector(string name, CollectorBuilder collectorBuilder)
    ```
    
    **Docstring**
    
    Updates the configured collector stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateCollector`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:531`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateCollector(string name, Func<CollectorBuilder, CollectorBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured collector stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteCollector`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteCollector(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:544`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteCollector(string name)
    ```
    
    **Docstring**
    
    Removes the configured collector from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddMockerCommand`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddMockerCommand(MockerCommandBuilder mockerCommandBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:557`
    
    **Signature**
    ```csharp
    public SessionBuilder AddMockerCommand(MockerCommandBuilder mockerCommandBuilder)
    ```
    
    **Docstring**
    
    Adds the supplied mocker command to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateMockerCommand`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:572`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateMockerCommand(MockerCommandBuilder mockerCommandBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured mocker command entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadMockerCommands`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadMockerCommands()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:584`
    
    **Signature**
    ```csharp
    public IReadOnlyList<MockerCommandBuilder> ReadMockerCommands()
    ```
    
    **Docstring**
    
    Returns the configured mocker commands currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadMockerCommand`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadMockerCommand(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:596`
    
    **Signature**
    ```csharp
    public MockerCommandBuilder? ReadMockerCommand(string name)
    ```
    
    **Docstring**
    
    Returns the configured mocker command currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateMockerCommand`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:608`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateMockerCommand(string name, MockerCommandBuilder mockerCommandBuilder)
    ```
    
    **Docstring**
    
    Updates the configured mocker command stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `UpdateMockerCommand`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:621`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateMockerCommand(string name, Func<MockerCommandBuilder, MockerCommandBuilder> update)
    ```
    
    **Docstring**
    
    Updates the configured mocker command stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteMockerCommand`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteMockerCommand(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:634`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteMockerCommand(string name)
    ```
    
    **Docstring**
    
    Removes the configured mocker command from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `AddStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.AddStage(StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:647`
    
    **Signature**
    ```csharp
    public SessionBuilder AddStage(StageConfig stage)
    ```
    
    **Docstring**
    
    Adds the supplied stage to the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `CreateStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.CreateStage(StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:660`
    
    **Signature**
    ```csharp
    public SessionBuilder CreateStage(StageConfig stage)
    ```
    
    **Docstring**
    
    Creates or adds the configured stage entry on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadStages`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadStages()`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:672`
    
    **Signature**
    ```csharp
    public IReadOnlyList<StageConfig> ReadStages()
    ```
    
    **Docstring**
    
    Returns the configured stages currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `ReadStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.ReadStage(int stageNumber)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:684`
    
    **Signature**
    ```csharp
    public StageConfig? ReadStage(int stageNumber)
    ```
    
    **Docstring**
    
    Returns the configured stage currently stored on the Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.UpdateStage(int stageNumber, StageConfig stage)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:696`
    
    **Signature**
    ```csharp
    public SessionBuilder UpdateStage(int stageNumber, StageConfig stage)
    ```
    
    **Docstring**
    
    Updates the configured stage stored on the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteStage`

??? info "Location, signature, and docstring"
    **Member**
    `SessionBuilder.DeleteStage(int stageNumber)`
    
    **Kind** `function`
    
    **Declaring Type** `SessionBuilder`
    
    **Location** `QaaS.Runner.Sessions/Session/Builders/SessionBuilderLogic.cs:715`
    
    **Signature**
    ```csharp
    public SessionBuilder DeleteStage(int stageNumber)
    ```
    
    **Docstring**
    
    Removes the configured stage from the current Runner session builder instance.
    
    Use this method when working with the documented Runner session builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
