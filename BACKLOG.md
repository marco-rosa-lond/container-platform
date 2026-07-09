---
title: Backlog
id: PM-001
status: Approved
category: business
owner: platform-engineering
related:
  - README.md
  - CHANGELOG.md
  - docs/reference/doc-001-platform-overview.md
last_updated: 2026-07-09
---

# Backlog

## Purpose

Tracks platform repository deliverables by stable ID. The backlog records what
is implemented, what remains planned, and which documents or files satisfy each
deliverable.

## Status Values

| Status | Meaning |
|--------|---------|
| Planned | Accepted work not yet implemented. |
| In Progress | Work started but not complete. |
| Done | Implemented in the repository. |
| Blocked | Cannot proceed until an external decision or dependency is resolved. |

## Active Backlog

| ID      | Status | Deliverable                           | Acceptance Criteria                                                                                                  |
| ------- | ------ | ------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| PM-001  | Done   | Repository baseline                   | Required root files, directories, governance files, changelog, and backlog are present.                              |
| STD-001 | Done   | Platform directory standard           | Defines `/opt/docker` host layout and repository-to-host mapping.                                                    |
| STD-002 | Done   | Storage standard                      | Defines bind mount rules, named volume exceptions, ownership, permissions, and data placement.                       |
| STD-003 | Done   | Git deployment standard               | Defines Git branch, stack deployment, Portainer usage, and change-control rules.                                     |
| STD-004 | Done   | Documentation standard                | Defines document structure, naming, front matter, links, and required sections.                                      |
| STD-005 | Done   | Compose stack standard                | Defines approved Compose file structure, naming, networks, images, restart policy, logging, and health expectations. |
| STD-006 | Done   | Host inventory standard               | Defines inventory schema and host metadata rules for multi-host operation.                                           |
| STD-007 | Done   | Backup standard                       | Defines backup scope, retention classes, validation, and restore expectations.                                       |
| STD-008 | Done   | Security baseline standard            | Defines repository and host security rules that apply to the platform baseline.                                      |
| ADR-001 | Done   | Bind mounts as default storage        | Records the storage decision and consequences.                                                                       |
| ADR-002 | Done   | Git as source of truth                | Records why Portainer is not the source of truth.                                                                    |
| ADR-003 | Done   | Portainer CE as operational interface | Records the decision to use Portainer CE for operations.                                                             |
| ADR-004 | Done   | Independently recoverable hosts       | Records the multi-host recovery model.                                                                               |
| RUN-001 | Done   | Build Ubuntu Server host              | Documents OS installation baseline and host preparation.                                                             |
| RUN-002 | Done   | Install Docker Engine                 | Documents Docker Engine and Compose v2 installation.                                                                 |
| RUN-003 | Done   | Deploy Portainer CE                   | Documents first platform stack deployment.                                                                           |
| RUN-004 | Done   | Connect Portainer to Git              | Documents Git-backed stack configuration.                                                                            |
| RUN-005 | Done   | Deploy application stack              | Documents the approved stack deployment procedure.                                                                   |
| RUN-006 | Done   | Back up platform                      | Documents backup scope, procedure, validation, and rollback.                                                         |
| RUN-007 | Done   | Restore platform                      | Documents full host and application data recovery.                                                                   |
| RUN-008 | Done   | Validate platform health              | Documents post-change and post-restore validation.                                                                   |
| RUN-009 | Done   | Add Docker host                       | Documents how to add a host without redesigning the platform.                                                        |
| RUN-010 | Done   | Rotate platform secrets               | Documents operational secret rotation without committing secret values.                                              |
| TMP-001 | Done   | Compose stack template                | Provides the approved Compose project template.                                                                      |
| TMP-002 | Done   | Environment file template             | Provides the approved environment variable template.                                                                 |
| DOC-001 | Done   | Platform overview                     | Describes platform architecture, roles, and lifecycle.                                                               |
| DOC-002 | Done   | Host inventory reference              | Defines inventory structure for multiple Docker hosts.                                                               |
| DOC-003 | Done   | Administrator onboarding              | Defines required access, tools, and operating expectations for new administrators.                                   |
| DOC-004 | Done   | Repository layout reference           | Defines repository directory responsibilities.                                                                       |
| DOC-005 | Done   | Portainer operations reference        | Defines approved Portainer usage.                                                                                    |
| DOC-006 | Done   | Validation reference                  | Defines validation commands and expected outcomes.                                                                   |

## Completed Work

| Date | ID | Summary |
|------|----|---------|
| 2026-07-09 | PM-001 | Established the repository baseline. |
| 2026-07-09 | STD-001 | Added the platform directory standard. |
| 2026-07-09 | STD-002 | Added the storage standard. |
| 2026-07-09 | STD-003 | Added the Git deployment standard. |
| 2026-07-09 | STD-004 | Added the documentation standard. |
| 2026-07-09 | STD-005 | Added the Compose stack standard. |
| 2026-07-09 | STD-006 | Added the host inventory standard. |
| 2026-07-09 | STD-007 | Added the backup standard. |
| 2026-07-09 | STD-008 | Added the security baseline standard. |
| 2026-07-09 | ADR-001 | Recorded bind mounts as the default storage decision. |
| 2026-07-09 | ADR-002 | Recorded Git as the source of truth. |
| 2026-07-09 | ADR-003 | Recorded Portainer CE as the operational interface. |
| 2026-07-09 | ADR-004 | Recorded independent host recovery. |
| 2026-07-09 | RUN-001 | Added the Ubuntu Server host build runbook. |
| 2026-07-09 | RUN-002 | Added the Docker Engine installation runbook. |
| 2026-07-09 | RUN-003 | Added the Portainer CE deployment runbook. |
| 2026-07-09 | RUN-004 | Added the Portainer Git connection runbook. |
| 2026-07-09 | RUN-005 | Added the application stack deployment runbook. |
| 2026-07-09 | RUN-006 | Added the platform backup runbook. |
| 2026-07-09 | RUN-007 | Added the platform restore runbook. |
| 2026-07-09 | RUN-008 | Added the platform validation runbook. |
| 2026-07-09 | RUN-009 | Added the Docker host onboarding runbook. |
| 2026-07-09 | RUN-010 | Added the platform secret rotation runbook. |
| 2026-07-09 | TMP-001 | Added the Compose stack template. |
| 2026-07-09 | TMP-002 | Added the environment file template. |
| 2026-07-09 | DOC-001 | Added the platform overview. |
| 2026-07-09 | DOC-002 | Added the host inventory reference. |
| 2026-07-09 | DOC-003 | Added administrator onboarding. |
| 2026-07-09 | DOC-004 | Added the repository layout reference. |
| 2026-07-09 | DOC-005 | Added the Portainer operations reference. |
| 2026-07-09 | DOC-006 | Added the validation reference. |

## Related Documents

- [Container Platform](README.md)
- [Changelog](CHANGELOG.md)
- [Platform Overview](docs/reference/doc-001-platform-overview.md)
