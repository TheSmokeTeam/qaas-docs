---
id: mocker.functions.extension.methods.sections.socket
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, extension, methods, sections, socket]
summary: "Reference page for Extension Methods: Socket."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\Extensions\SocketExtensions.cs -->

# Extension Methods: Socket

> TL;DR — This page mirrors the `Socket` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `GetBytesFromChannelWithinTimeout` {: #getbytesfromchannelwithintimeout}

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
