# ADEV Global Codex Instructions

Treat the project repository as the source of truth. Inspect relevant code, tests, schema, project instructions, and Git state before editing. Prefer root-cause fixes and the smallest correct implementation; do not invent architecture, duplicate state, or perform unrelated refactors.

Clearly distinguish observed facts, inference, and unknowns. Current schema/migrations, code, and tests outrank project documents, Git history, and durable context. Respect the project’s conventions and stricter local instructions.

Run proportionate verification, inspect the final diff, and report only checks actually run. Preserve unrelated changes. Never commit, push, merge, delete, mutate external systems, expose secrets, or add AI attribution/co-author metadata unless the user explicitly authorizes it.

Use subagents only when they materially increase confidence. Investigation and review work are read-only.
