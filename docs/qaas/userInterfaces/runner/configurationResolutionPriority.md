# Configuration Resolution Priority

When loading qaas configurations we have many different options to parse and load them.

Those options and the order in which they are resolved by default (can be changed using certain CLI flags) is:

* base `.yaml` file
* `-w` flag's overwrite files by the order they were given
* `-c` flag's cases
* `-o` flag's overwrite arguments
* `-p` flag's pushed references which themselves are resolved with the following resolutions in the following order:
  * All push reference files by the order they are given
  * Environment variables
  * Placeholders
  * `<<` arrow
* Environment variables
* Placeholders
* `<<` arrow

???- info "--no-env flag"
    This flag disables environment-variable resolution everywhere in the pipeline, including pushed references and the final merged configuration.

???- info "--resolve-cases-last flag"
    This flag moves the `-c` case overlay to the very end of the pipeline, so it is applied after overwrite files, overwrite folders, overwrite arguments, pushed references, and environment-variable resolution.
