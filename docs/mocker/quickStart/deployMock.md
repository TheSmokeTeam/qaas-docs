# Deploy a Mock

Most QaaS mocker projects are deployed as container images. The current template and example project both ship with a multi-stage `Dockerfile` that restores, publishes, and starts the app with `mocker.qaas.yaml`.

## Build an Image

```bash
docker build -t my-qaas-mocker .
```

## Run the Container Locally

For the template's default `/health` mock:

```bash
docker run --rm -p 8080:8080 my-qaas-mocker
```

If your configuration exposes different ports or multiple servers, publish those ports instead.

## Example Helm Chart

The `QaaS.Mocker.Example` project includes a Helm chart under `QaaS.Mocker.Example/Chart` that deploys:

- the example mocker workload
- KeyDB / Redis
- RedisInsight

Treat that chart as a working example for the sample project. The project template itself currently ships only the Dockerfile.
