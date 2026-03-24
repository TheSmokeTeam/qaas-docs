# Bootstrap

Source-driven reference for `Mocker` functions in the `Commands / Bootstrap` category.

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

## `New<TRunner>`

??? info "Location, signature, and docstring"
    **Member**
    `Bootstrap.New<TRunner>(IEnumerable<string>? args = null)`
    
    **Kind** `function`
    
    **Declaring Type** `Bootstrap`
    
    **Location** `QaaS.Mocker/Bootstrap.cs:34`
    
    **Signature**
    ```csharp
    public static MockerRunner New<TRunner>(IEnumerable<string>? args = null) where TRunner : MockerRunner
    ```
    
    **Docstring**
    
    Creates a new runner instance from the supplied bootstrap inputs.
    
    Use this overload when the mocker run should be represented by a custom implementation while keeping the same command-line bootstrap flow.
