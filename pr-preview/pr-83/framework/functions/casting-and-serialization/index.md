# Casting & Serializing Data — Quick Guide

> TL;DR — `QaasSerializer` turns any payload into bytes/strings and back in one call, and the `Convert…`/`Get…As`/`Try…` extension methods turn `SessionData`, `CommunicationData`, and `DetailedData` payloads into typed objects without manual factory or cast plumbing.

## When to use

- You are writing a hook (assertion, generator, probe, processor) and need typed access to session bodies instead of `object`.
- You want one-liner serialize/deserialize calls with indicative error messages instead of the factory + cast dance.
- You need non-throwing (`Try…`) variants for optional payloads.

All APIs on this page are purely additive — every pre-existing casting and serialization API keeps working unchanged.

## One-liner serialization: `QaasSerializer`

`QaaS.Framework.Serialization.QaasSerializer` is a static facade over the serializer/deserializer factories:

```csharp
using QaaS.Framework.Serialization;

// Bytes round trip
byte[] payload = QaasSerializer.Serialize(order, SerializationType.Json);
Order order2   = QaasSerializer.Deserialize<Order>(payload, SerializationType.Json)!;

// Text round trip (Json, Yaml, Xml, XmlElement)
string json    = QaasSerializer.SerializeToString(order, SerializationType.Json)!;
Order order3   = QaasSerializer.DeserializeFromString<Order>(json, SerializationType.Json)!;

// Non-throwing variants
if (QaasSerializer.TryDeserialize<Order>(payload, SerializationType.Json, out var maybeOrder))
{
    // maybeOrder is not null here
}
```

Compare with the pre-existing (still supported) form:

```csharp
var deserializer = DeserializerFactory.BuildDeserializer(SerializationType.Json);
var result = (Order?)deserializer?.Deserialize(payload, typeof(Order));
```

Behavior notes:

- A `null` serialization type keeps the framework's pass-through semantics: serializing returns the payload only if it is already `byte[]`, otherwise an indicative `QaasSerializationException` is thrown.
- Every failure is wrapped in `QaasSerializationException` whose message names the operation, the target type, and the serialization format.
- `Try…` variants never throw; they return `false` and a `null`/`default` result instead.

## Fluent format-first construction

When you want a reusable serializer instance, build it straight off the enum:

```csharp
var serializer   = SerializationType.Yaml.BuildSerializer();    // never null
var deserializer = SerializationType.Yaml.BuildDeserializer();  // never null

string yaml  = serializer.SerializeToString(order)!;
Order  again = deserializer.DeserializeFromString<Order>(yaml)!;
```

The instance extension methods (`Deserialize<T>`, `DeserializeFromString<T>`, `SerializeToString`, `TrySerialize`, `TryDeserialize<T>`) also work on any `ISerializer` / `IDeserializer` you already have.

## Typed access to session payloads

Session bodies arrive as `object` (often `byte[]`, `JsonNode`, or another deserialized representation depending on the configured `SerializationType`). The new helpers convert them to your POCO in one call:

```csharp
using QaaS.Framework.SDK.Extensions;

// All typed bodies of a named output, in one line:
IList<Order?> orders = sessionData.GetOutputBodies<Order>("orders_output");

// A fully typed CommunicationData<Order>:
CommunicationData<Order> typed = sessionData.GetOutputAs<Order>("orders_output");

// Inputs work the same way:
var inputs = sessionData.GetInputBodies<OrderRequest>("orders_input");

// Non-throwing:
if (sessionData.TryGetOutputAs<Order>("orders_output", out var maybeTyped))
{
    // ...
}
```

Conversion uses the `SerializationType` declared on the `CommunicationData` itself, so payloads convert with the same format they were captured with. You can pass an explicit `SerializationType` to override.

### How conversion works

`ConvertBodyTo<T>` (and everything built on it) resolves each body in this order:

1. body is `null` → `default`
1. body is already `T` → returned as-is (no copy)
1. body is `byte[]` → deserialized with the given format
1. anything else (for example `JsonNode`, YAML dictionaries) → round-tripped serialize → deserialize into `T`

## Representation-aware casting

A consumer that reads from a protocol (for example a RabbitMQ queue) without a configured specific type receives bodies as deserialized representations: json arrives as `JsonNode`, yaml as `Dictionary<object, object>`, xml as `XDocument`/`XElement`. The cast family — `CastCommunicationData<T>`, `CastObjectDetailedData<T>`, `CastObjectData<T>`, `GetBodyAs<T>`, `GetBodiesAs<T>`, and their `Try…` variants — converts such bodies to the requested type instead of throwing:

```csharp
// Producer side: generated Person objects published to RabbitMQ as json bytes.
// Consumer side: without a configured type the consumed bodies are JsonNode instances,
// yet the cast still lands on the producer's POCO:
CommunicationData<object> consumed = ReadConsumedCommunicationData();
CommunicationData<Person> people = consumed.CastCommunicationData<Person>();
```

Each body resolves in this order:

1. direct cast — a body that already is `T` is returned as-is
1. declared format — the `SerializationType` declared on the `CommunicationData` round-trips the body into `T`
1. inferred format — without a declared type, the representation picks the format: `JsonNode`/`JsonElement`/`JsonDocument` → json, `XDocument` → xml, `XElement` → xml element, `Dictionary<object, object>`/`List<object>` → yaml (see `QaasSerializer.TryInferSerializationType`)
1. otherwise the original indicative `InvalidCastException` is thrown (`Try…` variants return `false`)

`byte[]` bodies stay strict on purpose: raw bytes convert only when the `CommunicationData` declares its `SerializationType`, so protocol code that requires `byte[]` bodies keeps failing fast instead of guessing a format.

## Working with single data items

```csharp
// Direct typed body access when the body already is the target type:
byte[]? raw = detailedData.GetBodyAs<byte[]>();
if (detailedData.TryGetBodyAs<string>(out var text)) { /* ... */ }

// Conversion when it is not:
Order? order = detailedData.ConvertBodyTo<Order>(SerializationType.Json);

// Whole-item conversion keeps headers and metadata:
DetailedData<Order> typedItem = detailedData.ConvertDetailedData<Order>(SerializationType.Json);

// Non-throwing casts mirror the existing hard casts:
if (data.TryCastObjectData<byte[]>(out var bytes)) { /* ... */ }
if (detailedData.TryCastObjectDetailedData<byte[]>(out var detailedBytes)) { /* ... */ }
```

## Working with communication data

```csharp
// Lookup without exceptions:
if (outputs.TryGetCommunicationDataByName("orders_output", out var communication))
{
    // Convert every body using the CommunicationData's own SerializationType:
    CommunicationData<Order> typed = communication.ConvertCommunicationData<Order>();

    // Or only the bodies:
    IList<object?> bodies      = communication.GetBodies();
    IList<Order?>  typedBodies = communication.GetBodiesAs<Order>();
}
```

## Edge cases

- `Binary` and `ProtobufMessage` formats require a concrete target type; `QaasSerializer.Deserialize<T>` always provides one.
- The `Xml`/`XmlElement` deserializers produce `XDocument`/`XElement` by default and honor a requested type: `XDocument`, `XElement`, and `string` are special-cased, while any other type deserializes through `XmlSerializer` (which requires a public type with a parameterless constructor). The matching serializers accept typed POCOs the same way.
- `GetOutputBodies<T>`/`GetInputBodies<T>` throw the same indicative exception as `GetOutputByName`/`GetInputByName` when the name is missing; use the `TryGet…As` variants for optional payloads.
- Conversion never mutates the source objects; converted `Data`/`DetailedData`/`CommunicationData` instances are new wrappers that preserve the original names, metadata, and timestamps.
- `GetBodyAs<T>` returns the body as-is when it already *is* the requested type, and converts deserialized representations as described in the Representation-aware casting section. For bodies it cannot convert (for example `byte[]` without a declared format) its `InvalidCastException` message points you to `ConvertBodyTo<T>`.

## See also

- [Serialization project reference](https://TheSmokeTeam.github.io/qaas-docs/framework/projects/serialization/index.md)
- [Extension Methods reference](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
- [SDK project reference](https://TheSmokeTeam.github.io/qaas-docs/framework/projects/sdk/index.md)
