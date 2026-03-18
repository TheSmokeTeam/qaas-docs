# Create a Mock

Let's create a simple HTTP mock server. The finished mock is available [here](REDA/dummy-app-mock).

## Mock Spec

The mock server needs to satisfy the following conditions:

* Run on port 80
* `Get` request on path `/data/` returns some json data from the internal mock server data

## Creating Relevant Files

Now to create the mock, first we open the cmd in the directory where we store our mock project. Then we create a new dotnet project with the `qaas` project template.

```bash
dotnet new qaas.mocker -n DummyAppMock
```

This will create the following C# QaaS Mocker project directory and files

```txt
DummyAppMock/
|--NuGet.Config
|--DummyAppMock.sln
|--README.md
|--Dockerfile
|--.gitlab-ci.yml
|--.gitignore
|--DummyAppMock/
|----DummyAppMock.csproj
|----Program.cs
|----mocker.qaas.yaml
|----ServerData/...
```

These files will contain basic required information and configurations for a QaaS Mocker project which we can now expend on top of.

For the purpose of this example we will assume we have X json samples already, in a folder called `ServerData`. which we create under the directory `DummyAppMock/DummyAppMock/`.

## Hooks And Plugins

`QaaS.Mocker` introduces additional type of `hook` called `processors`. Further explanation on hooks can be found [here](../../qaas/quickStart/writeHooks.md).

`processors` hooks give the mock server logic to execute on a specific endpoint request.

These **Hooks** can be written in the QaaS mocker project and invoked by the `.qaas.yaml` file, such hooks are automatically recognized by the **YAML** file by their class names.

On the other hand **Hooks** can also be provided in a nuget package called a `Plugin`.

QaaS provides a default processors `Plugin`, [QaaS.Common.Processors]({{ links.repository_processors }}) that includes commonly used processors and assertion hooks.

To use them we need to add the `QaaS.Common.Processors` and `QaaS.Common.Generators` nuget packages to our C# project in a version compatible with our `QaaS.Mocker` version

`DummyAppMock.csproj`

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
</ItemGroup>
```

## Creating Custom Processors

Our mock sever needs to have some behaviours which will be triggered on a specific endpoint. These behaviours are called `stubs`.

Every `stub` is based on a `Processor` hook that processes a given request.

A processor is a `C# class` that implements the interface `IProcessor` from the `QaaS.SDK` package.
Different servers requires different processor types. In our case, `http` server requires processors of type `TransactionProcessor` which are classes that implemets `ITransactionProcessor` interface.

The `ITransactionProcessor` inherits from the `IProcessor` interface and has a `Process` function that receives a request and returns the corresponding response.

In order to create a custom `TransactionProcessor` we use the `BaseTransactionProcessor` class and extend it with our processor, the `BaseTransactionProcessor` class receives a generic type when extending it, that generic type is an object that represents the configurations our processor expects with their own Data Annotations used to validate the passed configurations.

In our case, we need to define a stub that uses a `data source` and returns items from it

The first and second stub can actually be implemented by the same `processor`.

## Configurating The QaaS Mocker Yaml File

All the mock behaviours are configured at the `mocker.qaas.yaml` file that can invoke and run `hooks`.

We will now see how to configure the `mocker.qaas.yaml` file for our mocks.

### Initial configurations

The YAML file automatically generated in our QaaS Mocker project contains every mocker configuration section:
`mocker.qaas.yaml`

```yaml
DataSources: []

Stubs: []

Controller: 
  ServerName: PlaceHolderName
  Redis: {}

Server:
  Type: Http 
  Http: 
    Port: 8080
    Endpoints: []
```

### Configuring Data Sources

In order for the mocker to use the data located in `ServerData` we need to configure a data source.
a `data source` is a way to provide data to the mocks, its based on a `Generator` hook that it runs in order to create an enumerable of data.

In our case we need a `Generator` hook that can take raw data from a folder, such a generator exists in the `QaaS.Common.Generators` plugin and is called `FromFileSystem`, we can use it because we added the `QaaS.Common.Generators` plugin to our project.

We also need to give the data source a name so we can reference it in the future, we will give it the name of the folder it came from combined with its generator `FromFileSystemServerData` (we can give it any name, we want it to be as indicative as possible).

```yaml
DataSources:
  - Name: FromFileSystemServerData
    Generator: FromFileSystem
    GeneratorSpecificConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: ServerData
```

### Configuring Stubs

Now that we have our data prepared we need to define behaviours that our mock server will use later on. Those behaviours are called stubs.

In our case we need a processor that returns data from given data sources, such a processor exists in the `QaaS.Common.Processors` plugin and is called `TransactionFromDataSources`. We can use it because we added the `QaaS.Common.Processors` plugin to our project.

We need to pass to it the `data source` defined above. We also need to give the data source a name so we can reference it in the future.

```yaml
Stubs:
  - Name: ServerDataStub
    Processor: TransactionFromDataSources
    DataSourceNames: [ FromFileSystemServerData ]
```

### Configuring Server

Now that we have defined our behaviours, we configure the server by linking stubs to endpoints.

We need the server to run on port 80 and our `ServerDataStub` to execute on a `Get` request at `/data/`:

```yaml
Server:
    Type: Http
    Http:
        Port: 80
        EndPoints:
          - Path: /data/
            Actions:
            - Name: DataFromFileSystemAction
              Method: Get
              TransactionStubName: ServerDataStub
```

We defined the server with an `Action` by the name of `DataFromFileSystemAction`. An action is the combination of `Method` and `Stub` in a given `Path`. `DataFromFileSystemAction` is the action relevant to a `Get` request to the path `/data/` and it tells the server to use the `ServerDataStub`

## Yaml Configuration File Validation

### Configuration File Overview

After configuring all the sections above we now have a qaas mocker yaml file that looks like this

`mocker.qaas.yaml`

```yaml
DataSources:
  - Name: FromFileSystemServerData
    Generator: FromFileSystem
    GeneratorSpecificConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: ServerData

Stubs:
  - Name: ServerDataStub
    Processor: TransactionFromDataSources
    DataSourceNames: [ FromFileSystemServerData ]

Server:
    Type: Http
    Http:
        Port: 80
        EndPoints:
          - Path: /data/
            Actions:
            - Name: DataFromFileSystemAction
              Method: Get
              TransactionStubName: ServerDataStub
```

```txt
DummyAppMock/
|--NuGet.Config
|--DummyAppMock.sln
|--README.md
|--Dockerfile
|--.gitlab-ci.yml
|--.gitignore
|--DummyAppMock/
|----DummyAppMock.csproj
|----Program.cs
|----mocker.qaas.yaml
|----ServerData/...
```
