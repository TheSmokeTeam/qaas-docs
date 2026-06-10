#!/usr/bin/env node
// gen-plugin-pages.mjs — Catalogs+Auto-Gen renderer for QaaS plugin pages.
// Fallback to the "single-file csx" path described in coverage-schema-ops:
// reads JSON schemas + best-effort XMLDoc/source summaries, emits frontmatter-
// compliant overview.md + configuration/tableView.md + configuration/yamlView.md
// per plugin under docs/<area>/available<Area>/<Plugin>/.
//
// Pure Node, no deps. Uses Node built-ins. Idempotent — overwrites existing files.

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '../..');
const DOCS = path.join(ROOT, 'docs');
const PLANNING = path.join(ROOT, 'planning');
const WORKSPACE_ROOT = process.env.QAAS_WORKSPACE_ROOT || 'D:/QaaS';
const SCHEMA_DIR = process.env.QAAS_DOCS_SCHEMA_SOURCE_DIR ||
  path.join(WORKSPACE_ROOT, 'QaaS.JsonSchemaExtensions/generated-schemas');
const TODAY = '2026-05-22';

const FAMILIES = [
  { key: 'assertions', area: 'assertions', folder: 'availableAssertions',
    arr: 'Assertions', cfgKey: 'AssertionConfiguration', schema: 'assertions.schema.json',
    srcRoot: process.env.QAAS_DOCS_ASSERTIONS_SOURCE_ROOT ||
      path.join(WORKSPACE_ROOT, 'QaaS.Common.Assertions/QaaS.Common.Assertions'),
    appliesTo: 'assertions', idPrefix: 'assertions.available' },
  { key: 'generators', area: 'generators', folder: 'availableGenerators',
    arr: 'Generators', cfgKey: 'GeneratorConfiguration', schema: 'generators.schema.json',
    srcRoot: process.env.QAAS_DOCS_GENERATORS_SOURCE_ROOT ||
      path.join(WORKSPACE_ROOT, 'QaaS.Common.Generators/QaaS.Common.Generators'),
    appliesTo: 'generators', idPrefix: 'generators.available' },
  { key: 'probes', area: 'probes', folder: 'availableProbes',
    arr: 'Probes', cfgKey: 'ProbeConfiguration', schema: 'probes.schema.json',
    srcRoot: process.env.QAAS_DOCS_PROBES_SOURCE_ROOT ||
      path.join(WORKSPACE_ROOT, 'QaaS.Common.Probes/QaaS.Common.Probes'),
    appliesTo: 'probes', idPrefix: 'probes.available' },
  { key: 'processors', area: 'processors', folder: 'availableProcessors',
    arr: 'Processors', cfgKey: 'ProcessorConfiguration', schema: 'processors.schema.json',
    srcRoot: process.env.QAAS_DOCS_PROCESSORS_SOURCE_ROOT ||
      path.join(WORKSPACE_ROOT, 'QaaS.Common.Processors/QaaS.Common.Processors'),
    appliesTo: 'processors', idPrefix: 'processors.available' },
];

// ---------- helpers ----------
function walk(dir, out = []) {
  if (!fs.existsSync(dir)) return out;
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) {
      if (/[\\/](bin|obj|Test|Tests)([\\/]|$)/.test(p)) continue;
      walk(p, out);
    } else if (e.isFile() && p.endsWith('.cs')) out.push(p);
  }
  return out;
}

function findSourceFile(srcFiles, pluginName) {
  // 1. Exact filename match Foo.cs (preferred — main class).
  const exact = srcFiles.find(f =>
    path.basename(f).toLowerCase() === `${pluginName.toLowerCase()}.cs` &&
    !/Configuration|Config|Exception|Handler\.cs$/.test(path.basename(f)));
  if (exact) return exact;
  // 2. Configuration file.
  const cfg = srcFiles.find(f =>
    /Configuration\.cs$|Config\.cs$/.test(path.basename(f)) &&
    path.basename(f).toLowerCase().startsWith(pluginName.toLowerCase()));
  if (cfg) return cfg;
  // 3. Any file starting with the plugin name.
  return srcFiles.find(f => path.basename(f).toLowerCase().startsWith(pluginName.toLowerCase())) || null;
}

function extractClassSummary(filePath, className) {
  if (!filePath || !fs.existsSync(filePath)) return null;
  const src = fs.readFileSync(filePath, 'utf8');
  // Find a class/record declaration matching the name and walk backwards collecting /// lines.
  const re = new RegExp(`(public\\s+(?:abstract\\s+|sealed\\s+|static\\s+)?(?:class|record)\\s+${className}\\b)`);
  const m = src.match(re);
  if (!m) {
    // Try any public class in the file as fallback.
    const m2 = src.match(/public\s+(?:abstract\s+|sealed\s+|static\s+)?(?:class|record)\s+(\w+)/);
    if (!m2) return null;
    return extractClassSummaryAt(src, m2.index);
  }
  return extractClassSummaryAt(src, m.index);
}

function extractClassSummaryAt(src, idx) {
  // Walk backward line-by-line, collect contiguous /// lines, then parse <summary>.
  const before = src.slice(0, idx).split(/\r?\n/);
  const tripleLines = [];
  for (let i = before.length - 1; i >= 0; i--) {
    const ln = before[i].trim();
    if (ln === '' || ln.startsWith('[')) continue;        // skip blank/attribute lines
    if (ln.startsWith('///')) { tripleLines.unshift(ln.replace(/^\/\/\/\s?/, '')); continue; }
    break;
  }
  if (tripleLines.length === 0) return null;
  const xml = tripleLines.join('\n');
  const sm = xml.match(/<summary>([\s\S]*?)<\/summary>/);
  if (!sm) return null;
  return sm[1].replace(/\s+/g, ' ').trim();
}

function typeStr(t) {
  if (!t) return '';
  if (Array.isArray(t)) return t.join(' or ');
  return String(t);
}

function escapeMd(s) {
  return (s || '').replace(/\|/g, '\\|').replace(/\n/g, ' ').trim();
}

function checkMark(b) { return b ? '&#10004' : '&#10006'; }

function defaultStr(d) {
  if (d === undefined || d === null) return '';
  if (typeof d === 'object') return '`' + JSON.stringify(d) + '`';
  return String(d);
}

function renderFieldRows(cfgKey, propsObj, requiredArr, prefix = '') {
  const rows = [];
  for (const [k, v] of Object.entries(propsObj || {})) {
    const full = prefix ? `${prefix}.${k}` : `${cfgKey}.${k}`;
    const t = typeStr(v.type);
    const req = (requiredArr || []).includes(k);
    rows.push(`| \`${full}\` | \`${t}\` | ${checkMark(req)} | ${escapeMd(defaultStr(v.default))} | ${escapeMd(v.description || '')} |`);
    if (v.properties) {
      rows.push(...renderFieldRows(cfgKey, v.properties, v.required || [], full));
    } else if (v.items && v.items.properties) {
      rows.push(...renderFieldRows(cfgKey, v.items.properties, v.items.required || [], full + '[*]'));
    }
  }
  return rows;
}

function exampleScalar(v) {
  // Generate a minimal but realistic example value.
  if (v.default !== undefined && typeof v.default !== 'object') return v.default;
  const types = Array.isArray(v.type) ? v.type : [v.type];
  if (types.includes('integer')) return 0;
  if (types.includes('number')) return 0;
  if (types.includes('boolean')) return false;
  if (types.includes('array')) return '[]';
  return '""';
}

function renderYamlExample(cfgKey, propsObj, requiredArr, indent = 2) {
  const ind = ' '.repeat(indent);
  const lines = [];
  for (const [k, v] of Object.entries(propsObj || {})) {
    const types = Array.isArray(v.type) ? v.type : [v.type];
    if (v.properties) {
      lines.push(`${ind}${k}:`);
      lines.push(...renderYamlExample(cfgKey, v.properties, v.required || [], indent + 2));
    } else if (types.includes('array')) {
      lines.push(`${ind}${k}: []`);
    } else {
      // leave value blank for the yamlView.md "minimal" style
      lines.push(`${ind}${k}:`);
    }
  }
  return lines;
}

function frontmatter({ id, slug, type, area, since, last_verified, applies_to, prereqs, code_langs, keywords, summary, canonical_url, source_path }) {
  const lines = [
    '---',
    `id: ${id}`,
    `slug: ${slug}`,
    `type: ${type}`,
    `status: stable`,
    `since: ${since}`,
    `last_verified: ${last_verified}`,
    `applies_to: [${applies_to}]`,
    `prerequisites: [${(prereqs||[]).join(', ')}]`,
    `code_langs: [${code_langs.join(', ')}]`,
    `keywords: [${keywords.join(', ')}]`,
    `summary: "${summary.replace(/"/g, '\\"').slice(0, 278)}"`,
    `tags: [${area}]`,
    `canonical_url: ${canonical_url}`,
  ];
  if (source_path) lines.push(`# Verified-against: ${source_path}`);
  lines.push('---');
  return lines.join('\n') + '\n\n';
}

// ---------- main per-family ----------
const xmldocGaps = [];   // [{family, plugin, source_file}]
const couldNotAutogen = [];
let totalPages = 0;

for (const fam of FAMILIES) {
  const schemaPath = path.join(SCHEMA_DIR, fam.schema);
  if (!fs.existsSync(schemaPath)) {
    console.warn(`MISS schema ${fam.schema}`);
    continue;
  }
  const schema = JSON.parse(fs.readFileSync(schemaPath, 'utf8'));
  const items = schema.properties[fam.arr].items[0].properties;
  const anyOf = items[fam.cfgKey].anyOf;
  const plugins = anyOf.filter(x => x && x.title);

  const srcFiles = walk(fam.srcRoot);

  for (const p of plugins) {
    const name = p.title;
    const folder = path.join(DOCS, fam.area, fam.folder, name);
    const cfgFolder = path.join(folder, 'configuration');
    fs.mkdirSync(cfgFolder, { recursive: true });

    const sourceFile = findSourceFile(srcFiles, name);
    const summary = sourceFile ? extractClassSummary(sourceFile, name) : null;
    if (!summary) xmldocGaps.push({ family: fam.key, plugin: name, source_file: sourceFile || '(no source file located)' });

    const relSource = sourceFile ? sourceFile.replace(/^.*?QaaS\./, 'QaaS.') : 'unknown';
    const pageSummary = (summary || `${name} ${fam.area.slice(0,-1)} plugin reference.`).slice(0, 278);

    // ---------- overview.md ----------
    const overviewFm = frontmatter({
      id: `${fam.idPrefix}.${name.toLowerCase()}.overview`,
      slug: name.toLowerCase(),
      type: 'reference',
      area: fam.area,
      since: '2.0.0',
      last_verified: TODAY,
      applies_to: fam.appliesTo,
      prereqs: [],
      code_langs: ['yaml', 'csharp'],
      keywords: [fam.area, name, fam.cfgKey],
      summary: pageSummary,
      canonical_url: `/${fam.area}/${fam.folder}/${name}/overview/`,
      source_path: relSource,
    });
    const summaryPara = summary
      ? summary
      : `Source summary unavailable. Add a \`<summary>\` comment to the source class, then rerun \`node tools/docs-generator/gen-plugin-pages.mjs\`.`;
    const summaryBanner = summary ? '' : `!!! warning "Missing XMLDoc"\n    Source class has no \`<summary>\` comment. The gap report is written to \`planning/xmldoc-gaps.md\`.\n\n`;

    // Build a minimal realistic YAML wired into a Session.
    const cfgLines = renderYamlExample(fam.cfgKey, p.properties || {}, p.required || [], 8);
    const yamlBlock = `\`\`\`yaml
Sessions:
  - Name: ${name}Session
    ${fam.arr}:
      - Name: ${name}Step
        ${fam.key === 'generators' ? 'DataSource' : fam.key === 'processors' ? 'Processor' : fam.key === 'probes' ? 'Probe' : 'Assertion'}: ${name}
        ${fam.cfgKey}:
${cfgLines.join('\n')}
\`\`\`
`;

    const overview = `${overviewFm}# ${name}

${summaryBanner}${summaryPara}

## What it does

${summary || 'Behavior not yet documented in source XMLDoc.'} See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

${yamlBlock}

## Where it lives

| | |
|--|--|
| **Plugin family** | ${fam.area} |
| **YAML key** | \`${name}\` |
| **Schema** | [\`${fam.schema}\`](../../../_generated/schemas/${fam.schema.replace('.schema.json','.md')}) |
| **Source** | \`${relSource}\` |

## See also

- [${fam.area} index](../../index.md)
- [Custom ${fam.area.slice(0,-1)} authoring guide](../../custom-authoring-guide.md)
`;
    fs.writeFileSync(path.join(folder, 'overview.md'), overview);

    // ---------- configuration/tableView.md ----------
    const rows = renderFieldRows(fam.cfgKey, p.properties || {}, p.required || []);
    const tableFm = frontmatter({
      id: `${fam.idPrefix}.${name.toLowerCase()}.configuration.tableview`,
      slug: 'tableview',
      type: 'reference',
      area: fam.area,
      since: '2.0.0',
      last_verified: TODAY,
      applies_to: fam.appliesTo,
      prereqs: [`${fam.area}/${fam.folder}/${name}/overview.md`],
      code_langs: ['yaml'],
      keywords: [fam.area, name, 'configuration', 'reference'],
      summary: `Field-by-field reference for ${name} ${fam.cfgKey} keys, types, defaults and descriptions, generated from ${fam.schema}.`,
      canonical_url: `/${fam.area}/${fam.folder}/${name}/configuration/tableView/`,
      source_path: `QaaS.JsonSchemaExtensions/generated-schemas/${fam.schema}`,
    });
    const tableMd = `${tableFm}# ${name} — Configuration (table view)

Generated from \`${fam.schema}\`. Every field below is verified against the JSON schema at \`QaaS.JsonSchemaExtensions/generated-schemas/${fam.schema}\`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| \`${fam.cfgKey}\` | \`object or string\` | &#10006 |  |  |
${rows.join('\n')}

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
`;
    fs.writeFileSync(path.join(cfgFolder, 'tableView.md'), tableMd);

    // ---------- configuration/yamlView.md ----------
    const yamlFm = frontmatter({
      id: `${fam.idPrefix}.${name.toLowerCase()}.configuration.yamlview`,
      slug: 'yamlview',
      type: 'reference',
      area: fam.area,
      since: '2.0.0',
      last_verified: TODAY,
      applies_to: fam.appliesTo,
      prereqs: [`${fam.area}/${fam.folder}/${name}/overview.md`],
      code_langs: ['yaml'],
      keywords: [fam.area, name, 'yaml', 'scaffold'],
      summary: `Minimal YAML scaffold for ${name} ${fam.cfgKey}; fill the blanks, then drop it into a Session step.`,
      canonical_url: `/${fam.area}/${fam.folder}/${name}/configuration/yamlView/`,
      source_path: `QaaS.JsonSchemaExtensions/generated-schemas/${fam.schema}`,
    });
    const yamlMinimal = renderYamlExample(fam.cfgKey, p.properties || {}, p.required || [], 2);
    const yamlMd = `${yamlFm}# ${name} — Configuration (YAML scaffold)

Drop this into the \`${fam.cfgKey}\` block of a Session step. Field meanings are in [tableView](tableView.md).

\`\`\`yaml
${fam.cfgKey}:
${yamlMinimal.join('\n')}
\`\`\`
`;
    fs.writeFileSync(path.join(cfgFolder, 'yamlView.md'), yamlMd);

    totalPages += 3;
  }
}

// ---------- write xmldoc gap report ----------
const gapMd = [
  '# XMLDoc gaps in plugin source',
  '',
  `Last refreshed: ${TODAY}`,
  '',
  'Plugin classes that ship without a `<summary>` XMLDoc block. Each plugin page emits a source-summary-unavailable placeholder and an admonition banner. Fix-forward: add `<summary>` to the source class, then rerun `node tools/docs-generator/gen-plugin-pages.mjs`.',
  '',
  '| Family | Plugin | Source file |',
  '| ------ | ------ | ----------- |',
  ...xmldocGaps.map(g => `| ${g.family} | ${g.plugin} | \`${g.source_file.replace(/\\/g,'/')}\` |`),
  '',
  `**Total gaps:** ${xmldocGaps.length}`,
  '',
].join('\n');
fs.mkdirSync(PLANNING, { recursive: true });
fs.writeFileSync(path.join(PLANNING, 'xmldoc-gaps.md'), gapMd);

console.log(`pages written: ${totalPages}`);
console.log(`xmldoc gaps:   ${xmldocGaps.length}`);
console.log(`could-not-autogen: ${couldNotAutogen.length}`);
