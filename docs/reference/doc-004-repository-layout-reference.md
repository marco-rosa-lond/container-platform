---
title: Repository Layout Reference
id: DOC-004
status: Approved
category: reference
owner: platform-engineering
related:
  - ../../README.md
  - ../engineering/std-004-documentation-standard.md
  - ../engineering/std-003-git-deployment-standard.md
last_updated: 2026-07-09
---

# Repository Layout Reference

## Purpose

Defines the responsibility of each top-level repository directory. Contributors
use this reference when deciding where platform files belong.

## Layout

```text
container-platform/
├── docs/
├── bootstrap/
├── inventory/
├── stacks/
├── templates/
├── scripts/
├── examples/
├── assets/
└── .github/
```

## Directory Responsibilities

| Path | Responsibility |
|------|----------------|
| `docs/business` | Business-facing operating documents and onboarding material. |
| `docs/engineering` | Approved engineering standards. |
| `docs/reference` | Technical reference material. |
| `docs/runbooks` | Operational procedures with validation and rollback. |
| `docs/adr` | Architectural decision records. |
| `bootstrap` | Host bootstrap entrypoints. |
| `inventory` | Host inventory and inventory guidance. |
| `stacks/platform` | Platform-owned Compose stacks. |
| `stacks/shared` | Shared service stacks used by multiple applications. |
| `stacks/applications` | Application Compose stacks. |
| `templates` | Approved reusable implementation templates. |
| `scripts` | Operational scripts used by runbooks. |
| `examples` | Non-production examples that demonstrate approved patterns. |
| `assets` | Repository-owned static assets. |
| `.github` | Repository automation and review configuration. |

## Placement Rules

If a file explains an operational process, it belongs in `docs/runbooks`. If a
file defines a rule, it belongs in `docs/engineering`. If a file records an
architectural decision, it belongs in `docs/adr`.

Repeated implementation patterns become templates. Repeated documentation
requirements become standards.

## Related Documents

- [Container Platform](../../README.md)
- [Documentation Standard](../engineering/std-004-documentation-standard.md)
- [Git Deployment Standard](../engineering/std-003-git-deployment-standard.md)
