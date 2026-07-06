---
id: mocker.functions.extension-methods
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, extension, methods]
summary: "This page collects public Mocker extension methods that have XML documentation or explicit docs annotations."
---
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\Extensions\DataExtensions.cs -->
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\Extensions\HttpExtensions.cs -->
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\Extensions\SocketExtensions.cs -->

# Extension Methods

> TL;DR — This page lists the public Mocker extension methods generated from XML documentation.

## When to use {: #when-to-use}

Use this page when you need extension-method signatures and doc comments for the Mocker API surface.

This page collects public `Mocker` extension methods that have XML documentation or explicit docs annotations.

Annotated extension methods continue to appear in their regular category pages; this page gives the extension surface a dedicated view.

## Data {: #data}

### `CloneDetailed` {: #clonedetailed}

??? info "Source file, signature, and docstring"
    **Member**
    `DataExtensions.CloneDetailed(this Data<object> data, DateTime? datetime = null)`
    
    **Kind** `function`
    
    **Declaring Type** `DataExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/DataExtensions.cs`
    
    **Signature**
    ```csharp
    public static DetailedData<object> CloneDetailed(this Data<object> data, DateTime? datetime = null)
    ```
    
    **Docstring**
    
    Clones a payload into a DetailedData{T} instance with a capture timestamp.

## Http {: #http}

### `ToHttpMethodEnum` {: #tohttpmethodenum}

??? info "Source file, signature, and docstring"
    **Member**
    `HttpExtensions.ToHttpMethodEnum(this string stringHttpMethod)`
    
    **Kind** `function`
    
    **Declaring Type** `HttpExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/HttpExtensions.cs`
    
    **Signature**
    ```csharp
    public static HttpMethod ToHttpMethodEnum(this string stringHttpMethod)
    ```
    
    **Docstring**
    
    Converts a string representation of an HTTP method to the corresponding HttpMethod enum.

### `ConstructRequestDataAsync` {: #constructrequestdataasync}

??? info "Source file, signature, and docstring"
    **Member**
    `HttpExtensions.ConstructRequestDataAsync(this Microsoft.AspNetCore.Http.HttpRequest request)`
    
    **Kind** `function`
    
    **Declaring Type** `HttpExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/HttpExtensions.cs`
    
    **Signature**
    ```csharp
    public static async Task<Data<object>> ConstructRequestDataAsync(this Microsoft.AspNetCore.Http.HttpRequest request)
    ```
    
    **Docstring**
    
    Constructs request data from an HttpRequest.

### `HandleResponseDataAndCloseAsync` {: #handleresponsedataandcloseasync}

??? info "Source file, signature, and docstring"
    **Member**
    `HttpExtensions.HandleResponseDataAndCloseAsync(this Microsoft.AspNetCore.Http.HttpResponse response, Data<object> responseData, HttpMethod method)`
    
    **Kind** `function`
    
    **Declaring Type** `HttpExtensions (extension type)`
    
    **Source File** `QaaS.Mocker.Servers/Extensions/HttpExtensions.cs`
    
    **Signature**
    ```csharp
    public static async Task HandleResponseDataAndCloseAsync(this Microsoft.AspNetCore.Http.HttpResponse response, Data<object> responseData, HttpMethod method)
    ```
    
    **Docstring**
    
    Handles response data by setting headers and writing the response body.

## Socket {: #socket}

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

## See also {: #see-also}

- [Mocker Functions](index.md)
