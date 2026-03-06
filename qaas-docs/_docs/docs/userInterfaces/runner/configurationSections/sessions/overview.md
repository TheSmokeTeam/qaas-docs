# Sessions

The Sessions section contains the actions performed against the tested system and its underlying infrastructure in order to receive response data from the tested system to assert on.

The actions can be divided into 2 categories:

* `Probe actions` are actions that effect the system/its underlying infrastructure but dont save any information related to the interaction with the system.
* `Communication actions` are actions that send/receive data from the system or its underlying infrastructure and save that data in the `SessionData`.
  Communication actions contain a number of sub categories
  * `Publishers` communication actions that send data
  * `Consumers` communication actions that receive data
  * `Collectors` communication actions that collect data from an endpoint within a certain range of time in a single action
  * `Transactions` communication actions that send and receive data

!!! Tip "Connection Timeouts"
    The more `asynchronous actions` that use `network resources` you have in a session the more you are likely to get **connection timeouts**. If you are
    experiencing timeouts try increasing your relevant action's network connection timeout configurations who may vary between different actions.
    :warning: If you increase the timeout of a `communication action` make sure your consuming communication action's `consumption timeout` is substantially **higher** than your `communication action`'s timeouts or you might experience loss of data, as the longer network timeout can mean the data will take more time to reach the consumer.

## SessionData Structure

`SessionData` is the outcome produced by every session run, it contains a list of `inputs` and a list of `outputs`.
The inputs are produced from any data sent to the tested system (from `publishers` or `transactions`) and their name is the name of the action that produced them.
The outputs are produced from any data received from the testd system (from `consumers`, `collectors` or `transactions`) and their name is the name of the action that produced them.
Both the inputs' and output's items are arranged by their timestamps ascending.

## Serialized Data Based Communications / Deserialized Data Based Communications

Every communication action can either work with `Serialized` byte[] data or with a `Deserialized` C# object.

Communication actions that work with `Serialized` data for `Input` communication actions can be configured to serialize the generated data given to them before sending it and for an `Output` communication action they can be configured to deserialize the received data before saving it to the `SessionData`.

Communication actions that work with `Deserialized` data for `Input` communication actionsmust receive the C# object they work with and for an `Output` communication action they save the deserialized data as they received it to the `SessionData`.
