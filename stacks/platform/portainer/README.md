---
title: Portainer Stack
id: RUN-003
status: Approved
category: reference
owner: platform-engineering
related:
  - compose.yaml
  - ../../../docs/runbooks/run-003-deploy-portainer-ce.md
  - ../../../docs/reference/doc-005-portainer-operations-reference.md
last_updated: 2026-07-09
---

# Portainer Stack

## Purpose

Defines the Portainer CE server stack used as the platform operational
interface. Administrators deploy this stack on the host that runs the primary
Portainer server.

## Service Summary

The stack runs Portainer CE and connects it to the local Docker Engine through
`/var/run/docker.sock`.

## Published Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `9443` | TCP | Portainer HTTPS UI and API. |
| `8000` | TCP | Portainer Edge agent tunnel endpoint. |

## Persistent Data

```text
/opt/docker/data/portainer
```

## Security Notes

The Docker socket bind mount grants Portainer administrative control of the
local Docker Engine. Access to the Portainer UI is restricted to approved
administrators.

## Deployment

Deploy locally for initial bootstrap or through Portainer after Git connection
is established.

```bash
sudo scripts/deploy-stack-local.sh stacks/platform/portainer portainer
cd /opt/docker/compose/portainer
sudo docker compose up -d
```

## Validation

```bash
sudo docker compose --project-directory /opt/docker/compose/portainer ps
```

## Related Documents

- [Compose File](compose.yaml)
- [Deploy Portainer CE](../../../docs/runbooks/run-003-deploy-portainer-ce.md)
- [Portainer Operations Reference](../../../docs/reference/doc-005-portainer-operations-reference.md)
