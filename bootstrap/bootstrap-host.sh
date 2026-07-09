#!/usr/bin/env bash
set -Eeuo pipefail

PLATFORM_ROOT="/opt/docker"
DIRECTORIES=(compose data backups scripts archive tmp logs)

if [[ "${EUID}" -ne 0 ]]; then
  echo "error: bootstrap-host.sh must run as root" >&2
  exit 1
fi

install -d -m 0755 "${PLATFORM_ROOT}"
for directory in "${DIRECTORIES[@]}"; do
  install -d -m 0755 "${PLATFORM_ROOT}/${directory}"
done

chmod 1777 "${PLATFORM_ROOT}/tmp"

if [[ -d scripts ]]; then
  rsync -a --delete scripts/ "${PLATFORM_ROOT}/scripts/"
  find "${PLATFORM_ROOT}/scripts" -type f -name '*.sh' -exec chmod 0755 {} \;
fi

cat > "${PLATFORM_ROOT}/README.platform" <<'EOF'
This host is managed by the container-platform repository.

Approved root layout:

/opt/docker/compose
/opt/docker/data
/opt/docker/backups
/opt/docker/scripts
/opt/docker/archive
/opt/docker/tmp
/opt/docker/logs

Do not store platform-managed data outside /opt/docker.
EOF

echo "bootstrap complete: ${PLATFORM_ROOT}"
