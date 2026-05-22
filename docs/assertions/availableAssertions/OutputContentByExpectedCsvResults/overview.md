---
id: assertions.available.outputcontentbyexpectedcsvresults.overview
slug: outputcontentbyexpectedcsvresults
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, OutputContentByExpectedCsvResults, AssertionConfiguration]
ai_summary: "Checks that the configured output content matches the expected values loaded from a CSV results file."
tags: [assertions]
canonical_url: /assertions/availableAssertions/OutputContentByExpectedCsvResults/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\ContentLogic\OutputContentByExpectedCsvResults.cs
---

# OutputContentByExpectedCsvResults

Checks that the configured output content matches the expected values loaded from a CSV results file.

## What it does

Checks that the configured output content matches the expected values loaded from a CSV results file. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OutputContentByExpectedCsvResultsSession
    Assertions:
      - Name: OutputContentByExpectedCsvResultsStep
        Assertion: OutputContentByExpectedCsvResults
        AssertionConfiguration:
        OutputName:
        ResultsMetaDataStorageKey:
        DataSourceName:
        ColumnNameToFieldPathMap:
        JsonConverterType:
        CompareRowsNotInOrder:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `OutputContentByExpectedCsvResults` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\ContentLogic\OutputContentByExpectedCsvResults.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
