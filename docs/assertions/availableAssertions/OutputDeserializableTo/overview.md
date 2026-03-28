# OutputDeserializableTo

Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer

> Logical group: Contract validation / Deserialization validation

> Logical group: Contract validation / Deserialization validation

## What It Does

Takes every item from one output, treats the body as serialized bytes, and tries to deserialize each item with the configured deserializer.

The assertion passes only when every item can be deserialized successfully. It records the index and exception for each failure in the trace, which makes it useful as a fast safety check that a response stream really matches the serialization format you expect.

## YAML Example

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

## What This Configuration Does

This configuration checks the `Reply` output of `SampleSession` and attempts to deserialize every saved body with the JSON deserializer.

If every item is valid JSON bytes, the assertion passes. If any item is malformed, the assertion fails and the trace shows which item index could not be deserialized.
