---
title: Bind Mounts as Default Storage
id: ADR-001
status: Approved
category: adr
owner: platform-engineering
related:
  - ../engineering/std-002-storage-standard.md
  - ../engineering/std-001-platform-directory-standard.md
last_updated: 2026-07-09
---

# Bind Mounts as Default Storage

## Purpose

Records the platform decision to use bind mounts as the default persistent
storage model. This ADR applies to all Docker hosts and Compose stacks managed
by this repository.

## Context

The platform must be recoverable without relying on undocumented Docker runtime
internals. Operators must be able to inspect, back up, copy, and restore
persistent data from known host paths.

Docker named volumes are operationally useful but hide data under Docker's
storage area and make backup scope less visible. Anonymous volumes are worse
because they are easy to create accidentally and hard to audit.

## Decision

Use bind mounts under `/opt/docker/data` as the default persistent storage
model.

```text
/opt/docker/data/<project-name>/<service-name>/
```

Named volumes are controlled exceptions. Anonymous volumes are not approved.

## Consequences

Positive consequences:

- Backup scope is visible on the host filesystem.
- Restore procedures are easier to document.
- Data ownership can be inspected with normal Linux tools.
- Host migration does not require Docker volume internals.

Negative consequences:

- Directory permissions must be managed explicitly.
- Compose files contain host paths.
- Some vendor examples must be adapted before use.

## Related Documents

- [Storage Standard](../engineering/std-002-storage-standard.md)
- [Platform Directory Standard](../engineering/std-001-platform-directory-standard.md)
