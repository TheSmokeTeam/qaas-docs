# Deploy a Mock

Now that the mock server is created, deploy it for use in tests. Most deployments start by building a container image.

## Mock Server Image

Our project already contains a `dockerfile` which looks like this:

```dockerfile
FROM REDA/dotnet8.0/alpine:1.1.0 AS build-env
COPY . /app
WORKDIR /app
RUN dotnet restore --configfile NuGet.config
WORKDIR # PlaceHolder 
CMD ["dotnet", "build", "--help"]
```

We just need to push it to the artifactory, we can do it in CI by filling the missing variables the `.gitlab-ci.yml` and in the `dockerfile`

```yaml
variables:
  DOCKER_DESTINATION_PATH: REDA/mockers
  DOCKER_IMAGE_NAME: dummy-app-mocker
```

## Mocker Image And Redis by Helm Common

Now that we have our mock image, we can deploy our mocker by adding the image and a redis to chart as a [helm-common](REDA) dependencies.

### Configuring Chart.yaml

We add the mocker server and redis as a helm-common dependencies

```yaml
apiVersion: v2
name: my-chart
version: 0.1.0

helmCommonStableVersion: &helmCommonStableVersion x.x.x
dependencies:
  - alias: mocker
    name: helm-common
    version: *helmCommonStableVersion
    repository: REDA

  - alias: redis
    name: helm-common
    version: *helmCommonStableVersion
    repository: REDA
```

### Configuring values.yaml

We configure our mocker and redis in `values.yaml`, for our mocker dependency we configure the mocker's image

We can override the mocker's running command by configuring `mocker.deployment.command`

```yaml

mocker:
  nameOverride: mocker
  service:
    enabled: true
    type: NodePort
    ports:
      - protocol: TCP
        port: 8080
  deployment:
    image:
      repository: REDA/dummy-app-mocker
      tag: x.x.x
    command: dotnet run --no-restore
    
redis:
  deployment:
    imagePullPolicy: Always
    replicas: 1
    image:
      repository: REDA/keydb
      tag: bitnami-debian-12-r7
    env:
        ALLOW_EMPTY_PASSWORD: true  
  service: 
    enabled: true
    type: NodePort
    ports:
    - name: redis
      protocol: TCP
      port: 6379
  volumeMount:
    enabled: true
    path: /data
  persistentVolume:
    enabled: true
    storage: 1Gi
    accessMode: ReadWriteOnce   
```

## Mocker Image and Redis by QaaS.Applications.Chart

not implemented yet 😔

```csharp
throw new NotImplementedException()
```
