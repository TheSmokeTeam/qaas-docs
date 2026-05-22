---
id: processors.custom-authoring-guide
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors, framework, mocker]
keywords: [processors, custom, processor, authoring, sdk, BaseTransactionProcessor]
summary: "Derive a custom transaction processor from BaseTransactionProcessor<TConfig> and wire it into a mocker stub."
---

# Custom Processors — Authoring Guide

> TL;DR — A processor inspects an inbound request and produces the response payload. Derive `BaseTransactionProcessor<TConfiguration>`, override `Process`, and reference it from a mocker `Stubs[].Processor` entry.

## When to use {#when-to-use}

- The built-in processor catalog (see [Available Processors](index.md)) does not cover your transformation.
- You need to mutate request bodies (redact, enrich, project) before the response is computed.
- You need to read multiple data sources to assemble a response.

## YAML configuration {#yaml}

A processor binding lives inside a mocker stub:

```yaml
Stubs:
  - Name: SanitisedEcho
    Processor: PiiRedactingEcho
    ProcessorConfiguration:
      RedactedFields: [email, phone, ssn]
      Replacement: "***"
      StatusCode: 200

Servers:
  - Http:
      Port: 8080
      Endpoints:
        - Path: /users
          Actions:
            - Name: UpsertUser
              Method: Post
              TransactionStubName: SanitisedEcho
```

## C# (CAC) usage {#csharp}

Derive `BaseTransactionProcessor<TConfiguration>` from `QaaS.Framework.SDK.Hooks.Processor`. Override `Process(IImmutableList<DataSource>, Data<object>)`, return a new `Data<object>` whose `Body` is the bytes you want to send back.

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.DataObjects;

public sealed class MyProcessor : BaseTransactionProcessor<MyConfig>
{
    public override Data<object> Process(
        IImmutableList<DataSource> dataSourceList,
        Data<object> requestData)
    {
        // produce response bytes
        return new Data<object> { Body = System.Text.Encoding.UTF8.GetBytes("{\"ok\":true}") };
    }
}
```

## Minimal example {#example-minimal}

```csharp
public record EchoConfig { public int StatusCode { get; set; } = 200; }

public sealed class Echo : BaseTransactionProcessor<EchoConfig>
{
    public override Data<object> Process(
        IImmutableList<DataSource> _,
        Data<object> requestData) => new() { Body = requestData.Body };
}
```

## Realistic example {#example-realistic}

A processor that walks the request JSON, redacts configured property names (case-insensitive), and returns the sanitised body. The same configuration drives every endpoint that references the stub.

```csharp
using System.Collections.Immutable;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Text.Json.Nodes;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.MetaDataObjects;

namespace MyMock.Processors;

public record PiiRedactingEchoConfig
{
    [Description("Case-insensitive JSON property names to redact wherever they appear.")]
    [Required, MinLength(1)]
    public List<string> RedactedFields { get; set; } = new();

    [Description("Replacement token written to the response."), DefaultValue("***")]
    public string Replacement { get; set; } = "***";

    [Description("HTTP status to return."), DefaultValue(200)]
    [Range(100, 599)]
    public int StatusCode { get; set; } = 200;
}

public class PiiRedactingEcho : BaseTransactionProcessor<PiiRedactingEchoConfig>
{
    public override Data<object> Process(
        IImmutableList<DataSource> dataSourceList,
        Data<object> requestData)
    {
        var raw = requestData.Body ?? Array.Empty<byte>();
        var json = raw.Length == 0 ? new JsonObject() : JsonNode.Parse(raw) ?? new JsonObject();

        var fields = Configuration.RedactedFields
            .Select(f => f.ToLowerInvariant())
            .ToHashSet();

        Redact(json, fields, Configuration.Replacement);

        var sanitised = Encoding.UTF8.GetBytes(json.ToJsonString());

        return new Data<object>
        {
            Body = sanitised,
            MetaData = new MetaData
            {
                Http = new Http
                {
                    StatusCode = Configuration.StatusCode,
                    ResponseHeaders = new Dictionary<string, string>
                    {
                        ["Content-Type"] = "application/json",
                        ["X-Redacted-Field-Count"] = fields.Count.ToString(),
                    },
                },
            },
        };
    }

    private static void Redact(JsonNode? node, HashSet<string> fields, string replacement)
    {
        switch (node)
        {
            case JsonObject obj:
                foreach (var key in obj.Select(kv => kv.Key).ToList())
                {
                    if (fields.Contains(key.ToLowerInvariant()))
                        obj[key] = replacement;
                    else
                        Redact(obj[key], fields, replacement);
                }
                break;
            case JsonArray arr:
                for (var i = 0; i < arr.Count; i++)
                    Redact(arr[i], fields, replacement);
                break;
        }
    }
}
```

Mocker YAML:

```yaml
Stubs:
  - Name: SanitisedEcho
    Processor: PiiRedactingEcho
    ProcessorConfiguration:
      RedactedFields: [email, phone, ssn, nationalId]
      Replacement: "***"
      StatusCode: 200

Servers:
  - Http:
      Port: 8080
      IsLocalhost: false
      Endpoints:
        - Path: /users
          Actions:
            - Name: UpsertUser
              Method: Post
              TransactionStubName: SanitisedEcho
```

After the round-trip a request body of

```json
{ "id": 42, "email": "alice@example.com", "phone": "+1-555-0142", "profile": { "ssn": "123-45-6789", "nickname": "ali" } }
```

is rewritten to

```json
{ "id": 42, "email": "***", "phone": "***", "profile": { "ssn": "***", "nickname": "ali" } }
```

## Edge cases {#edge-cases}

- Non-JSON payloads raise on `JsonNode.Parse`. Wrap in `try/catch` and return the body unchanged if you need a tolerant variant.
- Field matching is case-insensitive on the property name; recursion handles nested paths automatically.
- `Body` is `byte[]`, not `string`. Encode with UTF-8 explicitly.
- The processor instance is shared across in-flight requests. Do not hold per-request state in fields.
- Custom response headers belong in `MetaData.Http.ResponseHeaders`; the mocker emits them verbatim.

## See also {#see-also}

- [Processors — Introduction](index.md)
- [Mocker — Stubs reference](../mocker/userInterfaces/mocker/configurationSections/stubs/overview.md)
- [Mocker — Servers reference](../mocker/userInterfaces/mocker/configurationSections/server/overview.md)
