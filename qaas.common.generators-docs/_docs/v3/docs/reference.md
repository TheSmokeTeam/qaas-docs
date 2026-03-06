# Generators Reference

## External Source Generators

- `FromFileSystemConfig`
  - `FileSystem`
- `LettuceFromFileSystemConfig`
  - filesystem-based lettuce payload loading
- `FromS3Config`
  - `LoadMetadataFirst`
  - `S3`
- `BaseExternalSourceBasedGeneratorConfig`
  - `DataArrangeOrder`
  - `Count`
  - `DataUuidRegexExpression`
  - `StorageMetaData`
- `FileSystemConfig`
  - `Path`
  - `SearchPattern`
- `S3Config`
  - `Delimiter`
  - `Prefix`
  - `SkipEmptyObjects`

## Data-Source Composition Generators

- `FromDataSourceBasedConfiguration`
  - base configuration for generator chains
- `FromLettuceDataSourcesConfiguration`
  - lettuce-oriented data-source composition
- `FromSessionDataDataSourcesConfiguration`
  - `SessionName`
  - `CommunicationDataList`
- `CommunicationDataName`
  - `Type`
  - `Name`
- `StackingConfiguration`
  - `Count`
  - `ItemsPerGenerator`
  - `LoopFinishedGenerators`

## Structured Payload Generators

- `JsonConfiguration`
  - `Count`
  - `JsonFieldReplacements`
  - `OutputObjectType`
  - `OutputObjectTypeConfiguration`
  - `JsonDataSourceName`
- `JsonFieldReplacement`
  - `Path`
  - `ValueType`
  - `FromDataSource`
  - `DateTime`
  - `UnixEpochTime`
  - `String`
  - `Integer`
  - `Double`
  - `Boolean`
  - `ByteArray`
- `JsonSchemaConfiguration`
  - `Seed`
- `FromDataSource`
  - `Name`
  - `OutOfRangePolicy`
- `UnixEpochTime`
  - `UnixEpochScaleType`
  - `UnixEpochObjectType`
- `DateTime`
  - `TimeZone`
  - `Format`

## Remote Query Generator

- `FromDataLakeConfiguration`
  - `TrinoServerUri`
  - `Username`
  - `Password`
  - `ClientTag`
  - `Catalog`
  - `Query`
  - `ColumnsToIgnore`
