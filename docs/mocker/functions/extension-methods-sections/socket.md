# Extension Methods: Socket

This page mirrors the `Socket` section from [Extension Methods](../extension-methods.md).

## `GetBytesFromChannelWithinTimeout`

??? info "Source file, signature, and docstring"
    **Member**
    `SocketExtensions.GetBytesFromChannelWithinTimeout(this Socket channel, int timeout, int bufferSize, EndPoint? endpoint = null, ILogger? logger = null)`
    
    **Kind** `function`
    
    **Declaring Type** `SocketExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/SocketExtensions.cs`
    
    **Signature**
    ```csharp
    public static byte[]? GetBytesFromChannelWithinTimeout(this Socket channel, int timeout, int bufferSize, EndPoint? endpoint = null, ILogger? logger = null)
    ```
    
    **Docstring**
    
    Implements timeout-based socket collection. When endpoint is provided the call is treated as datagram-based receive, so the loop does not rely on Available before reading.
