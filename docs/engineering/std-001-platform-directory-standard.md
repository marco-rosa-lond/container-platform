---
title: Platform Directory Standard
id: STD-001
status: Approved
category: standard
owner: platform-engineering
related:
  - ../../README.md
  - std-002-storage-standard.md
  - std-004-documentation-standard.md
last_updated: 2026-07-09
---

# Platform Directory Standard

## Purpose

Defines the approved filesystem layout for every Docker host managed by this
repository. Platform engineers use this standard when building hosts, deploying
stacks, writing scripts, creating backups, and restoring services.

## Standard

Every platform host uses `/opt/docker` as the platform root. The root contains
only the approved first-level directories shown below.

```text
/opt/docker/
├── compose/
├── data/
├── backups/
├── scripts/
├── archive/
├── tmp/
└── logs/
```

The same layout applies to every host, including production, development, and
lab hosts.

## Directory Rules

### `/opt/docker/compose`

Stores Compose project directories deployed on the host.

```text
/opt/docker/compose/<project-name>/
```

The project directory contains the files required to run that stack on the host,
including `compose.yaml` and approved non-secret configuration files. Important
configuration is stored in Git and deployed to the host from the repository.

### `/opt/docker/data`

Stores persistent application and platform data used by containers through bind
mounts.

```text
/opt/docker/data/<project-name>/
/opt/docker/data/<project-name>/<service-name>/
```

Containers are disposable. Data under `/opt/docker/data` is not disposable and
is included in backup and restore scope.

### `/opt/docker/backups`

Stores host-local backup artifacts, restore staging material, and backup job
working files.

```text
/opt/docker/backups/<scope>/<yyyy-mm-dd>/
```

Backup files are operational artifacts and are not used as live container data.

### `/opt/docker/scripts`

Stores host-local operational scripts approved for the platform. Scripts are
copied or deployed from the repository.

### `/opt/docker/archive`

Stores retired platform material kept for short-term operational reference.
Archived material is not used by running containers.

### `/opt/docker/tmp`

Stores temporary platform working files. Files in this directory are disposable.

### `/opt/docker/logs`

Stores platform-managed logs that must persist outside Docker's default logging
configuration.

```text
/opt/docker/logs/<project-name>/
/opt/docker/logs/<platform-task>/
```

## Repository-to-Host Mapping

```text
container-platform/                  Docker host
──────────────────                  ───────────
stacks/platform/<project>/      ->   /opt/docker/compose/<project>/
stacks/shared/<project>/        ->   /opt/docker/compose/<project>/
stacks/applications/<project>/  ->   /opt/docker/compose/<project>/
scripts/                        ->   /opt/docker/scripts/
```

Persistent runtime data is not stored in Git:

```text
/opt/docker/data/<project>/
/opt/docker/backups/<scope>/
/opt/docker/logs/<project>/
```

## Naming Rules

Directory names use lowercase letters, numbers, and hyphens.

Approved:

```text
portainer
postgres-primary
vehicle-api
```

Not approved:

```text
Portainer
postgres_primary
vehicle api
```

A Compose project name, data directory name, backup scope, and log directory use
the same `<project-name>` where they refer to the same stack.

## Host Independence

Each host is independently recoverable. A host must not depend on another host's
local `/opt/docker` directory for normal startup, backup validation, or restore.

Host-specific values are recorded in inventory or approved environment files.
They are not encoded by changing the directory standard on a per-host basis.

## Prohibited Locations

Do not store platform-managed Compose projects, persistent data, backups,
scripts, archives, temporary files, or platform-managed logs in these locations:

```text
/root
/home/<user>
/tmp
/var/tmp
/var/lib/docker/volumes
```

`/var/lib/docker/volumes` is used only when an approved exception requires a
Docker named volume.

## Rationale

A fixed host layout makes backup, restore, monitoring, and troubleshooting
repeatable across every Docker host. Keeping platform material under one root
reduces implicit knowledge and removes host-specific guesswork during recovery.

## Related Documents

- [Container Platform](../../README.md)
- [Storage Standard](std-002-storage-standard.md)
- [Documentation Standard](std-004-documentation-standard.md)
