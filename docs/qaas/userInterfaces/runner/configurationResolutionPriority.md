# Configuration Resolution priority

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
        This flag removes all the environment variable resolution from the resolution list.

???- info "--resolve-cases-last flag"
        This flag takes the `-c` resolution and resolves it after the `-p` instead of in its current order.
