---
title: Storage Standard
id: STD-002
status: Approved
category: standard
owner: platform-engineering
related:
  - std-001-platform-directory-standard.md
  - ../adr/adr-001-bind-mounts-as-default-storage.md
  - std-007-backup-standard.md
last_updated: 2026-07-09
---

# Storage Standard

## Purpose

Defines how persistent container data is stored on every platform host. Platform
engineers use this standard when writing Compose files, creating data
directories, designing backups, and restoring services.

## Standard

Bind mounts are the default storage model. Persistent data lives under
`/opt/docker/data`.

```text
/opt/docker/data/<project-name>/
/opt/docker/data/<project-name>/<service-name>/
```

Named Docker volumes are exceptions. Anonymous volumes are prohibited.

## Bind Mount Rules

Compose files use absolute host paths for platform-managed persistent data.

Approved:

```yaml
volumes:
  - /opt/docker/data/portainer:/data
```

Not approved:

```yaml
volumes:
  - portainer_data:/data
  - ./data:/data
```

Relative paths are allowed only for read-only files committed in the same stack
directory, such as static configuration shipped with the stack.

## Data Directory Ownership

Directory ownership is set according to the container image runtime user. If the
image runs as a fixed UID or GID, the host directory uses that UID or GID. If the
image runs as root, the directory remains owned by `root:root` unless the image
vendor requires a different owner.

World-writable directories are prohibited.

## Named Volume Exceptions

A named volume may be used only when all of the following are true:

1. The container image or vendor explicitly requires a named volume.
2. A bind mount is unsupported or creates a known operational defect.
3. Backup and restore behavior is documented.
4. The exception is recorded in the stack README.
5. The decision is recorded in an ADR when it affects future operation or
   recovery.

## Disposable Data

The following locations are disposable and are not backup sources:

```text
/opt/docker/tmp
container writable layers
anonymous Docker volumes
```

Do not place application state, licenses, configuration, or backups in those
locations.

## Backup Scope

Backups include:

```text
/opt/docker/compose/<project-name>/
/opt/docker/data/<project-name>/
/opt/docker/logs/<project-name>/        when required by the service
/opt/docker/scripts/                    when host-local scripts are deployed
```

Backups do not replace application-native exports for databases or systems that
require consistency guarantees. Those applications receive service-specific
backup procedures.

## Rationale

Bind mounts make persistent data visible, inspectable, and recoverable without
requiring Docker internals. They also keep backup scope clear: if data is under
`/opt/docker/data`, it is platform data and must be protected.

## Related Documents

- [Platform Directory Standard](std-001-platform-directory-standard.md)
- [Bind Mounts as Default Storage](../adr/adr-001-bind-mounts-as-default-storage.md)
- [Backup Standard](std-007-backup-standard.md)
