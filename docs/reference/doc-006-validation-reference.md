---
title: Validation Reference
id: DOC-006
status: Approved
category: reference
owner: platform-engineering
related:
  - ../runbooks/run-008-validate-platform-health.md
  - ../../scripts/validate-host.sh
  - ../../scripts/validate-repository.sh
last_updated: 2026-07-09
---

# Validation Reference

## Purpose

Defines common validation checks used by platform runbooks. Administrators use
this reference to interpret validation output consistently.

## Repository Validation

Run from the repository root:

```bash
scripts/validate-repository.sh
```

Expected result:

```text
repository validation passed
```

## Host Validation

Run on a Docker host:

```bash
sudo /opt/docker/scripts/validate-host.sh
```

Expected checks:

- Ubuntu Server is detected.
- Docker service is active.
- Docker Compose v2 is available.
- Required `/opt/docker` directories exist.
- Docker can list containers.
- Portainer container status is visible when deployed.

## Compose Validation

Run from a stack directory:

```bash
docker compose config
```

The command must complete without parsing errors.

## Service Validation

Run from a deployed project directory:

```bash
docker compose ps
docker compose logs --tail 100
```

A service is healthy when the expected containers are running, health checks pass
where defined, and logs show no active startup failure.

## Related Documents

- [Validate Platform Health](../runbooks/run-008-validate-platform-health.md)
- [Host Validation Script](../../scripts/validate-host.sh)
- [Repository Validation Script](../../scripts/validate-repository.sh)
