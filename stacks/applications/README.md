---
title: Application Stacks
id: DOC-004
status: Approved
category: reference
owner: platform-engineering
related:
  - ../README.md
  - ../../docs/runbooks/run-005-deploy-application-stack.md
  - ../../templates/tmp-001-compose-stack-template.md
last_updated: 2026-07-09
---

# Application Stacks

## Purpose

Stores application Compose stacks deployed through Portainer from Git.
Application owners and platform engineers use this directory for production and
non-production application stack definitions.

## Rules

Each application stack uses:

```text
stacks/applications/<project-name>/compose.yaml
stacks/applications/<project-name>/README.md
```

Create new stacks from the approved template.

## Related Documents

- [Stacks](../README.md)
- [Deploy Application Stack](../../docs/runbooks/run-005-deploy-application-stack.md)
- [Compose Stack Template](../../templates/tmp-001-compose-stack-template.md)
