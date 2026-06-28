# DeerFlow Patterns For Codex

Use these translations when emulating DeerFlow inside Codex.

## Super-Agent Harness

DeerFlow is a harness: it gives an agent tools, skills, memory, sandboxed execution, sub-agents, and workflow discipline. In Codex, treat the current environment as the harness:

- Filesystem and shell are the execution environment.
- Web browsing provides research and source verification.
- Skills provide procedural context.
- Plans and scratch files provide context management.
- Multi-agent tools, when available, provide sub-agent style delegation.
- Tests, linters, screenshots, renderers, and generated artifacts provide verification.

## Lead Agent Contract

The lead agent should:

- Preserve the user's exact goal.
- Decide when the task needs planning, research, coding, artifact creation, or review.
- Decompose into tracks only when independence creates value.
- Keep each track narrow and evidence-driven.
- Integrate outputs into one coherent answer or artifact.
- Own final quality instead of forwarding worker output unfiltered.

## Sub-Agent Track Template

Use this structure when dispatching or simulating a worker track:

```text
Objective:
Scope:
Inputs:
Expected output:
Evidence required:
Stop condition:
```

For example:

```text
Objective: Identify architecture and extension points.
Scope: README, AGENTS.md, package files, backend/frontend entrypoints.
Inputs: repo path.
Expected output: concise architecture map with file references.
Evidence required: file paths and line numbers.
Stop condition: enough context to safely plan implementation.
```

## Context Engineering

Use progressive summarization:

- Keep raw findings in scratch files for long tasks.
- Keep the conversation focused on decisions and current blockers.
- Summarize completed tracks before moving to synthesis.
- Re-open primary files before editing or citing exact lines.

## Verification

Match verification to risk:

- Research: cross-check sources, prefer primary documentation, cite links.
- Code: run tests, type checks, linters, or focused scripts.
- UI: inspect with browser/screenshot tools where available.
- Data: validate row counts, schema assumptions, and missingness.
- Documents: render or open generated artifacts when layout matters.

## Final Synthesis

The final answer should include:

- The concrete result.
- What was verified.
- Any residual risk or missing dependency.
- Links to files, artifacts, sources, or commands that matter.

Do not dump raw notes unless the user asked for them.
