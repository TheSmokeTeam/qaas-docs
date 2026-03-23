param(
    [string]$DocsRoot,
    [string]$MirrorRoot,
    [switch]$Check
)

$ErrorActionPreference = 'Stop'

function Resolve-NormalizedPath {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $resolvedPath = Resolve-Path -LiteralPath $Path -ErrorAction SilentlyContinue
    if ($null -ne $resolvedPath) {
        return $resolvedPath.ProviderPath
    }

    return [System.IO.Path]::GetFullPath($Path)
}

$workspaceRoot = Resolve-NormalizedPath (Join-Path (Split-Path -Parent $PSScriptRoot) '..')

if ([string]::IsNullOrWhiteSpace($DocsRoot)) {
    $DocsRoot = Split-Path -Parent $PSScriptRoot
}

if ([string]::IsNullOrWhiteSpace($MirrorRoot)) {
    $MirrorRoot = Join-Path $workspaceRoot 'QaaS.PackageMirror'
}

$DocsRoot = Resolve-NormalizedPath $DocsRoot
$MirrorRoot = Resolve-NormalizedPath $MirrorRoot
Set-StrictMode -Version Latest

$failures = New-Object 'System.Collections.Generic.List[string]'

$kindSpecs = @{
    generator = @{
        DocsDirectory = 'docs\generators\availableGenerators'
    }
    assertion = @{
        DocsDirectory = 'docs\assertions\availableAssertions'
    }
    probe = @{
        DocsDirectory = 'docs\probes\availableProbes'
    }
    processor = @{
        DocsDirectory = 'docs\processors\availableProcessors'
    }
}

function Test-IsList {
    param([object]$Value)

    return ($Value -is [System.Array]) -or (($Value -is [System.Collections.IList]) -and -not ($Value -is [string]))
}

function Convert-ToArray {
    param([object]$Value)

    if ($null -eq $Value) {
        return @()
    }

    if (Test-IsList $Value) {
        return @($Value)
    }

    return @($Value)
}

function Get-PropertyValue {
    param(
        [object]$Node,
        [string]$Name
    )

    if ($null -eq $Node) {
        return $null
    }

    if ($Node -is [System.Collections.IDictionary]) {
        return $Node[$Name]
    }

    $property = $Node.PSObject.Properties[$Name]
    if ($null -eq $property) {
        return $null
    }

    return $property.Value
}

function Get-JsonPointerSegments {
    param([string]$Pointer)

    if ([string]::IsNullOrWhiteSpace($Pointer) -or $Pointer -eq '#') {
        return @()
    }

    return @(
        ($Pointer -replace '^#', '').Split('/') |
            Where-Object { $_ -ne '' } |
            ForEach-Object { $_ -replace '~1', '/' -replace '~0', '~' }
    )
}

function Resolve-JsonPointer {
    param(
        [object]$Root,
        [string]$Pointer
    )

    $current = $Root
    foreach ($segment in Get-JsonPointerSegments $Pointer) {
        if ($current -is [System.Array]) {
            $current = $current[[int]$segment]
            continue
        }

        $matches = @($current.PSObject.Properties.Match($segment))
        if ($matches.Count -eq 0) {
            throw "Could not resolve JSON pointer segment '$segment' within '$Pointer'. Current node type: $($current.GetType().FullName)"
        }

        $current = $matches[0].Value
    }

    return $current
}

function Get-ParentJsonPointer {
    param([string]$Pointer)

    $segments = @(Get-JsonPointerSegments $Pointer)
    if ($segments.Count -le 1) {
        return '#'
    }

    return '#/' + (($segments | Select-Object -First ($segments.Count - 1)) -join '/')
}

function Get-LeafPointerSegment {
    param([string]$Pointer)

    $segments = @(Get-JsonPointerSegments $Pointer)
    return $segments[$segments.Count - 1]
}

function Get-SchemaTypes {
    param([object]$Schema)

    return @(
        Convert-ToArray (Get-PropertyValue $Schema 'type') |
            ForEach-Object { [string]$_ }
    )
}

function Get-SchemaProperties {
    param([object]$Schema)

    $properties = Get-PropertyValue $Schema 'properties'
    if ($null -eq $properties) {
        return @()
    }

    return @(
        $properties.PSObject.Properties |
            ForEach-Object {
                [pscustomobject]@{
                    Name = $_.Name
                    Schema = $_.Value
                }
            }
    )
}

function Get-RequiredNames {
    param([object]$Schema)

    return @(
        Convert-ToArray (Get-PropertyValue $Schema 'required') |
            ForEach-Object { [string]$_ }
    )
}

function Get-ItemSchema {
    param([object]$Schema)

    $items = Get-PropertyValue $Schema 'items'
    if ($null -eq $items) {
        return $null
    }

    if (Test-IsList $items) {
        return @(Convert-ToArray $items)[0]
    }

    return $items
}

function Test-SchemaIsArray {
    param([object]$Schema)

    return (@(Get-SchemaTypes $Schema) -contains 'array')
}

function Test-SchemaHasObjectProperties {
    param([object]$Schema)

    return (@(Get-SchemaTypes $Schema) -contains 'object') -and (@(Get-SchemaProperties $Schema)).Count -gt 0
}

function Get-SchemaCategory {
    param([object]$Schema)

    if (Test-SchemaIsArray $Schema) {
        return 1
    }

    if (Test-SchemaHasObjectProperties $Schema) {
        return 2
    }

    return 0
}

function Get-OrderedSchemaProperties {
    param([object]$Schema)

    $requiredNames = @(Get-RequiredNames $Schema)
    return @(
        @(Get-SchemaProperties $Schema) |
            Sort-Object `
                @{ Expression = { Get-SchemaCategory $_.Schema } }, `
                @{ Expression = { if ($requiredNames -contains $_.Name) { 0 } else { 1 } } }, `
                @{ Expression = { $_.Name } }
    )
}

function Format-TypeName {
    param([string]$TypeName)

    switch ($TypeName) {
        'array' { return 'list' }
        'boolean' { return 'true/false' }
        'integer' { return 'integer' }
        'null' { return 'null' }
        'number' { return 'number' }
        'object' { return 'object' }
        'string' { return 'string' }
        default { return $TypeName.ToLowerInvariant() }
    }
}

function Join-FriendlyTypes {
    param([string[]]$TypeNames)

    return ($TypeNames -join ' or ')
}

function Describe-Schema {
    param([object]$Schema)

    $enumValues = @(Convert-ToArray (Get-PropertyValue $Schema 'enum'))
    if ($enumValues.Count -gt 0) {
        return 'one of [' + (($enumValues | ForEach-Object { [string]$_ }) -join ' / ') + ']'
    }

    $types = @(Get-SchemaTypes $Schema)
    if ($types.Count -eq 0) {
        return 'object'
    }

    $friendlyTypes = @(
        $types |
            ForEach-Object { Format-TypeName $_ } |
            Sort-Object `
                @{ Expression = { if ($_ -eq 'null') { 1 } else { 0 } } }, `
                @{ Expression = { $_ } } -Unique
    )

    return Join-FriendlyTypes $friendlyTypes
}

function Format-Scalar {
    param([object]$Value)

    if ($null -eq $Value) {
        return ''
    }

    if (Test-IsList $Value) {
        return (($Value | ForEach-Object { [string]$_ }) -join ', ')
    }

    return [string]$Value
}

function Escape-Markdown {
    param([object]$Value)

    if ($null -eq $Value) {
        return ''
    }

    $text = [string]$Value
    return $text.Replace('|', '\|').Replace("`r", '').Replace("`n", '<br />')
}

function Normalize-LineEndings {
    param([string]$Text)

    return $Text.Replace("`r`n", "`n").Replace("`r", "`n")
}

function Sanitize-HookSlug {
    param([string]$Title)

    return $Title -replace '`\d+$', ''
}

function Add-TableRows {
    param(
        [string]$Path,
        [object]$Schema,
        [bool]$Required,
        [System.Collections.Generic.List[object]]$Rows
    )

    $Rows.Add([pscustomobject]@{
            Path = $Path
            Type = Describe-Schema $Schema
            Required = if ($Required) { '&#10004' } else { '&#10006' }
            Default = Format-Scalar (Get-PropertyValue $Schema 'default')
            Description = Format-Scalar (Get-PropertyValue $Schema 'description')
        }) | Out-Null

    if (Test-SchemaIsArray $Schema) {
        $itemSchema = Get-ItemSchema $Schema
        if ($null -eq $itemSchema) {
            return
        }

        if (Test-SchemaHasObjectProperties $itemSchema) {
            Add-TableRows "$Path[]" $itemSchema $false $Rows
        }
        else {
            $Rows.Add([pscustomobject]@{
                    Path = "$Path[]"
                    Type = Describe-Schema $itemSchema
                    Required = '&#10006'
                    Default = Format-Scalar (Get-PropertyValue $itemSchema 'default')
                    Description = Format-Scalar (Get-PropertyValue $itemSchema 'description')
                }) | Out-Null
        }

        return
    }

    if (-not (Test-SchemaHasObjectProperties $Schema)) {
        return
    }

    $requiredNames = @(Get-RequiredNames $Schema)
    foreach ($child in Get-OrderedSchemaProperties $Schema) {
        Add-TableRows "$Path.$($child.Name)" $child.Schema ($requiredNames -contains $child.Name) $Rows
    }
}

function Add-YamlLines {
    param(
        [System.Collections.Generic.List[string]]$Lines,
        [int]$Indent,
        [string]$Name,
        [object]$Schema
    )

    $prefix = '  ' * $Indent

    if (Test-SchemaIsArray $Schema) {
        $itemSchema = Get-ItemSchema $Schema
        if ($null -ne $itemSchema -and (Test-SchemaHasObjectProperties $itemSchema)) {
            $Lines.Add("${prefix}${Name}:") | Out-Null
            $Lines.Add("$prefix  -") | Out-Null
            foreach ($child in Get-OrderedSchemaProperties $itemSchema) {
                Add-YamlLines $Lines ($Indent + 2) $child.Name $child.Schema
            }
        }
        else {
            $Lines.Add("${prefix}${Name}: []") | Out-Null
        }

        return
    }

    if (Test-SchemaHasObjectProperties $Schema) {
        $Lines.Add("${prefix}${Name}:") | Out-Null
        foreach ($child in Get-OrderedSchemaProperties $Schema) {
            Add-YamlLines $Lines ($Indent + 1) $child.Name $child.Schema
        }

        return
    }

    $Lines.Add("${prefix}${Name}:") | Out-Null
}

function Get-FamilyArtifacts {
    param([string]$FamilyId)

    $familyRoot = Join-Path $MirrorRoot ("schemas\{0}\latest" -f $FamilyId)
    $schemaPath = Join-Path $familyRoot 'schema.json'
    $catalogPath = Join-Path $familyRoot 'hook-catalog.json'

    if (-not (Test-Path $schemaPath)) {
        throw "Missing family schema file: $schemaPath"
    }

    if (-not (Test-Path $catalogPath)) {
        throw "Missing hook catalog file: $catalogPath"
    }

    return [pscustomobject]@{
        Schema = Get-Content $schemaPath -Raw | ConvertFrom-Json
        Hooks = @(Convert-ToArray ((Get-Content $catalogPath -Raw | ConvertFrom-Json).hookTypes))
    }
}

function Write-OrCheckFile {
    param(
        [string]$RelativePath,
        [string]$Content
    )

    $fullPath = Join-Path $DocsRoot $RelativePath
    if ($Check) {
        if (-not (Test-Path $fullPath)) {
            $failures.Add("Missing generated hook doc: $RelativePath") | Out-Null
            return
        }

        $existing = Normalize-LineEndings ([System.IO.File]::ReadAllText($fullPath))
        $candidate = Normalize-LineEndings $Content
        if ($existing -ne $candidate) {
            $failures.Add("Generated hook doc drift: $RelativePath") | Out-Null
        }

        return
    }

    New-Item -ItemType Directory -Path (Split-Path -Parent $fullPath) -Force | Out-Null
    [System.IO.File]::WriteAllText($fullPath, $Content)
}

function Get-HookDocsDirectory {
    param(
        [string]$Kind,
        [string]$Slug
    )

    return Join-Path $kindSpecs[$Kind].DocsDirectory $Slug
}

function Test-ShouldPublishHookDocs {
    param(
        [string]$Kind,
        [string]$Slug
    )

    if ($Kind -ne 'processor') {
        return $true
    }

    $overviewRelativePath = Join-Path (Get-HookDocsDirectory $Kind $Slug) 'overview.md'
    return Test-Path (Join-Path $DocsRoot $overviewRelativePath)
}

function Remove-OrCheckFilteredHookDocs {
    param(
        [string]$Kind,
        [string]$Slug
    )

    $hookRelativePath = Get-HookDocsDirectory $Kind $Slug
    $hookFullPath = Join-Path $DocsRoot $hookRelativePath

    if ($Check) {
        if (Test-Path $hookFullPath) {
            $failures.Add("Filtered hook docs should not exist: $hookRelativePath") | Out-Null
        }

        return
    }

    if (Test-Path $hookFullPath) {
        Remove-Item $hookFullPath -Recurse -Force
    }
}

$hooksByKey = @{}
foreach ($familyId in @('runner-family', 'mocker-family')) {
    $familyArtifacts = Get-FamilyArtifacts $familyId
    foreach ($hook in $familyArtifacts.Hooks) {
        $kind = [string]$hook.hookKind
        if (-not $kindSpecs.ContainsKey($kind)) {
            continue
        }

        $slug = Sanitize-HookSlug ([string]$hook.docsSlug)
        if ([string]::IsNullOrWhiteSpace($slug)) {
            $slug = Sanitize-HookSlug ([string]$hook.title)
        }

        if (-not (Test-ShouldPublishHookDocs $kind $slug)) {
            Remove-OrCheckFilteredHookDocs $kind $slug
            continue
        }

        $schemaPointer = [string]$hook.configurationSchemaJsonPointer
        $schemaNode = Resolve-JsonPointer $familyArtifacts.Schema $schemaPointer
        if ($null -eq $schemaNode) {
            throw "Could not resolve schema pointer '$schemaPointer' for hook '$($hook.title)'."
        }

        $rootName = Get-LeafPointerSegment $schemaPointer
        $parentPointer = Get-ParentJsonPointer $schemaPointer
        $parentNode = Resolve-JsonPointer $familyArtifacts.Schema $parentPointer
        $rootRequired = (@(Get-RequiredNames $parentNode) -contains $rootName)

        $hooksByKey["$kind|$slug"] = [pscustomobject]@{
            Kind = $kind
            Slug = $slug
            Schema = $schemaNode
            RootName = $rootName
            RootRequired = $rootRequired
        }
    }
}

$documentCount = 0
foreach ($entry in @($hooksByKey.Values | Sort-Object Kind, Slug)) {
    $rows = New-Object 'System.Collections.Generic.List[object]'
    Add-TableRows $entry.RootName $entry.Schema $entry.RootRequired $rows

    $tableLines = New-Object 'System.Collections.Generic.List[string]'
    $tableLines.Add("# $($entry.Slug) Configurations Table View") | Out-Null
    $tableLines.Add('') | Out-Null
    $tableLines.Add('| Property Path | Type | Required | Default | Description |') | Out-Null
    $tableLines.Add('| ------------- | ---- | -------- | ------- | ----------- |') | Out-Null
    foreach ($row in $rows) {
        $tableLines.Add(
            "| ``$($row.Path)`` | ``$($row.Type)`` | $($row.Required) | $(Escape-Markdown $row.Default) | $(Escape-Markdown $row.Description) |") | Out-Null
    }

    $yamlLines = New-Object 'System.Collections.Generic.List[string]'
    $yamlLines.Add("# $($entry.Slug) Configurations Yaml View") | Out-Null
    $yamlLines.Add('') | Out-Null
    $yamlLines.Add('```yaml') | Out-Null
    Add-YamlLines $yamlLines 0 $entry.RootName $entry.Schema
    $yamlLines.Add('```') | Out-Null

    $baseRelativePath = Join-Path (Get-HookDocsDirectory $entry.Kind $entry.Slug) 'configuration'
    Write-OrCheckFile (Join-Path $baseRelativePath 'tableView.md') (([string]::Join("`r`n", $tableLines)) + "`r`n")
    Write-OrCheckFile (Join-Path $baseRelativePath 'yamlView.md') (([string]::Join("`r`n", $yamlLines)) + "`r`n")
    $documentCount += 2
}

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) {
        Write-Error $failure
    }

    throw 'Hook configuration docs sync failed.'
}

Write-Host ("{0} {1} hook configuration documents." -f ($(if ($Check) { 'Validated' } else { 'Wrote' }), $documentCount))
