# Optional Mem0 integration

Mem0 can provide optional persistent, cross-session memory through Codex's MCP support. ADEV works fully without it: neither the ADEV installer nor its core workflows require Mem0.

You need your own Mem0 account and API key. Expose the key in your shell environment as `MEM0_API_KEY`; never put it in a repository, configuration example, commit, or issue.

## Configure Codex Desktop

In the Codex home (`$CODEX_HOME` when set, otherwise `~/.codex`), add this to `config.toml`:

```toml
[mcp_servers.mem0]
url = "https://mcp.mem0.ai/mcp"
bearer_token_env_var = "MEM0_API_KEY"
```

The secret-free version is available in [`config.example.toml`](config.example.toml). On macOS or Linux, this repository's `scripts/enable-mem0.sh` can safely add the block when no Mem0 block exists; it makes a backup before altering an existing configuration and stops if the existing block is ambiguous.

Restart Codex Desktop or start a new task after changing its configuration. Test connectivity with a read-only memory search, such as a harmless query for an existing durable preference. Do not use a write operation merely to test the integration.

To disable Mem0, remove the `[mcp_servers.mem0]` block from `config.toml` (after making your own backup), then restart Codex. This does not delete any memories held by Mem0.

Mem0 should contain durable knowledge—such as stable constraints, recurring root causes, and reusable decisions—not copies of repository files or source code. See [`policy.md`](policy.md) for retention rules.
