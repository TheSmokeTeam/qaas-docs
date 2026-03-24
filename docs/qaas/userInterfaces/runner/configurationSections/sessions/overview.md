# Sessions

The Sessions section contains the actions performed against the tested system and its underlying infrastructure in order to receive response data from the tested system to assert on.

The actions can be divided into two categories:

- `Probe actions` are actions that affect the system or its underlying infrastructure but do not save information related to the interaction with the system.
- `Communication actions` are actions that send or receive data from the system or its underlying infrastructure and save that data in the `SessionData`.

Communication actions contain a number of sub-categories:

- `Publishers` send data.
- `Consumers` receive data.
- `Collectors` collect data from an endpoint within a certain time range in a single action.
- `Transactions` send and receive data.

!!! Tip "Connection Timeouts"
    The more asynchronous actions that use network resources you have in a session, the more likely you are to get connection timeouts.
    If you are experiencing timeouts, try increasing the relevant action's network connection timeout configurations, which may vary between different actions.
    If you increase the timeout of a communication action, make sure your consuming communication action's timeout is substantially higher or you might experience loss of data.

## SessionData Structure

`SessionData` is the outcome produced by every session run. It contains a list of `inputs` and a list of `outputs`.
The inputs are produced from any data sent to the tested system and their name is the name of the action that produced them.
The outputs are produced from any data received from the tested system and their name is the name of the action that produced them.
Both the inputs' and outputs' items are arranged by timestamp in ascending order.

## Serialized Data Based Communications And Deserialized Data Based Communications

Every communication action can either work with serialized `byte[]` data or with a deserialized C# object.

Communication actions that work with serialized data can be configured to serialize generated data before sending it, and can also deserialize received data before saving it to the `SessionData`.

Communication actions that work with deserialized data must receive the C# object they work with directly, and for output actions they save the deserialized data as received to the `SessionData`.
