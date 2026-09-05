#!/usr/bin/env bash
set -euo pipefail

SOURCE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"
SOURCE_AGENTS="$SOURCE_ROOT/codex/AGENTS.md"
SOURCE_SKILLS="$SOURCE_ROOT/codex/skills"

check_target() {
  local source="$1" destination="$2"
  if [[ -L "$destination" && "$(readlink "$destination")" == "$source" ]]; then
    return 0
  elif [[ -e "$destination" || -L "$destination" ]]; then
    printf 'conflict; left unchanged: %s\n' "$destination" >&2
    return 1
  fi
}

link_if_needed() {
  local source="$1" destination="$2"
  if [[ -L "$destination" && "$(readlink "$destination")" == "$source" ]]; then
    printf 'already linked: %s\n' "$destination"
  else
    ln -s "$source" "$destination"
    printf 'linked: %s -> %s\n' "$destination" "$source"
  fi
}

mkdir -p "$CODEX_ROOT/skills"
failures=0
check_target "$SOURCE_AGENTS" "$CODEX_ROOT/AGENTS.md" || failures=1
for skill in "$SOURCE_SKILLS"/*; do
  [[ -d "$skill" ]] || continue
  check_target "$skill" "$CODEX_ROOT/skills/adev-$(basename "$skill")" || failures=1
done
if (( failures )); then
  printf 'No ADEV links were changed. Resolve listed conflicts, then rerun.\n' >&2
  exit 1
fi
link_if_needed "$SOURCE_AGENTS" "$CODEX_ROOT/AGENTS.md"
for skill in "$SOURCE_SKILLS"/*; do
  [[ -d "$skill" ]] || continue
  link_if_needed "$skill" "$CODEX_ROOT/skills/adev-$(basename "$skill")"
done
printf 'ADEV Codex harness is installed via symlinks. Changes in this repository are immediately available.\n'
