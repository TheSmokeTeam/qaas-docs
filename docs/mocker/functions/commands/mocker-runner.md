# Mocker Runner

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

## `Run`

??? info "Source file, signature, and docstring"
    **Member**
    `MockerRunner.Run()`
    
    **Kind** `function`
    
    **Declaring Type** `MockerRunner`
    
    **Source File** `QaaS.Mocker/MockerRunner.cs`
    
    **Signature**
    ```csharp
    public virtual void Run()
    ```
    
    **Docstring**
    
    Runs the configured QaaS.Mocker execution.
    
    Call this after the mocker execution has been configured and resolved. The method delegates to the underlying execution host.
