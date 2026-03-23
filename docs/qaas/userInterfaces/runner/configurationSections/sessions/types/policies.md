# Policies

Policies shape how communication actions behave while a session is running. They let you control pace, retries, limits, and phased traffic patterns without rewriting the action itself, which makes them the main lever for turning a simple functional check into a realistic workload profile.

Use them when the same publisher, consumer, transaction, or mocker command needs to behave differently under smoke, load, soak, or ramp scenarios. In practice, policies are what let you keep one test definition and still express "send slowly", "burst in stages", "stop after this limit", or "keep pushing until timeout" in a clear, reusable way.

In order to see all the available policies visit [QaaS.Framework.Policies](../../../../../../framework/projects/policies.md).
