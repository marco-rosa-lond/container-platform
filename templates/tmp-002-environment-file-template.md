---
title: Environment File Template
id: TMP-002
status: Approved
category: template
owner: platform-engineering
related:
  - ../docs/engineering/std-008-security-baseline-standard.md
  - env/.env.example
  - ../SECURITY.md
last_updated: 2026-07-09
---

# Environment File Template

## Purpose

Provides the approved pattern for documenting stack environment variables
without committing secret values. Platform engineers use this template when a
stack requires runtime configuration.

## Usage

1. Copy `templates/env/.env.example` into the stack directory.
2. Keep non-secret default values in `.env.example` where safe.
3. Use descriptive variable names.
4. Commit `.env.example`.
5. Create production `.env` files only on approved hosts or in Portainer.
6. Do not commit production `.env` files.

## Secret Values

A variable that holds a password, token, private key, certificate, or credential
contains an empty value in `.env.example`.

```text
DATABASE_PASSWORD=
```

## Related Documents

- [Security Baseline Standard](../docs/engineering/std-008-security-baseline-standard.md)
- [Environment Example](env/.env.example)
- [Security](../SECURITY.md)
