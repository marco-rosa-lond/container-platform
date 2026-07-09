---
title: GitHub Automation
id: DOC-004
status: Approved
category: reference
owner: platform-engineering
related:
  - workflows/validate.yml
  - ../scripts/validate-repository.sh
  - ../CONTRIBUTING.md
last_updated: 2026-07-09
---

# GitHub Automation

## Purpose

Stores repository automation for validation and review support. Contributors use
this directory to understand repository checks that run on pushes and pull
requests.

## Workflows

```text
workflows/validate.yml
```

The validation workflow runs `scripts/validate-repository.sh`.

## Related Documents

- [Validation Workflow](workflows/validate.yml)
- [Repository Validation Script](../scripts/validate-repository.sh)
- [Contributing](../CONTRIBUTING.md)
