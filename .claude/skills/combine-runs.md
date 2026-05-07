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
   - **Font**: IBM Plex Sans (installed on system). Set as the document's primary font; do not fall back to generic sans-serif.
   - Structure:
     - **Title page**: Combined title, subtitle, date, list of included runs with idea counts
     - **Table of contents**: Auto-generated from run topics and idea names
     - **For each run**: A part/chapter divider page with the run topic, then all ideas from that run
   - Each idea should be a clearly separated section with fields styled distinctly
   - Feasibility/Impact should use colored text (green=#2d8a4e for High, orange=#e67e22 for Medium, red=#c0392b for Low)
   - Horizontal rule between ideas for visual separation
   - **Page numbers**: centered in the footer on every page
   - Body text at 11pt, clean A4 margins
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

8. **Upload PDF to Google Drive**. Upload the combined PDF to the AI Ideation Runs folder on Google Drive, organized into a subfolder:

   - **Drive parent folder ID**: `1DxxXi-XjKXZmTc_SgsKQDveAk01oNcrt` (Ideation_Runs subfolder)
   - **Workspace**: `personal`
   - **Step A — Stage the file via MinIO**: Stage the PDF and capture the presigned URL:
     ```bash
     python3 ~/.claude/lib/minio-stage.py outputs/combined/<slug>/YYYY-MM-DD.pdf --expires 3600
     ```
     Legacy `:3201/upload` / `/tmp/gws-mcp-staging/` was decommissioned 2026-04-20 — don't use.
   - **Step B — Create Drive subfolder**: Use `mcp__jungle-personal__gws-personal__create_folder` to create `combined--<slugified-title>` inside `1DxxXi-XjKXZmTc_SgsKQDveAk01oNcrt`.
   - **Step C — Upload**: Use `mcp__jungle-personal__gws-personal__upload_file` with:
     - `sourceUrl`: the presigned URL from Step A
     - `name`: `YYYY-MM-DD.pdf`
     - `parents`: `["<subfolder ID from Step B>"]`
   - If the upload fails, warn the user but do not block the commit/push step.

9. **Commit and push** with message: `Add combined PDF: <title>`

10. **Report**: Tell the user the PDF path, total idea count, and confirm the Google Drive upload.
