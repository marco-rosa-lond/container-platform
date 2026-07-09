---
title: Rotate Platform Secrets
id: RUN-010
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-008-security-baseline-standard.md
  - ../../SECURITY.md
  - ../engineering/std-003-git-deployment-standard.md
last_updated: 2026-07-09
---

# Rotate Platform Secrets

## Purpose

Defines the approved procedure for rotating platform or stack secrets without
committing secret values to Git. Use this runbook when credentials are scheduled
for rotation or suspected to be exposed.

## Prerequisites

- Owner approval for the secret rotation.
- Access to the approved external secret source.
- Administrative access to affected hosts or Portainer stacks.
- Maintenance window when the secret affects running services.

## Procedure

1. Identify affected stacks and hosts.
2. Create the replacement secret in the approved secret source.
3. Update host-local protected environment files or Portainer secret inputs.
4. Restart affected services.

   ```bash
   sudo docker compose --project-directory /opt/docker/compose/<project-name> up -d
   ```

5. Validate affected services.
6. Revoke the previous secret.
7. Record the rotation date and affected systems in the operational record.

## Validation

Confirm:

- Affected containers are running.
- Application authentication using the new secret succeeds.
- Logs show no authentication failure.
- The previous secret no longer works after revocation.

## Rollback

If the new secret fails, restore the previous secret only if it is not suspected
compromised. If compromise is suspected, keep the service stopped until a valid
replacement secret is deployed.

## Related Documents

- [Security Baseline Standard](../engineering/std-008-security-baseline-standard.md)
- [Security](../../SECURITY.md)
- [Git Deployment Standard](../engineering/std-003-git-deployment-standard.md)
