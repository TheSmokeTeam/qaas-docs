# Probes

Probes are hooks built on `IProbe`. They are used for setup, cleanup, or environmental changes that support a test run but do not produce normal session input/output data.

Typical probe use cases include:

- emptying Redis before a run
- purging RabbitMQ queues
- truncating SQL tables
- restarting pods or updating deployment state in OpenShift
- cleaning S3 buckets or Elastic indices

Probes can still inspect available `SessionData` and configured `DataSource` objects if they need them, but they do not append new communication data to the session output.

The reusable implementations live in the separate `QaaS.Common.Probes` docs package in this repository.
