---
title: Inventory
id: DOC-002
status: Approved
category: reference
owner: platform-engineering
related:
  - hosts.yml
  - ../docs/reference/doc-002-host-inventory-reference.md
  - ../docs/engineering/std-006-host-inventory-standard.md
last_updated: 2026-07-09
---

# Inventory

## Purpose

Stores platform host inventory metadata. Administrators use this directory to
track Docker hosts without storing credentials or replacing external systems of
record.

## Files

```text
hosts.yml
```

## Rules

- Keep host names stable.
- Do not store secrets.
- Mark retired hosts as `retired` before deleting operational history.
- Keep `platform_root` set to `/opt/docker`.

## Related Documents

- [Host Inventory](hosts.yml)
- [Host Inventory Reference](../docs/reference/doc-002-host-inventory-reference.md)
- [Host Inventory Standard](../docs/engineering/std-006-host-inventory-standard.md)
