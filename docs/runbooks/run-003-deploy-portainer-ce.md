---
title: Deploy Portainer CE
id: RUN-003
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../../stacks/platform/portainer/README.md
  - ../../stacks/platform/portainer/compose.yaml
  - run-004-connect-portainer-to-git.md
last_updated: 2026-07-09
---

# Deploy Portainer CE

## Purpose

Defines the approved procedure for deploying the first Portainer CE server on a
Docker host. Use this runbook after Docker Engine is installed.

## Prerequisites

- Docker Engine installed and validated.
- `/opt/docker` directory structure present.
- Administrative access to the host.
- TCP port `9443` reachable by administrators.

## Procedure

1. Create Portainer data directory.

   ```bash
   sudo install -d -m 0750 /opt/docker/data/portainer
   ```

2. Deploy the stack files to the host.

   ```bash
   sudo scripts/deploy-stack-local.sh stacks/platform/portainer portainer
   ```

3. Start Portainer.

   ```bash
   cd /opt/docker/compose/portainer
   sudo docker compose up -d
   ```

4. Open the Portainer UI.

   ```text
   https://<host>:9443
   ```

5. Complete the initial administrator setup in the UI.

6. Select the local Docker environment when prompted.

## Validation

Run:

```bash
sudo docker ps --filter name=portainer
sudo docker compose --project-directory /opt/docker/compose/portainer ps
```

Expected result:

- The `portainer` container is running.
- Port `9443` is published.
- Portainer UI is reachable by administrators.

## Rollback

Stop the Portainer stack without deleting persistent data.

```bash
cd /opt/docker/compose/portainer
sudo docker compose down
```

To redeploy, rerun the procedure. Do not delete `/opt/docker/data/portainer`
unless a restore or rebuild has been approved.

## Related Documents

- [Portainer Stack README](../../stacks/platform/portainer/README.md)
- [Portainer Compose File](../../stacks/platform/portainer/compose.yaml)
- [Connect Portainer to Git](run-004-connect-portainer-to-git.md)
