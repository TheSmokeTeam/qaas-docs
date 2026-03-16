# Server Configurations Table View

Rows documented under `Server.*` also apply to each item under `Servers[]`.

| Property Path | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `Server` | `object` | &#10006 |  | The legacy single server mocker instance to run. |
| `Servers` | `array` | &#10006 |  | List of server mocker instances to run concurrently. |
| `Servers[]` | `object` | &#10006 |  | Each item uses the same schema as `Server`. |
| `Server.Type` | `enum` [`Http` / `Grpc` / `Socket`] | &#10004 |  | The type of the server protocol to run. |
| `Server.Http` | `object` | &#10006 |  | `HTTP` server type configuration. |
| `Server.Http.Port` | `integer` (`0.0` <= `value` <= `65535.0`) | &#10004 |  | The port to expose on the HTTP server. |
| `Server.Http.Endpoints` | `array` | &#10006 |  | All endpoints handled by the HTTP server. |
| `Server.Http.Endpoints[]` | `object` | &#10006 |  |  |
| `Server.Http.Endpoints[].Path` | `string` | &#10004 |  | The HTTP endpoint path. |
| `Server.Http.Endpoints[].Actions` | `array` | &#10004 |  | The HTTP endpoint method actions. |
| `Server.Http.Endpoints[].Actions[]` | `object` | &#10006 |  |  |
| `Server.Http.Endpoints[].Actions[].Name` | `string` | &#10006 |  | The HTTP endpoint action name identifier. |
| `Server.Http.Endpoints[].Actions[].Method` | `enum` [`Get` / `Post` / `Put` / `Delete` / `Head` / `Options` / `Patch` / `Trace` / `Connect`] | &#10004 |  | The HTTP endpoint action method. |
| `Server.Http.Endpoints[].Actions[].TransactionStubName` | `string` | &#10004 |  | The name of the transaction stub to process the request through. |
| `Server.Http.IsSecuredSchema` | `boolean` | &#10006 | False | Run the server with a secured schema. |
| `Server.Http.CertificatePath` | `string` | &#10006 |  | Server certificate path (`.pfx`). Required when `IsSecuredSchema` is `true`. |
| `Server.Http.CertificatePassword` | `string` | &#10006 |  | Server certificate password used when `IsSecuredSchema` is `true`. |
| `Server.Http.IsLocalhost` | `boolean` | &#10006 | False | Run the server host as localhost. |
| `Server.Http.NotFoundTransactionStubName` | `string` | &#10006 |  | Transaction stub used when an unknown action is triggered. |
| `Server.Http.InternalErrorTransactionStubName` | `string` | &#10006 |  | Transaction stub used when an internal error in an action is triggered. |
| `Server.Http.ConnectionAcceptanceValue` | `integer` | &#10006 | 128 | The HTTP connection acceptance value used for the semaphore (multiplied with local processor count). |
| `Server.Grpc` | `object` | &#10006 |  | `gRPC` server type configuration. |
| `Server.Grpc.Port` | `integer` (`0.0` <= `value` <= `65535.0`) | &#10004 |  | The port to expose on the gRPC server. |
| `Server.Grpc.Services` | `array` (`length` >= `1`) | &#10004 |  | The gRPC services and RPC actions handled by the mocker. |
| `Server.Grpc.Services[]` | `object` | &#10006 |  |  |
| `Server.Grpc.Services[].ServiceName` | `string` | &#10004 |  | The proto service name. |
| `Server.Grpc.Services[].ProtoNamespace` | `string` | &#10004 |  | The namespace containing generated gRPC proto classes. |
| `Server.Grpc.Services[].AssemblyName` | `string` | &#10004 |  | The assembly containing generated gRPC proto classes. |
| `Server.Grpc.Services[].Actions` | `array` (`length` >= `1`) | &#10004 |  | The RPC actions for this gRPC service. |
| `Server.Grpc.Services[].Actions[]` | `object` | &#10006 |  |  |
| `Server.Grpc.Services[].Actions[].Name` | `string` | &#10006 |  | The gRPC action name identifier. |
| `Server.Grpc.Services[].Actions[].RpcName` | `string` | &#10004 |  | The RPC method name. |
| `Server.Grpc.Services[].Actions[].TransactionStubName` | `string` | &#10004 |  | The transaction stub used for this RPC method. |
| `Server.Grpc.IsSecuredSchema` | `boolean` | &#10006 | False | Run the server with TLS credentials. |
| `Server.Grpc.CertificatePath` | `string` | &#10006 |  | Server certificate path (`.pfx`). Required when `IsSecuredSchema` is `true`. |
| `Server.Grpc.CertificatePassword` | `string` | &#10006 |  | Server certificate password used when `IsSecuredSchema` is `true`. |
| `Server.Grpc.IsLocalhost` | `boolean` | &#10006 | False | Run the server host as localhost. |
| `Server.Grpc.NotFoundTransactionStubName` | `string` | &#10006 |  | Transaction stub used when an unknown action is triggered. |
| `Server.Grpc.InternalErrorTransactionStubName` | `string` | &#10006 |  | Transaction stub used when an internal error in an action is triggered. |
| `Server.Socket` | `object` | &#10006 |  | Socket streaming server type configuration. |
| `Server.Socket.BindingIpAddress` | `string` | &#10006 | `0.0.0.0` | Subnet IPv4 mask to bind socket client connections to. |
| `Server.Socket.ConnectionAcceptanceValue` | `integer` | &#10006 | 8 | The socket connection acceptance value used for the semaphore (multiplied with local processor count). |
| `Server.Socket.Endpoints` | `array` (`length` >= `1`) | &#10004 |  | All socket endpoint implementations handled by the socket server. |
| `Server.Socket.Endpoints[]` | `object` | &#10006 |  |  |
| `Server.Socket.Endpoints[].Port` | `integer` (`0.0` <= `value` <= `65535.0`) | &#10004 |  | Port that the socket listens on and binds connections to. |
| `Server.Socket.Endpoints[].ProtocolType` | `enum` [`IP` / `IPv6HopByHopOptions` / `Unspecified` / `Icmp` / `Igmp` / `Ggp` / `IPv4` / `Tcp` / `Pup` / `Udp` / `Idp` / `IPv6` / `IPv6RoutingHeader` / `IPv6FragmentHeader` / `IPSecEncapsulatingSecurityPayload` / `IPSecAuthenticationHeader` / `IcmpV6` / `IPv6NoNextHeader` / `IPv6DestinationOptions` / `ND` / `Raw` / `Ipx` / `Spx` / `SpxII` / `Unknown`] | &#10004 |  | Specifies the protocol to use in the socket. |
| `Server.Socket.Endpoints[].SocketType` | `enum` [`Stream` / `Dgram` / `Raw` / `Rdm` / `Seqpacket` / `Unknown`] | &#10006 | Stream | Specifies the type of socket. |
| `Server.Socket.Endpoints[].AddressFamily` | `enum` [`Unspecified` / `Unix` / `InterNetwork` / `ImpLink` / `Pup` / `Chaos` / `NS` / `Ipx` / `Iso` / `Osi` / `Ecma` / `DataKit` / `Ccitt` / `Sna` / `DecNet` / `DataLink` / `Lat` / `HyperChannel` / `AppleTalk` / `NetBios` / `VoiceView` / `FireFox` / `Banyan` / `Atm` / `InterNetworkV6` / `Cluster` / `Ieee12844` / `Irda` / `NetworkDesigners` / `Max` / `Packet` / `ControllerAreaNetwork` / `Unknown`] | &#10006 | InterNetwork | Specifies the address family used to approve connections. |
| `Server.Socket.Endpoints[].BufferSizeBytes` | `integer` (`0.0` <= `value` <= `2147483647.0`) | &#10006 | 65536 | The size of the communication buffer in bytes. |
| `Server.Socket.Endpoints[].NagleAlgorithm` | `boolean` | &#10006 | False | Whether to use the Nagle algorithm. |
| `Server.Socket.Endpoints[].LingerTimeSeconds` | `integer` | &#10006 |  | The number of seconds to retain the connection after communication. |
| `Server.Socket.Endpoints[].TimeoutMs` | `integer` | &#10004 |  | Timeout in milliseconds for the socket action before terminating the connection. |
| `Server.Socket.Endpoints[].Action` | `object` | &#10004 |  | The socket action to perform on the client connection endpoint. |
| `Server.Socket.Endpoints[].Action.Name` | `string` | &#10006 |  | The socket server action name identifier. |
| `Server.Socket.Endpoints[].Action.Method` | `enum` [`Collect` / `Broadcast`] | &#10004 |  | The socket server method to perform on the client connection. |
| `Server.Socket.Endpoints[].Action.DataSourceName` | `string` | &#10006 |  | Name of the data source to broadcast. Required when `Method` is `Broadcast`. |
| `Server.Socket.Endpoints[].Action.TransactionStubName` | `string` | &#10006 |  | The name of the transaction stub to process the data through. |
