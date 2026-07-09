---
title: Administrator Onboarding
id: DOC-003
status: Approved
category: business
owner: platform-engineering
related:
  - ../../README.md
  - ../reference/doc-001-platform-overview.md
  - ../runbooks/run-008-validate-platform-health.md
last_updated: 2026-07-09
---

# Administrator Onboarding

## Purpose

Defines the onboarding requirements for administrators who operate the container
platform. New administrators use this document before making changes to hosts,
stacks, backups, or Portainer.

## Required Access

An administrator needs:

- Read access to this repository.
- Write access to this repository if they approve or implement platform changes.
- SSH access to assigned Docker hosts.
- Portainer access with the minimum role required for assigned operations.
- Access to the approved external secret source.
- Access to backup storage for assigned recovery responsibilities.

## Required Local Tools

Administrators use:

```text
git
ssh
bash
Docker CLI for local validation when required
Markdown editor or Obsidian
```

## Required Reading

Before operating the platform, read:

1. [Container Platform](../../README.md)
2. [Platform Overview](../reference/doc-001-platform-overview.md)
3. [Git Deployment Standard](../engineering/std-003-git-deployment-standard.md)
4. [Storage Standard](../engineering/std-002-storage-standard.md)
5. [Security Baseline Standard](../engineering/std-008-security-baseline-standard.md)
6. [Validate Platform Health](../runbooks/run-008-validate-platform-health.md)

## Operating Expectations

Administrators:

- Change platform state through Git.
- Avoid uncommitted Portainer stack edits.
- Validate after deployments, backups, restores, and host changes.
- Record decisions as ADRs when they affect future operation.
- Escalate unclear ownership or security issues before changing production.

## Related Documents

- [Container Platform](../../README.md)
- [Platform Overview](../reference/doc-001-platform-overview.md)
- [Validate Platform Health](../runbooks/run-008-validate-platform-health.md)
