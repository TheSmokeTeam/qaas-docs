# ConditionalResponseProcessor

Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches.

> Logical group: Data-driven responses / Conditional routing

## What It Does

Evaluates the configured rules in order and returns the response from the first rule whose request-header or path-parameter condition matches the incoming request.

If no rule matches, it falls back to the configured default response. This makes it useful for lightweight branching behavior without writing custom processor code.

## YAML Example

```yaml
Stubs:
  - Name: ConditionalResponseProcessorStub
    Processor: ConditionalResponseProcessor

    ProcessorConfiguration:
      DefaultContentType: text/plain; charset=utf-8
      DefaultStatusCode: 404
      DefaultBody: route not found
      Rules:
        - RequestHeaderName: X-Mode
          ExpectedValue: advanced
          ContentType: text/plain; charset=utf-8
          StatusCode: 202
          ResponseBody: advanced mode enabled

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: ConditionalResponseProcessorStub
```

## What This Configuration Does

This stub checks the incoming `X-Mode` request header first. If the header value is `advanced`, it returns `202` and the text body `advanced mode enabled`.

If the header is missing or has a different value, the rule does not match and the processor falls back to the default `404` response with the body `route not found`.
