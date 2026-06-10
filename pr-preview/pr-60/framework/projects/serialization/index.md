# QaaS.Framework.Serialization

> TL;DR — QaaS.Framework.Serialization provides shared serializers and deserializers used by Framework and SDK packages.

`QaaS.Framework.Serialization` is the Framework solution's serializer and deserializer package. It is a standalone package that other QaaS packages reference, including [QaaS.Framework.SDK](https://TheSmokeTeam.github.io/qaas-docs/framework/projects/sdk/index.md). The package contains the configuration objects that choose a format, the factories that create the right runtime implementation, and the concrete serializers and deserializers for each supported format.

## What this project contains

### Format selection and configuration

The package exposes four central configuration types:

- `SerializationType.cs`
- `SerializeConfig.cs`
- `DeserializeConfig.cs`
- `SpecificTypeConfig.cs`

`SerializationType` is the format enum used across the package. `SerializeConfig` and `DeserializeConfig` describe how a caller wants serialization or deserialization to happen. `SpecificTypeConfig` stores the type metadata needed when deserialization must reconstruct a specific runtime type.

### Factory layer

The runtime dispatch layer is implemented in:

- `SerializerFactory.cs`
- `DeserializerFactory.cs`

These factories translate the selected `SerializationType` into a concrete serializer or deserializer implementation.

### Convenience layer

On top of the factories the package exposes a purely additive convenience surface:

- `QaasSerializer.cs` — a static facade with one-liner `Serialize`, `SerializeToString`, `Deserialize<T>`, `DeserializeFromString<T>` calls plus non-throwing `TrySerialize`/`TryDeserialize<T>`/`TryDeserializeFromString<T>` variants. A `null` serialization type keeps the framework's byte-array pass-through semantics.
- `SerializationTypeExtensions.cs` — `SerializationType.Json.BuildSerializer()` / `.BuildDeserializer()` fluent builders with non-null returns.
- `SerializationExtensions.cs` — instance extension methods on `ISerializer`/`IDeserializer` (`Deserialize<T>`, `DeserializeFromString<T>`, `SerializeToString`, `TrySerialize`, `TryDeserialize<T>`).
- `QaasSerializationException.cs` — the dedicated exception type all facade and extension failures are wrapped in; messages name the operation, the target type, and the serialization format.

See [Casting & Serializing Data](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/casting-and-serialization/index.md) for a usage-first walkthrough.

The pre-existing factory + `Deserialize(bytes, type)` surface is unchanged; the convenience layer is built on top of it.

### Concrete serializers

The `Serializers` folder currently contains:

- `Binary.cs`
- `Json.cs`
- `MessagePack.cs`
- `Xml.cs`
- `XmlElement.cs`
- `Yaml.cs`
- `ProtobufMessage.cs`

### Concrete deserializers

The `Deserializers` folder contains the matching format implementations:

- `Binary.cs`
- `Json.cs`
- `MessagePack.cs`
- `Xml.cs`
- `XmlElement.cs`
- `Yaml.cs`
- `ProtobufMessage.cs`

## Supported formats

The current package supports these serialization formats:

- `Binary`
- `Json`
- `MessagePack`
- `Xml`
- `XmlElement`
- `Yaml`
- `ProtobufMessage`

The current enum and implementation name is `ProtobufMessage`, not `Protobuf`.

## Current behavior

The current implementation includes several format-specific behaviors that are worth calling out:

- both factories validate the requested enum value and throw for unsupported values
- `SpecificTypeConfig` resolves a runtime type from assembly and type-name metadata
- `SpecificTypeConfig` can backfill the assembly name from the entry assembly when the configuration omits it
- binary deserialization is guarded by an allowlist binder instead of blindly accepting any runtime type
- binary deserialization requires a target type
- protobuf-message deserialization also requires an explicit target type
- several deserializers return `null` for `null` payloads instead of throwing
- YAML deserialization contains a special case for empty payloads when the requested type is `string`
- the convenience layer (`QaasSerializer` and the serializer/deserializer extension methods) wraps every failure in an indicative `QaasSerializationException` and offers non-throwing `Try…` variants

This package is used heavily by the SDK for session and communication serialization, but it remains a separate package because the serialization layer is intentionally reusable outside of the SDK's higher-level object surface.

## Main source areas

The most important files and folders are:

- `SerializationType.cs`
- `SerializeConfig.cs`
- `DeserializeConfig.cs`
- `SpecificTypeConfig.cs`
- `SerializerFactory.cs`
- `DeserializerFactory.cs`
- `QaasSerializer.cs`
- `SerializationExtensions.cs`
- `SerializationTypeExtensions.cs`
- `QaasSerializationException.cs`
- `Serializers/`
- `Deserializers/`

## Companion tests

`QaaS.Framework.Serialization.Tests` is the sibling test project for this package.

The current tests cover:

- factory dispatch for every supported format
- round-trip serialization for Binary, Json, MessagePack, Xml, XmlElement, Yaml, and ProtobufMessage
- `SpecificTypeConfig` runtime-type resolution
- invalid enum handling
- type requirements for Binary and ProtobufMessage deserialization
- rejection of unexpected runtime types during binary deserialization
- null and empty payload behavior
- the `QaasSerializer` facade round trips, pass-through semantics, and indicative error wrapping
- the serializer/deserializer extension methods and `Try…` variants for every supported format

Representative test files include:

- `SerializationBehaviorTests.cs`
- `SerializationEdgeCaseTests.cs`
- `SerializationConvenienceTests.cs`

## See also

- [Framework](https://TheSmokeTeam.github.io/qaas-docs/framework/index.md)
