---
id: framework.functions.casting-and-serialization
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-10-04
render_macros: true
applies_to: [framework, runner]
keywords: [framework, casting, serialization, deserialization, SerializerFactory, DeserializerFactory, typed, session data, JsonNode]
summary: "Use serializer factories for payload conversion and SDK casting extensions for bodies that already have the requested runtime type."
---

# Casting & Serializing Data - Quick Guide

> TL;DR - Use `SerializerFactory` and `DeserializerFactory` to convert payloads. SDK casting extensions only cast bodies that already have a compatible runtime type.

## When to use {: #when-to-use}

- You are writing a hook and need typed access to session bodies stored as `object`.
- You need to serialize an object to bytes or deserialize bytes into a specific type.
- You need to distinguish a runtime cast from a format conversion.

The convenience APIs previously shown here, including `QaasSerializer`, `ConvertBodyTo<T>`, and `GetOutputBodies<T>`, were reverted in [Framework PR #48]({{ links.repository_framework }}/pull/48) by [commit e48c9d6]({{ links.repository_framework }}/commit/e48c9d6147aa3bc25209af8960f1b4ad56a5dbb2). They are absent from the current Framework source. The examples below use the supported factory and SDK extension APIs.

## Serialization with factories {: #serialization-with-factories}

The serializer returns `byte[]?`; the deserializer accepts bytes and a target `Type`, and returns `object?`. These examples assume `Order` is your application type and `order` is an instance.

```csharp
using QaaS.Framework.Serialization;

var serializer = SerializerFactory.BuildSerializer(SerializationType.Json)!;
var deserializer = DeserializerFactory.BuildDeserializer(SerializationType.Json)!;

byte[]? payload = serializer.Serialize(order);
Order? restored = (Order?)deserializer.Deserialize(payload, typeof(Order));
```

Both factories return `null` when the format is `null`. The caller must decide whether to retain raw bytes or skip conversion; the factories do not provide a pass-through serializer. Unsupported enum values throw `ArgumentOutOfRangeException`. Serialization and deserialization failures propagate from the format implementation; there is no shared convenience exception or non-throwing `TryDeserialize` API.

For JSON text, convert explicitly with UTF-8:

```csharp
using System.Text;
using QaaS.Framework.Serialization;

var serializer = SerializerFactory.BuildSerializer(SerializationType.Json)!;
var deserializer = DeserializerFactory.BuildDeserializer(SerializationType.Json)!;

byte[]? payload = serializer.Serialize(order);
string? json = payload is null ? null : Encoding.UTF8.GetString(payload);
Order? restored = (Order?)deserializer.Deserialize(
    json is null ? null : Encoding.UTF8.GetBytes(json), typeof(Order));
```

## Typed access to session payloads {: #typed-session-access}

Use `GetOutputByName` or `GetInputByName` to find a communication. When its bodies already contain `Order` objects, cast the communication and select the bodies:

```csharp
using System.Linq;
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.SDK.Session.CommunicationDataObjects;

CommunicationData<Order> typed = sessionData.GetOutputByName("orders_output")
    .CastCommunicationData<Order>();
var orders = typed.Data.Select(item => item.Body).ToList();
```

`CastCommunicationData<T>` calls `CastObjectDetailedData<T>` for each item. It copies the communication name and `SerializationType`, and preserves each item's metadata and timestamp in a new wrapper. It does not deserialize bytes, infer formats, or convert a `JsonNode` into a POCO. A body's incompatible runtime type causes `InvalidCastException`, even when the communication declares a `SerializationType`.

For optional communications, use the existing lookup helper:

```csharp
using QaaS.Framework.SDK.Extensions;

if (sessionData.TryGetOutputByName("orders_output", out var output))
{
    foreach (var item in output!.Data)
    {
        if (item.Body is Order order)
        {
            // Use the already typed body here.
        }
    }
}
```

`TryGetOutputByName` and `TryGetInputByName` return `false` for a missing or duplicate name. They do not test or convert body types. The throwing lookup methods raise `ArgumentException` for these cases.

## Converting bytes and JSON representations {: #conversion-semantics}

When a body is raw JSON bytes, deserialize it explicitly. This example assumes `detailedData` is a `DetailedData<object>` whose body is either JSON bytes or `null`:

```csharp
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.Serialization;

byte[]? payload = detailedData.CastObjectDetailedData<byte[]>().Body;
var deserializer = DeserializerFactory.BuildDeserializer(SerializationType.Json)!;
Order? order = (Order?)deserializer.Deserialize(payload, typeof(Order));
```

JSON deserialization without a target type produces a `JsonNode`. To convert that representation into your application type, serialize the representation back to JSON bytes, then deserialize with an explicit target type:

```csharp
using QaaS.Framework.Serialization;

// detailedData.Body is a JsonNode containing an Order-shaped JSON object.
var serializer = SerializerFactory.BuildSerializer(SerializationType.Json)!;
var deserializer = DeserializerFactory.BuildDeserializer(SerializationType.Json)!;
byte[]? payload = serializer.Serialize(detailedData.Body);
Order? order = (Order?)deserializer.Deserialize(payload, typeof(Order));
```

Choose a format that matches the payload. `CommunicationData.SerializationType` is metadata, not an automatic conversion step in the cast methods. For configured session deserialization, the SDK's `SessionDataSerialization` uses `DeserializeConfig` and `SpecificTypeConfig`; see the [SDK project reference](../projects/sdk.md).

## Working with single data items {: #single-data-items}

```csharp
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.SDK.Session.DataObjects;

// data and detailedData have object bodies that already contain Order instances.
Data<Order> typedData = data.CastObjectData<Order>();
DetailedData<Order> typedItem = detailedData.CastObjectDetailedData<Order>();

// Optional typed access can use C# pattern matching.
if (detailedData.Body is Order order)
{
    // Use order here.
}
```

These casts create wrappers while retaining the body and metadata references; detailed-data casts also retain the timestamp. They are not deep clones and do not offer `TryCast` variants. Null reference-type bodies remain null; incompatible bodies throw `InvalidCastException`.

## Edge cases {: #edge-cases}

- `ProtobufMessage` deserialization requires an explicit message type. Supply it to `Deserialize(payload, typeof(TargetType))`. The current `Binary` implementation ignores the target-type hint and uses the type stored in the serialized payload.
- `Xml` returns `XDocument` and `XmlElement` returns `XElement`, regardless of the requested target type. They do not deserialize POCOs through `XmlSerializer`. The XML serializer expects `XDocument`; the XML-element serializer encodes the object's string representation.
- A null serialization format yields a null factory result; do not dereference it without handling the no-conversion case.
- Check the body representation before casting. Use explicit deserialization for bytes, and an explicit format conversion for representations such as `JsonNode`.

## See also {: #see-also}

- [Serialization project reference](../projects/serialization.md)
- [Extension Methods reference](extension-methods.md)
- [SDK project reference](../projects/sdk.md)
