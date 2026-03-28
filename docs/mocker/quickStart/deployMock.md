# Deploy a Mock

Once the mock works locally, package it as a container image and deploy it with a native Helm chart.

The finished chart lives alongside the sample project:

- [DummyAppMock (YAML)]({{ links.repository_mocker_quickstart_yaml }})
- [DummyAppMock (Code)]({{ links.repository_mocker_quickstart_code }})

## Build the Image

The project template already contains a Dockerfile. For a project named `DummyAppMock`, the final image can look like this:

```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore DummyAppMock.sln --configfile NuGet.config
RUN dotnet publish DummyAppMock/DummyAppMock.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/runtime:10.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "DummyAppMock.dll", "mocker.qaas.yaml"]
```

!!! warning "⚠️ Important"
    Build the project as part of the Docker image build, then push that finished runtime image to your registry. The deployed container should only pull the published image and start the already-built application. It should not compile the project during pod startup.

Build and push the image to your registry:

```bash
docker build -t ghcr.io/my-org/dummy-app-mock:1.0.0 .
docker push ghcr.io/my-org/dummy-app-mock:1.0.0
```

After the image is published, Kubernetes only needs to pull `ghcr.io/my-org/dummy-app-mock:1.0.0` and run it. Rebuilding is only needed when you publish a new image tag.

## Native Helm Chart

This chart deploys:

- the mocker container
- a Redis instance for the optional controller
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

{% raw %}
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
            - name: Controller__ServerName
              value: {{ .Values.mocker.controller.serverName | quote }}
            - name: Controller__Redis__Host
              value: "{{ .Release.Name }}-redis:{{ .Values.redis.service.port }}"
```
{% endraw %}

### `templates/mocker-service.yaml`

{% raw %}
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
{% endraw %}

### `templates/redis-deployment.yaml`

{% raw %}
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
{% endraw %}

### `templates/redis-service.yaml`

{% raw %}
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
{% endraw %}

## Deploy

```bash
helm upgrade --install dummy-app-mock ./chart
```

The mocker becomes reachable through the mocker service, and the controller connects to Redis through the injected `Controller__Redis__Host` environment variable.
