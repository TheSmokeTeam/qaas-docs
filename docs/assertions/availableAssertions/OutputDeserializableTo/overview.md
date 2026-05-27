---
id: assertions.available.outputdeserializableto.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, OutputDeserializableTo, AssertionConfiguration]
summary: "Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer"
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\DeserializationLogic\OutputDeserializableTo.cs -->

# OutputDeserializableTo

> TL;DR: Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer

Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer

## What It Does

Takes every item from one output, treats the body as serialized bytes, and tries to deserialize each item with the configured deserializer.

The assertion passes only when every item can be deserialized successfully. It records the index and exception for each failure in the trace, which makes it useful as a fast safety check that a response stream really matches the serialization format you expect.

## Minimal example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: OutputDeserializableToAssertion
    Assertion: OutputDeserializableTo
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      OutputName: Reply
      Deserialize:
        Deserializer: Json
```

## Realistic example

This configuration checks the `Reply` output of `SampleSession` and attempts to deserialize every saved body with the JSON deserializer.

If every item is valid JSON bytes, the assertion passes. If any item is malformed, the assertion fails and the trace shows which item index could not be deserialized.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
