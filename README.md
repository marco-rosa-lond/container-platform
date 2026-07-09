---
title: Container Platform
id: PM-001
status: Approved
category: reference
owner: platform-engineering
related:
  - BACKLOG.md
  - CHANGELOG.md
  - CONTRIBUTING.md
  - SECURITY.md
  - docs/reference/doc-001-platform-overview.md
  - docs/engineering/std-004-documentation-standard.md
last_updated: 2026-07-09
---

# Container Platform

## Purpose

Defines the production container platform operated from this repository. This
repository is the source of truth for building Ubuntu Server Docker hosts,
deploying Portainer CE, deploying Git-backed Compose stacks, protecting
persistent data, and recovering the platform.

## Platform Scope

The approved platform baseline is:

- Ubuntu Server LTS
- Docker Engine
- Docker Compose v2
- Portainer CE
- Git-backed Portainer stacks
- Bind-mounted persistent data under `/opt/docker/data`

The repository documents the approved implementation. It is not a general Docker
knowledge base.

## Operating Model

Git is the source of truth. Portainer is an operational interface. Docker hosts
run the declared platform state.

```text
administrator
     |
     v
Git repository  --->  Portainer CE  --->  Docker host
source of truth       operations UI       runtime state
```

Containers are disposable. Persistent data is protected. Important
configuration is stored in Git and deployed to the host.

## Host Model

The platform supports multiple Docker hosts. Each host follows the same
standards and remains independently recoverable.

```text
server-prod-01
server-prod-02
server-dev-01
server-lab-01
```

Host identity and operational metadata are managed through inventory files under
`inventory/`.

## Repository Layout

```text
container-platform/
├── README.md
├── BACKLOG.md
├── CHANGELOG.md
├── LICENSE
├── CONTRIBUTING.md
├── SECURITY.md
├── docs/
│   ├── business/
│   ├── engineering/
│   ├── reference/
│   ├── runbooks/
│   └── adr/
├── bootstrap/
├── inventory/
├── stacks/
│   ├── platform/
│   ├── shared/
│   └── applications/
├── templates/
├── scripts/
├── examples/
├── assets/
└── .github/
```

## Host Filesystem Layout

Every Docker host uses `/opt/docker` as the platform root.

```text
/opt/docker/
├── compose/
├── data/
├── backups/
├── scripts/
├── archive/
├── tmp/
└── logs/
```

Compose projects live under `/opt/docker/compose`. Persistent data lives under
`/opt/docker/data`. Backups, logs, scripts, temporary files, and archived
material remain inside the same platform root.

## Delivery Workflow

1. Update or create the required standard, ADR, runbook, or template.
2. Commit the platform change to Git.
3. Deploy stacks from Git through Portainer.
4. Validate the host and affected services.
5. Update the changelog and backlog when repository scope changes.

## Initial Build Path

Use the runbooks in order when building a new host:

1. [Build Ubuntu Server Host](docs/runbooks/run-001-build-ubuntu-server-host.md)
2. [Install Docker Engine](docs/runbooks/run-002-install-docker-engine.md)
3. [Deploy Portainer CE](docs/runbooks/run-003-deploy-portainer-ce.md)
4. [Connect Portainer to Git](docs/runbooks/run-004-connect-portainer-to-git.md)
5. [Validate Platform Health](docs/runbooks/run-008-validate-platform-health.md)

## Related Documents

- [Backlog](BACKLOG.md)
- [Changelog](CHANGELOG.md)
- [Contributing](CONTRIBUTING.md)
- [Security](SECURITY.md)
- [Platform Overview](docs/reference/doc-001-platform-overview.md)
- [Documentation Standard](docs/engineering/std-004-documentation-standard.md)
