---
title: Example Application Stack
id: TMP-001
status: Approved
category: reference
owner: platform-engineering
related:
  - compose.yaml
  - ../../templates/tmp-001-compose-stack-template.md
  - ../../docs/runbooks/run-005-deploy-application-stack.md
last_updated: 2026-07-09
---

# Example Application Stack

## Purpose

Demonstrates the approved Compose stack structure for an application. This
example is not a production stack and is not deployed by default.

## Service Summary

The example runs a minimal HTTP response service to demonstrate Compose naming,
logging, restart policy, and explicit networks.

## Published Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `8080` | TCP | Example HTTP endpoint. |

## Persistent Data

None.

## Deployment

Use only in a non-production environment.

```bash
docker compose up -d
```

## Validation

```bash
docker compose ps
```

## Related Documents

- [Compose File](compose.yaml)
- [Compose Stack Template](../../templates/tmp-001-compose-stack-template.md)
- [Deploy Application Stack](../../docs/runbooks/run-005-deploy-application-stack.md)
