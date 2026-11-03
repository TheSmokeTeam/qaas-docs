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

### Factory usage

```csharp
using QaaS.Framework.Serialization;

var serializer = SerializerFactory.BuildSerializer(SerializationType.Json)!;
var deserializer = DeserializerFactory.BuildDeserializer(SerializationType.Json)!;
byte[]? payload = serializer.Serialize(order);
Order? restored = (Order?)deserializer.Deserialize(payload, typeof(Order));
```

`order` and `Order` are application-defined. `ISerializer.Serialize(object?)` returns `byte[]?`, and `IDeserializer.Deserialize(byte[]?, Type?)` returns `object?`. Both factories return `null` for a null format, so callers must handle the no-conversion case explicitly.

The convenience facade and serializer extension methods were reverted in [Framework PR #48](https://github.com/TheSmokeTeam/QaaS.Framework/pull/48). Use the factories above; see [Casting & Serializing Data](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/casting-and-serialization/index.md) for runtime casts and explicit payload conversion.

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

- both factories return `null` for a null format and throw `ArgumentOutOfRangeException` for unsupported enum values
- `SpecificTypeConfig` resolves a runtime type from assembly and type-name metadata
- `SpecificTypeConfig` can backfill the assembly name from the entry assembly when the configuration omits it
- binary deserialization uses `BinaryFormatter`, ignores the requested target type, and reconstructs the payload's stored runtime type
- protobuf-message deserialization also requires an explicit target type
- XML deserialization returns `XDocument` or `XElement` rather than typed POCOs, even when a target type is supplied
- several deserializers return `null` for `null` payloads instead of throwing
- YAML deserialization contains a special case for empty payloads when the requested type is `string`

This package is used heavily by the SDK for session and communication serialization, but it remains a separate package because the serialization layer is intentionally reusable outside of the SDK's higher-level object surface.

## Main source areas

The most important files and folders are:

- `SerializationType.cs`
- `SerializeConfig.cs`
- `DeserializeConfig.cs`
- `SpecificTypeConfig.cs`
- `SerializerFactory.cs`
- `DeserializerFactory.cs`
- `Serializers/`
- `Deserializers/`

## Companion tests

`QaaS.Framework.Serialization.Tests` is the sibling test project for this package.

The current tests cover:

- factory dispatch for every supported format
- round-trip serialization for Binary, Json, MessagePack, Xml, XmlElement, Yaml, and ProtobufMessage
- `SpecificTypeConfig` runtime-type resolution
- invalid enum handling
- explicit target-type requirements for ProtobufMessage deserialization
- binary deserialization without a target type and ignoring a requested type hint
- null and empty payload behavior

Representative test files include:

- `SerializationBehaviorTests.cs`
- `SerializationEdgeCaseTests.cs`

## See also

- [Framework](https://TheSmokeTeam.github.io/qaas-docs/framework/index.md)
