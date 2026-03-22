# Servers Configurations Table View

`Server` is still supported as a legacy single-server shorthand, but the canonical configuration model is `Servers`.

| Property Path | Type | Required | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| `Servers` | `array` | &#10006; |  | List of configured servers |
| `Servers[]` | `object` | &#10006; |  | One configured server; exactly one of `Http`, `Grpc`, or `Socket` must be set |
| `Servers[].Http` | `object` | &#10006; |  | HTTP or HTTPS server configuration |
| `Servers[].Http.Port` | `integer` | &#10004; |  | HTTP server port |
| `Servers[].Http.Endpoints` | `array` | &#10006; |  | HTTP endpoints |
| `Servers[].Http.Endpoints[]` | `object` | &#10006; |  | One HTTP endpoint |
| `Servers[].Http.Endpoints[].Path` | `string` | &#10004; |  | Route path, including supported placeholder segments |
| `Servers[].Http.Endpoints[].Actions` | `array` | &#10004; |  | Method-specific actions for the path |
| `Servers[].Http.Endpoints[].Actions[]` | `object` | &#10006; |  | One HTTP action |
| `Servers[].Http.Endpoints[].Actions[].Name` | `string` | &#10006; |  | Optional action name used by the controller |
| `Servers[].Http.Endpoints[].Actions[].Method` | `enum` | &#10004; |  | HTTP method |
| `Servers[].Http.Endpoints[].Actions[].TransactionStubName` | `string` | &#10004; |  | Stub executed for the request |
| `Servers[].Http.IsSecuredSchema` | `boolean` | &#10006; | `false` | Enable HTTPS |
| `Servers[].Http.CertificatePath` | `string` | &#10006; |  | `.pfx` certificate path used when HTTPS is enabled |
| `Servers[].Http.CertificatePassword` | `string` | &#10006; |  | Certificate password |
| `Servers[].Http.IsLocalhost` | `boolean` | &#10006; | `false` | Bind to localhost for local testing |
| `Servers[].Http.NotFoundTransactionStubName` | `string` | &#10006; |  | Fallback stub for unmatched routes |
| `Servers[].Http.InternalErrorTransactionStubName` | `string` | &#10006; |  | Fallback stub for internal errors |
| `Servers[].Http.ConnectionAcceptanceValue` | `integer` | &#10006; | `128` | HTTP connection acceptance multiplier |
| `Servers[].Grpc` | `object` | &#10006; |  | gRPC or gRPCs server configuration |
| `Servers[].Grpc.Port` | `integer` | &#10004; |  | gRPC server port |
| `Servers[].Grpc.Services` | `array` | &#10004; |  | Configured proto services |
| `Servers[].Grpc.Services[]` | `object` | &#10006; |  | One gRPC service |
| `Servers[].Grpc.Services[].ServiceName` | `string` | &#10004; |  | Proto service name |
| `Servers[].Grpc.Services[].ProtoNamespace` | `string` | &#10004; |  | Namespace containing generated proto types |
| `Servers[].Grpc.Services[].AssemblyName` | `string` | &#10004; |  | Assembly containing generated proto types |
| `Servers[].Grpc.Services[].Actions` | `array` | &#10004; |  | RPC actions for the service |
| `Servers[].Grpc.Services[].Actions[]` | `object` | &#10006; |  | One RPC action |
| `Servers[].Grpc.Services[].Actions[].Name` | `string` | &#10006; |  | Optional action name used by the controller |
| `Servers[].Grpc.Services[].Actions[].RpcName` | `string` | &#10004; |  | RPC method name |
| `Servers[].Grpc.Services[].Actions[].TransactionStubName` | `string` | &#10004; |  | Stub executed for the RPC |
| `Servers[].Grpc.IsSecuredSchema` | `boolean` | &#10006; | `false` | Enable TLS |
| `Servers[].Grpc.CertificatePath` | `string` | &#10006; |  | `.pfx` certificate path used when TLS is enabled |
| `Servers[].Grpc.CertificatePassword` | `string` | &#10006; |  | Certificate password |
| `Servers[].Grpc.IsLocalhost` | `boolean` | &#10006; | `false` | Bind to localhost for local testing |
| `Servers[].Grpc.NotFoundTransactionStubName` | `string` | &#10006; |  | Fallback stub for unmatched RPC calls |
| `Servers[].Grpc.InternalErrorTransactionStubName` | `string` | &#10006; |  | Fallback stub for internal errors |
| `Servers[].Socket` | `object` | &#10006; |  | Socket server configuration |
| `Servers[].Socket.BindingIpAddress` | `string` | &#10006; | `0.0.0.0` | IP address used for socket binding |
| `Servers[].Socket.ConnectionAcceptanceValue` | `integer` | &#10006; | `8` | Socket connection acceptance multiplier |
| `Servers[].Socket.Endpoints` | `array` | &#10004; |  | Configured socket endpoints |
| `Servers[].Socket.Endpoints[]` | `object` | &#10006; |  | One socket endpoint |
| `Servers[].Socket.Endpoints[].Port` | `integer` | &#10004; |  | Socket port |
| `Servers[].Socket.Endpoints[].ProtocolType` | `enum` | &#10004; |  | Protocol type, typically `Tcp` or `Udp` |
| `Servers[].Socket.Endpoints[].SocketType` | `enum` | &#10006; | `Stream` | Socket type |
| `Servers[].Socket.Endpoints[].AddressFamily` | `enum` | &#10006; | `InterNetwork` | Address family |
| `Servers[].Socket.Endpoints[].BufferSizeBytes` | `integer` | &#10006; | `65536` | Socket buffer size in bytes |
| `Servers[].Socket.Endpoints[].NagleAlgorithm` | `boolean` | &#10006; | `false` | Enable Nagle algorithm for TCP |
| `Servers[].Socket.Endpoints[].LingerTimeSeconds` | `integer` | &#10006; |  | Linger time after communication |
| `Servers[].Socket.Endpoints[].TimeoutMs` | `integer` | &#10004; |  | Per-endpoint timeout in milliseconds |
| `Servers[].Socket.Endpoints[].Action` | `object` | &#10004; |  | Socket action |
| `Servers[].Socket.Endpoints[].Action.Name` | `string` | &#10006; |  | Optional action name used by the controller |
| `Servers[].Socket.Endpoints[].Action.Method` | `enum` | &#10004; |  | `Collect` or `Broadcast` |
| `Servers[].Socket.Endpoints[].Action.DataSourceName` | `string` | &#10006; |  | Broadcast data source; required when `Method` is `Broadcast` |
| `Servers[].Socket.Endpoints[].Action.TransactionStubName` | `string` | &#10006; |  | Stub used to process collected or broadcast data |
