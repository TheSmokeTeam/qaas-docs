# Integrate with Tests

In some scenarios you want the test and the mock to coordinate while both are running. That is what the optional `Controller` section is for.

The controller is the interface between `QaaS.Runner` tests and `QaaS.Mocker` servers. Both sides connect to Redis or KeyDB. The runner can then send named mocker commands that switch stubs, trigger behaviors, or consume captured data.

## Configure the Controller

Add a server name and a Redis connection:

```yaml
Controller:
  ServerName: MockerExample
  Redis:
    Host: localhost
    Port: 6379
```

## When To Use It

Use the controller when:

- one test needs the mock to change behavior mid-run
- you want to expose multiple stub variants and switch between them on demand
- the test should trigger mock-side behavior instead of relying only on static endpoint mapping

If the mock never changes during the test, keep the controller section out and use a simpler static mock configuration.
