# GrpcEchoProcessor

## Purpose

`GrpcEchoProcessor` is designed for gRPC echo-style flows.

It:

- expects a non-null request body
- looks for a `Message` string property on the request type
- resolves a matching response type by replacing the `Request` suffix with `Response`
- sets `Message` to `echo::<request-message>`
- sets `Code` to `200`
- returns `byte[]` when the response type exposes `ToByteArray()`

## Configuration

This processor uses `NoConfiguration`, so there are no required processor-specific fields.

## Important Assumptions

- the request type name must end with `Request`
- the response type must exist in the same assembly
- the request type must expose a `Message` property of type `string`

Use it when you need a lightweight gRPC test double that follows the common request/response naming convention.
