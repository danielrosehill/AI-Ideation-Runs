---
name: combine-runs
description: Generate a combined PDF from multiple ideation runs, with a shared title page and table of contents
user_invocable: true
---

# Combine Ideation Runs

Merge multiple ideation run markdown files into a single combined PDF with a title page and table of contents.

## Instructions

1. **Identify which runs to combine**. Use `$ARGUMENTS` if provided, otherwise ask. The user can specify runs by:
   - Slug names (e.g., `ai-council-projects, policy-use-cases`)
   - A theme/keyword to match against manifest entries
   - "last N runs" or "today's runs"
   - Specific manifest IDs

2. **Read the manifest** at `runs/manifest.json` to resolve the runs. Show the user which runs matched and confirm before proceeding.

3. **Get optional parameters**:
   - **Combined title**: A title for the combined document. Default: infer from the topics.
   - **Subtitle**: Optional subtitle or description.

4. **Read all selected markdown files** from their `markdown_path` in the manifest.

5. **Spawn Typst PDF subagent** using the Agent tool. The subagent must:
   - Create a `.typ` file at `outputs/combined/<slugified-title>/YYYY-MM-DD.typ`
   - Use IBM Plex Sans font if available, fallback to sans-serif
   - Structure:
     - **Title page**: Combined title, subtitle, date, list of included runs with idea counts
     - **Table of contents**: Auto-generated from run topics and idea names
     - **For each run**: A part/chapter divider page with the run topic, then all ideas from that run
   - Each idea should be a clearly separated section with fields styled distinctly
   - Feasibility/Impact should use colored badges (green=High, orange=Medium, red=Low)
   - Page numbers in footer
   - Compile to PDF using `typst compile`
   - Save PDF to `outputs/combined/<slugified-title>/YYYY-MM-DD.pdf`
   - Keep the `.typ` source file

6. **Update the manifest**. Add a combined run entry:

   ```json
   {
     "id": "combined/<slugified-title>/<YYYY-MM-DD>",
     "topic": "Combined title",
     "prompt": "Combined from: [list of source run IDs]",
     "date": "YYYY-MM-DD",
     "slug": "combined/<slugified-title>",
     "ideas": total_idea_count,
     "depth": "combined",
     "markdown_path": null,
     "pdf_path": "outputs/combined/<slugified-title>/YYYY-MM-DD.pdf",
     "tags": ["combined"],
     "source_runs": ["id1", "id2", "id3"]
   }
   ```

7. **Update the index**. Append a row to `outputs/INDEX.md`:

   ```markdown
   | [Combined title] (combined) | YYYY-MM-DD | N total | combined | [PDF](combined/slug/YYYY-MM-DD.pdf) | — |
   ```

8. **Commit and push** with message: `Add combined PDF: <title>`

9. **Report**: Tell the user the PDF path and total idea count.
