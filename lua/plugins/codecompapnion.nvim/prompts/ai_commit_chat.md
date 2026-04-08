---
name: Generate commit message in chat
interaction: chat
description: Generate a commit message in chat
opts:
  alias: ai_commit_chat
  auto_submit: true
  is_slash_cmd: true
---

## user

You are an expert at following the Conventional Commit specification. 
Below is a `git diff`. Generate a commit message based on these rules:

1. **Format**: `<type>: <description>` (e.g., `feat: add login functionality`).
2. **First Line**: Use ONLY the commit type and a brief description. 
   - **STRICT RULE**: Do NOT include file paths, folder names, or filenames in the first line.
3. **Body**: Use bullet points for additional details if the changes are complex.
   - include at least two bullet points as details.
   - details should be as explicit as possible
4. **Output**:
   - only output the commit message, nothing else 
   - do NOT provide any introductory text, conversational filler, or explanations

`````diff
${ai_commit.diff}
`````
