---
title: Backup Standard
id: STD-007
status: Approved
category: standard
owner: platform-engineering
related:
  - std-002-storage-standard.md
  - ../runbooks/run-006-back-up-platform.md
  - ../runbooks/run-007-restore-platform.md
last_updated: 2026-07-09
---

# Backup Standard

## Purpose

Defines how platform data is backed up and validated. Platform engineers use
this standard when designing backup jobs, writing runbooks, and reviewing new
stacks.

## Standard

Backups protect persistent platform and application data. A backup is not valid
until it is restorable and the restore procedure is documented.

## Backup Scope

Platform backup scope includes:

```text
/opt/docker/compose/
/opt/docker/data/
/opt/docker/scripts/
/opt/docker/logs/        when logs are required for operational retention
inventory/              from Git
stacks/                 from Git
```

The Git repository protects desired configuration. Host backups protect runtime
state and persistent data.

## Consistency Rule

A filesystem archive is sufficient only for services that can be safely backed
up from stopped containers or from quiescent files. Databases and stateful
systems with consistency requirements need application-native backup procedures.

## Retention Classes

| Class | Scope | Minimum Retention |
|-------|-------|-------------------|
| `platform` | Portainer, Compose projects, scripts, platform metadata | 30 days |
| `application` | Application persistent data | Defined by the application owner |
| `pre-change` | Manual backup before risky work | Until the change is validated |
| `pre-upgrade` | Backup before platform upgrade | Until rollback is no longer required |

## Off-Host Rule

A backup stored only on the source host is not sufficient. Backups must be copied
to an approved off-host destination after creation.

## Validation Rule

Every backup job records:

- Source host.
- Backup scope.
- Archive path.
- Checksum path.
- Start and end time.
- Validation result.

A restore test is performed after material backup design changes.

## Rationale

The platform treats persistent data as the protected asset. Standard backup
scope and validation prevent recoveries from depending on undocumented host
state or Docker internals.

## Related Documents

- [Storage Standard](std-002-storage-standard.md)
- [Back Up Platform](../runbooks/run-006-back-up-platform.md)
- [Restore Platform](../runbooks/run-007-restore-platform.md)
