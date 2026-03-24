<!-- generated hash:b82f8d12eec3 sources:Runner, functions, Commands, Bootstrap -->

# Bootstrap

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `New`

??? info "Location, signature, and docstring"
    **Member**
    `Bootstrap.New(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Location** `QaaS.Runner/Bootstrap.cs:30`
    
    **Signature**
    ```csharp
    public static Runner New(IEnumerable<string>? args = null)
    ```
    
    **Docstring**
    
    Creates a new Runner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.

## `New<TRunner>`

??? info "Location, signature, and docstring"
    **Member**
    `Bootstrap.New<TRunner>(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Location** `QaaS.Runner/Bootstrap.cs:42`
    
    **Signature**
    ```csharp
    public static Runner New<TRunner>(IEnumerable<string>? args = null) where TRunner : Runner
    ```
    
    **Docstring**
    
    Creates a new Runner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.
