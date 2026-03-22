# Architecture

QaaS.Mocker has a small runtime surface, but the execution path is structured. Configuration is loaded first, then converted into a runtime graph of data sources, stubs, servers, and the optional controller.

## Runtime Flow

1. **Bootstrap** loads configuration from YAML, code, overwrite files, overwrite arguments, and environment variables.
2. **Execution building** resolves `DataSources`, `Stubs`, `Servers`, and `Controller` into in-memory runtime objects.
3. **Server startup** creates the configured HTTP, gRPC, or socket listeners.
4. **Request handling** matches the incoming request to an endpoint action, resolves the target stub, and runs its processor.
5. **Response shaping** returns the `Data<object>` produced by the processor as protocol-specific output.

## Main Building Blocks

### DataSources

Data sources are optional inputs for a stub. They usually come from generators such as `FromFileSystem`, but they can also be built in code. A processor can read one or more named data sources and decide which generated item becomes the response payload.

### Stubs

A stub is the reusable response unit in Mocker. It binds together:

- the processor name
- the optional processor configuration
- the optional list of data-source names

Multiple endpoints can reuse the same stub, which keeps response logic centralized even when the same payload is exposed through several routes.

### Servers

The preferred runtime model is `Servers`, a list where each item can host one protocol configuration. In practice that means one mocker process can expose several HTTP servers, several gRPC servers, or a mixture of protocols at the same time.

For HTTP, the path is:

`Server -> Endpoint -> Action -> TransactionStubName -> Processor`

For gRPC and socket servers the same idea applies, but the routing key is the RPC method or socket behavior instead of an HTTP route.

### Processors

Processors are the code that actually creates the response. They receive:

- the resolved stub data sources
- the incoming request body and metadata

They return a `Data<object>` with body and metadata that Mocker translates into the outgoing protocol response. This is why processors are the core extension point in the mocker runtime.

### Controller

The controller is optional. When enabled, it adds a Redis-backed coordination surface that Runner sessions or other automation can use to switch stubs, trigger runtime actions, or consume cached runtime data. Local quick starts can ignore it, but deployment scenarios often enable it.

## Why The Model Scales

The architecture stays stable as a mock grows:

- add more data without rewriting routes by expanding data sources
- reuse response logic by pointing many actions at one stub
- swap YAML and code configuration without changing runtime semantics
- move from local execution to container or Helm deployment without changing the core mock design
