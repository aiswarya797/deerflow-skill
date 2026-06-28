# Deep Research Playbook

Use this when the user asks for research, competitive analysis, technical evaluation, market understanding, policy/current facts, or anything where DeerFlow-like breadth matters.

## Research Loop

1. Restate the research question and decision the answer should support.
2. Identify dimensions: technical, market, user, risk, economics, implementation, timeline, or alternatives.
3. Gather sources from primary or high-quality references first.
4. Record dates for current topics and distinguish old facts from new developments.
5. Compare claims across sources and note contradictions.
6. Build the answer around evidence, not source order.
7. Provide a recommendation or synthesis when the user needs a decision.

## Source Quality

Prefer:

- Official docs, standards, specs, source repositories, papers, filings, data portals.
- Direct product pages or changelogs for product capabilities.
- Recent reputable reporting for fast-changing events.

Use caution with:

- SEO summaries, reposted docs, unsourced blogs, forum claims without corroboration.
- Old tutorials for active APIs.
- Generated or scraped pages.

## Output Shapes

For a short brief:

```markdown
## Bottom Line
## Key Evidence
## Tradeoffs
## Recommendation
## Sources
```

For a deep report:

```markdown
# Title
## Executive Summary
## Method
## Findings
## Options
## Risks
## Recommendation
## Sources
```

For an implementation research handoff:

```markdown
# Implementation Brief
## Goal
## Current System
## External Constraints
## Proposed Approach
## Edge Cases
## Validation Plan
## References
```

## Synthesis Rules

- State confidence levels when evidence is incomplete.
- Put dates on time-sensitive claims.
- Separate "what is true" from "what I infer."
- Avoid long quotes; paraphrase and cite.
- If evidence changes the plan, say so.
