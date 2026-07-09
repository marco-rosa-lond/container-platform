---
title: Scripts
id: DOC-004
status: Approved
category: reference
owner: platform-engineering
related:
  - validate-repository.sh
  - validate-host.sh
  - ../docs/reference/doc-006-validation-reference.md
last_updated: 2026-07-09
---

# Scripts

## Purpose

Stores approved operational scripts used by platform runbooks. Administrators
copy these scripts to `/opt/docker/scripts` when a host requires local execution.

## Scripts

| Script | Purpose |
|--------|---------|
| `install-docker-engine.sh` | Installs Docker Engine and Compose v2 on Ubuntu Server. |
| `deploy-stack-local.sh` | Copies a stack from Git to `/opt/docker/compose` for bootstrap operations. |
| `backup-project.sh` | Creates a cold backup of a project compose and data directory. |
| `restore-project.sh` | Restores a project backup archive to `/opt/docker`. |
| `validate-host.sh` | Validates required host state. |
| `validate-repository.sh` | Validates repository documentation and stack conventions. |

## Related Documents

- [Repository Validation Script](validate-repository.sh)
- [Host Validation Script](validate-host.sh)
- [Validation Reference](../docs/reference/doc-006-validation-reference.md)
