#!/usr/bin/env bash
set -euo pipefail

SCRIPT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
printf 'ADEV uses symlinks, so no file copy is required. Reconciling links now.\n'
exec "$SCRIPT_ROOT/install.sh"
