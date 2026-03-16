# Stubs

Stubs are the units of mock behavior executed by server actions. Each stub binds a unique name to an `ITransactionProcessor` hook and can optionally consume one or more configured data sources.

A server action references a stub by `TransactionStubName`. The processor then decides how the incoming request data is transformed into the mock response or collected output.
