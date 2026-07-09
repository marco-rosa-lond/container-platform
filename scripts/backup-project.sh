#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "${SCRIPT_DIR}/lib/common.sh"

require_root
require_command tar
require_command sha256sum
require_command date

PROJECT_NAME="${1:-}"
[[ -n "${PROJECT_NAME}" ]] || fail "usage: backup-project.sh <project-name>"
safe_name "${PROJECT_NAME}" || fail "invalid project name: ${PROJECT_NAME}"

PLATFORM_ROOT="/opt/docker"
COMPOSE_DIR="${PLATFORM_ROOT}/compose/${PROJECT_NAME}"
DATA_DIR="${PLATFORM_ROOT}/data/${PROJECT_NAME}"
BACKUP_DATE="$(date -u +%Y-%m-%d)"
BACKUP_STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
BACKUP_DIR="${PLATFORM_ROOT}/backups/${PROJECT_NAME}/${BACKUP_DATE}"
ARCHIVE="${BACKUP_DIR}/${PROJECT_NAME}-${BACKUP_STAMP}.tar.gz"
CHECKSUM="${ARCHIVE}.sha256"

[[ -d "${COMPOSE_DIR}" ]] || fail "compose directory not found: ${COMPOSE_DIR}"

install -d -m 0750 "${BACKUP_DIR}"

WAS_RUNNING=0
if command -v docker >/dev/null 2>&1 && [[ -f "${COMPOSE_DIR}/compose.yaml" ]]; then
  if docker compose --project-directory "${COMPOSE_DIR}" ps --status running --format '{{.Name}}' | grep -q .; then
    WAS_RUNNING=1
    docker compose --project-directory "${COMPOSE_DIR}" down
  fi
fi

tar -C "${PLATFORM_ROOT}" -czf "${ARCHIVE}" \
  "compose/${PROJECT_NAME}" \
  $(if [[ -d "${DATA_DIR}" ]]; then printf '%s' "data/${PROJECT_NAME}"; fi)

sha256sum "${ARCHIVE}" > "${CHECKSUM}"
chmod 0640 "${ARCHIVE}" "${CHECKSUM}"

if [[ "${WAS_RUNNING}" -eq 1 ]]; then
  docker compose --project-directory "${COMPOSE_DIR}" up -d
fi

echo "backup created: ${ARCHIVE}"
echo "checksum created: ${CHECKSUM}"
