---
title: Stacks
id: DOC-004
status: Approved
category: reference
owner: platform-engineering
related:
  - ../docs/engineering/std-005-compose-stack-standard.md
  - platform/README.md
  - applications/README.md
last_updated: 2026-07-09
---

# Stacks

## Purpose

Stores Compose stacks deployed by the platform. Administrators use this
directory as the source for Portainer Git-backed stack deployments.

## Layout

```text
stacks/
├── platform/
├── shared/
└── applications/
```

## Rules

Every deployed stack contains `compose.yaml` and `README.md`. Stacks are
deployed from Git through Portainer.

## Related Documents

- [Compose Stack Standard](../docs/engineering/std-005-compose-stack-standard.md)
- [Platform Stacks](platform/README.md)
- [Application Stacks](applications/README.md)
