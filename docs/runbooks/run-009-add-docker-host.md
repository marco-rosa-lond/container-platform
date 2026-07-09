---
title: Add Docker Host
id: RUN-009
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-006-host-inventory-standard.md
  - ../adr/adr-004-independently-recoverable-hosts.md
  - run-001-build-ubuntu-server-host.md
last_updated: 2026-07-09
---

# Add Docker Host

## Purpose

Defines the approved procedure for adding a Docker host to the platform without
redesigning repository structure or operating standards. Use this runbook for
production, development, and lab hosts.

## Prerequisites

- Host name and environment approved.
- Ubuntu Server LTS available.
- Network access to Portainer and backup destination available.
- Required administrator access granted.

## Procedure

1. Build the host with [Build Ubuntu Server Host](run-001-build-ubuntu-server-host.md).
2. Install Docker with [Install Docker Engine](run-002-install-docker-engine.md).
3. Add the host to `inventory/hosts.yml`.
4. Deploy the Portainer Agent when the host is managed remotely.

   ```bash
   sudo scripts/deploy-stack-local.sh stacks/platform/portainer-agent portainer-agent
   cd /opt/docker/compose/portainer-agent
   sudo docker compose up -d
   ```

5. Add the environment in Portainer.
6. Assign stacks to the host through Git-backed Portainer deployments.
7. Validate the host.

## Validation

Run:

```bash
sudo /opt/docker/scripts/validate-host.sh
sudo docker ps
```

Confirm the host appears in Portainer with the expected environment name from
inventory.

## Rollback

If the host cannot be joined, set its inventory status to `maintenance`, stop any
new stacks, and remove the incomplete Portainer environment from the UI. Keep the
host build logs for review.

## Related Documents

- [Host Inventory Standard](../engineering/std-006-host-inventory-standard.md)
- [Independently Recoverable Hosts](../adr/adr-004-independently-recoverable-hosts.md)
- [Build Ubuntu Server Host](run-001-build-ubuntu-server-host.md)
