---
title: Shared Stacks
id: DOC-004
status: Approved
category: reference
owner: platform-engineering
related:
  - ../README.md
  - ../../docs/engineering/std-005-compose-stack-standard.md
last_updated: 2026-07-09
---

# Shared Stacks

## Purpose

Stores shared Compose stacks used by more than one application. Administrators
use this directory only when a service has shared platform ownership and a clear
operational boundary.

## Rules

Shared stacks follow the same Compose standard as platform and application
stacks. A shared stack must document consumers, published ports, persistent data,
backup requirements, and ownership in its README.

## Related Documents

- [Stacks](../README.md)
- [Compose Stack Standard](../../docs/engineering/std-005-compose-stack-standard.md)
