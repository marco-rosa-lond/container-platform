---
title: Compose Stack Standard
id: STD-005
status: Approved
category: standard
owner: platform-engineering
related:
  - std-002-storage-standard.md
  - std-003-git-deployment-standard.md
  - ../../templates/tmp-001-compose-stack-template.md
last_updated: 2026-07-09
---

# Compose Stack Standard

## Purpose

Defines the approved structure for Docker Compose stacks in this repository.
Platform engineers use this standard when creating or reviewing platform,
shared, and application stack definitions.

## Standard

Every stack uses `compose.yaml` as the Compose file name and defines a top-level
`name`. The obsolete top-level `version` key is not used.

```yaml
name: example-stack
services:
  example:
    image: registry.example.com/example/service:1.0.0
```

## Required Files

Each stack directory contains:

```text
compose.yaml
README.md
```

Stacks that require environment variables also include:

```text
.env.example
```

Production `.env` files are not committed.

## Image Rules

Container images are pinned to an explicit version tag. The `latest` tag is not
approved for platform or production application stacks.

Approved:

```yaml
image: portainer/portainer-ce:2.39.4
```

Not approved:

```yaml
image: portainer/portainer-ce:latest
```

## Storage Rules

Persistent data uses bind mounts under `/opt/docker/data`.

```yaml
volumes:
  - /opt/docker/data/example-stack/example:/var/lib/example
```

Anonymous volumes are prohibited. Named volumes follow `STD-002` exception
rules.

## Restart Policy

Long-running services use:

```yaml
restart: unless-stopped
```

One-shot jobs document their execution model in the stack README.

## Network Rules

Each stack uses an explicitly named default network unless the service requires
an external network.

```yaml
networks:
  default:
    name: example-stack
```

External network usage must be documented in the stack README.

## Logging Rules

Services use Docker's `json-file` logging driver with bounded rotation unless a
service-specific logging design is approved.

```yaml
logging:
  driver: json-file
  options:
    max-size: "10m"
    max-file: "5"
```

## Health Checks

A service exposes a health check when the image provides a reliable command or
HTTP endpoint. If a health check is not available, the stack README documents
how to validate the service.

## Rationale

Consistent Compose structure keeps deployments reviewable and predictable across
hosts. Explicit names, pinned images, bounded logs, and bind mounts reduce
implicit runtime behavior.

## Related Documents

- [Storage Standard](std-002-storage-standard.md)
- [Git Deployment Standard](std-003-git-deployment-standard.md)
- [Compose Stack Template](../../templates/tmp-001-compose-stack-template.md)
