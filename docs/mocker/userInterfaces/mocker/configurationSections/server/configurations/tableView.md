<!-- generated hash:43ac09f8381e sources:mocker-family, Servers, table-view -->

# Servers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Servers` | `Array | String` | &#10006 |  | List of server mocker instances to run concurrently. |
| `Servers[]` | `Object | String` | &#10006 |  |  |
| `Servers[].Grpc` | `Object | String` | &#10006 |  | 'gRPC' server type configuration |
| `Servers[].Grpc.Port` | `Integer | String` | &#10004 |  | The port to expose on the grpc server |
| `Servers[].Grpc.CertificatePassword` | `Null | String` | &#10006 |  | Server certificate password used when IsSecuredSchema is true |
| `Servers[].Grpc.CertificatePath` | `Null | String` | &#10006 |  | Server certificate path (.pfx) used when IsSecuredSchema is true |
| `Servers[].Grpc.InternalErrorTransactionStubName` | `Null | String` | &#10006 |  | Transaction stub referred when internal error in an action is triggered |
| `Servers[].Grpc.IsLocalhost` | `Boolean | String` | &#10006 | False | To run the server host as localhost. This is mainly for local testing. |
| `Servers[].Grpc.IsSecuredSchema` | `Boolean | String` | &#10006 | False | To run the server with TLS credentials |
| `Servers[].Grpc.NotFoundTransactionStubName` | `Null | String` | &#10006 |  | Transaction stub referred when unknown action is triggered |
| `Servers[].Grpc.Services` | `Array | String` | &#10004 |  | The grpc services and rpc actions that are handled by the mocker |
| `Servers[].Grpc.Services[]` | `Object | String` | &#10006 |  |  |
| `Servers[].Grpc.Services[].AssemblyName` | `String` | &#10004 |  | The assembly containing generated grpc proto classes |
| `Servers[].Grpc.Services[].ProtoNamespace` | `String` | &#10004 |  | The namespace containing generated grpc proto classes |
| `Servers[].Grpc.Services[].ServiceName` | `String` | &#10004 |  | The proto service name |
| `Servers[].Grpc.Services[].Actions` | `Array | String` | &#10004 |  | The rpc actions for this grpc service |
| `Servers[].Grpc.Services[].Actions[]` | `Object | String` | &#10006 |  |  |
| `Servers[].Grpc.Services[].Actions[].RpcName` | `String` | &#10004 |  | The rpc method name |
| `Servers[].Grpc.Services[].Actions[].TransactionStubName` | `String` | &#10004 |  | The transaction stub used for this rpc method |
| `Servers[].Grpc.Services[].Actions[].Name` | `Null | String` | &#10006 |  | The grpc action name identifier |
| `Servers[].Http` | `Object | String` | &#10006 |  | 'HTTP' server type configuration |
| `Servers[].Http.Port` | `Integer | String` | &#10004 |  | The port to expose on the http server |
| `Servers[].Http.CertificatePassword` | `Null | String` | &#10006 |  | Server certificate password used when IsSecuredSchema is true |
| `Servers[].Http.CertificatePath` | `Null | String` | &#10006 |  | Server certificate path (.pfx) used when IsSecuredSchema is true |
| `Servers[].Http.ConnectionAcceptanceValue` | `Integer | String` | &#10006 | 128 | The http connection acceptance value used for the semaphore (Multiplied with local processor count) |
| `Servers[].Http.InternalErrorTransactionStubName` | `Null | String` | &#10006 |  | Transaction stub referred when internal error in an action is triggered |
| `Servers[].Http.IsLocalhost` | `Boolean | String` | &#10006 | False | To run the server host as localhost. This is for mainly for local testing. |
| `Servers[].Http.IsSecuredSchema` | `Boolean | String` | &#10006 | False | To run the server with a secured schema. This is for mainly for local testing. |
| `Servers[].Http.NotFoundTransactionStubName` | `Null | String` | &#10006 |  | Transaction stub referred when unknown action is triggered |
| `Servers[].Http.Endpoints` | `Array | Null | String` | &#10006 |  | All endpints which handled by the http server |
| `Servers[].Http.Endpoints[]` | `Object | String` | &#10006 |  |  |
| `Servers[].Http.Endpoints[].Path` | `String` | &#10004 |  | The http endpoint Path |
| `Servers[].Http.Endpoints[].FixedPath` | `String` | &#10006 |  |  |
| `Servers[].Http.Endpoints[].Actions` | `Array | String` | &#10004 |  | The http endpoint method actions |
| `Servers[].Http.Endpoints[].Actions[]` | `Object | String` | &#10006 |  |  |
| `Servers[].Http.Endpoints[].Actions[].Method` | `enum [Get / Post / Put / Delete / Head / Options / Patch / Trace / Connect]` | &#10004 |  | The http endpoint action method |
| `Servers[].Http.Endpoints[].Actions[].TransactionStubName` | `String` | &#10004 |  | The name of the transaction stub to process the request through |
| `Servers[].Http.Endpoints[].Actions[].Name` | `Null | String` | &#10006 |  | The http endpoint action name identifier |
| `Servers[].Socket` | `Object | String` | &#10006 |  | Socket streaming server typed configuration |
| `Servers[].Socket.BindingIpAddress` | `String` | &#10006 | 0.0.0.0 | Subnet ipv4 mask to bind socket client's connection to |
| `Servers[].Socket.ConnectionAcceptanceValue` | `Integer | String` | &#10006 | 8 | The socket's connection acceptance value used for the semaphore (Multiplied with local processor count) |
| `Servers[].Socket.Endpoints` | `Array | String` | &#10004 |  | All socket endpoint-implementation which handled by the socket server |
| `Servers[].Socket.Endpoints[]` | `Object | String` | &#10006 |  |  |
| `Servers[].Socket.Endpoints[].Port` | `Integer | String` | &#10004 |  | Port that socket listenes and binds connection to |
| `Servers[].Socket.Endpoints[].ProtocolType` | `enum [IP / IPv6HopByHopOptions / Unspecified / Icmp / Igmp / Ggp / IPv4 / Tcp / Pup / Udp / Idp / IPv6 / IPv6RoutingHeader / IPv6FragmentHeader / IPSecEncapsulatingSecurityPayload / IPSecAuthenticationHeader / IcmpV6 / IPv6NoNextHeader / IPv6DestinationOptions / ND / Raw / Ipx / Spx / SpxII / Unknown]` | &#10004 |  | Specifies the protocol to use in the socket |
| `Servers[].Socket.Endpoints[].TimeoutMs` | `Integer | String` | &#10004 |  | Timeout in milliseconds for socket to perform method before terminating connection |
| `Servers[].Socket.Endpoints[].AddressFamily` | `enum [Unspecified / Unix / InterNetwork / ImpLink / Pup / Chaos / NS / Ipx / Iso / Osi / Ecma / DataKit / Ccitt / Sna / DecNet / DataLink / Lat / HyperChannel / AppleTalk / NetBios / VoiceView / FireFox / Banyan / Atm / InterNetworkV6 / Cluster / Ieee12844 / Irda / NetworkDesigners / Max / Packet / ControllerAreaNetwork / Unknown]` | &#10006 |  | Specifies the addresses masks to approve connections to |
| `Servers[].Socket.Endpoints[].BufferSizeBytes` | `Integer | String` | &#10006 | 65536 | The size of communication messages buffer, in bytes |
| `Servers[].Socket.Endpoints[].LingerTimeSeconds` | `Integer | Null | String` | &#10006 |  | The number of seconds to retain connection after communication. `null` means it won't remain connected |
| `Servers[].Socket.Endpoints[].NagleAlgorithm` | `Boolean | String` | &#10006 | False | Whether to use the Nagle Algorithm or not - to reduce small packets and communicate more efficiently over Tcp/Ip connection |
| `Servers[].Socket.Endpoints[].SocketType` | `enum [Stream / Dgram / Raw / Rdm / Seqpacket / Unknown]` | &#10006 |  | Specifies the type of socket |
| `Servers[].Socket.Endpoints[].Action` | `Object | String` | &#10004 |  | The socket action to perform on the client connection endpoint |
| `Servers[].Socket.Endpoints[].Action.Method` | `enum [Collect / Broadcast]` | &#10004 |  | The socket server method to perform on the client connection |
| `Servers[].Socket.Endpoints[].Action.DataSourceName` | `Null | String` | &#10006 |  | Name of the data-source for the socket server to broadcast data by |
| `Servers[].Socket.Endpoints[].Action.Name` | `Null | String` | &#10006 |  | The socket server action name identifier |
| `Servers[].Socket.Endpoints[].Action.TransactionStubName` | `Null | String` | &#10006 |  | The name of the transaction stub to process the data through |
