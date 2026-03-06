# Configuration Resolution Priority

When QaaS loads a configuration, it layers multiple inputs on top of each other. The effective order comes from `ContextBuilder` in `QaaS.Framework.SDK`.

By default the resolution order is:

1. base QaaS YAML file
2. overwrite files from `-w` / `--with-files`, in the order provided
3. case file from `-c` / `--cases`, if a case run is active
4. command-line overwrite arguments from `-r` / `--overwrite-arguments`
5. pushed references from `-p` / `--push-references`
6. environment-variable enrichment, unless `--no-env` is used

!!! info "--no-env flag"
    This removes the final environment-variable enrichment step.

!!! info "--resolve-cases-last flag"
    This moves case resolution after references instead of before them.

In practical terms:

- overwrite files are the first layer for environment or profile-specific changes
- case files let one base test fan out into multiple case variants
- command-line overwrite arguments are the last explicit overrides before reference and case finalization
- environment variables are optional and should be used carefully so local runs stay predictable
