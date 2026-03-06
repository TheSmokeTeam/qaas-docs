# QaaS.Framework.Serialization

`QaaS.Framework.Serialization` contains the serializer and deserializer support used across the QaaS ecosystem.

This package is pulled in through [`QaaS.Framework.SDK`](sdk.md), but it is useful to understand directly because runner sessions, mocker stubs, assertion attachments, and protocol implementations all depend on it.

## Supported Types

The current `SerializationType` enum supports:

- `Binary`
- `Json`
- `MessagePack`
- `Xml`
- `Yaml`
- `ProtobufMessage`
- `XmlElement`

## Where It Is Used

Common examples:

- session publishers and consumers that need to serialize or deserialize payloads
- mocker processors that return protocol-specific response bodies
- assertion attachments written into result artifacts
- hooks that need to convert raw `byte[]` payloads into typed .NET objects

## Practical Guidance

- use `Json` for most HTTP and event-driven test payloads
- use `ProtobufMessage` for strongly typed gRPC workflows
- use `Binary` when the payload should stay opaque
- use explicit serializer settings in the session or stub configuration instead of relying on guesswork
