---
name: run
description: Run an AI ideation session — generate ideas via subagent, render PDF via Typst subagent, save to outputs with index
user_invocable: true
---

# Run Ideation

Generate a structured batch of ideas for a user-provided topic, render them as a polished PDF, and archive everything in `outputs/`.

## Instructions

1. **Get the topic**: Ask the user what topic they want ideas about. Accept any framing — a question, a problem statement, a domain, a "what if" scenario. Use `$ARGUMENTS` if the user provided inline arguments.

2. **Get optional parameters** (offer defaults, don't force an interview):
   - **Number of ideas**: How many? Default: 10.
   - **Depth**: brief / standard / comprehensive. Default: standard.

3. **Slugify the topic** into a folder name (lowercase, hyphens, no special characters, max 60 chars). Use today's date (YYYY-MM-DD) for the filename.

4. **Spawn ideation subagent** using the Agent tool. The subagent must:
   - Generate N ideas following the idea format and creativity guidelines from CLAUDE.md
   - Return the ideas as a single markdown string (do NOT let the subagent write files)
   - Each run is independent — the subagent must NOT read any files in `runs/` or `outputs/`

5. **Save the markdown** to `runs/<slug>/YYYY-MM-DD.md` with this header:

   ```markdown
   # [Topic]

   **Date**: YYYY-MM-DD
   **Ideas generated**: [count]
   **Depth**: [brief / standard / comprehensive]

   **Prompt**: [The user's original topic prompt, quoted verbatim]

   ---

   [Ideas from subagent]
   ```

6. **Spawn Typst PDF subagent** using the Agent tool. The subagent must:
   - Read the markdown file just saved
   - Write a `.typ` file in the same output folder that renders the ideas into a clean, professional PDF
   - Use IBM Plex Sans font if available, fallback to sans-serif
   - Include a title page with the topic, date, and idea count
   - Each idea should be a clearly separated section with the fields styled distinctly
   - Feasibility/Impact should use colored badges (green=High, orange=Medium, red=Low)
   - Compile the `.typ` file to PDF using `typst compile`
   - Save the PDF to `outputs/<slug>/YYYY-MM-DD.pdf`
   - Clean up the `.typ` file after successful compilation (or keep it — user's choice)

7. **Update the index**. Read `outputs/INDEX.md` (create if missing). Append a row to the table:

   ```markdown
   | [Topic] | YYYY-MM-DD | N | depth | [PDF](slug/YYYY-MM-DD.pdf) | [Markdown](../runs/slug/YYYY-MM-DD.md) |
   ```

   Keep the table sorted by date descending (newest first).

8. **Commit and push** with message: `Add ideation run: <topic>`

9. **Report**: Tell the user how many ideas were generated, which categories were covered, and the path to the PDF.

## Isolation Rule

**Each run is fully independent.** Do not scan, read, or reference any other files in `runs/` or prior outputs. No deduplication, no cross-referencing.

## Creativity Guidelines (pass to ideation subagent)

- Push beyond obvious ideas; include unconventional and lateral-thinking suggestions
- Vary abstraction levels: mix strategic ideas with concrete tactical ones
- Draw from adjacent domains and cross-pollinate concepts
- Every idea must be specific enough to act on, not vague platitudes
- Be honest about feasibility limitations
- At least 20% of ideas should be genuinely unconventional or surprising

## Idea Format (pass to ideation subagent)

Each idea must follow this structure:

```
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
