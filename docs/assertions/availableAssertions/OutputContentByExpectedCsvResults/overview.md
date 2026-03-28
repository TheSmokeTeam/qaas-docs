# OutputContentByExpectedCsvResults

Checks that the configured output content matches the expected values loaded from a CSV results file.

## What It Does

Loads expected results from a CSV data source, converts each output item to JSON, and validates configured fields by mapping CSV columns to JSON paths.

Field validation is per mapped column and can use exact matching, numeric error ranges, override values, or base64-to-hex conversion. The assertion can compare rows by position or, when `CompareRowsNotInOrder` is enabled, match rows in any order while still ensuring each expected row is satisfied only once.

## YAML Example

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

## What This Configuration Does

This example reads expected rows from `ExpectedResultsCsv`, compares them with the JSON bodies stored in the `Reply` output, and validates two fields.

`ORDER_ID` must match exactly, while `TOTAL` can differ by up to 0.1. Because `CompareRowsNotInOrder` is enabled, the assertion can match the observed output rows to the expected CSV rows in any order instead of forcing row 1 to match row 1.
