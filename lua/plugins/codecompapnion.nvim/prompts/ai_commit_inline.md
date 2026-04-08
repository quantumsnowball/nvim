---
name: Generate commit message inline
interaction: inline
description: Generate a commit message inline
opts:
  alias: ai_commit_inline
  user_prompt: false
  auto_submit: true
  is_slash_cmd: true
  placement: before
---

## user

You are an expert at following the Conventional Commit specification. 
Below is a `git diff`. Generate a commit message based on these rules:

1. **Format**: `<type>: <description>` (e.g., `feat: add login functionality`).
2. **First Line**: Use ONLY the commit type and a brief description. 
   - **STRICT RULE**: Do NOT include file paths, folder names, or filenames in the first line.
3. **Body**: Use bullet points for additional details if the changes are complex.
4. **Cleanliness**: Skip all empty lines. Output ONLY the raw commit message text.
5. **Output**: You must return a valid JSON object with a "code" field. Inside the "code" string, use literal '\n' characters for newlines and 
   '-' for bullet points. 
   - Format: { "code": "<type>: <description>\n- bullet 1\n- bullet 2" }

```diff
${ai_commit.diff}
