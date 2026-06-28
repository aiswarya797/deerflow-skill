---
name: deerflow
description: Run a DeerFlow-inspired super-agent workflow directly inside Codex without requiring a running DeerFlow server. Use this skill when the user wants DeerFlow-like behavior, deep exploration, efficient research flow, multi-step autonomous work, agent orchestration, broad research, repo analysis, code audit, report generation, artifact creation, or asks to "do the same thing as DeerFlow" from Codex. This skill turns Codex into a DeerFlow-style lead agent that plans, decomposes, explores, executes, verifies, and synthesizes results using the tools available in the current Codex environment.
---

# DeerFlow

Use this skill to run Codex like a DeerFlow-style super agent: deep exploration, efficient research flow, tool use, decomposition, context management, verification, and polished final delivery.

This skill does not require a DeerFlow server. It emulates DeerFlow's operating model inside Codex with the available local, web, coding, and delegation tools. If the user explicitly wants to control an existing DeerFlow deployment, say that this skill is focused on DeerFlow-like execution and use normal HTTP/API work only if requested.

## Operating Modes

Select the lightest mode that can satisfy the request:

- `flash`: answer or inspect quickly; no formal plan unless needed.
- `standard`: perform a focused multi-step task with local verification.
- `pro`: plan, explore multiple angles, use tools, verify evidence, and produce a durable artifact or answer.
- `ultra`: use for broad ambiguous tasks that benefit from multiple independent workstreams, deeper research, or extensive synthesis.

Default to `pro` for research, audits, planning, repo analysis, and artifact generation. Use `ultra` when the task naturally splits into independent investigations.

## Core Loop

Follow this loop for every substantial task:

1. Frame the objective, desired output, constraints, and success criteria.
2. Choose a mode and state it briefly if the work is substantial.
3. Build a compact plan with clear workstreams.
4. Gather context from the most authoritative available sources: repo files, user-provided artifacts, official docs, primary sources, logs, tests, or the web when current information matters.
5. Decompose broad work into independent tracks. Use actual subagent/delegation tools when available; otherwise run the tracks sequentially in the main thread.
6. Execute with real tools, not only reasoning. Read files, run tests, inspect outputs, browse, query APIs, or create artifacts as the task requires.
7. Keep context lean. Save scratch notes or run artifacts for long work instead of carrying every detail in the conversation.
8. Verify claims and outputs. Resolve contradictions, cite sources when browsing, run checks for code, and inspect generated artifacts.
9. Synthesize into the requested deliverable with the shortest explanation that preserves confidence.

For long tasks, create a run workspace:

```bash
bash scripts/new-run.sh <short-slug>
```

Use the workspace for scratch notes, extracted evidence, intermediate outputs, and final artifacts.

## Delegation Pattern

Use DeerFlow's lead-agent pattern:

- Lead agent owns the user's goal, plan, quality bar, and final synthesis.
- Worker tracks answer independent questions with minimal shared context.
- Each worker track should have a crisp prompt, expected output, stop condition, and evidence requirement.
- Merge outputs by comparing evidence quality, identifying conflicts, and removing duplication.

Good worker tracks:

- "Map the repo architecture and entrypoints."
- "Find likely failure modes and missing tests."
- "Research official docs for the current API behavior."
- "Create the first draft artifact from gathered evidence."
- "Review the draft for unsupported claims and gaps."

Avoid delegation when the task is simple, highly sequential, or needs a single coherent editing pass.

## Research Behavior

For deep research, read `references/research-playbook.md`. In short:

- Start broad enough to avoid anchoring, then narrow quickly.
- Prefer primary sources and current official docs.
- Track source quality and dates.
- Separate facts, interpretation, and recommendations.
- Preserve links for final attribution when browsing.

## Code And Repo Behavior

For code tasks:

- Read the repo's own instructions first: `AGENTS.md`, `README`, package files, test configs, and nearby code.
- Prefer existing patterns over new architecture.
- Run the smallest meaningful verification first, then broaden if risk warrants.
- Treat code review as finding real behavioral risk, not style commentary.
- Keep edits scoped to the user's goal.

## Artifact Behavior

For artifact-heavy tasks:

- Create concrete outputs: reports, plans, code changes, data files, slide outlines, markdown docs, or demos.
- Put intermediate notes in the run workspace when useful.
- Verify the final artifact exists and can be opened or rendered when applicable.
- In the final answer, point to the artifact path and summarize what changed or what was found.

## Memory And Context

Emulate DeerFlow's context discipline:

- Capture stable project facts in scratch notes for long tasks.
- Summarize completed tracks before starting new ones.
- Do not re-read large files repeatedly when a concise note is enough.
- Do not preserve secrets in notes or artifacts.

## Safety Boundaries

- Do not read secret-bearing files unless the user explicitly asks and it is necessary.
- Do not use destructive commands unless the user clearly requested them.
- Do not browse or rely on stale memory for current facts when web verification is required.
- Do not claim DeerFlow runtime features exist in Codex unless the current environment actually exposes them.

## References

- Read `references/deerflow-patterns.md` to understand the DeerFlow-to-Codex translation.
- Read `references/research-playbook.md` for deep research and synthesis tasks.
- Read `references/modes.md` when choosing between `flash`, `standard`, `pro`, and `ultra`.
