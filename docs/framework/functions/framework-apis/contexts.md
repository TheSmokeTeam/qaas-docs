<!-- generated hash:e71b2c0a9421 sources:Framework, functions, Framework APIs, Contexts -->

# Contexts

Source-driven reference for `Framework` functions in the `Framework APIs / Contexts` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `ContextBuilder`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`
    
    **Kind** `constructor`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:44`
    
    **Signature**
    ```csharp
    public ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
    ```
    
    **Docstring**
    
    Creates a context builder that starts from a base QaaS configuration file.
    
    Use this constructor when the context should load its initial configuration from a file path before overwrite sources and reference resolution are applied.

## `ContextBuilder`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`
    
    **Kind** `constructor`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:66`
    
    **Signature**
    ```csharp
    public ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
    ```
    
    **Docstring**
    
    Creates a context builder that starts from an existing configuration builder pipeline.
    
    Use this constructor when configuration sources are assembled externally and should be handed to the QaaS context pipeline as-is.

## `SetLogger`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.SetLogger(ILogger logger)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:82`
    
    **Signature**
    ```csharp
    public IContextBuilder SetLogger(ILogger logger)
    ```
    
    **Docstring**
    
    Sets the logger stored on the built context.
    
    The configured logger becomes the logger used by the context itself and by runtime components resolved from that context.

## `SetConfigurationFile`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.SetConfigurationFile(string? configurationFile)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:95`
    
    **Signature**
    ```csharp
    public IContextBuilder SetConfigurationFile(string? configurationFile)
    ```
    
    **Docstring**
    
    Sets the base configuration file used by the context builder.
    
    Use this when the base configuration file should be selected or replaced after the builder has been created.

## `WithOverwriteFile`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.WithOverwriteFile(string? overwriteFile)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:109`
    
    **Signature**
    ```csharp
    public IContextBuilder WithOverwriteFile(string? overwriteFile)
    ```
    
    **Docstring**
    
    Adds an overwrite file that should be applied during context construction.
    
    Overwrite files are applied after the base configuration and before the final configuration is built.

## `WithOverwriteFolder`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.WithOverwriteFolder(string? overwriteFolder)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:123`
    
    **Signature**
    ```csharp
    public IContextBuilder WithOverwriteFolder(string? overwriteFolder)
    ```
    
    **Docstring**
    
    Adds an overwrite folder whose YAML files should be applied during context construction.
    
    Every YAML file discovered in the folder is applied as an overwrite source in the order returned by the file-system enumeration.

## `SetCase`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.SetCase(string? caseFile)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:137`
    
    **Signature**
    ```csharp
    public IContextBuilder SetCase(string? caseFile)
    ```
    
    **Docstring**
    
    Sets the case file used during context construction.
    
    The supplied value is also stored as the case name on the built context.

## `SetExecutionId`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.SetExecutionId(string? executionId)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:153`
    
    **Signature**
    ```csharp
    public IContextBuilder SetExecutionId(string? executionId)
    ```
    
    **Docstring**
    
    Sets the execution identifier stored on the built context.
    
    The execution identifier flows into the built context and can later be used by logging, reports, and storage integrations.

## `WithOverwriteArgument`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.WithOverwriteArgument(string? argument)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:166`
    
    **Signature**
    ```csharp
    public IContextBuilder WithOverwriteArgument(string? argument)
    ```
    
    **Docstring**
    
    Adds a command-line style overwrite argument to the context builder.
    
    Use this when command-line style overrides should participate in the same configuration pipeline as YAML sources.

## `WithReferenceResolution`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.WithReferenceResolution(ReferenceConfig referenceConfig)`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:180`
    
    **Signature**
    ```csharp
    public IContextBuilder WithReferenceResolution(ReferenceConfig referenceConfig)
    ```
    
    **Docstring**
    
    Adds a reference-resolution rule to the context builder.
    
    Reference-resolution rules are applied while building the final configuration so linked configuration values can be expanded consistently.

## `ResolveCaseLast`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.ResolveCaseLast()`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:193`
    
    **Signature**
    ```csharp
    public IContextBuilder ResolveCaseLast()
    ```
    
    **Docstring**
    
    Delays case-file application until after reference resolution has completed.
    
    This changes resolution order so the case overlay is applied after references are expanded from the base configuration and overwrites.

## `WithEnvironmentVariableResolution`

??? info "Location, signature, and docstring"
    **Member**
    `ContextBuilder.WithEnvironmentVariableResolution()`
    
    **Kind** `function`
    
    **Declaring Type** `ContextBuilder`
    
    **Location** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs:206`
    
    **Signature**
    ```csharp
    public IContextBuilder WithEnvironmentVariableResolution()
    ```
    
    **Docstring**
    
    Enables environment-variable expansion while the context is being built.
    
    Enable this when configuration values should resolve environment variables while the context is being built.
