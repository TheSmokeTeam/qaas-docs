<!-- generated hash:e9ca55ad8eef sources:mocker-family, Servers, table-view -->

# Servers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Servers` | `list or string` | &#10006 |  | List of server mocker instances to run concurrently. |
| `Servers[]` | `object or string` | &#10006 |  |  |
| `Servers[].Grpc` | `object or string` | &#10006 |  | 'gRPC' server type configuration |
| `Servers[].Grpc.Port` | `integer or string` | &#10004 |  | The port to expose on the grpc server |
| `Servers[].Grpc.CertificatePassword` | `string or null` | &#10006 |  | Server certificate password used when IsSecuredSchema is true |
| `Servers[].Grpc.CertificatePath` | `string or null` | &#10006 |  | Server certificate path (.pfx) used when IsSecuredSchema is true |
| `Servers[].Grpc.InternalErrorTransactionStubName` | `string or null` | &#10006 |  | Transaction stub referred when internal error in an action is triggered |
| `Servers[].Grpc.IsLocalhost` | `string or true/false` | &#10006 | False | To run the server host as localhost. This is mainly for local testing. |
| `Servers[].Grpc.IsSecuredSchema` | `string or true/false` | &#10006 | False | To run the server with TLS credentials |
| `Servers[].Grpc.NotFoundTransactionStubName` | `string or null` | &#10006 |  | Transaction stub referred when unknown action is triggered |
| `Servers[].Grpc.Services` | `list or string` | &#10004 |  | The grpc services and rpc actions that are handled by the mocker |
| `Servers[].Grpc.Services[]` | `object or string` | &#10006 |  |  |
| `Servers[].Grpc.Services[].AssemblyName` | `string` | &#10004 |  | The assembly containing generated grpc proto classes |
| `Servers[].Grpc.Services[].ProtoNamespace` | `string` | &#10004 |  | The namespace containing generated grpc proto classes |
| `Servers[].Grpc.Services[].ServiceName` | `string` | &#10004 |  | The proto service name |
| `Servers[].Grpc.Services[].Actions` | `list or string` | &#10004 |  | The rpc actions for this grpc service |
| `Servers[].Grpc.Services[].Actions[]` | `object or string` | &#10006 |  |  |
| `Servers[].Grpc.Services[].Actions[].RpcName` | `string` | &#10004 |  | The rpc method name |
| `Servers[].Grpc.Services[].Actions[].TransactionStubName` | `string` | &#10004 |  | The transaction stub used for this rpc method |
| `Servers[].Grpc.Services[].Actions[].Name` | `string or null` | &#10006 |  | The grpc action name identifier |
| `Servers[].Http` | `object or string` | &#10006 |  | 'HTTP' server type configuration |
| `Servers[].Http.Port` | `integer or string` | &#10004 |  | The port to expose on the http server |
| `Servers[].Http.CertificatePassword` | `string or null` | &#10006 |  | Server certificate password used when IsSecuredSchema is true |
| `Servers[].Http.CertificatePath` | `string or null` | &#10006 |  | Server certificate path (.pfx) used when IsSecuredSchema is true |
| `Servers[].Http.ConnectionAcceptanceValue` | `integer or string` | &#10006 | 128 | The http connection acceptance value used for the semaphore (Multiplied with local processor count) |
| `Servers[].Http.InternalErrorTransactionStubName` | `string or null` | &#10006 |  | Transaction stub referred when internal error in an action is triggered |
| `Servers[].Http.IsLocalhost` | `string or true/false` | &#10006 | False | To run the server host as localhost. This is for mainly for local testing. |
| `Servers[].Http.IsSecuredSchema` | `string or true/false` | &#10006 | False | To run the server with a secured schema. This is for mainly for local testing. |
| `Servers[].Http.NotFoundTransactionStubName` | `string or null` | &#10006 |  | Transaction stub referred when unknown action is triggered |
| `Servers[].Http.Endpoints` | `list or string or null` | &#10006 |  | All endpints which handled by the http server |
| `Servers[].Http.Endpoints[]` | `object or string` | &#10006 |  |  |
| `Servers[].Http.Endpoints[].Path` | `string` | &#10004 |  | The http endpoint Path |
| `Servers[].Http.Endpoints[].FixedPath` | `string` | &#10006 |  |  |
| `Servers[].Http.Endpoints[].Actions` | `list or string` | &#10004 |  | The http endpoint method actions |
| `Servers[].Http.Endpoints[].Actions[]` | `object or string` | &#10006 |  |  |
| `Servers[].Http.Endpoints[].Actions[].Method` | `one of [Get / Post / Put / Delete / Head / Options / Patch / Trace / Connect]` | &#10004 |  | The http endpoint action method |
| `Servers[].Http.Endpoints[].Actions[].TransactionStubName` | `string` | &#10004 |  | The name of the transaction stub to process the request through |
| `Servers[].Http.Endpoints[].Actions[].Name` | `string or null` | &#10006 |  | The http endpoint action name identifier |
| `Servers[].Socket` | `object or string` | &#10006 |  | Socket streaming server typed configuration |
| `Servers[].Socket.BindingIpAddress` | `string` | &#10006 | 0.0.0.0 | Subnet ipv4 mask to bind socket client's connection to |
| `Servers[].Socket.ConnectionAcceptanceValue` | `integer or string` | &#10006 | 8 | The socket's connection acceptance value used for the semaphore (Multiplied with local processor count) |
| `Servers[].Socket.Endpoints` | `list or string` | &#10004 |  | All socket endpoint-implementation which handled by the socket server |
| `Servers[].Socket.Endpoints[]` | `object or string` | &#10006 |  |  |
| `Servers[].Socket.Endpoints[].Port` | `integer or string` | &#10004 |  | Port that socket listenes and binds connection to |
| `Servers[].Socket.Endpoints[].ProtocolType` | `one of [IP / IPv6HopByHopOptions / Unspecified / Icmp / Igmp / Ggp / IPv4 / Tcp / Pup / Udp / Idp / IPv6 / IPv6RoutingHeader / IPv6FragmentHeader / IPSecEncapsulatingSecurityPayload / IPSecAuthenticationHeader / IcmpV6 / IPv6NoNextHeader / IPv6DestinationOptions / ND / Raw / Ipx / Spx / SpxII / Unknown]` | &#10004 |  | Specifies the protocol to use in the socket |
| `Servers[].Socket.Endpoints[].TimeoutMs` | `integer or string` | &#10004 |  | Timeout in milliseconds for socket to perform method before terminating connection |
| `Servers[].Socket.Endpoints[].AddressFamily` | `one of [Unspecified / Unix / InterNetwork / ImpLink / Pup / Chaos / NS / Ipx / Iso / Osi / Ecma / DataKit / Ccitt / Sna / DecNet / DataLink / Lat / HyperChannel / AppleTalk / NetBios / VoiceView / FireFox / Banyan / Atm / InterNetworkV6 / Cluster / Ieee12844 / Irda / NetworkDesigners / Max / Packet / ControllerAreaNetwork / Unknown]` | &#10006 |  | Specifies the addresses masks to approve connections to |
| `Servers[].Socket.Endpoints[].BufferSizeBytes` | `integer or string` | &#10006 | 65536 | The size of communication messages buffer, in bytes |
| `Servers[].Socket.Endpoints[].LingerTimeSeconds` | `integer or string or null` | &#10006 |  | The number of seconds to retain connection after communication. `null` means it won't remain connected |
| `Servers[].Socket.Endpoints[].NagleAlgorithm` | `string or true/false` | &#10006 | False | Whether to use the Nagle Algorithm or not - to reduce small packets and communicate more efficiently over Tcp/Ip connection |
| `Servers[].Socket.Endpoints[].SocketType` | `one of [Stream / Dgram / Raw / Rdm / Seqpacket / Unknown]` | &#10006 |  | Specifies the type of socket |
| `Servers[].Socket.Endpoints[].Action` | `object or string` | &#10004 |  | The socket action to perform on the client connection endpoint |
| `Servers[].Socket.Endpoints[].Action.Method` | `one of [Collect / Broadcast]` | &#10004 |  | The socket server method to perform on the client connection |
| `Servers[].Socket.Endpoints[].Action.DataSourceName` | `string or null` | &#10006 |  | Name of the data-source for the socket server to broadcast data by |
| `Servers[].Socket.Endpoints[].Action.Name` | `string or null` | &#10006 |  | The socket server action name identifier |
| `Servers[].Socket.Endpoints[].Action.TransactionStubName` | `string or null` | &#10006 |  | The name of the transaction stub to process the data through |
