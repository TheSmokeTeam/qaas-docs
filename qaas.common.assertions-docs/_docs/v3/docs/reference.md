# Assertions Reference

## Hermetic Assertions

- `HermeticByExpectedOutputCountConfiguration`
  - `OutputNames`
  - `ExpectedCount`
- `HermeticByExpectedOutputCountInRangeConfiguration`
  - `OutputNames`
  - `ExpectedMinimumCount`
  - `ExpectedMaximumCount`
- `HermeticByInputOutputPercentageConfiguration`
  - `OutputNames`
  - `InputNames`
  - `ExpectedPercentage`
  - `InputsAreOutputs`
  - `MidpointRounding`
- `HermeticByInputOutputPercentageInRangeConfiguration`
  - `OutputNames`
  - `InputNames`
  - `ExpectedMinimumPercentage`
  - `ExpectedMaximumPercentage`
  - `InputsAreOutputs`
  - `MidpointRounding`
- `ValidateHermeticMetricsByInputOutputPercentageConfig`
  - `OutputNames`
  - `InputNames`
  - `MetricOutputSourceName`
  - `Tolerance`
  - `InputMetricName`
  - `OutputMetricName`
  - `ProcessMetricName`
  - `CombineMetricName`
  - `FilteredMetricName`
  - `SplitMetricName`

## Delay Assertions

- `DelayByAverageConfiguration`
  - `OutputName`
  - `InputName`
  - `MaximumDelayMs`
  - `MaximumNegativeDelayBufferMs`
- `DelayByChunksConfiguration`
  - `Output`
  - `Input`
  - `MaximumDelayMs`
  - `MaximumNegativeDelayBufferMs`
- `Chunk`
  - `Name`
  - `ChunkSize`
  - `ChunkTimeOption`

## Content, Schema, and Metadata Assertions

- `OutputContentByExpectedResultsAsCsvConfiguration`
  - CSV-backed configuration payload for `OutputContentByExpectedCsvResults`
- `OutputContentByExpectedResultsConfiguration`
  - `OutputName`
  - `ResultsMetaDataStorageKey`
  - `DataSourceName`
  - `ColumnNameToFieldPathMap`
  - `JsonConverterType`
  - `Path`
  - `FieldValidationConfig`
  - `Type`
  - `ExactValue`
  - `ErrorRange`
  - `ExactOverrideValue`
  - `Base64ToHex`
- `ObjectOutputJsonSchemaConfiguration`
  - `OutputName`
- `OutputDeserializableToConfiguration`
  - `OutputName`
  - `Deserialize`
- `HttpStatusConfiguration`
  - `StatusCode`
  - `OutputNames`

## Validator Building Blocks

- `ExactValueFieldValidatorConfig`
- `ErrorRangeFieldValidatorConfig`
- `ExactOverrideValueFieldValidatorConfig`
- `Base64ToHexFieldValidationConfig`
