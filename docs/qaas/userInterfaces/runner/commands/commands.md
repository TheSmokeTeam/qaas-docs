<!-- generated hash:95eed8c3e1ad sources:Runner, cli-overview -->

# Commands

Running without a command currently prints:

```text
ERROR(S):
  No verb selected.
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  run         Run a qaas test according to the given configurations.

  act         Run a qaas test without the assertions and save all sessionData.

  assert      Run a qaas test with only the assertions on already existing sessionData.

  template    Template a qaas configuration file to see how it looks after being loaded, will template what it can even
              if the configuration file is invalid.

  execute     Executes a yaml execution file that contains a list of other commands to execute in a sequential order.
              The flags of all commands in the execution file that can also be given in the execute command ('s', 'e',
              'l', 'g') will be ignored.

  help        Display more information on a specific command.

  version     Display version information.
```

## Available Commands

| Command | Description |
| ------- | ----------- |
| `act` | Run a qaas test without the assertions and save all sessionData. |
| `assert` | Run a qaas test with only the assertions on already existing sessionData. |
| `execute` | Executes a yaml execution file that contains a list of other commands to execute in a sequential order. The flags of all commands in the execution file that can also be given in the execute command ('s', 'e', 'l', 'g') will be ignored. |
| `run` | Run a qaas test according to the given configurations. |
| `template` | Template a qaas configuration file to see how it looks after being loaded, will template what it can even if the configuration file is invalid. |

See the dedicated command pages for the full positional argument and flag reference.
