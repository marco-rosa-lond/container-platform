---
title: Connect Portainer to Git
id: RUN-004
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-003-git-deployment-standard.md
  - ../reference/doc-005-portainer-operations-reference.md
  - run-005-deploy-application-stack.md
last_updated: 2026-07-09
---

# Connect Portainer to Git

## Purpose

Defines the approved procedure for configuring Portainer stacks to deploy from
this Git repository. Use this runbook after Portainer CE is running.

## Prerequisites

- Portainer CE deployed and reachable.
- Administrator access to Portainer.
- Repository URL available.
- Repository credentials or deploy key available when the repository is private.

## Procedure

1. Sign in to Portainer.
2. Open the target Docker environment.
3. Create a stack from Git.
4. Set the repository URL to this repository.
5. Set the reference to `main` for production stacks.
6. Set the Compose path to the stack directory, for example:

   ```text
   stacks/platform/portainer/compose.yaml
   stacks/applications/<project-name>/compose.yaml
   ```

7. Configure repository authentication when required.
8. Deploy the stack.
9. Record the stack deployment in the relevant stack README when operational
   behavior changes.

## Validation

Confirm in Portainer:

- Stack source is Git.
- Repository URL is correct.
- Reference is `main` or an approved commit SHA.
- Compose path points to a file in this repository.

Confirm on the host:

```bash
sudo docker compose --project-directory /opt/docker/compose/<project-name> ps
```

## Rollback

Redeploy the previous known-good Git commit or revert the Git change and deploy
the revert commit.

Do not fix production by making permanent Portainer web-editor changes.

## Related Documents

- [Git Deployment Standard](../engineering/std-003-git-deployment-standard.md)
- [Portainer Operations Reference](../reference/doc-005-portainer-operations-reference.md)
- [Deploy Application Stack](run-005-deploy-application-stack.md)
