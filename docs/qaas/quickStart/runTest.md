# Run Test

Start RabbitMQ first, then run the Runner sample from the `DummyAppTests/DummyAppTests` directory.

```bash
docker run --rm -d --name qaas-runner-rabbit \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=admin \
  rabbitmq:4-management
```

## YAML Sample

```bash
dotnet run -- run test.qaas.yaml
```

## Code Sample

```bash
dotnet run -- run test.qaas.yaml
```

## Output

Both variants write execution artifacts to `allure-results`. If you have the Allure CLI installed, you can serve the report locally:

```bash
allure serve
```
