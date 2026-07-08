---
id: qaas.functions.extension.methods.sections.runner.case.expansion
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [runner]
keywords: [runner, reference]
summary: "Reference page for Extension Methods: Runner case expansion."
---

<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\ContextArtifactExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Infrastructure\DateTimeExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\DetailedDataExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Extensions\SessionExtensions.cs -->
<!-- Verified-against: QaaS.Runner\QaaS.Runner\Cases\RunnerCaseExpansionExtensions.cs -->

# Extension Methods: Runner case expansion

> TL;DR — This page mirrors the `Runner case expansion` section from [Extension Methods](../extension-methods.md) as a focused reference.

## When to use {: #when-to-use}

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage {: #c-cac-usage}

### `ExtractBaseBuilder` {: #extractbasebuilder}

??? info "Source file, signature, and docstring"
    **Member**
    `RunnerCaseExpansionExtensions.ExtractBaseBuilder(this Runner runner, int index = 0, Action<ExecutionBuilder>? setupBase = null)`
    
    **Kind** `function`
    
    **Declaring Type** `RunnerCaseExpansionExtensions (extension type)`
    
    **Source File** `QaaS.Runner/Cases/RunnerCaseExpansionExtensions.cs`
    
    **Signature**
    ```csharp
    public static ExecutionBuilder ExtractBaseBuilder(this Runner runner, int index = 0, Action<ExecutionBuilder>? setupBase = null)
    ```
    
    **Docstring**
    
    Extracts a single execution builder (by position) to serve as a base for case expansion. Only the selected builder is removed from the Runner; any other builders created by Bootstrap.New are left in place so they can keep running alongside the generated cases.

### `ExtractBaseBuilder` {: #extractbasebuilder-2}

??? info "Source file, signature, and docstring"
    **Member**
    `RunnerCaseExpansionExtensions.ExtractBaseBuilder(this Runner runner, Action<ExecutionBuilder> setupBase)`
    
    **Kind** `function`
    
    **Declaring Type** `RunnerCaseExpansionExtensions (extension type)`
    
    **Source File** `QaaS.Runner/Cases/RunnerCaseExpansionExtensions.cs`
    
    **Signature**
    ```csharp
    public static ExecutionBuilder ExtractBaseBuilder(this Runner runner, Action<ExecutionBuilder> setupBase)
    ```
    
    **Docstring**
    
    Extracts the first execution builder to serve as a base and applies the supplied configuration block.

### `AddTestCases` {: #addtestcases}

??? info "Source file, signature, and docstring"
    **Member**
    `RunnerCaseExpansionExtensions.AddTestCases(this Runner runner, ExecutionBuilder baseBuilder, params ITestCase[] cases)`
    
    **Kind** `function`
    
    **Declaring Type** `RunnerCaseExpansionExtensions (extension type)`
    
    **Source File** `QaaS.Runner/Cases/RunnerCaseExpansionExtensions.cs`
    
    **Signature**
    ```csharp
    public static Runner AddTestCases(this Runner runner, ExecutionBuilder baseBuilder, params ITestCase[] cases)
    ```
    
    **Docstring**
    
    Adds builders cloned from the provided base builder, one per test case, with each case's configuration applied.

## Edge cases {: #edge-cases}

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also {: #see-also}

- [Extension Methods](../extension-methods.md)
