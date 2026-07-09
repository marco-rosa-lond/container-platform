---
title: Git as Source of Truth
id: ADR-002
status: Approved
category: adr
owner: platform-engineering
related:
  - ../engineering/std-003-git-deployment-standard.md
  - ../reference/doc-005-portainer-operations-reference.md
last_updated: 2026-07-09
---

# Git as Source of Truth

## Purpose

Records the platform decision that Git owns desired platform state. This ADR
applies to standards, runbooks, inventory, scripts, templates, and Compose
stacks in this repository.

## Context

Portainer provides an operational interface for Docker hosts. It can also edit
stacks directly. Direct edits are convenient but create configuration that is
not reviewed, not versioned, and not recoverable from repository history.

The platform must remain maintainable for years and support multiple hosts.
That requires a single source of truth.

## Decision

Git is the source of truth. Portainer deploys stacks from Git and is not used to
store permanent desired state that is absent from this repository.

## Consequences

Positive consequences:

- Platform changes are reviewable.
- Rollback uses Git history.
- Recovery does not depend on Portainer-only state.
- Documentation and implementation change together.

Negative consequences:

- Emergency UI changes must be reconciled back to Git.
- Operators must understand the Git workflow before managing production stacks.

## Related Documents

- [Git Deployment Standard](../engineering/std-003-git-deployment-standard.md)
- [Portainer Operations Reference](../reference/doc-005-portainer-operations-reference.md)
