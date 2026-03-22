using System.Text;

namespace QaaS.Docs.Generator.Cli;

internal sealed class CliReferenceRenderer
{
    public IReadOnlyList<GeneratedDocument> RenderRunner(RunnerCliCatalog catalog)
    {
        var commandRoot = "qaas/userInterfaces/runner/commands";
        return new[]
        {
            new GeneratedDocument(
                $"{commandRoot}/commands.md",
                GeneratedDocumentHasher.WithHeader(RenderRunnerOverview(catalog), ["Runner", "cli-overview"]))
        }.Concat(catalog.Commands.Select(command => new GeneratedDocument(
                $"{commandRoot}/{command.Name}.md",
                GeneratedDocumentHasher.WithHeader(RenderRunnerCommand(command), ["Runner", command.Name, "cli-command"]))))
            .ToList();
    }

    public IReadOnlyList<GeneratedDocument> RenderMocker(MockerCliCatalog catalog)
    {
        var commandRoot = "mocker/userInterfaces/mocker/commands";
        return new[]
        {
            new GeneratedDocument(
                $"{commandRoot}/commands.md",
                GeneratedDocumentHasher.WithHeader(RenderMockerOverview(catalog), ["Mocker", "cli-overview"]))
        }.Concat(catalog.Commands.Select(command => new GeneratedDocument(
                $"{commandRoot}/{command.Name}.md",
                GeneratedDocumentHasher.WithHeader(RenderMockerCommand(command), ["Mocker", command.Name, "cli-command"]))))
            .ToList();
    }

    private static string RenderRunnerOverview(RunnerCliCatalog catalog)
    {
        var builder = new StringBuilder();
        builder.AppendLine("# Commands");
        builder.AppendLine();
        builder.AppendLine("This page is generated from a committed Runner CLI snapshot captured from the live help path.");
        builder.AppendLine();
        builder.AppendLine("Running without a command currently prints:");
        builder.AppendLine();
        builder.AppendLine("```text");
        builder.AppendLine(NormalizeHelpText(catalog.OverviewHelpText));
        builder.AppendLine("```");
        builder.AppendLine();
        builder.AppendLine("## Available Commands");
        builder.AppendLine();
        builder.AppendLine("| Command | Description |");
        builder.AppendLine("| ------- | ----------- |");
        foreach (var command in catalog.Commands.OrderBy(command => command.Name, StringComparer.Ordinal))
        {
            builder.AppendLine($"| `{command.Name}` | {Escape(command.Description)} |");
        }

        builder.AppendLine();
        builder.AppendLine("See the dedicated command pages for the full positional argument and flag reference.");
        return builder.ToString().TrimEnd();
    }

    private static string RenderMockerOverview(MockerCliCatalog catalog)
    {
        var builder = new StringBuilder();
        builder.AppendLine("# Commands");
        builder.AppendLine();
        builder.AppendLine("This page is generated from a committed Mocker CLI snapshot captured from the live help path.");
        builder.AppendLine();
        builder.AppendLine("Running without a command currently prints:");
        builder.AppendLine();
        builder.AppendLine("```text");
        builder.AppendLine(NormalizeHelpText(catalog.OverviewHelpText));
        builder.AppendLine("```");
        builder.AppendLine();
        builder.AppendLine("## Available Commands");
        builder.AppendLine();
        builder.AppendLine("| Command | Description |");
        builder.AppendLine("| ------- | ----------- |");
        foreach (var command in catalog.Commands.OrderBy(command => command.Name, StringComparer.Ordinal))
        {
            builder.AppendLine($"| `{command.Name}` | {Escape(command.Description)} |");
        }

        var commonOptions = catalog.Commands
            .Select(command => command.Options.Select(option => option.LongName).ToHashSet(StringComparer.Ordinal))
            .Aggregate((left, right) =>
            {
                left.IntersectWith(right);
                return left;
            });

        var flattenedCommonOptions = catalog.Commands
            .SelectMany(command => command.Options)
            .Where(option => commonOptions.Contains(option.LongName))
            .GroupBy(option => option.LongName, StringComparer.Ordinal)
            .Select(group => group.First())
            .OrderBy(option => option.LongName, StringComparer.Ordinal);

        builder.AppendLine();
        builder.AppendLine("## Common Flags");
        builder.AppendLine();
        builder.AppendLine("| Flag | Required | Default | Type | Description |");
        builder.AppendLine("| ---- | -------- | ------- | ---- | ----------- |");
        foreach (var option in flattenedCommonOptions)
        {
            builder.AppendLine(
                $"| `{FormatFlag(option.ShortName, option.LongName)}` | {YesNo(option.Required)} | {Escape(option.DefaultValue ?? string.Empty)} | `{option.ValueType}` | {Escape(option.HelpText)} |");
        }

        return builder.ToString().TrimEnd();
    }

    private static string RenderRunnerCommand(RunnerCliCommand command)
    {
        var builder = new StringBuilder();
        builder.AppendLine($"# {command.Name}");
        builder.AppendLine();
        builder.AppendLine(command.Description);
        builder.AppendLine();
        builder.AppendLine("## Help Output");
        builder.AppendLine();
        builder.AppendLine("```text");
        builder.AppendLine(NormalizeHelpText(command.HelpText));
        builder.AppendLine("```");

        if (command.Positionals.Count != 0)
        {
            builder.AppendLine();
            builder.AppendLine("## Positional Arguments");
            builder.AppendLine();
            builder.AppendLine("| Position | Property | Source Type | Required | Default | Value Type | Description |");
            builder.AppendLine("| -------- | -------- | ----------- | -------- | ------- | ---------- | ----------- |");
            foreach (var positional in command.Positionals.OrderBy(argument => argument.Position))
            {
                builder.AppendLine(
                    $"| `{positional.Position}` | `{positional.PropertyName}` | `{positional.SourceOptionType}` | {YesNo(positional.Required)} | {Escape(positional.DefaultValue ?? string.Empty)} | `{positional.ValueType}` | {Escape(positional.HelpText ?? string.Empty)} |");
            }
        }

        builder.AppendLine();
        builder.AppendLine("## Flags");
        builder.AppendLine();
        builder.AppendLine("| Flag | Property | Source Type | Inherited | Required | Default | Value Type | Description |");
        builder.AppendLine("| ---- | -------- | ----------- | --------- | -------- | ------- | ---------- | ----------- |");
        foreach (var option in command.Options.OrderBy(argument => argument.LongName, StringComparer.Ordinal))
        {
            builder.AppendLine(
                $"| `{FormatFlag(option.ShortName, option.LongName)}` | `{option.PropertyName}` | `{option.SourceOptionType}` | {YesNo(option.IsInherited)} | {YesNo(option.Required)} | {Escape(option.DefaultValue ?? string.Empty)} | `{option.ValueType}` | {Escape(option.HelpText ?? string.Empty)} |");
        }

        return builder.ToString().TrimEnd();
    }

    private static string RenderMockerCommand(MockerCliCommand command)
    {
        var builder = new StringBuilder();
        builder.AppendLine($"# {command.Name}");
        builder.AppendLine();
        builder.AppendLine(command.Description);
        builder.AppendLine();
        builder.AppendLine("## Help Output");
        builder.AppendLine();
        builder.AppendLine("```text");
        builder.AppendLine(NormalizeHelpText(command.HelpText));
        builder.AppendLine("```");

        if (command.Positionals.Count != 0)
        {
            builder.AppendLine();
            builder.AppendLine("## Positional Arguments");
            builder.AppendLine();
            builder.AppendLine("| Position | Property | Source Type | Inherited | Required | Default | Value Type | Description |");
            builder.AppendLine("| -------- | -------- | ----------- | --------- | -------- | ------- | ---------- | ----------- |");
            foreach (var positional in command.Positionals.OrderBy(argument => argument.Index))
            {
                builder.AppendLine(
                    $"| `{positional.Index}` | `{positional.PropertyName}` | `{positional.SourceOptionType}` | {YesNo(positional.IsInherited)} | {YesNo(positional.Required)} | {Escape(positional.DefaultValue ?? string.Empty)} | `{positional.ValueType}` | {Escape(positional.HelpText)} |");
            }
        }

        builder.AppendLine();
        builder.AppendLine("## Flags");
        builder.AppendLine();
        builder.AppendLine("| Flag | Property | Source Type | Inherited | Required | Default | Value Type | Description |");
        builder.AppendLine("| ---- | -------- | ----------- | --------- | -------- | ------- | ---------- | ----------- |");
        foreach (var option in command.Options.OrderBy(argument => argument.LongName, StringComparer.Ordinal))
        {
            builder.AppendLine(
                $"| `{FormatFlag(option.ShortName, option.LongName)}` | `{option.PropertyName}` | `{option.SourceOptionType}` | {YesNo(option.IsInherited)} | {YesNo(option.Required)} | {Escape(option.DefaultValue ?? string.Empty)} | `{option.ValueType}` | {Escape(option.HelpText)} |");
        }

        return builder.ToString().TrimEnd();
    }

    private static string FormatFlag(string? shortName, string? longName)
    {
        return shortName is null || string.IsNullOrWhiteSpace(shortName)
            ? $"--{longName}"
            : $"-{shortName}`, `--{longName}";
    }

    private static string YesNo(bool value) => value ? "Yes" : "No";

    private static string Escape(string value)
    {
        return value
            .Replace("|", "\\|", StringComparison.Ordinal)
            .Replace("\r", string.Empty, StringComparison.Ordinal)
            .Replace("\n", "<br />", StringComparison.Ordinal);
    }

    private static string NormalizeHelpText(string helpText)
    {
        var rawLines = helpText
            .TrimEnd()
            .Split(["\r\n", "\n"], StringSplitOptions.None);

        var lines = new List<string>();
        for (var index = 0; index < rawLines.Length; index++)
        {
            var line = rawLines[index];
            if ((line.Contains("CliExport", StringComparison.Ordinal) ||
                 line.Contains("SnapshotHost", StringComparison.Ordinal)) &&
                index + 1 < rawLines.Length &&
                rawLines[index + 1].StartsWith("Copyright", StringComparison.OrdinalIgnoreCase))
            {
                index++;
                continue;
            }

            lines.Add(line);
        }

        while (lines.Count != 0 && string.IsNullOrWhiteSpace(lines[0]))
        {
            lines.RemoveAt(0);
        }

        return string.Join(Environment.NewLine, lines);
    }
}
