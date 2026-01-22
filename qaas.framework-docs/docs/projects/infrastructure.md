# QaaS.Framework.Infrastructure

This project provides essential utility extensions for `DateTime` and file system operations used throughout the QaaS
ecosystem.

## DateTime Extensions

- `ConvertDateTimeToUtcByTimeZoneOffset`: Converts a local time to UTC using a specified summer-time offset, adjusting
  for daylight saving if needed.
- `ConvertDateTimeFromUtcToTimeZoneByTimeZoneOffset`: Converts UTC time back to local time with proper offset handling.
- `IsDayLightSavingTimeInGivenDateTime`: Checks if a given datetime falls within daylight saving in Israel’s time zone.

These extensions are designed for consistent time handling across environments, especially for systems operating in
Israel’s time zone (e.g., `Asia/Jerusalem` on Unix, `Israel Standard Time` on Windows).

## File System Extensions

- `MakeValidDirectoryName`: Replaces invalid characters in a string with underscores to create a valid directory name
  for the current OS.

### Usage

This package is used by [QaaS.Framework.Protocols](protocols.md), which relies on its utilities and also by other packages in the
QaaS Ecosystem such as `QaaS.Runner`.
