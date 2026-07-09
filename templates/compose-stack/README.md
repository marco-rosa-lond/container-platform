---
title: Template Compose Stack README
id: TMP-001
status: Approved
category: template
owner: platform-engineering
related:
  - ../tmp-001-compose-stack-template.md
  - compose.yaml
  - ../../docs/engineering/std-005-compose-stack-standard.md
last_updated: 2026-07-09
---

# Template Compose Stack README

## Purpose

Documents the required README structure for a Compose stack. Copy this file into
a stack directory and replace the template content with stack-specific approved
operational details.

## Service Summary

Document what the stack runs and which team or role owns it.

## Published Ports

List published ports. Use `None` when the stack does not publish host ports.

## Persistent Data

List persistent paths under `/opt/docker/data/<project-name>`.

## Environment Variables

List required environment variables and identify which are secrets. Do not put
secret values in this file.

## Deployment

Deploy through Portainer as a Git-backed stack using this repository path:

```text
stacks/<scope>/<project-name>/compose.yaml
```

## Validation

Run:

```bash
docker compose config
docker compose ps
```

## Related Documents

- [Compose Stack Template](../tmp-001-compose-stack-template.md)
- [Template Compose File](compose.yaml)
- [Compose Stack Standard](../../docs/engineering/std-005-compose-stack-standard.md)
