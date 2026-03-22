<!-- generated hash:a4507d55e5ac sources:Runner, template, cli-command -->

# template

Template a qaas configuration file to see how it looks after being loaded, will template what it can even if the configuration file is invalid.

## Help Output

```text
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  -w, --with-files                   List of files to overwrite the qaas configuration with, The first file overwrites
                                     the qaas configuration file and then the one after it overwrite the result and so
                                     on...

  -f, --with-folders                 List of folders whose yaml files overwrite the qaas configuration in alphabetical
                                     order, after overwrite files and in the order the folders are given.

  -r, --overwrite-arguments          List of arguments to overwrite the qaas configuration with, The first argument
                                     overwrites the qaas configuration and then the one after it overwrites the result
                                     and so on...
                                     For example: `Path:To:Variable:To:Overwrite=NewVariableValue`
                                     

  -p, --push-references              References to push onto the qaas configuration.
                                     References are configurations that are pushed in the completed test case's root
                                     level list configurations instead of a certain keyword to replace,
                                     if such a keyword is not found for a certain list nothing will be added to it.
                                     The items added to the configuration list will have a prefix of the given keyword
                                     to replace added to their unique name field.
                                     
                                     For example:
                                     If we push the reference below
                                     `reference.yaml`
                                     ```
                                     Sessions:
                                       - Name: A
                                       - Name: B
                                     ```
                                     On the configuration below
                                     `test.qaas.yaml`
                                     ```
                                     Sessions:
                                       - Name: First
                                       - ReplaceKeyWord
                                       - Name: Seconds
                                     ```
                                     With the replace keyword `ReplaceKeyWord` we will get the following results:
                                     ```
                                     Sessions:
                                       - Name: First
                                       - Name: ReplaceKeyWordA
                                       - Name: ReplaceKeyWordB
                                       - Name: Seconds
                                     ```
                                     
                                     The syntax to add a reference is:
                                     `-p KeyWordToReplace Path/To/Reference.yaml PathToReferenceOverridingFiles.yaml`
                                     
                                     To add multiple references you can invoke the -p flag multiple times or
                                      use a single -p flag but have the references seperated by the KeyWordToReplace:
                                     `-p KeyWordToReplace1 Reference1.yaml -p KeyWordToReplace2 Reference2.yaml`
                                     Or
                                     `-p KeyWordToReplace1 Reference1.yaml KeyWordToReplace2 Reference2.yaml`
                                     
                                     !!! Note that the `KeyWordToReplace` must not end with the suffix `.yml` or
                                     `.yaml`.
                                     

  -c, --cases                        Name of the folder containing all the different .yaml case files that cases are ran
                                     with, If no folder is given will run the .qaas.yaml file as is without cases.

  -n, --cases-names                  Names of the test-cases to run.

  --cases-names-ignore               Names of the test-cases to ignore.

  --cases-name-patterns-ignore       Regex patterns of test-case names to ignore.

  -i, --session-names                Names of the sessions to run.

  --session-categories               Used to filter the session categories to run.

  -a, --assertion-names              Names of the assertions to run. Only sessions given to those assertions will run.

  --assertion-categories             Used to filter the assertion categories to run. The sessions that are associated
                                     with assertions will run too.

  --resolve-cases-last               (Default: false) When this flag is used cases will be resolved after all other
                                     types of configuration resolutions, instead of its default behaviour which is after
                                     overwrite files and before references.

  --no-env                           (Default: false) When this flag is used environment variables will not override
                                     loaded configurations.

  --no-process-exit                  (Default: false) When this flag is used the runner will not terminate the current
                                     process after it completes. Useful when embedding QaaS.Runner and orchestrating
                                     multiple runners in a single host process.

  -l, --logger-level                 The logger's level, overrides both the default logger's level (Information) and the
                                     level of any logger's configuration given.
                                     All available options (not case sensitive) are: Verbose, Debug,
                                     Information, Warning, Error, Fatal.

  -g, --logger-configuration-file    Path to a logger's configuration file, will override the default logger's
                                     configuration. Its level can be overridden by the logger-level flag.

  --send-logs                        (Default: false) Weather to send the logs to Smokes's logs database

  --elastic-uri                      Elasticsearch URI used by the logger sink when send-logs is enabled.

  --elastic-username                 Optional Elasticsearch username for the logger sink.

  --elastic-password                 Optional Elasticsearch password for the logger sink.

  --help                             Display this help screen.

  --version                          Display version information.

  value pos. 0                       (Default: test.qaas.yaml) Path to a qaas yaml configuration file to use with the
                                     command.
```

## Positional Arguments

| Position | Property | Source Type | Required | Default | Value Type | Description |
| -------- | -------- | ----------- | -------- | ------- | ---------- | ----------- |
| `0` | `ConfigurationFile` | `QaaS.Runner.Options.BaseOptions` | Yes | test.qaas.yaml | `System.String` | Path to a qaas yaml configuration file to use with the command. |

## Flags

| Flag | Property | Source Type | Inherited | Required | Default | Value Type | Description |
| ---- | -------- | ----------- | --------- | -------- | ------- | ---------- | ----------- |
| `--assertion-categories` | `AssertionCategoriesToRun` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Used to filter the assertion categories to run. The sessions that are associated with assertions will run too. |
| `-a`, `--assertion-names` | `AssertionNamesToRun` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Names of the assertions to run. Only sessions given to those assertions will run. |
| `-c`, `--cases` | `CasesRootDirectory` | `QaaS.Runner.Options.BaseOptions` | Yes | No |  | `System.String` | Name of the folder containing all the different .yaml case files that cases are ran with, If no folder is given will run the .qaas.yaml file as is without cases. |
| `--cases-name-patterns-ignore` | `CasesNamePatternsToIgnore` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Regex patterns of test-case names to ignore. |
| `-n`, `--cases-names` | `CasesNamesToRun` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Names of the test-cases to run. |
| `--cases-names-ignore` | `CasesNamesToIgnore` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Names of the test-cases to ignore. |
| `--elastic-password` | `ElasticPassword` | `QaaS.Framework.Executions.Options.LoggerOptions` | Yes | No |  | `System.String` | Optional Elasticsearch password for the logger sink. |
| `--elastic-uri` | `ElasticUri` | `QaaS.Framework.Executions.Options.LoggerOptions` | Yes | No |  | `System.String` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| `--elastic-username` | `ElasticUsername` | `QaaS.Framework.Executions.Options.LoggerOptions` | Yes | No |  | `System.String` | Optional Elasticsearch username for the logger sink. |
| `-g`, `--logger-configuration-file` | `LoggerConfigurationFilePath` | `QaaS.Framework.Executions.Options.LoggerOptions` | Yes | No |  | `System.String` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| `-l`, `--logger-level` | `LoggerLevel` | `QaaS.Framework.Executions.Options.LoggerOptions` | Yes | No |  | `System.Nullable`1[[Serilog.Events.LogEventLevel, Serilog, Version=4.3.0.0, Culture=neutral, PublicKeyToken=24c2f752a8e58a10]]` | <br />The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug, <br />Information, Warning, Error, Fatal. |
| `--no-env` | `DontResolveWithEnvironmentVariables` | `QaaS.Runner.Options.BaseOptions` | Yes | No | False | `System.Boolean` | When this flag is used environment variables will not override loaded configurations. |
| `--no-process-exit` | `NoProcessExit` | `QaaS.Runner.Options.BaseOptions` | Yes | No | False | `System.Boolean` | When this flag is used the runner will not terminate the current process after it completes. Useful when embedding QaaS.Runner and orchestrating multiple runners in a single host process. |
| `-r`, `--overwrite-arguments` | `OverwriteArguments` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | <br />List of arguments to overwrite the qaas configuration with, The first argument overwrites the qaas configuration and then the one after it overwrites the result and so on...<br />For example: `Path:To:Variable:To:Overwrite=NewVariableValue`<br /> |
| `-p`, `--push-references` | `PushReferences` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | <br />References to push onto the qaas configuration.<br />References are configurations that are pushed in the completed test case's root level list configurations instead of a certain keyword to replace,<br />if such a keyword is not found for a certain list nothing will be added to it.<br />The items added to the configuration list will have a prefix of the given keyword to replace added to their unique name field.<br /><br />For example:<br />If we push the reference below<br />`reference.yaml`<br />```<br />Sessions:<br />  - Name: A<br />  - Name: B<br />```<br />On the configuration below <br />`test.qaas.yaml`<br />```<br />Sessions:<br />  - Name: First<br />  - ReplaceKeyWord<br />  - Name: Seconds<br />```<br />With the replace keyword `ReplaceKeyWord` we will get the following results:<br />```<br />Sessions:<br />  - Name: First<br />  - Name: ReplaceKeyWordA<br />  - Name: ReplaceKeyWordB<br />  - Name: Seconds<br />```<br /><br />The syntax to add a reference is:<br />`-p KeyWordToReplace Path/To/Reference.yaml PathToReferenceOverridingFiles.yaml`<br /><br />To add multiple references you can invoke the -p flag multiple times or<br /> use a single -p flag but have the references seperated by the KeyWordToReplace:<br />`-p KeyWordToReplace1 Reference1.yaml -p KeyWordToReplace2 Reference2.yaml`<br />Or<br />`-p KeyWordToReplace1 Reference1.yaml KeyWordToReplace2 Reference2.yaml`<br /><br />!!! Note that the `KeyWordToReplace` must not end with the suffix `.yml` or `.yaml`.<br /> |
| `--resolve-cases-last` | `ResolveCasesLast` | `QaaS.Runner.Options.BaseOptions` | Yes | No | False | `System.Boolean` | When this flag is used cases will be resolved after all other types of configuration resolutions, instead of its default behaviour which is after overwrite files and before references. |
| `--send-logs` | `SendLogs` | `QaaS.Framework.Executions.Options.LoggerOptions` | Yes | No | False | `System.Boolean` | Weather to send the logs to Smokes's logs database |
| `--session-categories` | `SessionCategoriesToRun` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Used to filter the session categories to run. |
| `-i`, `--session-names` | `SessionNamesToRun` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | Names of the sessions to run. |
| `-w`, `--with-files` | `OverwriteFiles` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | List of files to overwrite the qaas configuration with, The first file overwrites the qaas configuration file and then the one after it overwrite the result and so on... |
| `-f`, `--with-folders` | `OverwriteFolders` | `QaaS.Runner.Options.BaseOptions` | Yes | No | [] | `System.Collections.Generic.IList`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]` | List of folders whose yaml files overwrite the qaas configuration in alphabetical order, after overwrite files and in the order the folders are given. |
