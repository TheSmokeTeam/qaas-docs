# Logger

QaaS uses `Serilog` for its logging needs.

## Default logger

All QaaS commands by default have a Serilog with the following configuration:

```yaml
Serilog:
  MinimumLevel: Information
  WriteTo:
    - Name: Console
```

## Overwriting the default logger

You can change the logging configuration with any command by using the `-l` or `-g` flags.

* `-l` or `--logger-level`: Changes the minimum log level of the loaded logger (Either the default or the one loaded from the `-g` flag).
* `-g` or `--logger-configuration-file`: Gives a YAML configuration file with Serilog configurations (The `Serilog` section) to use for the logger. It overrides the default logger completely and supports giving a file from the Artifactory.
