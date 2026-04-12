---
name: run
description: Run an AI ideation session — generate ideas via subagent, render PDF via Typst subagent, save to outputs with index and manifest
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

6. **Update the manifest**. Read `runs/manifest.json`, append a new entry, and write it back. Each entry:

   ```json
   {
     "id": "<slug>/<YYYY-MM-DD>",
     "topic": "The topic title",
     "prompt": "The user's original prompt, verbatim",
     "date": "YYYY-MM-DD",
     "slug": "<slug>",
     "ideas": 10,
     "depth": "standard",
     "markdown_path": "runs/<slug>/YYYY-MM-DD.md",
     "pdf_path": "outputs/<slug>/YYYY-MM-DD.pdf",
     "tags": ["optional", "user-provided", "or", "inferred"]
   }
   ```

   Keep the array sorted by date descending (newest first).

7. **Spawn Typst PDF subagent** using the Agent tool. The subagent must:
   - Read the markdown file just saved
   - Write a `.typ` file in the same output folder that renders the ideas into a clean, professional PDF
   - **Font**: IBM Plex Sans (installed on system). Set as the document's primary font; do not fall back to generic sans-serif.
   - Include a title page with the topic, date, and idea count
   - **Page numbers**: centered in the footer on every page (including title page)
   - Each idea should be a clearly separated section with the fields styled distinctly
   - Feasibility/Impact should use colored text (green=#2d8a4e for High, orange=#e67e22 for Medium, red=#c0392b for Low)
   - Horizontal rule between ideas for visual separation
   - Body text at 11pt, clean A4 margins
   - Compile the `.typ` file to PDF using `typst compile`
   - Save the PDF to `outputs/<slug>/YYYY-MM-DD.pdf`
   - Clean up the `.typ` file after successful compilation (or keep it — user's choice)

8. **Update the index**. Read `outputs/INDEX.md` (create if missing). Append a row to the table:

   ```markdown
   | [Topic] | YYYY-MM-DD | N | depth | [PDF](slug/YYYY-MM-DD.pdf) | [Markdown](../runs/slug/YYYY-MM-DD.md) |
   ```

   Keep the table sorted by date descending (newest first).

9. **Upload PDF to Google Drive**. Upload the generated PDF to the AI Ideation Runs folder on Google Drive, organized into a subfolder matching the slug:

   - **Drive parent folder ID**: `1DxxXi-XjKXZmTc_SgsKQDveAk01oNcrt` (Ideation_Runs subfolder)
   - **Workspace**: `personal`
   - **Step A — Stage the file**: The GWS MCP runs on ubuntuvm, so local files must be staged first. Use `scp` to copy the PDF to `ubuntuvm:/tmp/gws-mcp-staging/` (or POST to the staging service at `http://10.0.0.4:3201/upload` if available).
   - **Step B — Create Drive subfolder**: Use `mcp__jungle-personal__gws-personal__create_folder` to create a subfolder named `<slug>` inside `1DxxXi-XjKXZmTc_SgsKQDveAk01oNcrt`. If a subfolder for this slug already exists (repeat topic on a new date), reuse it.
   - **Step C — Upload**: Use `mcp__jungle-personal__gws-personal__upload_file` with:
     - `sourcePath`: the **remote** path on ubuntuvm (e.g., `/tmp/gws-mcp-staging/YYYY-MM-DD.pdf`)
     - `name`: `YYYY-MM-DD.pdf`
     - `folderId`: the subfolder ID from Step B
     - `cleanupSource`: `true` (auto-deletes the staged file after upload)
   - If the upload fails, warn the user but do not block the commit/push step.

10. **Commit and push** with message: `Add ideation run: <topic>`

11. **Report**: Tell the user how many ideas were generated, which categories were covered, the path to the PDF, and confirm the Google Drive upload.

## Isolation Rule

**Each run is fully independent.** Do not scan, read, or reference any other files in `runs/` or prior outputs. No deduplication, no cross-referencing. The manifest is the only file you read from `runs/` (to append to it).

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
