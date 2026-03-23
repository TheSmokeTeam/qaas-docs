# Probes

Probes are based on the `hook` `IProbe` and are actions that effect the system/its underlying infrastructure but don't save any information related to the interaction with the system, meaning they don't effect the `SessionData` object at all.

Probes can use `SessionData` and `DataSource` lists in order to get relevent information to perform their action.
Behaviour.

In order to see all of the available probes visit [QaaS.Common.Probes]({{ links.repository_probes }})
