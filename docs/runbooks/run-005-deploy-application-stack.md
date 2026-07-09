---
title: Deploy Application Stack
id: RUN-005
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-005-compose-stack-standard.md
  - ../../templates/tmp-001-compose-stack-template.md
  - run-008-validate-platform-health.md
last_updated: 2026-07-09
---

# Deploy Application Stack

## Purpose

Defines the approved procedure for deploying an application stack to a Docker
host through Portainer and Git. Use this runbook for new application stacks and
controlled changes to existing stacks.

## Prerequisites

- Application stack exists under `stacks/applications/<project-name>/`.
- Stack follows the Compose stack standard.
- Persistent data paths exist or are created during deployment.
- Required secrets are available outside Git.
- Target host is active in inventory.

## Procedure

1. Validate the stack locally or on a non-production host.

   ```bash
   docker compose -f stacks/applications/<project-name>/compose.yaml config
   ```

2. Commit the stack and documentation changes to Git.
3. In Portainer, create or update a Git-backed stack.
4. Set Compose path:

   ```text
   stacks/applications/<project-name>/compose.yaml
   ```

5. Configure environment variables from the approved secret source.
6. Deploy the stack.
7. Validate service state and logs.

## Validation

Run on the target host:

```bash
sudo docker compose --project-directory /opt/docker/compose/<project-name> ps
sudo docker compose --project-directory /opt/docker/compose/<project-name> logs --tail 100
```

Confirm:

- Required containers are running.
- Health checks pass where defined.
- Published ports match the stack README.
- Persistent data appears under `/opt/docker/data/<project-name>`.

## Rollback

Redeploy the previous known-good commit through Portainer. If data migration was
performed, follow the application-specific rollback procedure before starting
the previous container version.

## Related Documents

- [Compose Stack Standard](../engineering/std-005-compose-stack-standard.md)
- [Compose Stack Template](../../templates/tmp-001-compose-stack-template.md)
- [Validate Platform Health](run-008-validate-platform-health.md)
