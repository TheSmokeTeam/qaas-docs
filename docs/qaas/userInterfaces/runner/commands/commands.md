# Commands

A QaaS Runner project is a C# .NET project that accepts additional CLI commands controlling how it runs.

Running without a command shows the help screen:

```txt
QaaS.Runner.Project 1.0.0                                                  
Copyright (C) 2024 QaaS.Runner.Project                                     
                                                                     
ERROR(S):                                                            
  No verb selected.                                                  
Usage:                                                               
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]                                        
                                                                     
  run         Run a qaas test according to the given configurations.              
                                                                                                                        
  template    Template a qaas configuration file to see how it looks after being loaded, will template what it can even 
              if the configuration file is invalid.                                                                     

  act         Run a qaas test without the assertions and save all sessionData.

  assert      Run a qaas test with only the assertions on already existing sessionData.

  execute     Executes a yaml execution file that contains a list of other commands to execute in a sequential order.

  help        Display more information on a specific command.

  version     Display version information.
```

To run the QaaS project with any of its commands, the following syntax is required:

```bash
dotnet run <dotnet-parameters> -- <qaas-command>
```

See individual command pages for details: [run](run.md) | [act](act.md) | [assert](assert.md) | [execute](execute.md) | [template](template.md)
