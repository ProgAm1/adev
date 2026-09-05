#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  printf 'Usage: %s /path/to/project\n' "$0" >&2
  exit 64
fi
SOURCE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$(cd "$1" && pwd)"
TEMPLATE="$SOURCE_ROOT/templates/project"
created=0
existing=0

if [[ -f "$TARGET/AGENTS.md" ]]; then
  printf 'existing project instructions preserved: AGENTS.md\n'
  ((existing+=1))
else
  cp "$TEMPLATE/AGENTS.md" "$TARGET/AGENTS.md"
  printf 'created: AGENTS.md\n'
  ((created+=1))
fi

if [[ -d "$TARGET/.agents" || -d "$TARGET/.codex" ]]; then
  printf 'mature agent infrastructure detected; only missing generic context will be added.\n'
fi
mkdir -p "$TARGET/docs/ai"
for name in architecture decisions state known-issues; do
  destination="$TARGET/docs/ai/$name.md"
  if [[ -e "$destination" ]]; then
    printf 'existing context preserved: docs/ai/%s.md\n' "$name"
    ((existing+=1))
  else
    cp "$TEMPLATE/docs/ai/$name.md" "$destination"
    printf 'created: docs/ai/%s.md\n' "$name"
    ((created+=1))
  fi
done
printf 'Done: %d created, %d already present. Review generated TODOs before relying on them.\n' "$created" "$existing"
