---
title: Compose Stack Template
id: TMP-001
status: Approved
category: template
owner: platform-engineering
related:
  - ../docs/engineering/std-005-compose-stack-standard.md
  - compose-stack/compose.yaml
  - compose-stack/README.md
last_updated: 2026-07-09
---

# Compose Stack Template

## Purpose

Provides the approved starting point for new Compose stacks. Platform engineers
copy this template when creating platform, shared, or application stacks.

## Usage

1. Copy `templates/compose-stack/` to the correct stack directory.
2. Rename the project in `compose.yaml`.
3. Replace template service names and image references with approved values.
4. Replace data paths with `/opt/docker/data/<project-name>/...`.
5. Update the copied stack `README.md`.
6. Validate with `docker compose config`.

## Template Files

```text
templates/compose-stack/
├── compose.yaml
├── README.md
└── .env.example
```

## Related Documents

- [Compose Stack Standard](../docs/engineering/std-005-compose-stack-standard.md)
- [Template Compose File](compose-stack/compose.yaml)
- [Template README](compose-stack/README.md)
