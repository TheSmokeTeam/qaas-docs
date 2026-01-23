# Write Test With Yaml

Lets write tests for an application that uses `rabbitmq`.
That application's name is `DummyApp`.

The finished test project that will be written in this quick start tutorial can be found [here](REDA/examples/dummyapptests/). In addition a helm chart that deploys a `rabbitmq` that will work with this test project can be found [here](REDA/qaas-quickstart-dummyapp-helm-chart).

## Application spec

The application should withstand the following conditions

* Be `100%` hermetic, meaning for every input it receives an output is sent.

* Withstand an average rate of `50 msg/s`.

* Have an I/O delay of less than `5 seconds`.

* The application receives a json array as input and sends a json array with the same number of items in it as the received json array as output.

The details of the rabbitmq the application uses are

```txt
Host: rabbitmq
Port: 5672
UserName: admin
Password: admin
Input Exchange: input
Output Exchange: output
I/O Routing Key: /
```

## Creating Relevant Files

Now to write the test, first we open the cmd in the directory where we store all of our test projects.
Then we create a new dotnet project with the `qaas` project template.

```bat
dotnet new qaas.test -n DummyAppTests
```

This will create the following C# QaaS project directory and files

```txt
DummyAppTests/
|--NuGet.Config
|--DummyAppTests.sln
|--README.md
|--.gitignore
|--DummyAppTests/
|----DummyAppTests.csproj
|----Program.cs
|----test.qaas.yaml
|----Variables/
|------local.yaml
|------k8s.yaml
```

These files will contain basic required information and configurations for a QaaS test project which we can now expend on top of.

**NOTE** at this point of the tutorial we will ignore the `Variables` folder and its contents, we will come back to it later on in the [Make Test More Maintainable](makeTestMoreMaintainable.md) tutorial part.

For the purpose of this example we will assume we have X json samples already, in a folder called `TestData`. which we create under our test directory `DummyAppTests/DummyAppTests/`.

File structure after creating relevant files:

```txt
DummyAppTests/
|--NuGet.Config
|--DummyAppTests.sln
|--README.md
|--.gitignore
|--DummyAppTests/
|----DummyAppTests.csproj
|----Program.cs
|----test.qaas.yaml
|----Variables/
|------local.yaml
|------k8s.yaml
|----TestData/...
```

## Hooks And Plugins

**Hooks** are C# classes that are recognized by QaaS's framework.

There are 3 types of hooks relevant to a QaaS test project:

* `Generators` hooks used for generating data to send to the tested system and use throughout the test.
* `Assertions` hooks used for asserting if a test passes or fails.
* `Probes` hooks used for actions that done to setup or rollback the test.

These **Hooks** can be written in the QaaS test project and invoked by the `.yaml` file or code configuration, such hooks are automatically recognized by QaaS by their class names.

On the other hand **Hooks** can also be provided in a nuget package called a `Plugin`.

QaaS has 3 default `Plugins`, [QaaS.Common.Generators](REDA/v3/), [QaaS.Common.Assertions](REDA/v3/) and [QaaS.Common.Probes](REDA) that include within them a lot of commonly used generators, assertions and probe hooks, in this tutorial we will use some of the assertions offered by the `QaaS.Common.Assertions` package, some of the generators offered by the `QaaS.Common.Generators` and some of the probes offered by the `QaaS.Common.Probes` package in our test project.

To use them we need to add the `QaaS.Common.Assertions`, `QaaS.Common.Generators`, `QaaS.Common.Probes` nuget packages to our C# project in a version compatible with our `QaaS.Runner` version (a version of the packages that has the same `QaaS.Framework.SDK` version or newer (but not breaking) than the `QaaS.Runner` package)

`DummyAppTests.csproj`

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
</ItemGroup>
```

## Configuring The QaaS Yaml File

The tests themselves can be configured at the `test.qaas.yaml` file that can invoke and run `hooks`, which are pieces of code written in the C# project that perform a certain action used to test an application.

We will now see how to configure the `test.qaas.yaml` file for our tests.

### Initial configurations

The yaml file automatically generated in our QaaS project will contains a place to put our yaml anchors

`test.qaas.yaml`

```yaml
anchors: {}
```

### Configuring Data Sources

In order to take our json samples from the folder `TestData` and use them in the test we need to configure a data source.
a `data source` is a way to provide data to the tests, its based on a `Generator` hook that it runs in order to create an enumerable of data.

In our case we need a `Generator` hook that can take raw data from a folder, such a generator exists in the `QaaS.Common.Generators` plugin and is called `FromFileSystem`, we can use it because we added the `QaaS.Common.Generators` plugin to our project.

We also need to give the data source a name so we can reference it in the future, we will give it the name of the folder it came from combined with its generator `FromFileSystemTestData` (we can give it any name, we want it to be as indicative as possible).

```yaml
DataSources:
  - Name: FromFileSystemTestData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: TestData
```

### Configuring The Sessions

Now that we have our test data prepared we need to publish it to the `input` exchange and consume the application's output from the `output` exchange, for that we configure a session.

That session also needs a name so we can reference it in the future, we will give it a name comprised of the name of the data source used combined with the protocol used - `RabbitMqExchangeWithFromFileSystemTestData`.

The session needs a rabbitmq publisher with a policy controlling its publishing rate so its the average rate the application is supposed to withstand, 50 msg/s.
And it needs a rabbitmq consumer listening to the output exchange simultanously.

Since we only have 1 publisher and 1 consumer we can simple name them `Publisher` and `Consumer` so its easy to reference them.

`RabbitMqExchange` is a protocol that recieves `byte[]` **serialized** data when publishing to it and returns `byte[]` **serialized** data when consuming from it, our data source's data is already serialized since we didn't specify any `Deserializer` when loading it.
Meaning we only need to specify the `Deserializer` to use when consuming the output data from the `output` exchange as `Json`.

```yaml
Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
    Publishers:
      - Name: Publisher
        DataSourceNames: [FromFileSystemTestData]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq: 
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json
```

### Configuring The Assertions

Now that we have our sessions configured we want to perform assertions on the data they give us, for that we need to configure the `Assertions` section.

We want to assert that our application was 100% hermetic during the session `RabbitMqExchangeWithFromFileSystemTestData`, for that we have a hermetic assertion called `HermeticByInputOutputPercentage` and its one of the common assertions we can use because we added `QaaS.Common.Assertions` as a plugin in our project.

```yaml
Assertions:
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
```

We also want to assert that our application's delay was less than 5 seconds, for that we have a delay assertion called `DelayByChunks` which checks the delay between chunks of inputs and outputs. Its one of the common assertions we can use because we added `QaaS.Common.Assertions` as a plugin in our project. we will add that assertion to the assertion list like so:

```yaml
  - Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
```

## Yaml Configuration File Validation

### Configuration File Overview

After configuring all the sections above we now have a qaas test yaml file that looks like this

`test.qaas.yaml`

```yaml
anchors: {}

DataSources:
  - Name: FromFileSystemTestData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: TestData

Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
    Publishers:
      - Name: Publisher
        DataSourceNames: [FromFileSystemTestData]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq:   
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json

Assertions:
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  - Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
```

```txt
DummyAppTests/
|--NuGet.Config
|--DummyAppTests.sln
|--README.md
|--.gitignore
|--DummyAppTests/
|----DummyAppTests.csproj
|----Program.cs
|----test.qaas.yaml
|----Variables/
|------local.yaml
|------k8s.yaml
|----TestData/...
```

### Templating

If we want to see all the default values qaas has loaded in our configuration file we can template it, to do that we open the terminal in the directory `DummyAppTests/DummyAppTests/` and type

```bat
dotnet run -- template test.qaas.yaml
```

which will give us the qaas yaml configuration file as it looks after being loaded by qaas and given default values/changed (:warning: **Note** that the generated template file might not be runnable or valid).

If the configurations are **invalid** the `qaas template` command will throw a fatal log but still continue to template what it can of the configuration file.
