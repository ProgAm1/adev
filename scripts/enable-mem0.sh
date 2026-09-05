#!/usr/bin/env bash
set -euo pipefail

CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"
CONFIG="$CODEX_ROOT/config.toml"
MEM0_BLOCK='[mcp_servers.mem0]
url = "https://mcp.mem0.ai/mcp"
bearer_token_env_var = "MEM0_API_KEY"'

if [[ -z "${MEM0_API_KEY:-}" ]]; then
  printf 'MEM0_API_KEY missing; Mem0 was not configured.\n' >&2
  exit 1
fi

if [[ ! -e "$CONFIG" ]]; then
  mkdir -p "$CODEX_ROOT"
  printf '%s\n' "$MEM0_BLOCK" >"$CONFIG"
  printf 'configured successfully: %s\n' "$CONFIG"
  exit 0
fi

if [[ ! -f "$CONFIG" ]]; then
  printf 'manual action required: config.toml is not a regular file: %s\n' "$CONFIG" >&2
  exit 1
fi

header_count="$(grep -Ec '^\[mcp_servers\.mem0\][[:space:]]*$' "$CONFIG" || true)"
mem0_lines="$(awk '
  /^\[mcp_servers\.mem0\][[:space:]]*$/ { in_block=1; next }
  in_block && /^\[/ { exit }
  in_block { print }
' "$CONFIG")"
if [[ "$header_count" != 0 ]]; then
  url_count="$(printf '%s\n' "$mem0_lines" | grep -Ec '^[[:space:]]*url[[:space:]]*=[[:space:]]*"https://mcp\.mem0\.ai/mcp"[[:space:]]*$' || true)"
  token_count="$(printf '%s\n' "$mem0_lines" | grep -Ec '^[[:space:]]*bearer_token_env_var[[:space:]]*=[[:space:]]*"MEM0_API_KEY"[[:space:]]*$' || true)"
  all_url_count="$(printf '%s\n' "$mem0_lines" | grep -Ec '^[[:space:]]*url[[:space:]]*=' || true)"
  all_token_count="$(printf '%s\n' "$mem0_lines" | grep -Ec '^[[:space:]]*bearer_token_env_var[[:space:]]*=' || true)"
  if [[ "$header_count" == 1 && "$url_count" == 1 && "$token_count" == 1 && "$all_url_count" == 1 && "$all_token_count" == 1 ]]; then
    printf 'already configured: %s\n' "$CONFIG"
    exit 0
  fi
  printf 'manual action required: existing [mcp_servers.mem0] block is incomplete or differs from the documented configuration.\n' >&2
  exit 1
fi

timestamp="$(date +%Y%m%d%H%M%S)"
backup="$CONFIG.bak.$timestamp"
suffix=1
while [[ -e "$backup" ]]; do
  backup="$CONFIG.bak.$timestamp.$suffix"
  ((suffix += 1))
done
cp -p "$CONFIG" "$backup"
printf '\n%s\n' "$MEM0_BLOCK" >>"$CONFIG"
printf 'configured successfully: %s (backup: %s)\n' "$CONFIG" "$backup"
