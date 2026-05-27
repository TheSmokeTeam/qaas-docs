---
id: qaas.functions.builders.consumers.sections.general
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [runner, qaas, functions, builders, consumers, sections, general]
summary: "Reference page for Consumers: General."
---
<!-- Verified-against: QaaS.Runner\QaaS.Runner.Sessions\Actions\Consumers\Builders\ConsumerBuilderLogic.cs -->

# Consumers: General

> TL;DR: Reference page for Consumers: General.

This page mirrors the `General` section from [Consumers](../consumers.md).

## `FilterData` {: #filterdata}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.FilterData(DataFilter dataFilter)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder FilterData(DataFilter dataFilter)
    ```
    
    **Docstring**
    
    Sets the data filter used by the current Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## `Configure` {: #configure}

??? info "Source file, signature, and docstring"
    **Member**
    `ConsumerBuilder.Configure(IReaderConfig config)`
    
    **Kind** `function`
    
    **Declaring Type** `ConsumerBuilder`
    
    **Source File** `QaaS.Runner.Sessions/Actions/Consumers/Builders/ConsumerBuilderLogic.cs`
    
    **Signature**
    ```csharp
    public ConsumerBuilder Configure(IReaderConfig config)
    ```
    
    **Docstring**
    
    Sets the configuration currently stored on the Runner consumer builder instance.
    
    Use this method when working with the documented Runner consumer builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
