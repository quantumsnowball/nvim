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
Given the git diff listed below, please generate a commit message for me.
- Output only the commit message, nothing else.
- Skip empty lines.
- First line format template: [tag]: [description text].
- Do NOT write path in first line.
- Then use bullet point for details.

`````diff
${ai_commit.diff}
`````

