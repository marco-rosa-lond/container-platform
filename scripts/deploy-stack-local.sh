#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "${SCRIPT_DIR}/lib/common.sh"

require_root
require_command rsync

SOURCE_DIR="${1:-}"
PROJECT_NAME="${2:-}"

[[ -n "${SOURCE_DIR}" ]] || fail "usage: deploy-stack-local.sh <source-stack-dir> <project-name>"
[[ -n "${PROJECT_NAME}" ]] || fail "usage: deploy-stack-local.sh <source-stack-dir> <project-name>"
safe_name "${PROJECT_NAME}" || fail "invalid project name: ${PROJECT_NAME}"
[[ -d "${SOURCE_DIR}" ]] || fail "source stack directory not found: ${SOURCE_DIR}"
[[ -f "${SOURCE_DIR}/compose.yaml" ]] || fail "compose.yaml not found in ${SOURCE_DIR}"

DESTINATION="/opt/docker/compose/${PROJECT_NAME}"
install -d -m 0755 "${DESTINATION}"
rsync -a --delete \
  --include '.env.example' \
  --exclude '.env' \
  --exclude '.env.*' \
  "${SOURCE_DIR}/" "${DESTINATION}/"

if [[ -f "${DESTINATION}/.env.example" && ! -f "${DESTINATION}/.env" ]]; then
  cp "${DESTINATION}/.env.example" "${DESTINATION}/.env"
  chmod 0600 "${DESTINATION}/.env"
fi

echo "deployed ${PROJECT_NAME} to ${DESTINATION}"
