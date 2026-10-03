# Imported skills

These skills are vendored snapshots of the locally installed packages. Each skill retains its upstream license and supporting files. ADEV's existing installer discovers them under `codex/skills/` and creates `adev-<directory>` links. The `name` in each `SKILL.md` remains its invocation name.

| Package | Snapshot | License | Directories |
| --- | --- | --- | --- |
| [Superpowers](https://github.com/obra/superpowers) | 6.4.2 | MIT | All 15 skills, including planning, execution, and their required companion skills |
| [Ponytail](https://github.com/DietrichGebert/ponytail) | Installed cache 1.0.0; plugin manifest 4.10.3 | MIT | All 6 Ponytail skills |
| [Flutter Skills](https://github.com/thiennc-tesoglobal/flutter-skills) | 0.9.1 | BSD-3-Clause | `flutter-app-workflow`, `flutter-ui-design`, `flutter-architecture`, `flutter-code-review` |
| Web Typography | Locally installed snapshot; no version declared | Apache-2.0 | `web-typography` |

## Standalone installation

Superpowers references to `superpowers:<skill>` have been changed to the standalone `<skill>` names used by ADEV. Relative paths, scripts, prompts, and skill names are preserved. Other imported files are unchanged. Plugin hooks, MCP servers, and plugin registration are not included. To use those integrations, install the original plugin. Avoid installing the same skills through both ADEV and a plugin.

Flutter's workflow loads available specialists only; specialists beyond the four listed here are not bundled. It documents how to continue when a specialist is unavailable.

Apply skills only when relevant. User authorization and project instructions continue to control commits, pushes, merges, deletion, and delegation; imported workflow examples do not grant that authorization.

## Added inventory

- `brainstorming` — Superpowers 6.4.2
- `diagnosing-superpowers` — Superpowers 6.4.2
- `dispatching-parallel-agents` — Superpowers 6.4.2
- `executing-plans` — Superpowers 6.4.2
- `finishing-a-development-branch` — Superpowers 6.4.2
- `receiving-code-review` — Superpowers 6.4.2
- `requesting-code-review` — Superpowers 6.4.2
- `subagent-driven-development` — Superpowers 6.4.2
- `systematic-debugging` — Superpowers 6.4.2
- `test-driven-development` — Superpowers 6.4.2
- `using-git-worktrees` — Superpowers 6.4.2
- `using-superpowers` — Superpowers 6.4.2
- `verification-before-completion` — Superpowers 6.4.2
- `writing-plans` — Superpowers 6.4.2
- `writing-skills` — Superpowers 6.4.2
- `ponytail` — Ponytail cache 1.0.0 (manifest 4.10.3)
- `ponytail-audit` — Ponytail cache 1.0.0 (manifest 4.10.3)
- `ponytail-debt` — Ponytail cache 1.0.0 (manifest 4.10.3)
- `ponytail-gain` — Ponytail cache 1.0.0 (manifest 4.10.3)
- `ponytail-help` — Ponytail cache 1.0.0 (manifest 4.10.3)
- `ponytail-review` — Ponytail cache 1.0.0 (manifest 4.10.3)
- `flutter-app-workflow` — Flutter Skills 0.9.1
- `flutter-ui-design` — Flutter Skills 0.9.1
- `flutter-architecture` — Flutter Skills 0.9.1
- `flutter-code-review` — Flutter Skills 0.9.1
- `web-typography` — Locally installed web-typography-skill (Apache-2.0)
