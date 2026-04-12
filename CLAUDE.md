# CLAUDE.md - AI Ideation Runs

## Purpose

This is a public repository of AI ideation runs. The user provides a topic prompt and you (Claude) generate a structured batch of ideas. Each run is completely self-contained and independent -- do not read or reference other runs in this repository. Prior runs exist only as a public archive and must never influence the current run.

## Workspace Structure

```
runs/           # Individual ideation run outputs, one folder per topic
.claude/
  commands/     # Slash commands for the workflow
```

## Core Workflow

When the user triggers `/run`:

1. Ask the user for a **topic prompt** -- the subject they want ideas about. This can be anything: a problem to solve, a market to explore, a product category, a creative challenge, etc.
2. Optionally ask how many ideas they want (default: 10) and depth level (brief / standard / comprehensive; default: standard).
3. Generate ideas according to the parameters below.
4. Save output to `runs/<slugified-topic>/YYYY-MM-DD.md`.
5. Commit all changes and push.

## Isolation Rule

**Each run is fully independent.** Do not scan, read, or reference any other files in `runs/`. Do not deduplicate against prior runs. Do not carry context between runs. The user may run the same topic twice deliberately -- that is fine. Treat every invocation as a blank slate.

## Idea Output Format

Each idea within a run must follow this structure:

```markdown
## Idea: [Name]

**Summary**: One-sentence description.

**Description**: 2-3 paragraph explanation of the idea, how it works, and why it matters.

**Category**: [Tag or category label]

**Feasibility**: [Low / Medium / High] - Brief rationale.

**Impact**: [Low / Medium / High] - Brief rationale.

**Key Considerations**: Bullet list of important factors, risks, or dependencies.

**Next Steps**: What would be needed to explore or implement this idea further.
```

For **brief** depth: collapse Description to 1-2 sentences and omit Key Considerations and Next Steps.
For **comprehensive** depth: expand Description to a full analysis with examples, and add an "Alternatives" section.

## Creativity Guidelines

- Push beyond obvious ideas; include unconventional and lateral-thinking suggestions
- Vary abstraction levels: mix strategic ideas with concrete tactical ones
- Draw from adjacent domains and cross-pollinate concepts
- Every idea must be specific enough to act on, not vague platitudes
- Be honest about feasibility limitations
- At least 20% of ideas should be genuinely unconventional or surprising

## File Management

- Each topic gets its own folder under `runs/` using a slugified version of the topic (lowercase, hyphens, no special characters)
- If the same topic is run again on a different date, add a new dated file in the same folder
- Never overwrite or modify existing run files
- Each file must be fully self-contained and readable on its own
