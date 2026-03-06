# Deploy Mock

Now that the mock exists, the next step is to package and deploy it in the same environment as the test or in a shared integration environment.

## Build An Image

The project template includes a `Dockerfile`. The exact base images and registry path depend on your environment, but the flow is always the same:

1. restore packages with the same `NuGet.Config` your team uses for QaaS packages
2. build and publish the mocker project
3. package the published output into a container image
4. push that image to the registry your cluster can reach

## Deploy With Helm Or An Existing Chart

Most teams deploy the mock together with a Redis or KeyDB instance when they need the optional controller flow.

At minimum, the deployment needs:

- the mocker container image
- a service that exposes the mocker port
- environment-specific config such as certificates, Redis host, or mounted data files

If you use Helm, treat the mock like any other application workload:

- set the image repository and tag
- expose the required service port
- add Redis or KeyDB only when the `Controller` section is enabled

## Recommended Validation Steps

Before wiring the mock into a full test suite:

1. deploy the image
2. call the exposed endpoint directly
3. confirm the expected status code and body
4. only then connect the runner side through `MockerCommands` or direct protocol calls

This keeps deployment debugging separate from test debugging.
