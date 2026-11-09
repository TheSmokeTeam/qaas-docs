# S3 headers and key selection

> TL;DR — Put per-object headers in `MetaData.Storage.Headers`, enable `ReadStorageHeaders` on the S3 consumer, and use `Prefix` plus `Delimiter` to select the intended key hierarchy level.

## When to use

Use this guide when an S3 publisher must attach user-defined metadata that a later consumer and assertion can inspect, or when a consumer must read only one level of an S3 key hierarchy.

## Publish user metadata

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

If the publisher has `Prefix: events/`, this item is stored as `events/order-42.json`. Each `Storage.Headers` entry is uploaded as [S3 user-defined metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingMetadata.html). The S3 publisher has no configuration-level default headers; the data item must carry every header that should be uploaded.

## Consume headers and keep them for assertions

Set `ReadStorageHeaders: true` and keep `DataFilter.MetaData` enabled:

```yaml
Sessions:
  - Name: S3Publish
    Stage: 0
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
  - Name: S3Read
    Stage: 1
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
          ReadFromRunStartTime: false
```

`EventsWithStorageMetadata` represents a data source whose generator returns items like the C# example above. The separate session stages wait for publishing to finish before reading. `ReadFromRunStartTime: false` includes objects uploaded before the reader starts. Use a dedicated prefix for each run to exclude unrelated objects. Keep credentials outside committed configuration in real projects.

For each consumed object, Runner stores the full S3 key in `MetaData.Storage.Key`. With `ReadStorageHeaders: true`, it also stores user-defined metadata in `MetaData.Storage.Headers` and removes the wire-level `x-amz-meta-` prefix from header names. An assertion receives the same session output data and can read it directly:

```csharp
var consumedItems = sessions
    .Single(session => session.Name == "S3Read")
    .Outputs!
    .Single(output => output.Name == "ConsumeCurrentEvents")
    .Data;

var correlationId = consumedItems[0]
    .MetaData?
    .Storage?
    .Headers?["correlation-id"];
```

`ReadStorageHeaders` defaults to `false` because enabling it performs one additional S3 metadata request per consumed object. AWS documents that [`HeadObject`](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadObject.html) retrieves metadata without returning the object body. `DataFilter.MetaData: false` removes the storage metadata before assertions run, even when the consumer fetched it.

## Select keys with Prefix and Delimiter

`Prefix` selects the beginning of the object keys to list. `Delimiter` asks S3 to return one hierarchy level beneath that prefix: keys below the next delimiter are rolled into `CommonPrefixes` and are not returned as objects for the consumer to read. These are the [Amazon S3 `ListObjectsV2` semantics](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html); the [AWS prefix and delimiter guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html) illustrates the same hierarchical browsing behavior.

For a bucket containing `events/a.json` and `events/archive/b.json`:

| Consumer settings                  | Objects consumed                                  |
| ---------------------------------- | ------------------------------------------------- |
| `Prefix: events/`, `Delimiter: ''` | Both objects, including the deeper `archive/` key |
| `Prefix: events/`, `Delimiter: /`  | `events/a.json` only                              |

An empty delimiter is the default and reads every object whose key matches the prefix, at every deeper level. A non-empty delimiter is not an exclusion character and does not mean "return keys without this character anywhere." It selects a hierarchy level relative to `Prefix`. Use `Prefix` to choose the path and `Delimiter` to decide whether deeper paths are included.

## Read large object sets incrementally

`StreamResults` defaults to `false`: `ReadChunk` finishes acquisition before returning, reports download errors during that call, and returns a repeatable materialized result. For incremental delivery, set `StreamResults: true`.

The incremental reader waits for the configured inactivity window, lists matching object metadata, and filters and sorts that metadata before downloading bodies. `ReadFromRunStartTime: true` therefore excludes older objects before their bodies are fetched. With `StreamResults: true`, body downloads begin when the result sequence is enumerated.

With `StreamResults: true`, the metadata snapshot is captured when `ReadChunk` is called. Enumerating that result again downloads the bodies again; it does not reuse a memoized body cache. The metadata snapshot does not pin object versions, so repeated enumeration can observe changed bytes or a deleted key.

`MaxConcurrentDownloads` belongs under the consumer's `S3Bucket` configuration. It is a positive integer with a default of `1`. This example is a fragment to add to an existing S3 consumer, alongside its connection and bucket settings:

```yaml
S3Bucket:
  Prefix: events/current-run/
  StreamResults: true
  MaxConcurrentDownloads: 4
```

The equivalent code configures one consumer with a four-object download window:

```csharp
using QaaS.Framework.Protocols.ConfigurationObjects.S3;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

static SessionBuilder CreateS3ReadSession(
    string serviceUrl, string bucket, string accessKey, string secretKey)
{
    var consumer = new ConsumerBuilder().Named("ReadObjects").WithTimeout(1000)
        .Configure(new S3BucketReaderConfig
        {
            ServiceURL = serviceUrl, StorageBucket = bucket,
            AccessKey = accessKey, SecretKey = secretKey, ForcePathStyle = true,
            Prefix = "events/current-run/", StreamResults = true,
            MaxConcurrentDownloads = 4
        });
    return new SessionBuilder().Named("S3Read").AddConsumer(consumer);
}
```

With `MaxConcurrentDownloads: 1`, the reader loads one complete body at a time. In eager mode all results are accumulated before returning; in streaming mode only the current download window is acquired before yielding. A value of `4` loads at most four bodies in the current download window. It waits for that window to finish, then yields its results in timestamp order before starting the next window. Equal timestamps retain the listing order.

Choose `1` to minimize simultaneous body buffers, or a small higher value when overlapping requests improves throughput. This setting controls S3 body downloads, not publisher concurrency or generic consumer parallelism. `DataFilter.Body: false` avoids body GET requests entirely. `ReadStorageHeaders: true` performs an additional metadata request for each consumed object.

### Memory and stopping behavior

The limit counts concurrent object downloads; it is not a byte limit. Each downloaded body is materialized as a complete byte array, and transport buffers and copies add overhead. Four large objects can require much more memory than four small objects. Metadata for the selected object set is also listed and sorted in memory.

Runner retains consumed output bodies for later assertions. Incremental S3 reads reduce acquisition buffering, but do not make the complete Runner workflow use constant memory. Each retained `Body` is a complete byte array; deserialization, publisher data, storage and reporting also consume memory.

If a count policy or another caller stops enumeration, the reader does not start later windows. Up to `MaxConcurrentDownloads` objects from the current window may already have been downloaded. The setting does not cancel an in-flight request, and the consumer timeout remains an inactivity window rather than an overall download deadline.

Incremental delivery can expose earlier results before a later download fails. Treat the consumer action failure as a failed or incomplete read; a partial output list is not proof that every expected object was consumed. Objects can also change between listing and download: the result is not an immutable S3 snapshot.

## Edge cases

- `Delimiter` affects listing and consuming; it does not change publishing or object names.
- S3 user-defined metadata values are strings. Put structured content in the object body instead of a header.
- Amazon S3 stores user-defined metadata keys in lowercase; use stable lowercase keys in publishers and assertions.
- A supplied `MetaData.Storage.Key` is appended to the publisher `Prefix`; avoid repeating the prefix in both places.
- Header reads add one metadata request per returned object, so enable them only when downstream logic or assertions needs them.
- Keep `DataFilter.MetaData` enabled whenever an assertion needs `Storage.Key` or `Storage.Headers`.

## See also

- [Publishers](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/index.md)
- [Consumers](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/index.md)
- [Publishers configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers-tableView/index.md)
- [Consumers configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers-tableView/index.md)
