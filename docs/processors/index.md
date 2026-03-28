# Processors

Processors are **hooks** that create mock responses in [QaaS.Mocker](../mocker/index.md). They implement `BaseTransactionProcessor<TConfig>` and are referenced by class name from a [Stub](../mocker/userInterfaces/mocker/configurationSections/stubs/overview.md).

The **QaaS.Common.Processors** package is the reusable processor library for shared mock behavior. You can also author project-local processors when a mock needs behavior that is specific to one repository.

|                |                                                                          |
| -------------- | ------------------------------------------------------------------------ |
| **Package**    | `QaaS.Common.Processors`                                                 |
| **Source**     | [QaaS.Common.Processors]({{ links.repository_processors }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
```

## Writing a Custom Processor

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for the local-hook pattern.

## Quick-Start Note

The Mocker quick starts on this site keep the file-backed response processor inside the sample project so the examples stay runnable against the currently published NuGet packages.


<!-- generated hook catalog start -->
## Available Hooks

The built-in hooks below are grouped by implementation type so it is easier to shortlist the right hook before drilling into configuration details.

### Static responses

- [StaticResponseProcessor](availableProcessors/StaticResponseProcessor/overview.md): Fixed body. Returns a fixed UTF-8 response body with the configured status code, content type, and headers.
- [StatusCodeTransactionProcessor](availableProcessors/StatusCodeTransactionProcessor/overview.md): Status code only. Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration.

### Request-derived responses

- [RequestEchoProcessor](availableProcessors/RequestEchoProcessor/overview.md): Echo request. Returns a JSON response that echoes the incoming request body and optional request metadata.
- [PassThroughProcessor](availableProcessors/PassThroughProcessor/overview.md): Pass-through payload. Returns the incoming request payload unchanged while applying the configured response metadata.

### Transformations

- [JsonEnvelopeProcessor](availableProcessors/JsonEnvelopeProcessor/overview.md): JSON envelope. Wraps the incoming request payload and optional request metadata in a JSON envelope response.
- [TextTransformProcessor](availableProcessors/TextTransformProcessor/overview.md): Text transformation. Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

### Data-driven responses

- [ConditionalResponseProcessor](availableProcessors/ConditionalResponseProcessor/overview.md): Conditional routing. Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches.
- [DataSourceResponseProcessor](availableProcessors/DataSourceResponseProcessor/overview.md): Data source lookup. Builds the response from generated data produced by one configured data source.

### Error responses

- [ProblemDetailsProcessor](availableProcessors/ProblemDetailsProcessor/overview.md): Problem details. Returns an RFC 7807 style problem-details JSON response using the configured status and fields.

<!-- generated hook catalog end -->
