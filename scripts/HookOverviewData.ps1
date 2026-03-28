function New-HookOverviewEntry {
    param(
        [Parameter(Mandatory = $true)][string]$Kind,
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][ValidateSet('runner', 'mocker')][string]$Runtime,
        [Parameter(Mandatory = $true)][string]$WhatItDoes,
        [Parameter(Mandatory = $true)][string]$YamlSnippet,
        [Parameter(Mandatory = $true)][string]$ConfigExplanation
    )

    [pscustomobject]@{
        Kind              = $Kind
        Name              = $Name
        Runtime           = $Runtime
        WhatItDoes        = $WhatItDoes.Trim()
        YamlSnippet       = $YamlSnippet.Trim()
        ConfigExplanation = $ConfigExplanation.Trim()
    }
}

function New-AssertionEntry {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$WhatItDoes,
        [Parameter(Mandatory = $true)][string]$AssertionConfiguration,
        [Parameter(Mandatory = $true)][string]$ConfigExplanation,
        [string[]]$DataSourceNames = @(),
        [string]$SessionsBlock = @'
Sessions:
  - Name: SampleSession
'@,
        [string]$DataSourcesBlock = ''
    )

    $sections = @()
    if (-not [string]::IsNullOrWhiteSpace($DataSourcesBlock)) {
        $sections += $DataSourcesBlock.Trim()
    }

    $dataSourceNamesBlock = if ($DataSourceNames.Count -eq 0) {
        ''
    }
    else {
@"
    DataSourceNames:
$((@($DataSourceNames | ForEach-Object { "      - $_" })) -join "`n")
"@
    }

    $sections += $SessionsBlock.Trim()
    $sections += @"
Assertions:
  - Name: ${Name}Assertion
    Assertion: $Name
    SessionNames:
      - SampleSession
$dataSourceNamesBlock
    AssertionConfiguration:
$AssertionConfiguration
"@.Trim()

    New-HookOverviewEntry `
        -Kind 'assertions' `
        -Name $Name `
        -Runtime 'runner' `
        -WhatItDoes $WhatItDoes `
        -YamlSnippet ($sections -join "`n`n") `
        -ConfigExplanation $ConfigExplanation
}

function New-GeneratorEntry {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$WhatItDoes,
        [Parameter(Mandatory = $true)][string]$DataSourcesBlock,
        [Parameter(Mandatory = $true)][string]$ConfigExplanation
    )

    New-HookOverviewEntry `
        -Kind 'generators' `
        -Name $Name `
        -Runtime 'runner' `
        -WhatItDoes $WhatItDoes `
        -YamlSnippet $DataSourcesBlock `
        -ConfigExplanation $ConfigExplanation
}

function New-ProbeEntry {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$WhatItDoes,
        [Parameter(Mandatory = $true)][string]$ProbeConfiguration,
        [Parameter(Mandatory = $true)][string]$ConfigExplanation,
        [string]$SessionsBlock = ''
    )

    $probeBlock = @"
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: ${Name}Probe
        Probe: $Name
        ProbeConfiguration:
$ProbeConfiguration
"@

    $yamlSnippet = if ([string]::IsNullOrWhiteSpace($SessionsBlock)) {
        $probeBlock.Trim()
    }
    else {
        ($SessionsBlock.Trim(), $probeBlock.Trim() -join "`n`n")
    }

    New-HookOverviewEntry `
        -Kind 'probes' `
        -Name $Name `
        -Runtime 'runner' `
        -WhatItDoes $WhatItDoes `
        -YamlSnippet $yamlSnippet `
        -ConfigExplanation $ConfigExplanation
}

function New-ProcessorEntry {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$WhatItDoes,
        [Parameter(Mandatory = $true)][string]$ProcessorConfiguration,
        [Parameter(Mandatory = $true)][string]$ConfigExplanation,
        [string]$DataSourcesBlock = '',
        [string[]]$DataSourceNames = @()
    )

    $sections = @()
    if (-not [string]::IsNullOrWhiteSpace($DataSourcesBlock)) {
        $sections += $DataSourcesBlock.Trim()
    }

    $dataSourceNamesBlock = if ($DataSourceNames.Count -eq 0) {
        ''
    }
    else {
@"
    DataSourceNames:
$((@($DataSourceNames | ForEach-Object { "      - $_" })) -join "`n")
"@
    }

    $sections += @"
Stubs:
  - Name: ${Name}Stub
    Processor: $Name
$dataSourceNamesBlock
    ProcessorConfiguration:
$ProcessorConfiguration
"@.Trim()

    $sections += @"
Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: ${Name}Stub
"@.Trim()

    New-HookOverviewEntry `
        -Kind 'processors' `
        -Name $Name `
        -Runtime 'mocker' `
        -WhatItDoes $WhatItDoes `
        -YamlSnippet ($sections -join "`n`n") `
        -ConfigExplanation $ConfigExplanation
}

function Get-HookOverviewEntries {
    $entries = @()

    $entries += New-AssertionEntry `
        -Name 'DelayByAverage' `
        -WhatItDoes @'
Measures latency by taking every timestamp in the named input list, every timestamp in the named output list, calculating the average time for each side, and comparing the difference against `MaximumDelayMs`.

If the output list is empty it passes immediately because there is no observed delay to measure. If the input list is empty, or any required timestamp is missing, the assertion raises an error because the delay calculation is no longer meaningful. A small negative result can be tolerated through `MaximumNegativeDelayBufferMs`; anything more negative is treated as bad timing data and throws.
'@ `
        -AssertionConfiguration @'
      InputName: PublishedMessages
      OutputName: ConsumedMessages
      MaximumDelayMs: 250
      MaximumNegativeDelayBufferMs: 25
'@ `
        -ConfigExplanation @'
This snippet compares the average timestamp of `PublishedMessages` with the average timestamp of `ConsumedMessages` for `SampleSession`.

The assertion passes when the average output delay is 250 ms or less. If the calculated delay is slightly negative but still inside the 25 ms buffer, it is treated as clock jitter and effectively clamped to zero; a larger negative value is treated as invalid timing data and fails by exception.
'@

    $entries += New-AssertionEntry `
        -Name 'DelayByChunks' `
        -WhatItDoes @'
Splits the named input and output streams into ordered chunks, computes one timestamp per chunk, and then checks whether each output chunk arrives within the allowed delay relative to the matching input chunk.

The chunk timestamp can be taken from the first item, last item, or the average of the items in the chunk. The assertion succeeds only when the number of on-time output chunks matches the number of complete input chunks. Incomplete trailing chunks are ignored, an output chunk size of zero means "no output is expected", and large negative chunk delays are treated as invalid timing data.
'@ `
        -AssertionConfiguration @'
      Input:
        Name: PublishedBatch
        ChunkSize: 2
        ChunkTimeOption: Last
      Output:
        Name: ProcessedBatch
        ChunkSize: 1
        ChunkTimeOption: Last
      MaximumDelayMs: 500
      MaximumNegativeDelayBufferMs: 50
'@ `
        -ConfigExplanation @'
This configuration treats every two input items in `PublishedBatch` as one logical batch and compares that batch to each single output item in `ProcessedBatch`, using the last timestamp inside each chunk.

With this setup, the assertion expects one output chunk for every complete two-item input chunk, and each output chunk must arrive within 500 ms of its matching input chunk. Small negative timing drift up to 50 ms is tolerated.
'@

    $entries += New-AssertionEntry `
        -Name 'HermeticByExpectedOutputCount' `
        -WhatItDoes @'
Adds up the number of items found in the configured output names across every session given to the assertion and compares that total with one exact expected count.

Missing output names simply contribute zero instead of throwing. That makes the assertion useful when you want a strict "exactly N outputs were produced" check over one session or over a filtered group of sessions.
'@ `
        -AssertionConfiguration @'
      OutputNames:
        - Reply
        - RetryReply
      ExpectedCount: 3
'@ `
        -ConfigExplanation @'
This assertion totals the number of saved items in `Reply` and `RetryReply` for `SampleSession` and expects the combined count to be exactly 3.

If one of those outputs is missing entirely it contributes zero. The assertion passes only when the final summed count equals 3.
'@

    $entries += New-AssertionEntry `
        -Name 'HermeticByExpectedOutputCountInRange' `
        -WhatItDoes @'
Adds up the number of items in the configured output names across the selected sessions and checks whether the total falls between a minimum and a maximum inclusive boundary.

This is the range-based form of the exact-count hermetic check. It is useful when a flow is allowed to produce some controlled variation but still must stay inside a defined envelope.
'@ `
        -AssertionConfiguration @'
      OutputNames:
        - Reply
      ExpectedMinimumCount: 2
      ExpectedMaximumCount: 4
'@ `
        -ConfigExplanation @'
This snippet counts how many items were saved under `Reply` for `SampleSession`.

The assertion passes when the count is between 2 and 4 inclusive. Counts below 2 or above 4 fail the assertion.
'@

    $entries += New-AssertionEntry `
        -Name 'HermeticByInputOutputPercentage' `
        -WhatItDoes @'
Sums the configured input counts and output counts, converts the relationship into a percentage, and then checks whether the output total equals the rounded expected percentage of the input total.

The calculation supports multiple input names and multiple output names. When there are zero inputs and zero outputs the effective percentage is treated as zero; when there are zero inputs but some outputs, the comparison fails instead of dividing by zero. `InputsAreOutputs` lets you compare one output stream against another when the "input" side is itself stored as output data.
'@ `
        -AssertionConfiguration @'
      InputNames:
        - Published
      OutputNames:
        - Delivered
      ExpectedPercentage: 50
      MidpointRounding: AwayFromZero
'@ `
        -ConfigExplanation @'
This configuration says that `Delivered` should contain exactly half as many items as `Published` in `SampleSession`.

The assertion computes the expected output count as 50 percent of the total input count, rounds it with `AwayFromZero`, and passes only if the real output count matches that rounded number exactly.
'@

    $entries += New-AssertionEntry `
        -Name 'HermeticByInputOutputPercentageInRange' `
        -WhatItDoes @'
Sums the configured input and output counts, calculates the real output-to-input percentage, and checks whether that real percentage stays within the configured inclusive minimum and maximum range.

Unlike the exact-percentage variant, this assertion compares the calculated percentage directly instead of converting the input count into one exact expected output count. It still supports `InputsAreOutputs` for output-to-output comparisons.
'@ `
        -AssertionConfiguration @'
      InputNames:
        - Published
      OutputNames:
        - Delivered
      ExpectedMinimumPercentage: 45
      ExpectedMaximumPercentage: 55
'@ `
        -ConfigExplanation @'
This snippet checks whether `Delivered` stays near a 1:2 ratio with `Published`.

The assertion passes when the actual output percentage is between 45 and 55 percent inclusive. It is useful when the flow is allowed to vary slightly but should stay close to a target ratio.
'@

    $entries += New-AssertionEntry `
        -Name 'HttpStatus' `
        -WhatItDoes @'
Reads every saved item in the configured output lists of a single session and verifies that each item carries the expected HTTP status code in its metadata.

If any output item is missing HTTP status metadata entirely, the assertion throws instead of silently ignoring it. When status codes are present but some do not match, the assertion fails and records both the unexpected status codes and the outputs where they appeared.
'@ `
        -AssertionConfiguration @'
      StatusCode: 200
      OutputNames:
        - Reply
'@ `
        -ConfigExplanation @'
This assertion checks the `Reply` output of `SampleSession` and expects every saved item to have HTTP status `200`.

If all items report `200`, the assertion passes. If any item reports a different status it fails with a detailed trace, and if any item has no HTTP status metadata at all it fails by exception because the status check cannot be trusted.
'@

    $entries += New-AssertionEntry `
        -Name 'ObjectOutputJsonSchema' `
        -WhatItDoes @'
Loads every schema document provided by the attached data sources, converts each item in the named output to JSON, and validates each output item against all of the supplied schemas until at least one schema matches.

The assertion produces a detailed summary: whether all outputs passed, all failed, or the result was mixed, plus per-item validation details in the trace. It throws when schema documents are missing or malformed, or when an output item cannot be converted to JSON at all.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: OrderSchemas
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: schemas
        SearchPattern: '*.json'
      StorageMetaData: ItemName
'@ `
        -DataSourceNames @('OrderSchemas') `
        -AssertionConfiguration @'
      OutputName: Reply
'@ `
        -ConfigExplanation @'
This snippet attaches a schema source called `OrderSchemas` and then validates every item captured under the `Reply` output of `SampleSession` against the schemas loaded from that data source.

An output item passes when it matches at least one provided schema. If a reply matches none of them, the assertion fails and records the first failing item plus the schema-validation errors in the trace.
'@

    $entries += New-AssertionEntry `
        -Name 'OutputContentByExpectedCsvResults' `
        -WhatItDoes @'
Loads expected results from a CSV data source, converts each output item to JSON, and validates configured fields by mapping CSV columns to JSON paths.

Field validation is per mapped column and can use exact matching, numeric error ranges, override values, or base64-to-hex conversion. The assertion can compare rows by position or, when `CompareRowsNotInOrder` is enabled, match rows in any order while still ensuring each expected row is satisfied only once.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: ExpectedResultsCsv
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: expectations
        SearchPattern: '*.csv'
      StorageMetaData: ItemName
'@ `
        -DataSourceNames @('ExpectedResultsCsv') `
        -AssertionConfiguration @'
      OutputName: Reply
      DataSourceName: ExpectedResultsCsv
      ColumnNameToFieldPathMap:
        ORDER_ID:
          Path: $.orderId
          FieldValidationConfig:
            Type: ExactValue
        TOTAL:
          Path: $.total
          FieldValidationConfig:
            Type: ErrorRange
            ErrorRange:
              ErrorRange: 0.1
      CompareRowsNotInOrder: true
'@ `
        -ConfigExplanation @'
This example reads expected rows from `ExpectedResultsCsv`, compares them with the JSON bodies stored in the `Reply` output, and validates two fields.

`ORDER_ID` must match exactly, while `TOTAL` can differ by up to 0.1. Because `CompareRowsNotInOrder` is enabled, the assertion can match the observed output rows to the expected CSV rows in any order instead of forcing row 1 to match row 1.
'@

    $entries += New-AssertionEntry `
        -Name 'OutputDeserializableTo' `
        -WhatItDoes @'
Takes every item from one output, treats the body as serialized bytes, and tries to deserialize each item with the configured deserializer.

The assertion passes only when every item can be deserialized successfully. It records the index and exception for each failure in the trace, which makes it useful as a fast safety check that a response stream really matches the serialization format you expect.
'@ `
        -AssertionConfiguration @'
      OutputName: Reply
      Deserialize:
        Deserializer: Json
'@ `
        -ConfigExplanation @'
This configuration checks the `Reply` output of `SampleSession` and attempts to deserialize every saved body with the JSON deserializer.

If every item is valid JSON bytes, the assertion passes. If any item is malformed, the assertion fails and the trace shows which item index could not be deserialized.
'@

    $entries += New-AssertionEntry `
        -Name 'ValidateHermeticMetricsByInputOutputPercentage' `
        -WhatItDoes @'
Calculates hermetic behavior in two different ways and compares the results: first from the real input/output counts in the selected communication data, and second from the latest metric values found in a metrics output.

The metrics side uses the built-in hermetic formula `(output + process + combine + filtered) / (input + split) * 100`, with any optional metric names contributing zero when omitted. The assertion passes when the absolute difference between the metrics-based percentage and the count-based percentage stays below `Tolerance`.
'@ `
        -AssertionConfiguration @'
      InputNames:
        - Published
      OutputNames:
        - Delivered
      MetricOutputSourceName: Metrics
      InputMetricName: input_total
      OutputMetricName: output_total
      ProcessMetricName: process_total
      CombineMetricName: combine_total
      FilteredMetricName: filtered_total
      SplitMetricName: split_total
      Tolerance: 0.5
'@ `
        -ConfigExplanation @'
This snippet compares the observed `Published` to `Delivered` ratio with the ratio reported through the latest metric samples stored in the `Metrics` output.

The assertion looks up the latest sample for each configured metric name, computes the metrics hermetic percentage, and accepts the run only when that result stays within 0.5 percentage points of the real input/output percentage.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromCSV' `
        -WhatItDoes @'
Reads rows from one or more CSV files in a local directory and emits one generated item per row.

It can use the file header row, or configured column names when the files are headerless. Empty rows can be skipped, surrounding whitespace can be trimmed, and the generator can stop after a fixed number of rows. When storage metadata is enabled, each generated item keeps track of where it came from in the file set.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: OrdersCsvRows
    Generator: FromCSV
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      Delimiter: ','
      HasHeaderRecord: false
      SkipEmptyRows: true
      TrimWhiteSpace: true
      ColumnNames:
        - orderId
        - total
      FileSystem:
        Path: sample-data/csv
        SearchPattern: '*.csv'
      StorageMetaData: ItemName
'@ `
        -ConfigExplanation @'
This example reads every `*.csv` file under `sample-data/csv`, orders the files alphabetically, treats each line as a two-column record, and emits one generated item per row.

Because `HasHeaderRecord` is `false`, the first and second columns are exposed as `orderId` and `total`. Empty rows are ignored, whitespace is trimmed, and each emitted item keeps the source file name in its storage metadata.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromDataLake' `
        -WhatItDoes @'
Runs a Trino query and emits the returned rows as generated JSON-like objects.

This generator is useful when test data already lives in a lakehouse or analytics system and you want the scenario to read it directly instead of exporting it first. Optional ignored columns let you drop fields that are not relevant for the rest of the flow.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: OrdersFromDataLake
    Generator: FromDataLake
    GeneratorConfiguration:
      TrinoServerUri: http://trino.local:8080
      Catalog: lakehouse
      Query: SELECT order_id, customer_id, debug_flag FROM qaas.orders
      Username: docs
      Password: docs-password
      ClientTag: qaas-docs
      ColumnsToIgnore:
        - debug_flag
'@ `
        -ConfigExplanation @'
This configuration connects to Trino, runs the provided query, and turns each result row into one generated item.

The `debug_flag` column is removed before the items are exposed to the rest of the configuration, so downstream consumers only see `order_id` and `customer_id`.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromDataSources' `
        -WhatItDoes @'
Forwards the generated items produced by the attached data sources and exposes them as a new data source.

It does not transform the payloads. It is mainly a way to cap, regroup, or re-export existing generated data under a new name so the same base source can be reused in multiple places.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: RawPayloads
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/payloads
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: ForwardedPayloads
    Generator: FromDataSources
    DataSourceNames:
      - RawPayloads
    GeneratorConfiguration:
      Count: 2
'@ `
        -ConfigExplanation @'
`RawPayloads` loads every matching file from disk, and `ForwardedPayloads` then re-emits only the first two generated items from that source.

This is useful when you want to reuse an existing data source but limit how many items a particular session or stub should see.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromFileSystem' `
        -WhatItDoes @'
Reads files from a local directory and emits each matched file as one generated item.

It can order the file list deterministically, filter by a UUID-like pattern, stop after a fixed count, and attach storage metadata that identifies the source file or path.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: PayloadFiles
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/payloads
        SearchPattern: '*.json'
      StorageMetaData: ItemName
'@ `
        -ConfigExplanation @'
This example loads every `*.json` file under `sample-data/payloads` and exposes each file as one generated item.

Because the order is `AsciiAsc`, runs see the same file order every time, and `StorageMetaData: ItemName` preserves the file name for downstream logic that needs to know which file produced each payload.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromLettuceDataSources' `
        -WhatItDoes @'
Consumes attached data sources whose bodies are lettuce-style JSON envelopes, base64-decodes the `Body`, and emits the decoded payload as the generated item.

When the lettuce envelope contains a RabbitMQ routing key, that routing key is copied into the generated item metadata so publisher or consumer flows can reuse it naturally.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: LettuceEvents
    Generator: FromFileSystem
    Deserialize:
      Deserializer: Json
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/lettuce
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: DecodedEvents
    Generator: FromLettuceDataSources
    DataSourceNames:
      - LettuceEvents
    GeneratorConfiguration:
      Count: 5
'@ `
        -ConfigExplanation @'
`LettuceEvents` loads JSON envelope files, and `DecodedEvents` converts those envelopes into raw payload bytes.

With this setup, the first five decoded messages become available to the rest of the configuration, and any routing key carried inside each lettuce envelope is preserved in RabbitMQ metadata.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromS3' `
        -WhatItDoes @'
Reads objects from an S3-compatible bucket and emits one generated item per object.

It can walk the bucket directly or load object metadata first, filter keys, skip empty objects, order the results, and attach storage metadata that describes which object was used.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: BucketPayloads
    Generator: FromS3
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      LoadMetadataFirst: true
      StorageMetaData: ItemName
      S3:
        AccessKey: access-key
        SecretKey: secret-key
        ServiceURL: http://minio.local:9000
        StorageBucket: qaas-docs
        Prefix: payloads/
        SkipEmptyObjects: true
        ForcePathStyle: true
'@ `
        -ConfigExplanation @'
This configuration reads objects from the `qaas-docs` bucket under the `payloads/` prefix, skips empty objects, and emits the remaining objects in deterministic ASCII order.

Because metadata is loaded first, the generator can order and filter the object set before it starts retrieving the actual object bodies.
'@

    $entries += New-GeneratorEntry `
        -Name 'FromSessionDataDataSources' `
        -WhatItDoes @'
Loads serialized session data from attached data sources, deserializes it back into session snapshots, and then emits the inputs and outputs named in the configuration.

This generator is useful when you want to replay or mine previously captured sessions. It lets you pull only the communication streams you care about instead of replaying the entire saved session.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: SavedSessionData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/session-data
        SearchPattern: '*.sessionData'
      StorageMetaData: ItemName

  - Name: ExtractedReplayData
    Generator: FromSessionDataDataSources
    DataSourceNames:
      - SavedSessionData
    GeneratorConfiguration:
      - SessionName: CheckoutSession
        CommunicationDataList:
          - Name: Published
            Type: Input
          - Name: Delivered
            Type: Output
'@ `
        -ConfigExplanation @'
`SavedSessionData` points at serialized session snapshots on disk. `ExtractedReplayData` then deserializes those snapshots, looks for the session named `CheckoutSession`, and emits both its `Published` input data and its `Delivered` output data.

That makes the resulting data source useful for replay scenarios, regression checks, or derived generators that need past session traffic as their input.
'@

    $entries += New-GeneratorEntry `
        -Name 'Json' `
        -WhatItDoes @'
Clones a prototype JSON document from an attached JSON data source and applies configured field replacements before emitting the result.

The output can stay as JSON, or it can be parsed into another supported object type. Replacements can inject literal values, pull values from other data sources, or generate time-based values.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: OrderPrototype
    Generator: FromFileSystem
    Deserialize:
      Deserializer: Json
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/json
        SearchPattern: 'order-template.json'
      StorageMetaData: ItemName

  - Name: GeneratedOrders
    Generator: Json
    DataSourceNames:
      - OrderPrototype
    GeneratorConfiguration:
      JsonDataSourceName: OrderPrototype
      Count: 2
      OutputObjectType: Json
      JsonFieldReplacements:
        - Path: $.customerId
          ValueType: String
          String:
            Value: CUST-001
        - Path: $.priority
          ValueType: Boolean
          Boolean:
            Value: true
'@ `
        -ConfigExplanation @'
This setup reads `order-template.json`, clones that JSON twice, and updates two fields in each cloned document before exposing the generated items.

`customerId` is replaced with `CUST-001`, `priority` is set to `true`, and the output remains JSON because `OutputObjectType` is `Json`.
'@

    $entries += New-GeneratorEntry `
        -Name 'JsonSchemaDraft4' `
        -WhatItDoes @'
Generates JSON documents from a Draft 4 JSON schema and then applies the same field-replacement system used by the regular `Json` generator.

This is useful when you want structurally valid random test data but still need certain fields pinned to known values. An optional seed makes the random generation repeatable across runs.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: OrderSchema
    Generator: FromFileSystem
    Deserialize:
      Deserializer: Json
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/json-schema
        SearchPattern: 'order-schema.json'
      StorageMetaData: ItemName

  - Name: GeneratedSchemaOrders
    Generator: JsonSchemaDraft4
    DataSourceNames:
      - OrderSchema
    GeneratorConfiguration:
      JsonDataSourceName: OrderSchema
      Count: 3
      Seed: 42
      JsonFieldReplacements:
        - Path: $.priority
          ValueType: String
          String:
            Value: high
'@ `
        -ConfigExplanation @'
This example reads a Draft 4 schema from `order-schema.json`, generates three schema-valid JSON documents from it, and then forces the `priority` field in each document to `high`.

Because the seed is fixed to `42`, the random parts of the generated payloads stay repeatable between runs.
'@

    $entries += New-GeneratorEntry `
        -Name 'LettuceFromFileSystem' `
        -WhatItDoes @'
Reads lettuce envelope files directly from the local file system, decodes the base64 `Body`, and emits the decoded payload bytes.

If the envelope contains a RabbitMQ routing key, that routing key is copied into the generated item metadata so it can be reused when publishing or asserting later in the flow.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: LettuceFiles
    Generator: LettuceFromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/lettuce
        SearchPattern: '*.json'
      StorageMetaData: ItemName
'@ `
        -ConfigExplanation @'
This configuration scans `sample-data/lettuce` for lettuce envelope files, processes them in deterministic order, and exposes the decoded payload from each file as a generated item.

Any routing key carried by the envelope is preserved in metadata, which makes the generated data ready for RabbitMQ-based flows.
'@

    $entries += New-GeneratorEntry `
        -Name 'Stacking' `
        -WhatItDoes @'
Combines multiple attached data sources by taking a configured number of items from each source in sequence and repeating that pattern until the sources are exhausted or a count limit is reached.

It is useful when you need a predictable mix of payload families rather than consuming one data source completely before moving to the next. It can also keep looping over finished generators when you want a longer mixed stream.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: PriorityPayloads
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/priority
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: StandardPayloads
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/standard
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: MixedPayloads
    Generator: Stacking
    DataSourceNames:
      - PriorityPayloads
      - StandardPayloads
    GeneratorConfiguration:
      Count: 5
      LoopFinishedGenerators: true
      ItemsPerGenerator:
        - 2
        - 1
'@ `
        -ConfigExplanation @'
`MixedPayloads` takes two items from `PriorityPayloads`, then one item from `StandardPayloads`, and repeats that pattern until it has produced five generated items.

Because `LoopFinishedGenerators` is enabled, the stacking process can continue even if one source runs out earlier than the other.
'@

    $entries += New-ProbeEntry `
        -Name 'EmptyRedisByChunks' `
        -WhatItDoes @'
Scans the selected Redis database and deletes matching keys in batches instead of trying to remove everything in one call.

An optional key regex narrows the deletion to a subset of keys, which is useful when only one scenario namespace should be cleaned while the rest of the database stays untouched.
'@ `
        -ProbeConfiguration @'
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          BatchSize: 500
          KeyRegexPattern: '^qaas:'
'@ `
        -ConfigExplanation @'
This probe connects to Redis database `0`, finds keys that start with `qaas:`, and deletes them in batches of up to 500 keys at a time.

That gives you a focused cleanup step for scenario-owned keys without flushing unrelated Redis data.
'@

    $entries += New-ProbeEntry `
        -Name 'ExecuteRedisCommand' `
        -WhatItDoes @'
Runs one Redis command with the configured arguments against the selected Redis database.

This is useful for one-off setup or cleanup operations such as setting flags, creating keys, or issuing simple maintenance commands inside a scenario flow.
'@ `
        -ProbeConfiguration @'
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          Command: SET
          Arguments:
            - qaas:last-template
            - ready
'@ `
        -ConfigExplanation @'
This example runs `SET qaas:last-template ready` against Redis database `0`.

It is a simple probe step that can prepare a key before the rest of the scenario begins.
'@

    $entries += New-ProbeEntry `
        -Name 'ExecuteRedisCommands' `
        -WhatItDoes @'
Runs a configured sequence of Redis commands in order against the selected database.

It is useful when a scenario needs a small Redis setup script, such as creating a key and then seeding a list or hash before the tested system starts consuming from it.
'@ `
        -ProbeConfiguration @'
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          Commands:
            - Command: SET
              Arguments:
                - qaas:mode
                - docs
            - Command: LPUSH
              Arguments:
                - qaas:jobs
                - first-job
'@ `
        -ConfigExplanation @'
This probe first sets `qaas:mode` to `docs`, then pushes `first-job` into the `qaas:jobs` list.

Because the commands are executed in sequence, the Redis state is prepared deterministically before the next scenario step runs.
'@

    $entries += New-ProbeEntry `
        -Name 'FlushAllRedis' `
        -WhatItDoes @'
Runs `FLUSHALL` on the targeted Redis server and removes keys from every database on that server.

This is the broadest Redis cleanup option and is only appropriate when the Redis instance is dedicated to the scenario or test environment.
'@ `
        -ProbeConfiguration @'
          HostNames:
            - localhost:6379
'@ `
        -ConfigExplanation @'
This configuration performs a full Redis server flush against `localhost:6379`.

After the probe runs, all Redis databases on that server are emptied.
'@

    $entries += New-ProbeEntry `
        -Name 'FlushDbRedis' `
        -WhatItDoes @'
Runs `FLUSHDB` on one selected Redis database and removes every key from that database only.

This is safer than `FlushAllRedis` when the Redis server hosts multiple databases and only one of them belongs to the scenario.
'@ `
        -ProbeConfiguration @'
          HostNames:
            - localhost:6379
          RedisDataBase: 5
'@ `
        -ConfigExplanation @'
This probe connects to database `5` on `localhost:6379` and removes all keys from that database.

Other Redis databases on the same server are left untouched.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteS3Bucket' `
        -WhatItDoes @'
Deletes an S3-compatible bucket after first emptying all objects from it.

This is the destructive bucket-level cleanup option and is useful when the scenario creates temporary buckets that should be removed completely at the end of a run.
'@ `
        -ProbeConfiguration @'
          AccessKey: access-key
          SecretKey: secret-key
          ServiceURL: http://minio.local:9000
          StorageBucket: qaas-docs-temp
          ForcePathStyle: true
'@ `
        -ConfigExplanation @'
This probe connects to the S3-compatible service at `http://minio.local:9000`, empties the `qaas-docs-temp` bucket, and then deletes the bucket itself.

It is appropriate for fully disposable test buckets.
'@

    $entries += New-ProbeEntry `
        -Name 'EmptyS3Bucket' `
        -WhatItDoes @'
Deletes objects from an S3-compatible bucket without deleting the bucket itself.

An optional prefix limits the cleanup to one logical folder, which is useful when multiple scenarios share the same bucket but write to different prefixes.
'@ `
        -ProbeConfiguration @'
          AccessKey: access-key
          SecretKey: secret-key
          ServiceURL: http://minio.local:9000
          StorageBucket: qaas-docs
          ForcePathStyle: true
          Prefix: runs/2026-03-28/
'@ `
        -ConfigExplanation @'
This configuration removes every object under the `runs/2026-03-28/` prefix from the `qaas-docs` bucket and keeps the bucket itself intact.

That makes it useful for cleaning one run namespace without affecting the rest of the bucket.
'@

    $entries += New-ProbeEntry `
        -Name 'EmptyElasticIndices' `
        -WhatItDoes @'
Finds Elasticsearch indices that match the configured pattern and deletes documents from them with a delete-by-query operation.

This is useful when you want to clear scenario-generated documents from one family of indices without dropping the indices themselves.
'@ `
        -ProbeConfiguration @'
          Url: http://elastic.local:9200
          Username: elastic
          Password: elastic-password
          IndexPattern: qaas-orders-*
          MatchQueryString: event.dataset:orders
          RequestTimeoutMs: 15000
'@ `
        -ConfigExplanation @'
This probe targets indices whose names match `qaas-orders-*` and removes documents that match the query string `event.dataset:orders`.

The indices stay in place, but the matching documents are cleared out before the next run.
'@

    $entries += New-ProbeEntry `
        -Name 'EmptyMongoDbCollection' `
        -WhatItDoes @'
Deletes documents from one MongoDB collection in chunks until the collection is empty.

This is useful for repeatable cleanup in environments where the collection should stay available but the data written by the previous run should be removed.
'@ `
        -ProbeConfiguration @'
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
          ChunkSize: 1000
'@ `
        -ConfigExplanation @'
This probe connects to the `qaas` database, deletes documents from the `orders` collection in batches of 1000, and repeats until the collection is empty.

The collection itself remains available for the next scenario run.
'@

    $entries += New-ProbeEntry `
        -Name 'MsSqlDataBaseTablesTruncate' `
        -WhatItDoes @'
Truncates the configured SQL Server tables in the order they are listed.

This is useful when a scenario needs a fast relational cleanup step and the target tables are safe to truncate directly.
'@ `
        -ProbeConfiguration @'
          ConnectionString: Server=localhost;Database=qaas;User Id=sa;Password=Pass@word1;TrustServerCertificate=True;
          CommandTimeoutSeconds: 30
          TableNames:
            - dbo.Outbox
            - dbo.Orders
'@ `
        -ConfigExplanation @'
This probe connects to SQL Server, then truncates `dbo.Outbox` and `dbo.Orders` with a 30-second command timeout.

The listed order is preserved, which is helpful when cleanup should happen in a known sequence.
'@

    $entries += New-ProbeEntry `
        -Name 'OracleSqlDataBaseTablesTruncate' `
        -WhatItDoes @'
Truncates the configured Oracle tables in the order they are listed.

It serves the same purpose as the other SQL truncate probes, but uses the Oracle provider and connection details.
'@ `
        -ProbeConfiguration @'
          ConnectionString: User Id=qaas;Password=qaas-password;Data Source=oracle.local:1521/XEPDB1;
          CommandTimeoutSeconds: 30
          TableNames:
            - QAAS_OUTBOX
            - QAAS_ORDERS
'@ `
        -ConfigExplanation @'
This configuration connects to Oracle and truncates `QAAS_OUTBOX` followed by `QAAS_ORDERS`.

It is a database reset step that clears the table contents while keeping the table definitions in place.
'@

    $entries += New-ProbeEntry `
        -Name 'PostgreSqlDataBaseTablesTruncate' `
        -WhatItDoes @'
Truncates the configured PostgreSQL tables in the order they are listed.

This is useful when scenario state is stored in PostgreSQL and a fast table reset is needed between runs.
'@ `
        -ProbeConfiguration @'
          ConnectionString: Host=localhost;Port=5432;Database=qaas;Username=postgres;Password=postgres;
          CommandTimeoutSeconds: 30
          TableNames:
            - public.outbox
            - public.orders
'@ `
        -ConfigExplanation @'
This probe connects to PostgreSQL and truncates `public.outbox` and `public.orders` with a 30-second timeout.

It clears the table data while leaving the schema intact for the next run.
'@

    $entries += New-ProbeEntry `
        -Name 'CreateRabbitMqBindings' `
        -WhatItDoes @'
Creates RabbitMQ bindings through the AMQP connection defined in the probe configuration.

This is useful when the scenario needs to wire exchanges to queues or exchanges before traffic starts flowing.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Bindings:
            - SourceName: orders.exchange
              DestinationName: orders.queue
              BindingType: ExchangeToQueue
              RoutingKey: orders.created
'@ `
        -ConfigExplanation @'
This probe creates one binding from `orders.exchange` to `orders.queue` using the routing key `orders.created`.

After it runs, messages published to the exchange with that routing key can be routed into the queue.
'@

    $entries += New-ProbeEntry `
        -Name 'CreateRabbitMqExchanges' `
        -WhatItDoes @'
Creates RabbitMQ exchanges through the AMQP connection defined in the probe configuration.

It is a setup probe for scenarios that need the messaging topology to exist before publishers or consumers start.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Exchanges:
            - Name: orders.exchange
              Type: Direct
              Durable: true
              AutoDelete: false
'@ `
        -ConfigExplanation @'
This configuration creates a durable direct exchange named `orders.exchange` in the `/` virtual host.

Because `AutoDelete` is `false`, the exchange remains in place until it is deleted explicitly.
'@

    $entries += New-ProbeEntry `
        -Name 'CreateRabbitMqQueues' `
        -WhatItDoes @'
Creates RabbitMQ queues through the AMQP connection defined in the probe configuration.

This is useful for provisioning the queue side of a topology before bindings or message flow start.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Queues:
            - Name: orders.queue
              Durable: true
              Exclusive: false
              AutoDelete: false
'@ `
        -ConfigExplanation @'
This probe creates a durable queue named `orders.queue` in the `/` virtual host.

The queue is shared (`Exclusive: false`) and is not removed automatically when consumers disconnect.
'@

    $entries += New-ProbeEntry `
        -Name 'CreateRabbitMqUsers' `
        -WhatItDoes @'
Creates RabbitMQ users through the management API.

This is useful when a scenario provisions or resets its own RabbitMQ credentials as part of environment setup.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Users:
            - Username: orders-user
              Password: orders-password
              Tags:
                - administrator
'@ `
        -ConfigExplanation @'
This configuration connects to the RabbitMQ management API and creates a user named `orders-user` with the password `orders-password`.

The user is tagged as `administrator`, so it receives the matching management capabilities in RabbitMQ.
'@

    $entries += New-ProbeEntry `
        -Name 'CreateRabbitMqVirtualHosts' `
        -WhatItDoes @'
Creates RabbitMQ virtual hosts through the management API.

This is useful when a scenario wants isolated messaging namespaces that can be provisioned and torn down as part of test setup and cleanup.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHosts:
            - Name: orders-vhost
              Description: Temporary docs virtual host
              DefaultQueueType: quorum
              ProtectedFromDeletion: false
              Tracing: false
'@ `
        -ConfigExplanation @'
This probe creates a virtual host named `orders-vhost` and sets its default queue type to `quorum`.

It gives the scenario a dedicated RabbitMQ namespace for queues, exchanges, and permissions.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteRabbitMqBindings' `
        -WhatItDoes @'
Deletes RabbitMQ bindings through the AMQP connection defined in the probe configuration.

This is the inverse of `CreateRabbitMqBindings` and is useful when a topology should be removed without deleting the queues or exchanges themselves.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Bindings:
            - SourceName: orders.exchange
              DestinationName: orders.queue
              BindingType: ExchangeToQueue
              RoutingKey: orders.created
'@ `
        -ConfigExplanation @'
This probe removes the binding from `orders.exchange` to `orders.queue` for the routing key `orders.created`.

After it runs, that routing path no longer exists even though the queue and exchange can remain in place.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteRabbitMqExchanges' `
        -WhatItDoes @'
Deletes RabbitMQ exchanges through the AMQP connection defined in the probe configuration.

This is useful when an exchange was created for a temporary scenario and should be removed cleanly afterward.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          ExchangeNames:
            - orders.exchange
'@ `
        -ConfigExplanation @'
This configuration deletes the `orders.exchange` exchange from the `/` virtual host.

It is a topology cleanup step that removes the exchange but leaves other RabbitMQ objects untouched.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteRabbitMqPermissions' `
        -WhatItDoes @'
Deletes RabbitMQ user permissions through the management API.

This is useful when scenario-created access rules should be removed while keeping the users or virtual hosts themselves.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Permissions:
            - Username: orders-user
              VirtualHostName: orders-vhost
'@ `
        -ConfigExplanation @'
This probe removes the permissions granted to `orders-user` on the `orders-vhost` virtual host.

The user and virtual host can continue to exist, but the access rule between them is removed.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteRabbitMqQueues' `
        -WhatItDoes @'
Deletes RabbitMQ queues through the AMQP connection defined in the probe configuration.

This is useful for queue cleanup when the queue should be removed entirely instead of just purged.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          QueueNames:
            - orders.queue
'@ `
        -ConfigExplanation @'
This probe deletes the `orders.queue` queue from the `/` virtual host.

Any messages still in the queue are removed along with the queue itself.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteRabbitMqUsers' `
        -WhatItDoes @'
Deletes RabbitMQ users through the management API.

This is useful for cleaning up temporary credentials that were created for a scenario or test environment.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Usernames:
            - orders-user
'@ `
        -ConfigExplanation @'
This configuration removes the RabbitMQ user named `orders-user`.

It is a credential cleanup step for environments that create dedicated users per run or per tenant.
'@

    $entries += New-ProbeEntry `
        -Name 'DeleteRabbitMqVirtualHosts' `
        -WhatItDoes @'
Deletes RabbitMQ virtual hosts through the management API.

This is useful when scenario-specific namespaces should be removed entirely after the run is finished.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostNames:
            - orders-vhost
'@ `
        -ConfigExplanation @'
This probe deletes the `orders-vhost` virtual host through the management API.

It is a full namespace cleanup step for temporary RabbitMQ environments.
'@

    $entries += New-ProbeEntry `
        -Name 'DownloadRabbitMqDefinitions' `
        -WhatItDoes @'
Downloads RabbitMQ definitions through the management API and writes them to a JSON file.

This is useful for snapshotting an existing RabbitMQ topology before a run changes it, or for exporting a topology that should later be restored elsewhere.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostName: orders-vhost
          DefinitionsFilePath: artifacts/rabbitmq/orders-definitions.json
'@ `
        -ConfigExplanation @'
This probe connects to the RabbitMQ management API and saves the definitions for `orders-vhost` into `artifacts/rabbitmq/orders-definitions.json`.

The resulting file can be used as an environment snapshot or as input for a later upload step.
'@

    $entries += New-ProbeEntry `
        -Name 'PurgeRabbitMqQueues' `
        -WhatItDoes @'
Purges all messages from the configured RabbitMQ queues through the AMQP connection, while keeping the queues themselves.

This is useful when the topology should stay in place but leftover messages from a previous run must be removed.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          QueueNames:
            - orders.queue
'@ `
        -ConfigExplanation @'
This configuration purges every message from `orders.queue` without deleting the queue itself.

It is a targeted cleanup step that resets queue contents while preserving the existing topology.
'@

    $entries += New-ProbeEntry `
        -Name 'UploadRabbitMqDefinitions' `
        -WhatItDoes @'
Uploads RabbitMQ definitions through the management API from either an inline JSON payload or a JSON file.

This is useful for restoring a known topology snapshot before the scenario starts.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostName: orders-vhost
          DefinitionsFilePath: artifacts/rabbitmq/orders-definitions.json
'@ `
        -ConfigExplanation @'
This probe reads RabbitMQ definitions from `artifacts/rabbitmq/orders-definitions.json` and uploads them through the management API for the `orders-vhost` environment.

It is a restore step that can recreate a saved topology before the next test run begins.
'@

    $entries += New-ProbeEntry `
        -Name 'UpsertRabbitMqPermissions' `
        -WhatItDoes @'
Creates or updates RabbitMQ user permissions through the management API.

This is useful when a scenario needs to ensure a user has the expected configure, write, and read access patterns on one virtual host.
'@ `
        -ProbeConfiguration @'
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Permissions:
            - Username: orders-user
              VirtualHostName: orders-vhost
              Configure: '^orders\..*'
              Write: '^orders\..*'
              Read: '^orders\..*'
'@ `
        -ConfigExplanation @'
This configuration grants `orders-user` matching configure, write, and read permissions on the `orders-vhost` virtual host for names that start with `orders.`.

If the permission rule already exists, it is updated in place; otherwise it is created.
'@

    $entries += New-ProbeEntry `
        -Name 'OsChangeDeploymentEnvVars' `
        -WhatItDoes @'
Updates or removes environment variables on a deployment and then waits for the deployment to converge to its desired state.

This is useful when a scenario needs to switch feature flags, endpoint URLs, or other container environment settings before traffic starts.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-api
          ContainerName: api
          EnvVarsToUpdate:
            FEATURE_FLAG_X: enabled
            DOWNSTREAM_BASE_URL: http://mocker:8080
          EnvVarsToRemove:
            - LEGACY_MODE
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This probe updates the `api` container in the `orders-api` deployment so that `FEATURE_FLAG_X` and `DOWNSTREAM_BASE_URL` are set, while `LEGACY_MODE` is removed.

After patching the deployment, it waits until the workload reaches the desired state again before the scenario continues.
'@

    $entries += New-ProbeEntry `
        -Name 'OsChangeStatefulSetEnvVars' `
        -WhatItDoes @'
Updates or removes environment variables on a stateful set and then waits for the workload to converge.

This is useful for stateful components such as brokers or databases that need a controlled configuration change before the scenario runs.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-worker
          ContainerName: worker
          EnvVarsToUpdate:
            FEATURE_FLAG_X: enabled
            PROCESSING_MODE: replay
          EnvVarsToRemove:
            - LEGACY_MODE
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This configuration updates the `worker` container in the `orders-worker` stateful set, adds two environment variables, removes `LEGACY_MODE`, and then waits for the stateful set rollout to settle.

It is the stateful-set equivalent of the deployment environment-variable probe.
'@

    $entries += New-ProbeEntry `
        -Name 'OsEditYamlConfigMap' `
        -WhatItDoes @'
Loads a YAML document from a config map, edits the configured paths, and writes the updated document back to the config map.

This is useful when an application reads structured configuration from a config map and only a few settings need to change for a particular scenario.
'@ `
        -ProbeConfiguration @'
          ConfigMapName: orders-config
          ConfigMapYamlFileName: application.yaml
          ValuesToEdit:
            service.retries: 5
            logging.level.default: Warning
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This probe opens `application.yaml` inside the `orders-config` config map, changes `service.retries` to `5`, and changes `logging.level.default` to `Warning`.

It is a targeted way to adjust structured YAML configuration without replacing the whole config map by hand.
'@

    $entries += New-ProbeEntry `
        -Name 'OsExecuteCommandsInContainers' `
        -WhatItDoes @'
Finds pods by label selection and executes the configured commands inside the matching containers.

This is useful for ad hoc maintenance steps such as inspecting environment state, clearing temporary files, or triggering in-container admin commands before or after a scenario.
'@ `
        -ProbeConfiguration @'
          ContainerName: api
          ApplicationLabels:
            - app=orders-api
          Commands:
            - printenv
            - ls /tmp
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This probe finds pods labeled `app=orders-api`, enters the `api` container in each matching pod, and runs `printenv` followed by `ls /tmp`.

It is useful for inspection or lightweight maintenance commands inside the running workload.
'@

    $entries += New-ProbeEntry `
        -Name 'OsRestartPods' `
        -WhatItDoes @'
Deletes pods that match the configured labels and waits until the platform brings the workload back to its desired ready state.

This is useful when a scenario needs a clean restart of an application after changing config maps, secrets, or environment settings.
'@ `
        -ProbeConfiguration @'
          ApplicationLabels:
            - app=orders-api
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This probe deletes the pods labeled `app=orders-api` and waits until the replacement pods are ready again.

It gives the scenario a controlled application restart without manually deleting pods outside the flow.
'@

    $entries += New-ProbeEntry `
        -Name 'OsScaleDeploymentPods' `
        -WhatItDoes @'
Scales a deployment to the configured replica count and waits until the desired state is reached.

This is useful when a scenario needs to increase or decrease deployment capacity as part of the setup.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-api
          DesiredNumberOfPods: 3
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This probe scales the `orders-api` deployment to three pods and waits until the deployment reports that desired state.

It is a controlled capacity-management step inside the scenario flow.
'@

    $entries += New-ProbeEntry `
        -Name 'OsScaleStatefulSetPods' `
        -WhatItDoes @'
Scales a stateful set to the configured replica count and waits until the stateful workload converges.

This is useful when a scenario needs to grow or shrink a stateful component before traffic starts.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-worker
          DesiredNumberOfPods: 2
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This configuration scales the `orders-worker` stateful set to two pods and waits until the rollout is ready.

It is the stateful-set equivalent of the deployment scale probe.
'@

    $entries += New-ProbeEntry `
        -Name 'OsUpdateDeploymentImage' `
        -WhatItDoes @'
Updates the container image used by a deployment and waits until the deployment rollout reaches the desired state.

This is useful when a scenario needs to switch a deployment to a prebuilt image version as part of setup.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-api
          ContainerName: api
          DesiredImage: registry.local/orders-api:2.1.0
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This probe changes the `api` container in the `orders-api` deployment to use `registry.local/orders-api:2.1.0`.

After patching the deployment, it waits for the rollout to finish before the scenario proceeds.
'@

    $entries += New-ProbeEntry `
        -Name 'OsUpdateDeploymentResources' `
        -WhatItDoes @'
Updates CPU and memory requests and limits on a deployment container, then waits for the deployment to converge.

This is useful when a scenario needs a temporary resource profile, for example to test scaling thresholds or resource-constrained behavior.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-api
          ContainerName: api
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
          DesiredResources:
            Limits:
              Cpu: 1000m
              Memory: 1Gi
            Requests:
              Cpu: 250m
              Memory: 256Mi
'@ `
        -ConfigExplanation @'
This probe updates the `api` container in the `orders-api` deployment so that it requests `250m` CPU and `256Mi` memory, with limits of `1000m` CPU and `1Gi` memory.

The deployment is then allowed to roll out and settle before the scenario continues.
'@

    $entries += New-ProbeEntry `
        -Name 'OsUpdateStatefulSetImage' `
        -WhatItDoes @'
Updates the container image used by a stateful set and waits for the stateful rollout to converge.

This is useful when a scenario needs a stateful component to run from a different prebuilt image version.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-worker
          ContainerName: worker
          DesiredImage: registry.local/orders-worker:2.1.0
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
'@ `
        -ConfigExplanation @'
This configuration changes the `worker` container in the `orders-worker` stateful set to use `registry.local/orders-worker:2.1.0`.

The probe waits for the stateful set rollout to complete before the rest of the scenario runs.
'@

    $entries += New-ProbeEntry `
        -Name 'OsUpdateStatefulSetResources' `
        -WhatItDoes @'
Updates CPU and memory requests and limits on a stateful set container, then waits for the stateful rollout to converge.

This is useful when a scenario needs to change the resource profile of a stateful component without rebuilding or redeploying the whole environment manually.
'@ `
        -ProbeConfiguration @'
          ReplicaSetName: orders-worker
          ContainerName: worker
          IntervalBetweenDesiredStateChecksMs: 1000
          TimeoutWaitForDesiredStateSeconds: 300
          Openshift:
            Cluster: https://api.cluster.local:6443
            Namespace: docs
            Username: docs-user
            Password: docs-password
          DesiredResources:
            Limits:
              Cpu: 1500m
              Memory: 2Gi
            Requests:
              Cpu: 500m
              Memory: 512Mi
'@ `
        -ConfigExplanation @'
This probe updates the `worker` container in the `orders-worker` stateful set so that it requests `500m` CPU and `512Mi` memory, with limits of `1500m` CPU and `2Gi` memory.

After the patch is applied, the probe waits for the stateful set to finish rolling out.
'@

    $entries += New-ProcessorEntry `
        -Name 'ConditionalResponseProcessor' `
        -WhatItDoes @'
Evaluates the configured rules in order and returns the response from the first rule whose request-header or path-parameter condition matches the incoming request.

If no rule matches, it falls back to the configured default response. This makes it useful for lightweight branching behavior without writing custom processor code.
'@ `
        -ProcessorConfiguration @'
      DefaultContentType: text/plain; charset=utf-8
      DefaultStatusCode: 404
      DefaultBody: route not found
      Rules:
        - RequestHeaderName: X-Mode
          ExpectedValue: advanced
          ContentType: text/plain; charset=utf-8
          StatusCode: 202
          ResponseBody: advanced mode enabled
'@ `
        -ConfigExplanation @'
This stub checks the incoming `X-Mode` request header first. If the header value is `advanced`, it returns `202` and the text body `advanced mode enabled`.

If the header is missing or has a different value, the rule does not match and the processor falls back to the default `404` response with the body `route not found`.
'@

    $entries += New-ProcessorEntry `
        -Name 'DataSourceResponseProcessor' `
        -WhatItDoes @'
Selects a generated item from an attached data source and returns that item as the HTTP response body.

It can choose the first item, the last item, or a zero-based index. When no item can be selected, it can return a fallback body instead of throwing. This is useful when responses should come from prepared files or generated fixtures.
'@ `
        -DataSourcesBlock @'
DataSources:
  - Name: PreparedResponses
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/responses
        SearchPattern: '*.json'
      StorageMetaData: ItemName
'@ `
        -DataSourceNames @('PreparedResponses') `
        -ProcessorConfiguration @'
      DataSourceName: PreparedResponses
      SelectionMode: First
      StatusCode: 202
      ContentType: application/json
'@ `
        -ConfigExplanation @'
This configuration attaches the `PreparedResponses` data source to the stub and tells the processor to return the first generated response body from that source.

The body is returned as an HTTP `202` response with `application/json`.
'@

    $entries += New-ProcessorEntry `
        -Name 'JsonEnvelopeProcessor' `
        -WhatItDoes @'
Wraps the incoming request into a JSON object under a configurable body-property name and can optionally add request metadata such as headers, path parameters, URI, and the original body type.

This is useful when a downstream system expects a structured JSON envelope but the incoming request may be raw text, bytes, or another object type.
'@ `
        -ProcessorConfiguration @'
      BodyPropertyName: request
      ContentType: application/json
      StatusCode: 200
      IncludeBodyType: true
      IncludePathParameters: true
      IncludeRequestHeaders: true
      IncludeUri: true
'@ `
        -ConfigExplanation @'
This stub returns a JSON document that places the incoming request body under the `request` property and also includes the request URI, headers, path parameters, and original body-type information.

The response comes back as HTTP `200` with `application/json`.
'@

    $entries += New-ProcessorEntry `
        -Name 'PassThroughProcessor' `
        -WhatItDoes @'
Returns the incoming request body unchanged and optionally preserves the request metadata from the original data item.

It is the simplest processor for echoing raw request content back to the caller while still letting you control response status, content type, and extra headers.
'@ `
        -ProcessorConfiguration @'
      StatusCode: 202
      ContentType: application/octet-stream
      PreserveMetaData: true
'@ `
        -ConfigExplanation @'
This configuration returns the request body exactly as it arrived and marks the response as `202`.

Because `PreserveMetaData` is enabled, request metadata already attached to the incoming item is preserved instead of being discarded.
'@

    $entries += New-ProcessorEntry `
        -Name 'ProblemDetailsProcessor' `
        -WhatItDoes @'
Builds a problem-details style JSON response with a title, type, detail, instance, status code, and optional extension fields.

It is useful for returning standardized error payloads without custom code, especially when you want failures to look like HTTP API validation or domain errors.
'@ `
        -ProcessorConfiguration @'
      ContentType: application/problem+json
      StatusCode: 422
      Title: Validation failed
      Type: https://docs.example.com/problems/validation
      Detail: orderId is required
      UseRequestUriAsInstance: true
'@ `
        -ConfigExplanation @'
This example returns an RFC 7807-style response describing a validation error. The processor sets the problem type, title, detail, and status code.

Because `UseRequestUriAsInstance` is enabled, the request URI is copied into the problem `instance` field automatically.
'@

    $entries += New-ProcessorEntry `
        -Name 'RequestEchoProcessor' `
        -WhatItDoes @'
Returns a JSON echo of the incoming request body and can optionally include the request URI, headers, and path parameters.

For byte-array request bodies it also includes base64, text, and length information so binary payloads can still be inspected easily.
'@ `
        -ProcessorConfiguration @'
      ContentType: application/json
      StatusCode: 200
      IncludePathParameters: true
      IncludeRequestHeaders: true
      IncludeUri: true
'@ `
        -ConfigExplanation @'
This stub responds with a JSON document that mirrors the incoming request body and includes the request URI, path parameters, and request headers.

It returns HTTP `200` as a diagnostic echo response.
'@

    $entries += New-ProcessorEntry `
        -Name 'StaticResponseProcessor' `
        -WhatItDoes @'
Returns a fixed UTF-8 response body together with the configured HTTP status code, content type, and headers.

This is the simplest processor for serving a known canned response from a stubbed endpoint.
'@ `
        -ProcessorConfiguration @'
      Body: stub is healthy
      StatusCode: 200
      ContentType: text/plain; charset=utf-8
'@ `
        -ConfigExplanation @'
This configuration makes the endpoint always return the text `stub is healthy` as a UTF-8 body.

The response status is `200` and the content type is `text/plain; charset=utf-8`.
'@

    $entries += New-ProcessorEntry `
        -Name 'StatusCodeTransactionProcessor' `
        -WhatItDoes @'
Returns an HTTP response whose main purpose is the configured status code and does not require a response body.

This is useful for endpoints such as health checks, accepted commands, or no-content acknowledgements where only the status code matters.
'@ `
        -ProcessorConfiguration @'
      StatusCode: 204
'@ `
        -ConfigExplanation @'
This stub returns an HTTP `204` response and does not need to construct a response body.

It is a minimal way to model endpoints that acknowledge the request successfully but intentionally return no content.
'@

    $entries += New-ProcessorEntry `
        -Name 'TextTransformProcessor' `
        -WhatItDoes @'
Reads the incoming request body as text, optionally trims it, replaces matched text, and then adds a prefix and suffix before returning the transformed result.

If the original body is not already text, the processor serializes it first. This makes it useful for lightweight normalization, templating, or diagnostics without writing custom code.
'@ `
        -ProcessorConfiguration @'
      ContentType: text/plain; charset=utf-8
      StatusCode: 202
      Prefix: '['
      SearchText: hello
      ReplacementText: hi
      Suffix: ']'
      TrimWhitespace: true
'@ `
        -ConfigExplanation @'
This example trims the incoming body, replaces `hello` with `hi`, then wraps the result in square brackets.

For an input like `  hello world  `, the response body becomes `[hi world]`. The response is returned as HTTP `202`.
'@

    return $entries
}
