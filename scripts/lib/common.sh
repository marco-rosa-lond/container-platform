#!/usr/bin/env bash
set -Eeuo pipefail

fail() {
  echo "error: $*" >&2
  exit 1
}

require_root() {
  if [[ "${EUID}" -ne 0 ]]; then
    fail "this command must run as root"
  fi
}

require_command() {
  local command_name="$1"
  command -v "${command_name}" >/dev/null 2>&1 || fail "required command not found: ${command_name}"
}

safe_name() {
  local value="$1"
  [[ "${value}" =~ ^[a-z0-9][a-z0-9-]*[a-z0-9]$ || "${value}" =~ ^[a-z0-9]$ ]]
}
