# 3. Disable Kiali Operator for DUBBD

Date: 2023-08-09

## Status

Accepted

## Context

Big Bang core (umbrella) is configured with certain "defaults" such as charts enabled or disabled and specific application configurations. It is preferred that to stay aligned wherever possible with these defaults, but in certain scenarios DUBBD may deviate from them, for example:

* Simplification
* Performance optimization
* Compliance / controls alignment
* Best practices (from platform experience)
* Application features

## Decision

DUBBD will be configured to disable the Kiali Operator, which is currently enabled in Big Bang core by default.

## Consequences

This change is expected to improve DUBBD in these regards:

* Simplification - less software to support and maintain
* Performance optimization - lower cluster compute utilization as the Kiali Operator is resource intensive
* Compliance / controls alignment - no impact to existing controls being satisfied by DUBBD
* Best practices (from platform experience) - anecdotally, the "always-on" Kiali instance was leveraged only occasionally, as opposed to other similar DUBBD tools that were used very regularly

But it will also introduce the following risks:

* Application features - similar functionality will require a different solution or an alternative means to employ Kiali on an as-needed basis
* Simplification - to compensate for the removal, it may introduce complexity elsewhere in the overall stack and / or the platform team's means for environment observability
