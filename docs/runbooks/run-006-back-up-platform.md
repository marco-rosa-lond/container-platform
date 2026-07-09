---
title: Back Up Platform
id: RUN-006
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-007-backup-standard.md
  - ../../scripts/backup-project.sh
  - run-007-restore-platform.md
last_updated: 2026-07-09
---

# Back Up Platform

## Purpose

Defines the approved procedure for backing up platform-managed Docker project
data. Use this runbook before upgrades, risky changes, and scheduled backup
operations.

## Prerequisites

- Docker host is active in inventory.
- `/opt/docker` layout exists.
- Backup destination has sufficient free space.
- Application-specific backup requirements are known.
- Operator has administrative host access.

## Procedure

1. Identify the project.

   ```bash
   PROJECT=portainer
   ```

2. Create a cold project backup.

   ```bash
   sudo /opt/docker/scripts/backup-project.sh "$PROJECT"
   ```

3. Copy the generated backup and checksum to the approved off-host destination.

4. Record backup metadata:

   ```text
   host
   project
   archive path
   checksum path
   operator
   validation result
   ```

## Validation

Verify the archive checksum.

```bash
sha256sum -c /opt/docker/backups/<project>/<date>/<archive>.sha256
```

List archive contents.

```bash
tar -tzf /opt/docker/backups/<project>/<date>/<archive>.tar.gz | head
```

Expected result:

- Checksum passes.
- Archive contains `compose/` and `data/` entries for the project.

## Rollback

If backup validation fails, discard the failed archive and rerun the backup. Do
not use an unvalidated archive for restore.

## Related Documents

- [Backup Standard](../engineering/std-007-backup-standard.md)
- [Backup Project Script](../../scripts/backup-project.sh)
- [Restore Platform](run-007-restore-platform.md)
