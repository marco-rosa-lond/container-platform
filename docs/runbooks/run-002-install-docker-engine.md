---
title: Install Docker Engine
id: RUN-002
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../../scripts/install-docker-engine.sh
  - run-003-deploy-portainer-ce.md
  - ../engineering/std-008-security-baseline-standard.md
last_updated: 2026-07-09
---

# Install Docker Engine

## Purpose

Defines the approved Docker Engine installation procedure for Ubuntu Server LTS
hosts. Use this runbook after the host has been prepared with `RUN-001`.

## Prerequisites

- Host prepared by [Build Ubuntu Server Host](run-001-build-ubuntu-server-host.md).
- Administrative shell access.
- Internet access to Ubuntu and Docker package repositories.
- No production workload running on the host.

## Procedure

1. Copy approved scripts to the host when they are not already present.

   ```bash
   sudo rsync -a scripts/ /opt/docker/scripts/
   ```

2. Install Docker Engine and Compose v2.

   ```bash
   sudo /opt/docker/scripts/install-docker-engine.sh
   ```

3. Enable and start Docker.

   ```bash
   sudo systemctl enable --now docker
   ```

4. Confirm Docker Engine responds.

   ```bash
   sudo docker version
   sudo docker compose version
   ```

## Validation

Run:

```bash
sudo systemctl is-active docker
sudo docker run --rm hello-world
sudo docker compose version
```

Expected result:

- Docker service is `active`.
- `hello-world` exits successfully.
- Compose v2 version is printed.

## Rollback

On a failed new installation, remove Docker packages and retry after reviewing
package repository configuration.

```bash
sudo apt purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo apt autoremove -y
```

Do not remove `/var/lib/docker` on a host that has ever run workloads unless a
restore plan is already approved.

## Related Documents

- [Install Docker Engine Script](../../scripts/install-docker-engine.sh)
- [Deploy Portainer CE](run-003-deploy-portainer-ce.md)
- [Security Baseline Standard](../engineering/std-008-security-baseline-standard.md)
