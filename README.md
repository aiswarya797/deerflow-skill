# DeerFlow Skill

A skill repo for DeerFlow-inspired agent workflows across Codex and Claude.

The current implementation is a Codex-native skill that makes Codex work in a DeerFlow-inspired way: deep exploration, efficient research flow, task decomposition, tool execution, verification, and polished synthesis. The repo name is intentionally generic so Claude and Codex variants can live side by side.

This is **not** a bridge to a running DeerFlow server. It emulates DeerFlow's super-agent operating model with the tools available in the current agent environment.

## What It Does

The skill helps Codex behave like a DeerFlow-style lead agent:

- Frame the objective, constraints, and success criteria.
- Choose an effort mode: `flash`, `standard`, `pro`, or `ultra`.
- Decompose broad work into independent tracks.
- Use available tools for research, repo inspection, coding, artifact creation, and verification.
- Use subagent/delegation tools when available, or simulate tracks sequentially.
- Keep scratch notes and evidence in a run workspace for long tasks.
- Synthesize findings into a final answer, report, plan, code change, or artifact.

## Install

Clone this repo and copy the Codex skill folder into your Codex skills directory:

```bash
git clone https://github.com/aiswarya797/deerflow-skill.git
cp -R deerflow-skill/deerflow ~/.codex/skills/deerflow
```

Restart Codex or reload skills if needed.

## Usage

Ask Codex to use `$deerflow` when you want a DeerFlow-like workflow:

```text
Use $deerflow to deeply research this market and produce an executive brief.
Use $deerflow in ultra mode to audit this repo and identify architectural risks.
Use $deerflow to plan and execute this multi-step implementation.
```

For long tasks, the skill can create a run workspace:

```bash
bash deerflow/scripts/new-run.sh repo-audit
```

That creates:

```text
.deerflow-runs/<timestamp>-repo-audit/
├── manifest.md
├── artifacts/
├── evidence/
└── scratch/
```

## Layout

```text
deerflow/
├── SKILL.md
├── agents/openai.yaml
├── references/
│   ├── deerflow-patterns.md
│   ├── modes.md
│   └── research-playbook.md
└── scripts/
    └── new-run.sh
```

Future Claude-specific files can live alongside the Codex skill without changing the repo name.

## Attribution

This skill is inspired by the operating model described in [ByteDance DeerFlow](https://github.com/bytedance/deer-flow): a super agent harness with skills, tools, sub-agents, memory, sandboxed execution, and context discipline.

DeerFlow is maintained by ByteDance and the DeerFlow authors under the MIT License.
