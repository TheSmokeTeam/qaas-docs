# Deploy a Mock

> TL;DR — Package a working mock as a container image and deploy it with the native Helm chart.

Once the mock works locally, package it as a container image and deploy it with a native Helm chart.

The finished chart lives alongside the sample project:

- [DummyAppMock (YAML)](https://github.com/TheSmokeTeam/DummyAppMock/tree/yaml_configuration)
- [DummyAppMock (Code)](https://github.com/TheSmokeTeam/DummyAppMock/tree/code_configuration)

## Build the Image

The project template already contains a Dockerfile. For a project named `DummyAppMock`, the final image can look like this:

```dockerfile
ARG DOTNET_SDK_IMAGE=mcr.microsoft.com/dotnet/sdk:10.0
ARG DOTNET_RUNTIME_IMAGE=mcr.microsoft.com/dotnet/runtime:10.0

FROM ${DOTNET_SDK_IMAGE} AS build
WORKDIR /src
COPY . .
ARG QAAS_NUGET_SOURCE_NAME=nuget_feed
ARG QAAS_NUGET_SOURCE_URL=https://api.nuget.org/v3/index.json
RUN dotnet nuget remove source "${QAAS_NUGET_SOURCE_NAME}" --configfile NuGet.config || true \
 && dotnet nuget add source "${QAAS_NUGET_SOURCE_URL}" --name "${QAAS_NUGET_SOURCE_NAME}" --configfile NuGet.config
RUN dotnet restore DummyAppMock.sln --configfile NuGet.config
RUN dotnet publish DummyAppMock/DummyAppMock.csproj -c Release -o /app/publish --no-restore

FROM ${DOTNET_RUNTIME_IMAGE}
WORKDIR /app
COPY --from=build /app/publish .
ENV QAAS_MOCKER_CONFIG=mocker.qaas.yaml
ENTRYPOINT ["sh", "-c", "exec dotnet DummyAppMock.dll \"$QAAS_MOCKER_CONFIG\""]
```

⚠️ Important

Build the project as part of the Docker image build, then push that finished runtime image to your registry. The deployed container should only pull the published image and start the already-built application. It should not compile the project during pod startup.

The Dockerfile keeps the SDK image, runtime image, NuGet source name, NuGet source URL, and mocker configuration file configurable. Use build arguments for values needed before `dotnet restore`, and use the `QAAS_MOCKER_CONFIG` environment variable when the same image should start a different mocker YAML file.

Build and push the image to your registry:

```bash
docker build -t ghcr.io/my-org/dummy-app-mock:1.0.0 .
docker push ghcr.io/my-org/dummy-app-mock:1.0.0
```

For a private feed or a custom image mirror:

```bash
DOTNET_SDK_IMAGE=registry.example.com/dotnet/sdk:10.0
DOTNET_RUNTIME_IMAGE=registry.example.com/dotnet/runtime:10.0
QAAS_NUGET_SOURCE_URL=https://nuget.example.com/v3/index.json

docker build -t ghcr.io/my-org/dummy-app-mock:1.0.0 \
  --build-arg DOTNET_SDK_IMAGE="${DOTNET_SDK_IMAGE}" \
  --build-arg DOTNET_RUNTIME_IMAGE="${DOTNET_RUNTIME_IMAGE}" \
  --build-arg QAAS_NUGET_SOURCE_URL="${QAAS_NUGET_SOURCE_URL}" \
  .
```

After the image is published, Kubernetes only needs to pull `ghcr.io/my-org/dummy-app-mock:1.0.0` and run it. Rebuilding is only needed when you publish a new image tag.

## Native Helm Chart

This chart deploys:

- the mocker container
- a Redis instance for the optional [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md)
- a service for the mocker HTTP endpoint

### `Chart.yaml`

```yaml
apiVersion: v2
name: dummy-app-mock
description: Helm chart for deploying a QaaS.Mocker quick-start project
type: application
version: 0.1.0
appVersion: "1.0.0"
```

### `values.yaml`

```yaml
mocker:
  replicaCount: 1
  image:
    repository: ghcr.io/my-org/dummy-app-mock
    tag: 1.0.0
    pullPolicy: IfNotPresent
  service:
    type: ClusterIP
    port: 80
  controller:
    serverName: DummyAppMock
  configFile: mocker.qaas.yaml

redis:
  image:
    repository: redis
    tag: 7-alpine
    pullPolicy: IfNotPresent
  service:
    type: ClusterIP
    port: 6379
```

### `templates/mocker-deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-mocker
spec:
  replicas: {{ .Values.mocker.replicaCount }}
  selector:
    matchLabels:
      app: {{ .Release.Name }}-mocker
  template:
    metadata:
      labels:
        app: {{ .Release.Name }}-mocker
    spec:
      containers:
        - name: mocker
          image: "{{ .Values.mocker.image.repository }}:{{ .Values.mocker.image.tag }}"
          imagePullPolicy: {{ .Values.mocker.image.pullPolicy }}
          ports:
            - containerPort: {{ .Values.mocker.service.port }}
          env:
            - name: QAAS_MOCKER_CONFIG
              value: {{ .Values.mocker.configFile | quote }}
            - name: Controller__ServerName
              value: {{ .Values.mocker.controller.serverName | quote }}
            - name: Controller__Redis__Host
              value: "{{ .Release.Name }}-redis:{{ .Values.redis.service.port }}"
```

### `templates/mocker-service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-mocker
spec:
  type: {{ .Values.mocker.service.type }}
  selector:
    app: {{ .Release.Name }}-mocker
  ports:
    - name: http
      port: {{ .Values.mocker.service.port }}
      targetPort: {{ .Values.mocker.service.port }}
      protocol: TCP
```

### `templates/redis-deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-redis
spec:
  replicas: 1
  selector:
    matchLabels:
      app: {{ .Release.Name }}-redis
  template:
    metadata:
      labels:
        app: {{ .Release.Name }}-redis
    spec:
      containers:
        - name: redis
          image: "{{ .Values.redis.image.repository }}:{{ .Values.redis.image.tag }}"
          imagePullPolicy: {{ .Values.redis.image.pullPolicy }}
          ports:
            - containerPort: {{ .Values.redis.service.port }}
```

### `templates/redis-service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-redis
spec:
  type: {{ .Values.redis.service.type }}
  selector:
    app: {{ .Release.Name }}-redis
  ports:
    - name: redis
      port: {{ .Values.redis.service.port }}
      targetPort: {{ .Values.redis.service.port }}
      protocol: TCP
```

## Deploy

```bash
helm upgrade --install dummy-app-mock ./chart
```

The mocker becomes reachable through the mocker service, and the [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md) connects to Redis through the injected `Controller__Redis__Host` environment variable.

## See also

- [Create a mock in YAML](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMock/index.md)
- [Create a mock in code](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMockCode/index.md)
- [Integrate with tests](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/integrateWithTests/index.md)
- [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
