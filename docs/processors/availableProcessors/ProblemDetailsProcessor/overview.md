---
id: processors.available.problemdetailsprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, ProblemDetailsProcessor, ProcessorConfiguration]
summary: "Returns an RFC 7807 style problem-details JSON response using the configured status and fields."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\ProblemDetailsProcessor.cs -->

# ProblemDetailsProcessor

> TL;DR: Returns an RFC 7807 style problem-details JSON response using the configured status and fields.

Returns an RFC 7807 style problem-details JSON response using the configured status and fields.

## What It Does {: #what-it-does}

Builds a problem-details style JSON response with a title, type, detail, instance, status code, and optional extension fields.

It is useful for returning standardized error payloads without custom code, especially when you want failures to look like HTTP API validation or domain errors.

## Minimal example {: #minimal-example}

```yaml
Stubs:
  - Name: ProblemDetailsProcessorStub
    Processor: ProblemDetailsProcessor

    ProcessorConfiguration:
      ContentType: application/problem+json
      StatusCode: 422
      Title: Validation failed
      Type: https://docs.example.com/problems/validation
      Detail: orderId is required
      UseRequestUriAsInstance: true

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: ProblemDetailsProcessorStub
```

## Realistic example {: #realistic-example}

This example returns an RFC 7807-style response describing a validation error. The processor sets the problem type, title, detail, and status code.

Because `UseRequestUriAsInstance` is enabled, the request URI is copied into the problem `instance` field automatically.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
