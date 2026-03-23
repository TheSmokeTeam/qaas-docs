<!-- generated hash:f67019c9c138 sources:Mocker, functions, Runtime, Mocker Runner -->

# Mocker Runner

Source-driven reference for `Mocker` functions in the `Runtime / Mocker Runner` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Run`

??? info "Location, signature, and docstring"
    **Member**
    `MockerRunner.Run()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerRunner`
    
    **Location** `QaaS.Mocker/MockerRunner.cs:20`
    
    **Signature**
    ```csharp
    public void Run()
    ```
    
    **Docstring**
    
    Runs the configured QaaS.Mocker execution.
    
    Call this after the mocker execution has been configured and resolved. The method delegates to the underlying execution host.
