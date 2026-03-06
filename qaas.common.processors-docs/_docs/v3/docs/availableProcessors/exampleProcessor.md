# ExampleProcessor

## Purpose

`ExampleProcessor` is the simplest processor in the package. It ignores data sources and request content, then returns a static UTF-8 response body with HTTP status code `200`.

## Configuration

This processor uses `NoConfiguration`, so there are no required processor-specific fields.

## When To Use It

Use it as:

- a starter implementation when learning how mocker processors are wired
- a health or smoke endpoint that always returns a fixed body
- a template for writing your own custom processor
