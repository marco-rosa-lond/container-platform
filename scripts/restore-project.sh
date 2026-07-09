#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "${SCRIPT_DIR}/lib/common.sh"

require_root
require_command tar
require_command date

PROJECT_NAME="${1:-}"
ARCHIVE="${2:-}"

[[ -n "${PROJECT_NAME}" && -n "${ARCHIVE}" ]] || fail "usage: restore-project.sh <project-name> <archive.tar.gz>"
safe_name "${PROJECT_NAME}" || fail "invalid project name: ${PROJECT_NAME}"
[[ -f "${ARCHIVE}" ]] || fail "archive not found: ${ARCHIVE}"

PLATFORM_ROOT="/opt/docker"
COMPOSE_DIR="${PLATFORM_ROOT}/compose/${PROJECT_NAME}"
DATA_DIR="${PLATFORM_ROOT}/data/${PROJECT_NAME}"
RESTORE_STAMP="$(date -u +%Y%m%dT%H%M%SZ)"

if [[ -d "${COMPOSE_DIR}" || -d "${DATA_DIR}" ]]; then
  install -d -m 0755 "${PLATFORM_ROOT}/archive/${PROJECT_NAME}-${RESTORE_STAMP}"
  [[ ! -d "${COMPOSE_DIR}" ]] || mv "${COMPOSE_DIR}" "${PLATFORM_ROOT}/archive/${PROJECT_NAME}-${RESTORE_STAMP}/compose"
  [[ ! -d "${DATA_DIR}" ]] || mv "${DATA_DIR}" "${PLATFORM_ROOT}/archive/${PROJECT_NAME}-${RESTORE_STAMP}/data"
fi

tar -C "${PLATFORM_ROOT}" -xzf "${ARCHIVE}"

echo "restore complete for project: ${PROJECT_NAME}"
