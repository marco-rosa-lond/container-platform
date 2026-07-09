---
title: Validate Platform Health
id: RUN-008
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../reference/doc-006-validation-reference.md
  - ../../scripts/validate-host.sh
  - ../../scripts/validate-repository.sh
last_updated: 2026-07-09
---

# Validate Platform Health

## Purpose

Defines the approved validation procedure for the repository and Docker hosts.
Use this runbook after builds, deployments, restores, upgrades, and operational
changes.

## Prerequisites

- Repository checkout available for repository validation.
- Administrative host access available for host validation.
- Docker Engine installed for host validation.

## Procedure

1. Validate the repository.

   ```bash
   scripts/validate-repository.sh
   ```

2. Validate the host.

   ```bash
   sudo /opt/docker/scripts/validate-host.sh
   ```

3. Validate each affected stack.

   ```bash
   sudo docker compose --project-directory /opt/docker/compose/<project-name> ps
   sudo docker compose --project-directory /opt/docker/compose/<project-name> logs --tail 100
   ```

4. Confirm persistent data path exists.

   ```bash
   sudo test -d /opt/docker/data/<project-name>
   ```

## Validation

The validation is successful when:

- Repository validation passes.
- Docker service is active.
- Compose v2 is available.
- Required `/opt/docker` directories exist.
- Affected containers are running or intentionally stopped.
- Logs show no active startup failure.

## Rollback

If validation fails after a deployment, redeploy the previous known-good Git
commit. If validation fails after restore, stop the affected stack and restore
the previous known-good backup.

## Related Documents

- [Validation Reference](../reference/doc-006-validation-reference.md)
- [Host Validation Script](../../scripts/validate-host.sh)
- [Repository Validation Script](../../scripts/validate-repository.sh)
