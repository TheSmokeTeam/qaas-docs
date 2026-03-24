# Runner

Source-driven reference for `Runner` functions in the `Commands / Runner` category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its location, signature, and XML doc comments.

## `Run`

??? info "Location, signature, and docstring"
    **Member**
    `Runner.Run()`
    
    **Kind** `function`
    
    **Declaring Type** `Runner`
    
    **Location** `QaaS.Runner/Runner.cs:70`
    
    **Signature**
    ```csharp
    public void Run()
    ```
    
    **Docstring**
    
    Runs the configured lifecycle and applies the resulting exit code policy.
    
    Call this when the current process should honor Runner exit behavior. If the caller needs to inspect the exit code without terminating the process, prefer RunAndGetExitCode().

## `RunAndGetExitCode`

??? info "Location, signature, and docstring"
    **Member**
    `Runner.RunAndGetExitCode()`
    
    **Kind** `function`
    
    **Declaring Type** `Runner`
    
    **Location** `QaaS.Runner/Runner.cs:83`
    
    **Signature**
    ```csharp
    public int RunAndGetExitCode()
    ```
    
    **Docstring**
    
    Runs the configured lifecycle and returns the resulting exit code to the caller.
    
    Call this when the caller wants to control how the resulting exit code is handled instead of letting Runner apply its default process policy.

## `Dispose`

??? info "Location, signature, and docstring"
    **Member**
    `Runner.Dispose()`
    
    **Kind** `function`
    
    **Declaring Type** `Runner`
    
    **Location** `QaaS.Runner/Runner.cs:234`
    
    **Signature**
    ```csharp
    public virtual void Dispose()
    ```
    
    **Docstring**
    
    Releases the resources owned by the current Runner instance.
    
    Dispose should be called exactly once when the host is no longer needed so scopes, loggers, and other runtime resources are released deterministically.
