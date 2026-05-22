---
id: assertions.available.httpstatus.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/HttpStatus/overview.md]
code_langs: [yaml]
keywords: [assertions, HttpStatus, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for HttpStatus AssertionConfiguration — copy, fill the blanks, drop into a Session step."
tags: [assertions]
canonical_url: /assertions/availableAssertions/HttpStatus/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# HttpStatus — Configuration (YAML scaffold)

Drop this into the `AssertionConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
AssertionConfiguration:
  StatusCode:
  OutputNames: []
```
