# Contributing

Thank you for improving ADEV. Keep changes stack-independent, concise, and compatible with Codex-native behavior. Do not add a custom LLM runtime, provider SDK, external service, or project-specific policy without a clear proposal.

Before opening a pull request, read the relevant role, policy, and skill files; keep diffs narrow; run `bash -n scripts/*.sh`; and exercise changed scripts in temporary directories. Never include credentials, personal paths, local Codex configuration, generated dependencies, or unrelated changes.

For new skills, use a focused `SKILL.md` with a precise trigger description and actionable guidance. Prefer changes that complement project-local instructions rather than overriding them.
