---
id: mocker.functions.extension.methods.sections.http
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, functions, extension, methods, sections, http]
summary: "Reference page for Extension Methods: Http."
---

<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\Extensions\HttpExtensions.cs -->

# Extension Methods: Http

> TL;DR — This page mirrors the `Http` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

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
    
    Constructs request data from an HttpRequest .

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

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
