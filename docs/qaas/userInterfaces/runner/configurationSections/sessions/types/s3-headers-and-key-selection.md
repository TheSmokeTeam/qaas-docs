---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.s3.headers.and.key.selection
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-07-13
applies_to: [runner]
keywords: [qaas, runner, s3, headers, metadata, prefix, delimiter]
summary: "Publish S3 user metadata, consume it for assertions, and select one key hierarchy level with Prefix and Delimiter."
render_macros: true
---

# S3 headers and key selection

> TL;DR — Put per-object headers in `MetaData.Storage.Headers`, enable `ReadStorageHeaders` on the S3 consumer, and use `Prefix` plus `Delimiter` to select the intended key hierarchy level.

## When to use {: #when-to-use}

Use this guide when an S3 publisher must attach user-defined metadata that a later consumer and assertion can inspect, or when a consumer must read only one level of an S3 key hierarchy.

## Publish user metadata {: #publish-user-metadata}

The S3 publisher reads the object key and user metadata from each published data item. A generator that supplies an S3-ready item can construct it like this:

```csharp
using System.Text;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.MetaDataObjects;

yield return new Data<object>
{
    Body = Encoding.UTF8.GetBytes("{\"id\":42}"),
    MetaData = new MetaData
    {
        Storage = new Storage
        {
            Key = "order-42.json",
            Headers = new Dictionary<string, string>
            {
                ["correlation-id"] = "run-123",
                ["schema-version"] = "2",
            },
        },
    },
};
```

If the publisher has `Prefix: events/`, this item is stored as `events/order-42.json`. Each `Storage.Headers` entry is uploaded as [S3 user-defined metadata]({{ links.aws_s3_user_metadata }}). The S3 publisher has no configuration-level default headers; the data item must carry every header that should be uploaded.

## Consume headers and keep them for assertions {: #consume-headers-and-keep-them-for-assertions}

Set `ReadStorageHeaders: true` and keep `DataFilter.MetaData` enabled:

```yaml
Sessions:
  - Name: S3RoundTrip
    Publishers:
      - Name: PublishEvents
        DataSourceNames: [EventsWithStorageMetadata]
        S3Bucket:
          ServiceURL: http://127.0.0.1:9000
          AccessKey: access-key
          SecretKey: secret-key
          StorageBucket: qaas-events
          ForcePathStyle: true
          Prefix: events/
    Consumers:
      - Name: ConsumeCurrentEvents
        TimeoutMs: 1000
        DataFilter:
          Body: true
          MetaData: true
        S3Bucket:
          ServiceURL: http://127.0.0.1:9000
          AccessKey: access-key
          SecretKey: secret-key
          StorageBucket: qaas-events
          ForcePathStyle: true
          Prefix: events/
          Delimiter: /
          ReadStorageHeaders: true
```

`EventsWithStorageMetadata` represents a data source whose generator returns items like the C# example above. Keep credentials outside committed configuration in real projects.

For each consumed object, Runner stores the full S3 key in `MetaData.Storage.Key`. With `ReadStorageHeaders: true`, it also stores user-defined metadata in `MetaData.Storage.Headers` and removes the wire-level `x-amz-meta-` prefix from header names. An assertion receives the same session output data and can read it directly:

```csharp
var consumedItems = sessions
    .Single(session => session.Name == "S3RoundTrip")
    .Outputs!
    .Single(output => output.Name == "ConsumeCurrentEvents")
    .Data;

var correlationId = consumedItems[0]
    .MetaData?
    .Storage?
    .Headers?["correlation-id"];
```

`ReadStorageHeaders` defaults to `false` because enabling it performs one additional S3 metadata request per consumed object. AWS documents that [`HeadObject`]({{ links.aws_s3_head_object }}) retrieves metadata without returning the object body. `DataFilter.MetaData: false` removes the storage metadata before assertions run, even when the consumer fetched it.

## Select keys with Prefix and Delimiter {: #select-keys-with-prefix-and-delimiter}

`Prefix` selects the beginning of the object keys to list. `Delimiter` asks S3 to return one hierarchy level beneath that prefix: keys below the next delimiter are rolled into `CommonPrefixes` and are not returned as objects for the consumer to read. These are the [Amazon S3 `ListObjectsV2` semantics]({{ links.aws_s3_list_objects_v2 }}); the [AWS prefix and delimiter guide]({{ links.aws_s3_prefixes }}) illustrates the same hierarchical browsing behavior.

For a bucket containing `events/a.json` and `events/archive/b.json`:

| Consumer settings | Objects consumed |
| ----------------- | ---------------- |
| `Prefix: events/`, `Delimiter: ''` | Both objects, including the deeper `archive/` key |
| `Prefix: events/`, `Delimiter: /` | `events/a.json` only |

An empty delimiter is the default and reads every object whose key matches the prefix, at every deeper level. A non-empty delimiter is not an exclusion character and does not mean "return keys without this character anywhere." It selects a hierarchy level relative to `Prefix`. Use `Prefix` to choose the path and `Delimiter` to decide whether deeper paths are included.

## Edge cases {: #edge-cases}

- `Delimiter` affects listing and consuming; it does not change publishing or object names.
- S3 user-defined metadata values are strings. Put structured content in the object body instead of a header.
- Amazon S3 stores user-defined metadata keys in lowercase; use stable lowercase keys in publishers and assertions.
- A supplied `MetaData.Storage.Key` is appended to the publisher `Prefix`; avoid repeating the prefix in both places.
- Header reads add one metadata request per returned object, so enable them only when downstream logic or assertions needs them.
- Keep `DataFilter.MetaData` enabled whenever an assertion needs `Storage.Key` or `Storage.Headers`.

## See also {: #see-also}

- [Publishers](publishers.md)
- [Consumers](consumers.md)
- [Publishers configuration table](publishers-tableView.md)
- [Consumers configuration table](consumers-tableView.md)
