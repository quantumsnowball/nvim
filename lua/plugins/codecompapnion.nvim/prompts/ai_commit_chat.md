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
Given the git diff listed below, please generate a commit message for me.
- Output only the commit message, nothing else.
- Skip empty lines.
- First line format example: tag: description.
- DO NOT include path in first line.
- Then use bullet point for other details.

`````diff
${ai_commit.diff}
`````

