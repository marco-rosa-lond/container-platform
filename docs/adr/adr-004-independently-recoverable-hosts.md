---
title: Independently Recoverable Hosts
id: ADR-004
status: Approved
category: adr
owner: platform-engineering
related:
  - ../engineering/std-006-host-inventory-standard.md
  - ../runbooks/run-009-add-docker-host.md
  - ../runbooks/run-007-restore-platform.md
last_updated: 2026-07-09
---

# Independently Recoverable Hosts

## Purpose

Records the platform decision that each Docker host must be independently
recoverable. This ADR applies to production, development, and lab hosts.

## Context

The platform must support multiple Docker hosts without redesign. A host may be
lost, rebuilt, or restored independently. Coupling host startup to another
host's local filesystem, undocumented configuration, or manual operator memory
creates recovery risk.

## Decision

Every Docker host follows the same standards and remains independently
recoverable from:

- This Git repository.
- The host inventory.
- Approved backups.
- External secret sources.

A host does not depend on another host's `/opt/docker` directory for normal
startup or recovery.

## Consequences

Positive consequences:

- Hosts can be added without changing the platform model.
- Recovery is repeatable per host.
- Production and non-production hosts share the same operating standards.

Negative consequences:

- Shared services must be designed explicitly.
- Host-specific values must be kept in inventory and approved secret stores.
- Backups must be tracked by host and project.

## Related Documents

- [Host Inventory Standard](../engineering/std-006-host-inventory-standard.md)
- [Add Docker Host](../runbooks/run-009-add-docker-host.md)
- [Restore Platform](../runbooks/run-007-restore-platform.md)
