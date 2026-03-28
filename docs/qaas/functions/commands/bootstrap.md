# Bootstrap

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.


## `New`

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

## `New<TRunner>`

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
