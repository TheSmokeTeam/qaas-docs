# execute

The `execute` command runs multiple [Runner commands](commands.md) sequentially within a single test execution.

!!! Note
When running QaaS Runner Commands using the execute command, each QaaS Runner Command
will receive an ID that will be used to identify it in the logs and allure-results.

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- execute --help
```

This command will display all available options for the execute command, including flags and values.

## Configurations

The `execute` command uses a YAML configuration file to know which commands to run.

:warning: The commands in the YAML file are `QaaS Commands` there is **no** need to use **dotnet run** in them.

### YAML View

```yaml
Commands:
  - Command:
    Id:
    Parallel:
```

### Table View

| Property Path         | Type                                | Required | Default | Description                                                                                                                        |
|:----------------------|:------------------------------------|:---------|:--------|:-----------------------------------------------------------------------------------------------------------------------------------|
| `Commands`            | `array`  (`length` >= `1`)          | &#10004  |         | The list of QaaS commands to execute in the order they will be executed                                                            |
| `Commands[]`          | `object`                            | &#10004  |         |                                                                                                                                    |
| `Commands[].Command`  | `string`                            | &#10004  |         | The QaaS command to execute                                                                                                        |
| `Commands[].Id`       | `string` (`100` >= `length` >= `1`) | &#10004  |         | A unique identifier to identify the command by                                                                                     |
| `Commands[].Parallel` | `boolean`                           | &#10006  | false   | Whether to run this command in parallel with other commands coming before and after it that are also set to run in parallel or not |
