---
title: Security Baseline Standard
id: STD-008
status: Approved
category: standard
owner: platform-engineering
related:
  - ../../SECURITY.md
  - ../runbooks/run-010-rotate-platform-secrets.md
  - std-003-git-deployment-standard.md
last_updated: 2026-07-09
---

# Security Baseline Standard

## Purpose

Defines the minimum security controls for the platform baseline. Platform
engineers use this standard when building hosts, deploying stacks, handling
secrets, and reviewing operational changes.

## Standard

Security controls are applied at the repository, host, container, and operations
layers. No secret values are committed to Git.

## Repository Controls

- Commit only non-secret configuration.
- Commit `.env.example` files, not production `.env` files.
- Review changes to `stacks/`, `scripts/`, `bootstrap/`, and `inventory/`.
- Pin container images to explicit version tags.
- Record security-relevant changes in `CHANGELOG.md`.

## Host Controls

- Use Ubuntu Server LTS.
- Keep SSH administrative access restricted to approved administrators.
- Keep `/opt/docker` owned by root-managed administrative access.
- Use Docker Engine from the approved installation procedure.
- Apply security updates through the host operating process.

## Container Controls

- Use `restart: unless-stopped` for long-running services.
- Use bounded Docker logging.
- Use bind mounts only for required paths.
- Use `security_opt: ["no-new-privileges:true"]` unless the image is known to
  require otherwise.
- Do not expose container ports unless documented by the stack README.

## Secret Controls

Secrets are stored in the approved external secret store or host-local protected
environment files. Secret values are never documented or committed.

Production `.env` files on hosts use mode `0600` unless the service requires a
more restrictive mechanism.

## Rationale

The platform starts small but must remain maintainable as hosts and applications
increase. A security baseline prevents early operational shortcuts from becoming
long-term risk.

## Related Documents

- [Security](../../SECURITY.md)
- [Rotate Platform Secrets](../runbooks/run-010-rotate-platform-secrets.md)
- [Git Deployment Standard](std-003-git-deployment-standard.md)
