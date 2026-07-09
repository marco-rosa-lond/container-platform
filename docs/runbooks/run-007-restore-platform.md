---
title: Restore Platform
id: RUN-007
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-007-backup-standard.md
  - ../../scripts/restore-project.sh
  - run-008-validate-platform-health.md
last_updated: 2026-07-09
---

# Restore Platform

## Purpose

Defines the approved procedure for restoring a platform-managed Docker project
from backup. Use this runbook during host recovery, failed upgrades, or project
rebuilds.

## Prerequisites

- Replacement or existing host is prepared.
- Docker Engine is installed.
- `/opt/docker` layout exists.
- Validated backup archive and checksum are available.
- Required secrets are available from the approved secret source.

## Procedure

1. Copy backup archive and checksum to the host.
2. Verify checksum.

   ```bash
   sha256sum -c <archive>.sha256
   ```

3. Stop the target stack if it exists.

   ```bash
   cd /opt/docker/compose/<project-name>
   sudo docker compose down
   ```

4. Restore the project.

   ```bash
   sudo /opt/docker/scripts/restore-project.sh <project-name> <archive>.tar.gz
   ```

5. Restore host-local secret files from the approved secret source.
6. Start the stack.

   ```bash
   cd /opt/docker/compose/<project-name>
   sudo docker compose up -d
   ```

## Validation

Run:

```bash
sudo docker compose --project-directory /opt/docker/compose/<project-name> ps
sudo docker compose --project-directory /opt/docker/compose/<project-name> logs --tail 100
```

Confirm application-specific validation passes.

## Rollback

If restore validation fails, stop the stack and restore the previous known-good
backup. Keep failed restore artifacts in `/opt/docker/tmp` until the incident is
reviewed.

## Related Documents

- [Backup Standard](../engineering/std-007-backup-standard.md)
- [Restore Project Script](../../scripts/restore-project.sh)
- [Validate Platform Health](run-008-validate-platform-health.md)
