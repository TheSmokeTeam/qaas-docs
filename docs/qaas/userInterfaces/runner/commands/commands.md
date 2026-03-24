# Commands

A QaaS Runner project is a C# .NET project that receives additional CLI commands as part of its execution, controlling how it runs.

!!! Tip
    To see all available commands and all relevant information about them, you can use the '--help' flag -
    1. Without any command to see all available commands:
    ```bash
    dotnet run -- --help
    ```
    2. With a specific command to see all information about it:
    ```bash
    dotnet run -- <qaas-command> --help
    ```
    3. With a specific command and its flags to see all information about it and its flags:
    ```bash
    dotnet run -- <qaas-command> <qaas-command-flags> --help
    ```
    Also - You can look at the dedicated page for each command in the documentation. (There are tables with all the information about the positional arguments and flags).

To run the QaaS project with any of its commands, the following syntax is required:

```bash
dotnet run <dotnet-parameters> -- <qaas-command>
```

## Available Commands

| Command                     | Description                                                                                                                                                                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`act`](./act.md)           | Run a qaas test without the assertions and save all sessionData.                                                                                                                                                                            |
| [`assert`](./assert.md)     | Run a qaas test with only the assertions on already existing sessionData.                                                                                                                                                                   |
| [`execute`](./execute.md)   | Executes a yaml execution file that contains a list of other commands to execute in a sequential order. The flags of all commands in the execution file that can also be given in the execute command ('s', 'e', 'l', 'g') will be ignored. |
| [`run`](./run.md)           | Run a qaas test according to the given configurations.                                                                                                                                                                                      |
| [`template`](./template.md) | Template a qaas configuration file to see how it looks after being loaded, will template what it can even if the configuration file is invalid.                                                                                             |
