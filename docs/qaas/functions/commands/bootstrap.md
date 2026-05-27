---
id: qaas.functions.commands.bootstrap
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, functions, commands, bootstrap]
summary: "Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner\Bootstrap.cs -->

# Bootstrap

> TL;DR: Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `New` {: #new}

??? info "Source file, signature, and docstring"
    **Member**
    `Bootstrap.New(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Source File** `QaaS.Runner/Bootstrap.cs`
    
    **Signature**
    ```csharp
    public static Runner New(IEnumerable<string>? args = null)
    ```
    
    **Docstring**
    
    Creates a new Runner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## `New<TRunner>` {: #new-trunner}

??? info "Source file, signature, and docstring"
    **Member**
    `Bootstrap.New<TRunner>(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Source File** `QaaS.Runner/Bootstrap.cs`
    
    **Signature**
    ```csharp
    public static Runner New<TRunner>(IEnumerable<string>? args = null) where TRunner : Runner
    ```
    
    **Docstring**
    
    Creates a new Runner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
