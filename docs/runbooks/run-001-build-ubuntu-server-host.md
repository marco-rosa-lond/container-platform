---
title: Build Ubuntu Server Host
id: RUN-001
status: Approved
category: runbook
owner: platform-engineering
related:
  - ../engineering/std-001-platform-directory-standard.md
  - ../../bootstrap/bootstrap-host.sh
  - run-002-install-docker-engine.md
last_updated: 2026-07-09
---

# Build Ubuntu Server Host

## Purpose

Defines the approved procedure for preparing an Ubuntu Server host for the
container platform. Use this runbook before installing Docker Engine or joining
the host to Portainer.

## Prerequisites

- Ubuntu Server LTS installed.
- Static IP address or stable DNS name assigned.
- Administrative SSH access available.
- System clock synchronized.
- Repository cloned to an administrator workstation or the host.

## Procedure

1. Log in through SSH.

   ```bash
   ssh <administrator>@<host>
   ```

2. Update operating system packages.

   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```

3. Install baseline packages.

   ```bash
   sudo apt install -y ca-certificates curl git gnupg jq lsb-release rsync tar
   ```

4. Run the bootstrap script from the repository checkout.

   ```bash
   sudo bootstrap/bootstrap-host.sh
   ```

5. Confirm the platform root exists.

   ```bash
   sudo find /opt/docker -maxdepth 1 -type d | sort
   ```

6. Add or update the host record in `inventory/hosts.yml`.

## Validation

Run:

```bash
sudo test -d /opt/docker/compose
sudo test -d /opt/docker/data
sudo test -d /opt/docker/backups
sudo test -d /opt/docker/scripts
sudo test -d /opt/docker/archive
sudo test -d /opt/docker/tmp
sudo test -d /opt/docker/logs
```

Each command exits with status `0`.

## Rollback

If bootstrap fails before Docker is installed, remove only directories created
for the failed build and rerun the procedure.

```bash
sudo rm -rf /opt/docker/tmp/*
```

Do not remove `/opt/docker/data` or `/opt/docker/backups` from a host that has
ever run production workloads.

## Related Documents

- [Platform Directory Standard](../engineering/std-001-platform-directory-standard.md)
- [Bootstrap Host Script](../../bootstrap/bootstrap-host.sh)
- [Install Docker Engine](run-002-install-docker-engine.md)
