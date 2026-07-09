#!/usr/bin/env bash
set -Eeuo pipefail

failures=0

fail() {
  echo "fail: $*" >&2
  failures=$((failures + 1))
}

check_file() {
  local file="$1"
  [[ -f "${file}" ]] || fail "missing file: ${file}"
}

required_files=(
  README.md
  BACKLOG.md
  CHANGELOG.md
  LICENSE
  CONTRIBUTING.md
  SECURITY.md
  docs/engineering/std-004-documentation-standard.md
  docs/engineering/std-001-platform-directory-standard.md
  docs/engineering/std-002-storage-standard.md
  docs/engineering/std-003-git-deployment-standard.md
  docs/engineering/std-005-compose-stack-standard.md
  docs/engineering/std-006-host-inventory-standard.md
  docs/engineering/std-007-backup-standard.md
  docs/engineering/std-008-security-baseline-standard.md
  docs/adr/adr-001-bind-mounts-as-default-storage.md
  docs/adr/adr-002-git-as-source-of-truth.md
  docs/adr/adr-003-portainer-ce-as-operational-interface.md
  docs/adr/adr-004-independently-recoverable-hosts.md
  docs/runbooks/run-001-build-ubuntu-server-host.md
  docs/runbooks/run-002-install-docker-engine.md
  docs/runbooks/run-003-deploy-portainer-ce.md
  docs/runbooks/run-004-connect-portainer-to-git.md
  docs/runbooks/run-005-deploy-application-stack.md
  docs/runbooks/run-006-back-up-platform.md
  docs/runbooks/run-007-restore-platform.md
  docs/runbooks/run-008-validate-platform-health.md
  docs/runbooks/run-009-add-docker-host.md
  docs/runbooks/run-010-rotate-platform-secrets.md
  templates/tmp-001-compose-stack-template.md
  templates/tmp-002-environment-file-template.md
  inventory/hosts.yml
  stacks/platform/portainer/compose.yaml
  stacks/platform/portainer-agent/compose.yaml
)

for file in "${required_files[@]}"; do
  check_file "${file}"
done

while IFS= read -r -d '' md_file; do
  first_line="$(head -n 1 "${md_file}")"
  [[ "${first_line}" == "---" ]] || fail "missing YAML front matter: ${md_file}"
  grep -q '^## Purpose$' "${md_file}" || fail "missing Purpose section: ${md_file}"
  grep -q '^## Related Documents$' "${md_file}" || fail "missing Related Documents section: ${md_file}"
  h1_count="$(awk '
    /^```/ { in_code = !in_code; next }
    !in_code && /^# / { count++ }
    END { print count + 0 }
  ' "${md_file}")"
  [[ "${h1_count}" -eq 1 ]] || fail "expected exactly one H1 in ${md_file}"
done < <(find . -name '*.md' -print0)

while IFS= read -r -d '' compose_file; do
  grep -q '^name:' "${compose_file}" || fail "compose file missing top-level name: ${compose_file}"
  if grep -q '^version:' "${compose_file}"; then
    fail "compose file uses obsolete top-level version: ${compose_file}"
  fi
  if grep -q ':latest\b' "${compose_file}"; then
    fail "compose file uses latest tag: ${compose_file}"
  fi
done < <(find stacks templates examples -name 'compose.yaml' -print0)

if [[ "${failures}" -ne 0 ]]; then
  echo "repository validation failed: ${failures} failure(s)" >&2
  exit 1
fi

echo "repository validation passed"
