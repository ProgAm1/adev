# ADEV — Universal Codex Development Harness

ADEV is a Git-versioned, stack-independent harness for making Codex work consistently across software projects. Codex is the runtime: it reasons, uses tools, writes code, and can delegate work. ADEV supplies reusable instructions, roles, workflows, policies, and project-context templates. It has no LLM API client, provider configuration, model keys, database, or custom agent server.

It supports React/Vite, Next.js, Spring Boot, Flutter, Node/NestJS, Python, database-backed, Firebase/Supabase, and university projects because its guidance concerns engineering behavior rather than a particular framework.

## Architecture

```text
codex/       global instructions and composable Codex skills
agents/      Coordinator, Investigator, Implementer, Reviewer, Verifier roles
policies/    development, Git, context precedence, memory, verification
templates/   lightweight project entry point and docs/ai context templates
scripts/     safe global install, sync, and project initialization helpers
```

Global rules complement each repository’s own instructions; project instructions are more specific and should win when they conflict. Repositories remain the source of truth.

## Install into Codex

The installer uses the local Codex home (`$CODEX_HOME`, or `~/.codex`) and creates symlinks to `codex/AGENTS.md` and each `codex/skills/*` directory. A symlink means repository updates are immediately reflected; `sync.sh` only reconciles missing links. Existing files are never overwritten: conflicts are reported and installation exits non-zero.

```bash
git clone https://github.com/ProgAm1/adev.git
cd adev
./scripts/install.sh
```

After installation the global instruction link is `~/.codex/AGENTS.md`; skills appear under names such as `~/.codex/skills/adev-investigation`. Restart or begin a new Codex task if the active session has already loaded its skills.

## Project context

Initialize a repository with:

```bash
./scripts/init-project.sh /path/to/project
```

It creates only missing files: a concise `AGENTS.md` plus `docs/ai/architecture.md`, `decisions.md`, `state.md`, and `known-issues.md`. Existing instructions and context are always preserved. If `.agents/` or `.codex/` is present, the script reports mature agent infrastructure and still limits itself to missing generic context. Review the generated TODOs; ADEV never invents architecture.

## Roles and skills

The Coordinator selects the smallest useful workflow, not every role by default. Investigator and Reviewer are read-only; Implementer makes the narrow change; Verifier runs and reports real checks. For meaningful changes, the intended flow is:

```text
User → Coordinator → optional Investigator → Implementer → optional Reviewer → Verifier → synthesis
```

Skills are concise playbooks for investigation, implementation, review, verification, root-cause debugging, Git workflow, frontend review, backend review, and security review. They are composable: apply only what the task needs.

## Daily usage

Once installed, use ordinary Codex prompts. For example:

```text
Fix the stale calendar bug after editing a plan. Investigate first, implement the smallest correct fix, review the diff, verify it, and do not commit.
```

Or:

```text
Review the current changes for regressions.
```

The harness supplies consistent expectations to inspect context, preserve unrelated work, use proportionate verification, and report facts separately from inference and unknowns.

## Context and memory

When sources conflict, prefer: current schema/migrations; current code; current tests; project `AGENTS.md`; `docs/ai` context; Git history; durable context; then model inference. Historical notes never override current implementation.

Durable memory currently lives in decisions, state, known issues, Git history, and Codex context. Good future memory is a non-obvious constraint, recurring root cause, durable decision, or important preference. Line numbers, copied code, temporary branches, conversations, and stale facts are not durable memory. An external memory provider is intentionally deferred.

## Safety and Git rules

ADEV emphasizes inspection before editing, root-cause changes, narrow scope, one source of truth, final-diff review, and evidence-based verification. It does not authorize commits, pushes, merges, destructive Git commands, deletion, external mutations, secret exposure, or AI attribution. Local project rules and user authorization still control work.

## Mature repositories

Do not flatten a mature project into generic ADEV files. Its existing `AGENTS.md`, skills, documentation, and workflow stay in place; ADEV is an additive global baseline. This repository does not modify other projects during installation or initialization unless passed explicitly to `init-project.sh`.

## Current limitations

ADEV is intentionally a convention and workflow harness, not a separate agent runtime. It does not include a custom model provider, memory database, MCP server, dashboard, issue-tracker integration, autonomous code editing, or automated commits. Codex availability and how it loads global instructions remain controlled by the user’s Codex installation.

## Roadmap

Next improvements: optional templates for CI verification conventions, a safe harness self-check, and documented patterns for teams to version project-specific roles. ADEV will remain Codex-native rather than reintroducing a custom LLM runtime.
