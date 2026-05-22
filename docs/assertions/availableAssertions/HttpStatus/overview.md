---
id: assertions.available.httpstatus.overview
slug: httpstatus
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, HttpStatus, AssertionConfiguration]
ai_summary: "Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code"
tags: [assertions]
canonical_url: /assertions/availableAssertions/HttpStatus/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\HttpMetaDataLogic\HttpStatus.cs
---

# HttpStatus

Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code

## What it does

Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: HttpStatusSession
    Assertions:
      - Name: HttpStatusStep
        Assertion: HttpStatus
        AssertionConfiguration:
        StatusCode:
        OutputNames: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `HttpStatus` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\HttpMetaDataLogic\HttpStatus.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
