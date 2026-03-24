<!-- generated hash:f267ebbd498b sources:Mocker, functions, Commands, Mocker Runner -->

# Mocker Runner

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Run`

??? info "Location, signature, and docstring"
    **Member**
    `MockerRunner.Run()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerRunner`
    
    **Location** `QaaS.Mocker/MockerRunner.cs:32`
    
    **Signature**
    ```csharp
    public virtual void Run()
    ```
    
    **Docstring**
    
    Runs the configured QaaS.Mocker execution.
    
    Call this after the mocker execution has been configured and resolved. The method delegates to the underlying execution host.
