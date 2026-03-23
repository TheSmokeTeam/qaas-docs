<!-- generated hash:4fd808e8467f sources:Mocker, functions, Getting Started, Bootstrap -->

# Bootstrap

Source-driven reference for `Mocker` functions in the `Getting Started / Bootstrap` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `New`

??? info "Location, signature, and docstring"
    **Member**
    `Bootstrap.New(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Location** `QaaS.Mocker/Bootstrap.cs:21`
    
    **Signature**
    ```csharp
    public static MockerRunner New(IEnumerable<string>? args = null)
    ```
    
    **Docstring**
    
    Creates a new MockerRunner instance from the supplied bootstrap inputs.
    
    This is the primary code-first entry point for bootstrapping the product from command-line style arguments so library startup and CLI startup stay aligned.
