---
title: Portainer Operations Reference
id: DOC-005
status: Approved
category: reference
owner: platform-engineering
related:
  - ../adr/adr-003-portainer-ce-as-operational-interface.md
  - ../runbooks/run-003-deploy-portainer-ce.md
  - ../runbooks/run-004-connect-portainer-to-git.md
last_updated: 2026-07-09
---

# Portainer Operations Reference

## Purpose

Defines the approved operational use of Portainer CE. Administrators use this
reference to distinguish normal Portainer operations from configuration changes
that must be committed to Git.

## Approved Uses

Portainer is approved for:

- Deploying Git-backed stacks.
- Viewing container health and state.
- Reading container logs.
- Restarting services during approved operations.
- Adding Docker environments.
- Confirming stack deployment status.

## Not Approved Uses

Portainer is not approved for:

- Permanent web-editor stack changes that are not committed to Git.
- Storing undocumented desired state.
- Keeping the only copy of environment configuration.
- Replacing runbooks or standards.

## Stack Deployment Model

```text
Git repository path       Portainer stack path
──────────────────       ────────────────────
stacks/platform/...  ->   platform stack
stacks/shared/...    ->   shared stack
stacks/applications  ->   application stack
```

## Local Portainer Server

The local Portainer Server stack is stored at:

```text
stacks/platform/portainer/compose.yaml
```

The stack stores persistent Portainer data at:

```text
/opt/docker/data/portainer
```

## Remote Hosts

Additional Docker hosts are added as Portainer environments. Use the
Portainer Agent stack when direct Docker socket management from the Portainer
server is not used.

## Related Documents

- [Portainer CE as Operational Interface](../adr/adr-003-portainer-ce-as-operational-interface.md)
- [Deploy Portainer CE](../runbooks/run-003-deploy-portainer-ce.md)
- [Connect Portainer to Git](../runbooks/run-004-connect-portainer-to-git.md)
