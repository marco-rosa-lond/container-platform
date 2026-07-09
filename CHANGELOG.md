---
title: Changelog
id: PM-001
status: Approved
category: reference
owner: platform-engineering
related:
  - README.md
  - BACKLOG.md
  - docs/reference/doc-001-platform-overview.md
last_updated: 2026-07-09
---

# Changelog

## Purpose

Records completed platform repository changes in chronological order. The
changelog captures changes that affect platform operation, maintenance,
recovery, standards, security, or repository structure.

## Format

Each release uses this structure:

```text
## <version> - <YYYY-MM-DD>

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security
```

Sections with no entries are omitted.

## 1.0.0 - 2026-07-09

### Added

- Added platform standards for directories, storage, Git deployment, Compose,
  inventory, backups, and security.
- Added ADRs for bind mounts, Git as source of truth, Portainer CE, and
  independently recoverable hosts.
- Added runbooks for host build, Docker installation, Portainer deployment,
  Git connection, stack deployment, backup, restore, validation, host onboarding,
  and secret rotation.
- Added Portainer CE and Portainer Agent Compose stacks.
- Added Compose and environment templates.
- Added bootstrap, installation, validation, deployment, backup, and restore
  scripts.
- Added inventory files and examples for multi-host operation.
- Added GitHub repository validation workflow.

## 0.1.1 - 2026-07-09

### Added

- Added `STD-001` to define the approved `/opt/docker` host directory layout.
- Documented repository-to-host path mapping for Compose projects and scripts.

## 0.1.0 - 2026-07-09

### Added

- Created the initial `container-platform` repository baseline.
- Added required root governance files.
- Added the approved documentation standard as `STD-004`.
- Added the required top-level directory structure for future platform work.

## Related Documents

- [Container Platform](README.md)
- [Backlog](BACKLOG.md)
- [Platform Overview](docs/reference/doc-001-platform-overview.md)
