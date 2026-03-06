# JsonSchemaDraft4

Supports generating data from a **single DataSource** that contains a **single Json Schema**.
Given Json Deserielized as `JsonObject` of `System.Text.Json`.
Generates data in the following order:

1. Generates Json from the given Json Schema.
2. If configured: Injects **Manual** or **DataSource** given values to fields. > ⚠ Replaces value of already existing fields.
3. If configured: Parses the Json to a different output object.

!!! info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <object>
        ```

## Json Schema Generation

Given Schema must be of `draft 4`. For generation purposes, only some fields are used for the operation, while others are irrelevant.

### Global Schema Keywords

#### Json View

``` Json
{
  "id": "Schema Id Of The Constant Example",
  "const": "Constant value of the context",
}
```

``` Json
{
  "id": "Schema Id Of The Enum Example",
  "enum": ["many", 21, "options", true, "are", null, "given"],
}
```

``` Json
{
  "id": "Schema Id Of The Type Example, Used With definitions and $ref",
  "$ref": "#/definitions/firstDef",
  "definitions": {
    "firstDef": {
      "type": "object",
      "properties": {}
    }
  }
}
```

#### Table View

| Keyword | Type | Required | Default | Description |
|:--------|:-----|:---------|:--------|:------------|
|`id`|`string`| &#10006 | | Used for log debugging, only relevant on root schema context |
|`const`|`any` except `null`| &#10006 | | **1st** in line of the Json value evaluation process. Returns the value configured |
|`enum`|`array` of `any`| &#10006 | | **2nd** in line of the Json value evaluation process. Selects a random value from the array |
|`type`|`string` or `array` of `string` [ `object` / `array` / `string` / `integer` / `number` / `boolean` / `null`]| &#10006 | | **3rd** in line of the Json value evaluation process. Generates by its Schema related properties. If array of strings is given, picks one type randomally |
|`definitions`|`object`| &#10006 | | Dictionary recurring schemas, referenced by `$ref`. Configured only in root schema context |
|`$ref`|`string` (`#/definitions/<value>`) | &#10006 | | Reference of schema configuration to be used. Other keywords mentioned in the same schema context override the referenced schema configuration |

### Type "object" Schema

#### Json View

``` json
{
  "type": "object",
  "properties": {
    "FieldName": {}
  }
}
```

#### Table View

| Keyword | Type | Required | Default | Description |
|:--------|:-----|:---------|:--------|:------------|
|`properties`|`object`| &#10004 | | Properties (Fields) of the generated object |

### Type "array" Schema

#### Json View

``` json
{
  "type": "array",
  "items": {
    "type": ...
  },
  "items": [
    {
      "type": ...
    }
  ],
  "minItems": 1,
  "maxItems": 10,
  "uniqueItems": true
}
```

#### Table View

| Keyword | Type | Required | Default | Description |
|:--------|:-----|:---------|:--------|:------------|
|`items`| `object` / `array` of `object` | &#10004 | | Items Schema/s of the generated array |
|`minItems`|`integer`| &#10006 | `items` Count | Minimum items in the generated array |
|`maxItems`|`integer`| &#10006 | `items` Count | Maximum items in the generated array |
|`uniqueItems`|`boolean`| &#10006 | `false` | Flag for different item generations in generated array |

### Type "string" Schema

#### Json View

``` json
{
  "type": "string",
  "minLength": 1,
  "maxLength": 10,
  "format": "..."
}
```

#### Table View

| Keyword | Type | Required | Default | Description |
|:--------|:-----|:---------|:--------|:------------|
|`minLength`| `number` | &#10006 | `0` | Minimum string length value generation |
|`maxLength`| `number` | &#10006 | `69` | Maximum string length value generation |
|`format`| `string` [ `uuid` / `date` / `time` / `date-time` / `email` / `hostname` / `ipv4` / `ipv6`] | &#10006 | | Certain string formats sub-generations. Overrides `minLength` & `maxLength` keywords |

### Type "integer" & "number" Schemas

#### Json View

``` json
{
  "type": "integer",
  "minimum": 1,
  "maximum": 10,
  "exclusiveMinimum": true,
  "exclusiveMaximum": false,
  "multiplyOf": 3
}
```

``` json
{
  "type": "number",
  "minimum": 1,
  "maximum": 10,
  "exclusiveMinimum": true,
  "exclusiveMaximum": false
}
```

#### Table View

| Keyword | Type | Required | Default | Description |
|:--------|:-----|:---------|:--------|:------------|
|`minimum`| `integer` / `number` | &#10006 | `-2147483648` | Minimum value generation |
|`maximum`| `integer` / `number` | &#10006 | `2147483647` | Maximum value generation |
|`exclusiveMinimum`| `boolean` | &#10006 | `false` | Should the `minimum` be excluded from the value generation |
|`exclusiveMaximum`| `boolean` | &#10006 | `false` | Should the `maximum` be excluded from the value generation |
|`multiplyOf`| `integer` / `number` | &#10006 | | Common factor value generation |

> ⚠ `number` is actually `double` - `multiplyOf` won't work on this generation type!

### Type "boolean" Schema

``` json
{
  "type": "boolean"
}
```

### Type "null" Schema

``` json
{
  "type": "null"
}
```

## DataSource Parameters

* **Generator Name** - `JsonSchemaDraft4`.
* **DataSources** - All Used.
* **SessionData** - Passed to used DataSources.
