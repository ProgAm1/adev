# Mem0 Memory Policy

Mem0 is an optional persistent-memory provider. It supplements, but never overrides, current repository evidence. Use the precedence order in [`policies/memory.md`](../../policies/memory.md).

Search Mem0 only when durable cross-session context could materially improve a task. Save only scoped (global or project-specific), durable, reusable knowledge. Never save secrets, private information that is not necessary, source-code dumps, whole files or conversations, transient task state, logs, branch names, line numbers, speculation, or facts readily recovered from Git.
