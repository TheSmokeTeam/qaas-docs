# Assertions: Links

This page mirrors the `Links` section from [Assertions](../assertions.md).

## `CreateLink`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.CreateLink(LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder CreateLink(LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Creates or adds the configured link entry on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `ReadLinks`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.ReadLinks()`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public IReadOnlyList<LinkBuilder> ReadLinks()
    ```
    
    **Docstring**
    
    Returns the configured links currently stored on the Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. Use it to inspect the current configured state without rebuilding the surrounding collection or runtime object graph.

## `UpdateLink`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.UpdateLink(string name, LinkBuilder linkBuilder)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder UpdateLink(string name, LinkBuilder linkBuilder)
    ```
    
    **Docstring**
    
    Updates the configured link stored on the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `DeleteLink`

??? info "Source file, signature, and docstring"
    **Member**
    `AssertionBuilder.DeleteLink(string name)`
    
    **Kind** `function`
    
    **Declaring Type** `AssertionBuilder`
    
    **Source File** `QaaS.Runner.Assertions/ConfigurationObjects/AssertionBuilder.cs`
    
    **Signature**
    ```csharp
    public AssertionBuilder DeleteLink(string name)
    ```
    
    **Docstring**
    
    Removes the configured link from the current Runner assertion builder instance.
    
    Use this method when working with the documented Runner assertion builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.
