# Extension Methods: Extension Methods / Serilog

This page mirrors the `Extension Methods / Serilog` section from [Extension Methods](../../extension-methods.md).

## `WithHostname`

??? info "Source file, signature, and docstring"
    **Member**
    `SerilogExtensions.WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `SerilogExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs`
    
    **Signature**
    ```csharp
    public static LoggerConfiguration WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)
    ```
    
    **Docstring**
    
    Enriches log events with the machine hostname as a structured property and adds it as a tag (label) in Elasticsearch.

## `WithEnvironment`

??? info "Source file, signature, and docstring"
    **Member**
    `SerilogExtensions.WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)`
    
    **Kind** `function`
    
    **Declaring Type** `SerilogExtensions (extension type)`
    
    **Source File** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs`
    
    **Signature**
    ```csharp
    public static LoggerConfiguration WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)
    ```
    
    **Docstring**
    
    Enriches log events with the CI/Local environment as a structured property and adds it as a tag (label) in Elasticsearch.
