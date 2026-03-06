# Server

The server section defines the mock server behaviour.

There are currently several `Server` implementations - [`Socket`](#socket), [`Http`](#http), and each one of them has its own capabilities that mock a wide range of scenarios.

## Socket

Handles raw socket stream communcations as server.

Socket mocker has multiple `Endpoint` exposures - it can expose and bind multiple `Port`s and execute one different `SocketMethod` per endpoint, for any clients connecting - anytime.

**Table Property Path** - `Server.Socket`

```yaml
Type: Socket
Socket: {}
```

!!! info "Recommended Tcp Server Configuration"
    === ":octicons-file-code-16: `Tcp`"
        ```yaml
          Socket:
            ConnectionAcceptanceValue: 8 # Amount of connections to keep asynchronously for all server's endpoint
            EndPoints:
                # Example for broadcasting on Tcp connection
              - Port: 6000
                ProtocolType: Tcp
                BufferSizeBytes: 1024 # Decided by the maximum data's size in bytes the transferred in the server-client communication.
                Action:
                    Name: BroadcastSamples
                    Method: Broadcast
                    DataSourceName: Samples # Data source to generate and broadcast its data on any client connecion.
                # Example for collecting data from clients on top of Tcp connection
              - Port: 6001
                ProtocolType: Tcp
                BufferSizeBytes: 1024 # The bigger the buffer is - more data collected will be concat to same buffer on top of every server-client channel communication.
                Action:
                    Name: CollectSamples
                    Method: Collect
        ```

!!! warning "NagleAlgorithm"
        Nagle option is only relevant for Tcp Socket server!
        When applying Nagle algorithm on socket server - the communication between the client to the server will be handled differently behind the scenes (data's buffer written to channel will be concatted to bigger buffers to reduce acks by sending multiple buffers at once).

!!! Notice "LingerTimeSeconds"
        Time to retain connection of client before disposing it. Can be useful when collecting as backup timeout mechanism.

!!! Notice "ConnectionAcceptanceValue"
        In Udp socket server - the binded endpoint can handle ONE CHANNEL ONLY! Hence this value should be equal to the count of endpoints configured if wanted to handle all channels asynchronously.

## Http
