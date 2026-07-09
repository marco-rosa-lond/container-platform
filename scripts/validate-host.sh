#!/usr/bin/env bash
set -Eeuo pipefail

failures=0

check() {
  local description="$1"
  shift
  if "$@" >/dev/null 2>&1; then
    echo "ok: ${description}"
  else
    echo "fail: ${description}" >&2
    failures=$((failures + 1))
  fi
}

check "os-release exists" test -r /etc/os-release
if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  if [[ "${ID:-}" == "ubuntu" ]]; then
    echo "ok: operating system is Ubuntu"
  else
    echo "fail: operating system is not Ubuntu" >&2
    failures=$((failures + 1))
  fi
fi

for directory in compose data backups scripts archive tmp logs; do
  check "/opt/docker/${directory} exists" test -d "/opt/docker/${directory}"
done

check "docker command exists" command -v docker
check "docker service active" systemctl is-active docker
check "docker responds" docker ps
check "docker compose v2 available" docker compose version

if docker ps --format '{{.Names}}' 2>/dev/null | grep -qx 'portainer'; then
  echo "ok: portainer container exists"
else
  echo "warn: portainer container not found"
fi

if [[ "${failures}" -ne 0 ]]; then
  echo "host validation failed: ${failures} failure(s)" >&2
  exit 1
fi

echo "host validation passed"
