# ObjectOutputJsonSchema

Checks that all items in a configured output are valid according to atleast one of the json schemas provided from the configured DataBindings. Expects the output items to be deserialized to any type of C# object that can be converted to Json.

!!! Warning "Json Schema Draft"
            The json's schema draft must be specified in the schema under the field `$schema`
             and **match** one of the following:
            "$schema": "http://json-schema.org/draft-06/schema#"
            "$schema": "<http://json-schema.org/draft-07/schema#>"
            "$schema": "https://json-schema.org/draft/2019-09/schema"
            "$schema": "<https://json-schema.org/draft/2020-12/schema>"
            "$schema": "<https://json-schema.org/draft/next/schema>"

## Assertion Parameters

* **Assertion Name** - `ObjectOutputJsonSchema`.
* **DataSources** - Used, Should all contain serialized json schemas.
* **SessionData** - Single Session Support.

## Result Mapping

Passed

* All items in output `OutputName` after being converted to json are valid according to atleast one of the json schemas provided.

Failed

* Any item in output `OutputName` after being converted to json is not valid according to all of the json schemas provided.

Broken

* Any item in **DataBindings** given is not a valid serialized json schema.
* Any item in output `OutputName` cannot be converted into json.
* The output `OutputName` does not exist within the given session.
* The output `OutputName` exists more than once within the given session.
* More than 1 session was passed to the assertion.
