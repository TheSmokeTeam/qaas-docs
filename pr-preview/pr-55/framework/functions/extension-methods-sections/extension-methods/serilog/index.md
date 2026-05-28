# Extension Methods: Extension Methods / Serilog

> TL;DR — Reference page for Extension Methods: Extension Methods / Serilog.

This page mirrors the `Extension Methods / Serilog` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md).

## `WithHostname`

Source file, signature, and docstring

**Member** `SerilogExtensions.WithHostname(this LoggerEnrichmentConfiguration enrichmentConfiguration)`

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

Source file, signature, and docstring

**Member** `SerilogExtensions.WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)`

**Kind** `function`

**Declaring Type** `SerilogExtensions (extension type)`

**Source File** `QaaS.Framework.SDK/Extensions/LoggingExetentions.cs`

**Signature**

```csharp
public static LoggerConfiguration WithEnvironment(this LoggerEnrichmentConfiguration enrichmentConfiguration)
```

**Docstring**

Enriches log events with the CI/Local environment as a structured property and adds it as a tag (label) in Elasticsearch.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
