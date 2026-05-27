---
id: assertions.available.outputcontentbyexpectedcsvresults.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, OutputContentByExpectedCsvResults, AssertionConfiguration]
summary: "Checks that the configured output content matches the expected values loaded from a CSV results file."
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\ContentLogic\OutputContentByExpectedCsvResults.cs -->

# OutputContentByExpectedCsvResults

> TL;DR — Checks that the configured output content matches the expected values loaded from a CSV results file.

## When to use {: #when-to-use}

Loads expected results from a CSV data source, converts each output item to JSON, and validates configured fields by mapping CSV columns to JSON paths.

Field validation is per mapped column and can use exact matching, numeric error ranges, override values, or base64-to-hex conversion. The assertion can compare rows by position or, when `CompareRowsNotInOrder` is enabled, match rows in any order while still ensuring each expected row is satisfied only once.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
DataSources:
  - Name: ExpectedResultsCsv
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: expectations
        SearchPattern: '*.csv'
      StorageMetaData: ItemName

Sessions:
  - Name: SampleSession

Assertions:
  - Name: OutputContentByExpectedCsvResultsAssertion
    Assertion: OutputContentByExpectedCsvResults
    SessionNames:
      - SampleSession
    DataSourceNames:
      - ExpectedResultsCsv
    AssertionConfiguration:
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
```

## Realistic example {: #realistic-example}

This example reads expected rows from `ExpectedResultsCsv`, compares them with the JSON bodies stored in the `Reply` output, and validates two fields.

`ORDER_ID` must match exactly, while `TOTAL` can differ by up to 0.1. Because `CompareRowsNotInOrder` is enabled, the assertion can match the observed output rows to the expected CSV rows in any order instead of forcing row 1 to match row 1.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Assertions](../../index.md)
