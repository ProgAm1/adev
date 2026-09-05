# Memory Policy

Current durable context is project decisions, state, known issues, Git history, Codex conversation context, and optional persistent-memory providers. Evidence precedence is: current schema/migrations; current implementation; tests; project `AGENTS.md` and documentation; Git history; persistent memory; then model inference. Persistent memory never overrides current repository evidence.

Persistent-memory providers are optional. Search them only when prior cross-session knowledge could materially improve the task; a memory failure must not block normal work. Scope memories as global or project-specific and save only information likely to remain useful across future sessions.

Good memory candidates include durable cross-session lessons, recurring root causes, stable architectural constraints, durable decisions not clearly recoverable elsewhere, stable workflow preferences, and reusable project knowledge.

Never store API keys, passwords, tokens, secrets, unnecessary personal or private information, source-code dumps, entire files, full conversations, temporary branch names, line numbers, transient task state, ephemeral logs or test output, speculation presented as fact, or information trivially recoverable from Git.
