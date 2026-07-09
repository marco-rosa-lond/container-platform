---
title: Contributing
id: PM-001
status: Approved
category: reference
owner: platform-engineering
related:
  - README.md
  - BACKLOG.md
  - CHANGELOG.md
  - docs/engineering/std-004-documentation-standard.md
last_updated: 2026-07-09
---

# Contributing

## Purpose

Defines contribution rules for this repository. Contributors use this document
to keep platform changes consistent, reviewable, auditable, and recoverable.

## Contribution Rules

Every platform change must:

1. Reference a backlog ID in `BACKLOG.md`.
2. Update or create the required documentation.
3. Preserve Git as the source of truth.
4. Preserve the approved `/opt/docker` host layout.
5. Avoid storing important configuration inside containers.
6. Update `CHANGELOG.md` when operation, recovery, security, standards, or
   repository structure changes.

## Documentation Rules

All Markdown documents follow `STD-004`. Internal links are relative. Documents
render correctly in GitHub and Obsidian.

## Code and Script Rules

Scripts use Bash strict mode and fail on unsafe input. Operational scripts must
be idempotent where practical and must not delete data unless the operator passes
an explicit restore or destructive action.

## Review Requirements

A change is ready for review when:

- The backlog item acceptance criteria are satisfied.
- Related documents are updated.
- Operational procedures include validation and rollback steps.
- Architectural decisions that affect future operation are recorded as ADRs.
- Repeated implementation patterns are implemented as templates.
- `scripts/validate-repository.sh` completes successfully.

## Merge Rule

Do not merge a change that makes the repository inconsistent with its own
standards. Fix the standard, record an ADR, or update the implementation before
merge.

## Related Documents

- [Container Platform](README.md)
- [Backlog](BACKLOG.md)
- [Changelog](CHANGELOG.md)
- [Documentation Standard](docs/engineering/std-004-documentation-standard.md)
