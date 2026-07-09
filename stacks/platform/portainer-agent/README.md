---
title: Portainer Agent Stack
id: RUN-009
status: Approved
category: reference
owner: platform-engineering
related:
  - compose.yaml
  - ../../../docs/runbooks/run-009-add-docker-host.md
  - ../../../docs/reference/doc-005-portainer-operations-reference.md
last_updated: 2026-07-09
---

# Portainer Agent Stack

## Purpose

Defines the Portainer Agent stack used to add remote Docker hosts to Portainer.
Administrators deploy this stack on Docker hosts managed by an existing
Portainer server.

## Service Summary

The stack runs the Portainer Agent and exposes the agent API on TCP port `9001`.

## Published Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `9001` | TCP | Portainer Agent endpoint. |

## Persistent Data

The Portainer Agent stack does not persist application data under
`/opt/docker/data`.

## Security Notes

The Docker socket bind mount grants the agent administrative access to the local
Docker Engine. Restrict access to TCP port `9001` to the Portainer server.

## Deployment

```bash
sudo scripts/deploy-stack-local.sh stacks/platform/portainer-agent portainer-agent
cd /opt/docker/compose/portainer-agent
sudo docker compose up -d
```

## Validation

```bash
sudo docker compose --project-directory /opt/docker/compose/portainer-agent ps
```

## Related Documents

- [Compose File](compose.yaml)
- [Add Docker Host](../../../docs/runbooks/run-009-add-docker-host.md)
- [Portainer Operations Reference](../../../docs/reference/doc-005-portainer-operations-reference.md)
