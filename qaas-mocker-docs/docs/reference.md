# QaaS.Mocker Reference

## Root Config Types

### `TransactionStubConfig`

- `Name`: unique stub identifier.
- `Processor`: processor implementation name.
- `DataSourceNames`: named data sources supplied to the processor.
- `ProcessorSpecificConfiguration`: processor-specific configuration payload.
- `RequestBodyDeserialization`: optional inbound body deserializer.
- `ResponseBodySerialization`: optional outbound body serializer.

### `ControllerConfig`

- enables the optional controller runtime,
- carries the Redis connection details used for ping and command channels,
- is only required when the runner needs to switch stubs, trigger actions, or consume captured data at runtime.

### `ServerConfig`

Exactly one server family must be configured:

- `Http`
- `Grpc`
- `Socket`

The top-level `Type` selects which family is active.

## HTTP Server Types

### `HttpServerConfig`

- `Port`: listening port.
- `IsLocalhost`: binds locally when true.
- `IsSecuredSchema`: enables TLS.
- `CertificatePath` / `CertificatePassword`: certificate material for HTTPS.
- `Endpoints`: list of `HttpEndpointConfig`.

### `HttpEndpointConfig`

- `Path`: route path.
- `Actions`: list of `HttpEndpointActionConfig`.

### `HttpEndpointActionConfig`

- `Name`: action identifier.
- `Method`: HTTP verb.
- `TransactionStubName`: stub executed for the route.
- `StatusCode`: optional fixed response code override.
- `ContentType`: optional response content type.

## gRPC Server Types

### `GrpcServerConfig`

- `Port`, `IsLocalhost`, `IsSecuredSchema`, `CertificatePath`, `CertificatePassword`
- `Services`: list of `GrpcServiceConfig`

### `GrpcServiceConfig`

- `ServiceName`: gRPC service name.
- `ProtoNamespace`: namespace that contains generated proto types.
- `AssemblyName`: assembly containing the generated types.
- `Actions`: list of `GrpcEndpointActionConfig`.

### `GrpcEndpointActionConfig`

- `Name`: action identifier.
- `RpcName`: RPC method name.
- `TransactionStubName`: stub executed for that RPC.

## Socket Server Types

### `SocketServerConfig`

- `Port`: listening port.
- `IsLocalhost`: local-only bind switch.
- `Endpoints`: list of `SocketEndpointConfig`.

### `SocketEndpointConfig`

- `Name`: endpoint identifier.
- `Actions`: list of `SocketActionConfig`.

### `SocketActionConfig`

- `Name`: action identifier.
- `Method`: socket behavior mode.
- `TransactionStubName`: stub executed for the endpoint action.

## Runtime Controller

The controller uses `QaaS.Mocker.CommunicationObjects` over Redis:

- ping channels confirm the mocker is reachable,
- command channels change action-to-stub assignments,
- consume channels retrieve cached input or output payloads.

If you do not need runtime steering, omit the controller section entirely.
