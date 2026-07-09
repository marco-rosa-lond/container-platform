---
title: Host Inventory Standard
id: STD-006
status: Approved
category: standard
owner: platform-engineering
related:
  - ../reference/doc-002-host-inventory-reference.md
  - ../../inventory/README.md
  - ../adr/adr-004-independently-recoverable-hosts.md
last_updated: 2026-07-09
---

# Host Inventory Standard

## Purpose

Defines the required metadata for Docker hosts managed by this platform.
Platform engineers use this standard when adding hosts, validating host state,
and planning recovery.

## Standard

Inventory is stored under `inventory/`. The inventory file records host identity,
environment, role, access endpoint, platform root, and recovery metadata.

The canonical inventory file is:

```text
inventory/hosts.yml
```

## Required Host Fields

Each host record contains:

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Stable host name. |
| `environment` | Yes | `production`, `development`, or `lab`. |
| `role` | Yes | Platform role, such as `docker-host`. |
| `address` | Yes | DNS name or management IP. |
| `os` | Yes | Operating system family and version. |
| `platform_root` | Yes | Always `/opt/docker`. |
| `portainer_environment` | Yes | Portainer environment name. |
| `backup_profile` | Yes | Backup policy reference. |
| `status` | Yes | `active`, `maintenance`, or `retired`. |

## Naming Rules

Host names use lowercase letters, numbers, and hyphens.

Approved:

```text
server-prod-01
server-dev-01
server-lab-01
```

Not approved:

```text
ServerProd01
server_prod_01
server prod 01
```

## Inventory Rules

- Inventory does not store passwords, private keys, tokens, or certificates.
- Inventory does not replace CMDB, DNS, or monitoring.
- Inventory records platform metadata required to operate this repository.
- Retired hosts remain in inventory with `status: retired` until operational
  history is no longer required.

## Rationale

Multi-host platforms fail when host metadata lives only in operator memory.
Inventory gives each host a recoverable identity without making the platform
depend on one server.

## Related Documents

- [Host Inventory Reference](../reference/doc-002-host-inventory-reference.md)
- [Inventory README](../../inventory/README.md)
- [Independently Recoverable Hosts](../adr/adr-004-independently-recoverable-hosts.md)
