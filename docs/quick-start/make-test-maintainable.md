# Keep Tests Maintainable

The maintainable pattern in QaaS is:

1. keep logic in one base test file
2. move environment-specific values into variables or overwrite files
3. use cases for test variants, not for secrets or endpoint drift

## Anchors

Use plain YAML anchors to remove structural duplication.

```yaml
anchors:
  rabbitMq: &rabbitMq
    Host: ${variables:rabbitmq:Host}
    Username: ${variables:rabbitmq:Username}
    Password: ${variables:rabbitmq:Password}
    Port: ${variables:rabbitmq:Port}
    RoutingKey: /
```

Rule of thumb: anchor repeated objects, not single scalar values.

## Placeholders

QaaS resolves placeholders from configuration data and, unless `--no-env` is used, from environment variables too.

```yaml
variables:
  rabbitmq:
    Host: localhost
    Port: 5672

Sessions:
  - Name: SessionA
    Publishers:
      - Name: Publisher
        RabbitMq:
          Host: ${variables:rabbitmq:Host}
          Port: ${variables:rabbitmq:Port}
```

## Overwrite Files

Use `-w` for environment overlays.

`test.qaas.yaml`

```yaml
variables:
  rabbitmq:
    Host: localhost
    Port: 5672
```

`Variables/k8s.yaml`

```yaml
variables:
  rabbitmq:
    Host: rabbitmq
    Port: 5672
```

Run with the overlay:

```powershell
dotnet run -- run test.qaas.yaml -w Variables/k8s.yaml
```

Overwrite files are applied in the order you pass them.

## Cases

Cases are configuration overlays that fan one base test into many runs.

`Cases/stress.yaml`

```yaml
Sessions:
  0:
    Publishers:
      0:
        Policies:
          - LoadBalance:
              Rate: 100
          - Count:
              Count: 1000
```

Run all cases in a folder:

```powershell
dotnet run -- run test.qaas.yaml -w Variables/local.yaml -c Cases
```

Run only selected cases:

```powershell
dotnet run -- run test.qaas.yaml -c Cases -n Cases/stress.yaml
```

## Resolution Order

Default order from `ContextBuilder`:

1. base configuration file
2. overwrite files
3. case file
4. command-line overwrite arguments
5. pushed references
6. environment-variable enrichment, unless `--no-env`

If you pass `--resolve-cases-last`, the case overlay moves after references.

## Practical Naming

- Name data sources by what they provide, not by the hook class.
- Name sessions by protocol plus intent.
- Name assertions by the behavior they enforce.
- Keep case filenames stable; they become report grouping identifiers.
