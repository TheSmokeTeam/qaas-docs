---
id: framework.functions.extension.methods.sections.extension.methods.serilog
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [framework]
keywords: [framework, functions, extension, methods, sections, serilog]
summary: "Reference page for Extension Methods: Extension Methods / Serilog."
---

<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Extensions\LoggingExetentions.cs -->

# Extension Methods: Extension Methods / Serilog

> TL;DR — This page mirrors the `Extension Methods / Serilog` section from [Extension Methods](../../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `WithHostname` {: #withhostname}

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

### `WithEnvironment` {: #withenvironment}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../../extension-methods.md)
