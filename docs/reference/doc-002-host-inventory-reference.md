---
title: Host Inventory Reference
id: DOC-002
status: Approved
category: reference
owner: platform-engineering
related:
  - ../engineering/std-006-host-inventory-standard.md
  - ../../inventory/README.md
  - ../../inventory/hosts.yml
last_updated: 2026-07-09
---

# Host Inventory Reference

## Purpose

Defines the inventory model used to track Docker hosts. Administrators use this
reference when adding, reviewing, or retiring hosts.

## Inventory File

The canonical inventory file is:

```text
inventory/hosts.yml
```

## Schema

```yaml
hosts:
  - name: server-prod-01
    environment: production
    role: docker-host
    address: server-prod-01.example.internal
    os: ubuntu-server-lts
    platform_root: /opt/docker
    portainer_environment: server-prod-01
    backup_profile: platform-standard
    status: active
```

## Field Values

### `environment`

Approved values:

```text
production
development
lab
```

### `role`

Approved baseline value:

```text
docker-host
```

Additional role values require a standard update.

### `status`

Approved values:

```text
active
maintenance
retired
```

## Secrets

Inventory does not contain passwords, tokens, private keys, certificates, or
secret retrieval material.

## Related Documents

- [Host Inventory Standard](../engineering/std-006-host-inventory-standard.md)
- [Inventory README](../../inventory/README.md)
- [Host Inventory](../../inventory/hosts.yml)
