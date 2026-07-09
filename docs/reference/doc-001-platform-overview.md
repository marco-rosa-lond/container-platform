---
title: Platform Overview
id: DOC-001
status: Approved
category: reference
owner: platform-engineering
related:
  - ../../README.md
  - ../adr/adr-002-git-as-source-of-truth.md
  - ../adr/adr-003-portainer-ce-as-operational-interface.md
last_updated: 2026-07-09
---

# Platform Overview

## Purpose

Describes the architecture, operating model, and lifecycle of the container
platform. Administrators use this document to understand how the repository,
Portainer, Docker hosts, stacks, data, and backups fit together.

## Architecture

```text
                    ┌──────────────────────┐
                    │ container-platform    │
                    │ Git repository        │
                    └──────────┬───────────┘
                               │ deploys from Git
                               v
                    ┌──────────────────────┐
                    │ Portainer CE          │
                    │ operational interface │
                    └──────────┬───────────┘
                               │ manages Docker API
        ┌──────────────────────┼──────────────────────┐
        v                      v                      v
┌───────────────┐      ┌───────────────┐      ┌───────────────┐
│ server-prod-01│      │ server-dev-01 │      │ server-lab-01 │
│ /opt/docker   │      │ /opt/docker   │      │ /opt/docker   │
└───────────────┘      └───────────────┘      └───────────────┘
```

## Repository Responsibilities

The repository stores:

- Standards.
- ADRs.
- Runbooks.
- Host inventory metadata.
- Compose stacks.
- Templates.
- Scripts.
- Examples.

The repository does not store live persistent data or secret values.

## Host Responsibilities

Each Docker host stores runtime state under `/opt/docker`:

```text
/opt/docker/compose   deployed stack files
/opt/docker/data      persistent application and platform data
/opt/docker/backups   backup artifacts and restore staging
/opt/docker/scripts   approved host scripts
/opt/docker/logs      retained platform-managed logs
```

## Deployment Lifecycle

```text
change requested
      |
      v
update Git files
      |
      v
review repository change
      |
      v
deploy Git-backed stack in Portainer
      |
      v
validate service and host
      |
      v
record operational outcome
```

## Recovery Lifecycle

```text
identify failed host or service
      |
      v
build or prepare Ubuntu Server host
      |
      v
install Docker Engine
      |
      v
restore /opt/docker data from backup
      |
      v
deploy stacks from Git through Portainer
      |
      v
validate platform health
```

## Related Documents

- [Container Platform](../../README.md)
- [Git as Source of Truth](../adr/adr-002-git-as-source-of-truth.md)
- [Portainer CE as Operational Interface](../adr/adr-003-portainer-ce-as-operational-interface.md)
