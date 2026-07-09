---
title: Git Deployment Standard
id: STD-003
status: Approved
category: standard
owner: platform-engineering
related:
  - ../adr/adr-002-git-as-source-of-truth.md
  - std-005-compose-stack-standard.md
  - ../runbooks/run-004-connect-portainer-to-git.md
last_updated: 2026-07-09
---

# Git Deployment Standard

## Purpose

Defines how platform and application stacks are deployed from Git. Platform
engineers and administrators use this standard when changing Compose stacks,
connecting Portainer to repositories, and performing operational deployments.

## Standard

Git is the source of truth. Portainer deploys stacks from Git and does not own
the desired state.

Approved deployment path:

```text
Git commit -> repository review -> Portainer Git stack deployment -> Docker host
```

Not approved:

```text
Portainer web editor -> uncommitted stack change -> production runtime
```

## Branch Rules

The production branch is `main`. Portainer production stacks track `main` unless
a controlled rollback uses a specific commit SHA.

Feature branches may be used for review. A feature branch is not a production
deployment target unless an approved incident rollback or test environment
requires it.

## Stack Location Rules

Compose stacks are stored under one of these directories:

```text
stacks/platform/<project-name>/
stacks/shared/<project-name>/
stacks/applications/<project-name>/
```

Each deployed stack directory contains a `compose.yaml` file and a `README.md`.
Host-specific secrets are not committed.

## Portainer Rules

Portainer is used to:

- Deploy Git-backed stacks.
- View container status.
- Inspect logs.
- Restart services during operations.
- Add Docker environments.

Portainer is not used to create permanent configuration that does not exist in
Git.

## Change Control

Every stack change includes:

1. The changed Compose or configuration file.
2. A documentation update when operation, backup, restore, or security changes.
3. A changelog entry for platform-level changes.
4. Validation steps from the relevant runbook.

## Rollback Rule

Rollback uses Git history. The operator deploys the previous known-good commit
or reverts the change and deploys the revert commit.

## Rationale

Git-backed deployment keeps desired state reviewable and recoverable. Portainer
remains useful for operations while Git preserves the platform record that must
still make sense years later.

## Related Documents

- [Git as Source of Truth](../adr/adr-002-git-as-source-of-truth.md)
- [Compose Stack Standard](std-005-compose-stack-standard.md)
- [Connect Portainer to Git](../runbooks/run-004-connect-portainer-to-git.md)
