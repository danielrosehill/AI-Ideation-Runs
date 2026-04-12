## Run Ideation

Generate a structured batch of ideas for a user-provided topic.

### Instructions

1. **Get the topic**: Ask the user what topic they want ideas about. Accept any framing -- a question, a problem statement, a domain, a "what if" scenario.

2. **Get optional parameters** (offer defaults, don't force an interview):
   - **Number of ideas**: How many? Default: 10.
   - **Depth**: brief / standard / comprehensive. Default: standard.

3. **Do NOT read any other files in `runs/`.** Each run is independent. No deduplication, no cross-referencing, no context from prior runs.

4. **Generate ideas** following the output format and creativity guidelines in CLAUDE.md. Structure the output file as:

```markdown
# [Topic]

**Date**: YYYY-MM-DD
**Ideas generated**: [count]
**Depth**: [brief / standard / comprehensive]

**Prompt**: [The user's original topic prompt, quoted verbatim]

---

[Ideas follow using the format from CLAUDE.md]
```

5. **Save the file** to `runs/<slugified-topic>/YYYY-MM-DD.md`. Create the topic folder if it doesn't exist.

6. **Commit and push** with message: `Add ideation run: <topic>`

7. **Report**: Tell the user how many ideas were generated and which categories were covered.
