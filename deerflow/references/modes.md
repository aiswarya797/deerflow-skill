# Modes

Use modes to match effort to task size.

## Flash

Use for:

- Simple explanations.
- Quick command output.
- Small lookups where the answer is stable.
- One-file or low-risk edits.

Behavior:

- No formal plan unless needed.
- Use direct tools if they answer faster than reasoning.
- Final answer should be brief.

## Standard

Use for:

- Focused debugging.
- Small implementation tasks.
- Moderate repo inspection.
- Short research with a few sources.

Behavior:

- Make a compact plan if there are multiple steps.
- Verify with the smallest meaningful check.
- Keep final answer concise with changed files or sources.

## Pro

Use for:

- Deep research.
- Code audits.
- Architecture or implementation plans.
- Multi-file changes.
- Artifact creation.

Behavior:

- Plan explicitly.
- Gather enough context before deciding.
- Use scratch notes or a run workspace if the task grows.
- Verify claims and outputs.
- Deliver a coherent synthesis, not a stream of findings.

## Ultra

Use for:

- Ambiguous broad goals.
- Multi-domain research.
- Large repo audits.
- Work that benefits from independent investigation tracks.
- High-stakes synthesis where missed evidence would matter.

Behavior:

- Create independent workstreams.
- Use subagent/delegation tools when available.
- Track conflicts and confidence.
- Perform a review pass before final delivery.

Ultra should still stay bounded. Ask for scope if the task could expand without limit.
