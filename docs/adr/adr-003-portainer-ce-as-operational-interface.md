---
title: Portainer CE as Operational Interface
id: ADR-003
status: Approved
category: adr
owner: platform-engineering
related:
  - ../runbooks/run-003-deploy-portainer-ce.md
  - ../reference/doc-005-portainer-operations-reference.md
last_updated: 2026-07-09
---

# Portainer CE as Operational Interface

## Purpose

Records the platform decision to use Portainer CE as the operational interface
for Docker hosts. This ADR defines the role Portainer plays and the boundaries
it must not cross.

## Context

The platform needs an operational interface for viewing containers, deploying
Git-backed stacks, inspecting logs, and managing multiple Docker environments.
The initial platform scope does not require a larger orchestration system.

## Decision

Use Portainer CE for Docker host operations. Deploy Portainer itself from this
repository using the platform stack under `stacks/platform/portainer`.

Portainer is an interface, not the source of truth.

## Consequences

Positive consequences:

- Administrators get a consistent operational UI.
- Git-backed stacks can be deployed without custom deployment tooling.
- Additional Docker hosts can be added as Portainer environments.

Negative consequences:

- Portainer data becomes platform state and must be backed up.
- Docker socket access for the local Portainer server is sensitive and must be
  restricted to the Portainer stack.
- CE feature limits must be accepted unless a future ADR changes the edition.

## Related Documents

- [Deploy Portainer CE](../runbooks/run-003-deploy-portainer-ce.md)
- [Portainer Operations Reference](../reference/doc-005-portainer-operations-reference.md)
