# OutputDeserializableTo

> TL;DR — Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer

## When to use

Takes every item from one output, treats the body as serialized bytes, and tries to deserialize each item with the configured deserializer.

The assertion passes only when every item can be deserialized successfully. It records the index and exception for each failure in the trace, which makes it useful as a fast safety check that a response stream really matches the serialization format you expect.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

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

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/OutputDeserializableTo/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/OutputDeserializableTo/configuration/yamlView/index.md)
- [Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md)
