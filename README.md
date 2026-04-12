# AI Ideation Runs

A public archive of structured AI ideation sessions run using Claude Code.

Each run takes a topic prompt and generates a batch of diverse, structured ideas. Runs are fully independent -- no cross-referencing or deduplication between sessions.

## Structure

```
runs/
  <topic-slug>/
    YYYY-MM-DD.md     # One file per run
```

Each idea includes a name, summary, description, category, feasibility rating, impact rating, key considerations, and next steps.

## How It Works

This repo is a Claude Code workspace. To run a new ideation session:

```
/run
```

Claude asks for a topic, generates ideas, and saves the output to `runs/`.

## Idea Format

| Field | Content |
|-------|---------|
| Name | Descriptive title |
| Summary | One-sentence description |
| Description | Detailed explanation |
| Category | Topic tag |
| Feasibility | Low/Medium/High with rationale |
| Impact | Low/Medium/High with rationale |
| Key Considerations | Risks, dependencies, factors |
| Next Steps | Actionable follow-ups |

## License

MIT
