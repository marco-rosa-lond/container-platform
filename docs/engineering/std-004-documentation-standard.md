---
title: Documentation Standard
id: STD-004
status: Approved
category: standard
owner: platform-engineering
related:
  - ../../BACKLOG.md
last_updated: 2026-07-09
---

# Documentation Standard

## Purpose

Defines how documentation is written, structured, and named across this
repository. Applies to every document under `docs/`, `templates/`, and the
root-level Markdown files. A document that does not conform is not merged.

---

## Principles

Documentation is part of the platform, not a description of it.

Every platform change ships with the documentation update it requires.

Documentation describes the approved implementation, not every possible
implementation.

Consistency matters more than individual preference. Follow this standard
even where a different approach would also work.

---

## Writing Style

Write in present tense and active voice. State the approved action directly.

Prefer:

> Configure UFW to allow SSH access.

Instead of:

> You should probably configure the firewall to allow SSH.

Avoid opinionated or hedging language, except when a section is explicitly
documenting rationale for a standard. Avoid marketing language, filler
transitions, and commentary about the writing process itself.

Document the approved implementation. Do not enumerate every alternative
that was considered.

---

## Front Matter

Every document opens with YAML front matter:

```yaml
---
title: <human-readable title>
id: <backlog ID, e.g. STD-004>        # omit only on files with no backlog ID
status: Draft | Approved | Deprecated
category: standard | adr | runbook | template | reference | business
owner: <team or role, not a person's name>
related:
  - <relative link>
last_updated: <YYYY-MM-DD>
---
```

`status` meanings:

- **Draft** — not yet reviewed, not authoritative.
- **Approved** — current, authoritative, in force.
- **Deprecated** — superseded, kept for history, linked from its replacement.

---

## Document Structure

Every document contains, in this order:

1. YAML front matter.
2. A single `#` heading matching `title` in the front matter. Only one `#`
   per document.
3. `## Purpose` — two to four sentences on what the document governs and who
   needs it.
4. Body content specific to the document type.
5. `## Related Documents` — relative links only. Every document links to at
   least one other, except `BACKLOG.md`.

Categories with additional required sections:

- **ADR** — `## Context`, `## Decision`, `## Consequences`
- **Runbook** — `## Prerequisites`, `## Procedure`, `## Validation`, `## Rollback`
- **Standard** — `## Rationale`, when the reason for a rule isn't obvious from Purpose
- **Template** — `## Usage`

---

## Headings

Use heading levels in order. Do not skip levels.

```
# Document Title

## Section

### Subsection
```

Exactly one `#` per document, on the title. Everything else starts at `##`.

---

## File Naming

Documents that carry a backlog ID are named `<prefix>-<number>-<slug>.md`:

- `prefix` — `std`, `adr`, `run`, `tmp`, or `doc`, matching the backlog ID.
- `number` — zero-padded to three digits (`004`, not `4`).
- `slug` — lowercase, hyphen-separated, derived from the title.

Examples:

```
std-004-documentation-standard.md
adr-001-bind-mounts.md
run-006-backup-the-platform.md
```

Avoid:

```
DocumentationStandard.md
Standard 4.md
docstandard.md
```

`README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `SECURITY.md`, and `LICENSE`
keep their conventional root-level names and carry no prefix.

Prefix-to-directory mapping:

| Prefix | Directory |
|--------|-----------|
| std | `docs/engineering/` |
| adr | `docs/adr/` |
| run | `docs/runbooks/` |
| tmp | `templates/` |
| doc | `docs/reference/` or `docs/business/`, by subject |

---

## Links

Internal links are relative — `../adr/adr-001-bind-mounts.md`, never an
absolute repository URL. Verify links resolve both on GitHub and in
Obsidian.

Do not link to a document that doesn't exist yet. Reference its backlog ID
in prose instead, and add the link once the document lands.

---

## Diagrams and Code

Prefer ASCII diagrams in fenced code blocks over screenshots. Use a
screenshot only when there's no ASCII equivalent — a vendor UI element with
no CLI or API surface, for example.

Always specify the language on a code block:

```bash
docker compose up -d
```

No externally hosted images. Anything checked in lives under `assets/`.

---

## Rationale

Front matter makes documents machine-parseable for future tooling — index
generation, staleness checks. Fixed structure means "how do I roll this
back" is in the same place in every runbook. Consistent naming means backlog
IDs, filenames, and cross-references never drift apart. None of this is
optional, because the person relying on it in five years won't have this
conversation to fall back on.

---

## Rollout

This standard is retroactive: `BACKLOG.md` (PM-001) predates it and is
exempt, being a project-management artifact rather than a technical
document. Every document filed from STD-004 onward conforms.

## Related Documents

- [BACKLOG.md](../../BACKLOG.md)
