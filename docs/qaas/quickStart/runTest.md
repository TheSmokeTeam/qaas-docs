# Run Test

Start RabbitMQ first, then create the `input` and `output` exchanges used by the DummyApp quick starts. For the local smoke check, bind `input` to `output` so the same sample can publish, observe the response path, and verify assertions without needing a separate application process yet.

```bash
docker run --rm -d --name qaas-runner-rabbit \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=admin \
  rabbitmq:4-management

docker exec qaas-runner-rabbit rabbitmqadmin -u admin -p admin --non-interactive \
  exchanges declare --name input --type direct --durable true

docker exec qaas-runner-rabbit rabbitmqadmin -u admin -p admin --non-interactive \
  exchanges declare --name output --type direct --durable true

docker exec qaas-runner-rabbit rabbitmqadmin -u admin -p admin --non-interactive \
  bindings declare --source input --destination-type exchange --destination output --routing-key /
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
