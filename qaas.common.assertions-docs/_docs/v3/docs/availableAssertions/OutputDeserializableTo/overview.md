# OutputDeserializableTo

Checks that all items in a configured output can be deserialized with a configured deserializer.

All supported deserializer's documentation and names that can be used in this assertion can be found at [QaaS.Framework.Serialization](REDA/serialization/).

## Assertion Parameters

* **Assertion Name** - `OutputDeserializableTo`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* All items in output `OutputName` are deserializable with deserializer in `Deserialize`.

### Failed

* Any item in output `OutputName` is not deserializable with deserializer in `Deserialize`.

### Broken

* Any item in output `OutputName` has a `null` `Body`.
* The output `OutputName` does not exist within the given session.
* The output `OutputName` exists more than once within the given session.
* More than 1 session was passed to the assertion.
