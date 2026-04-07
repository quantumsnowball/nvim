---
name: Commit message
interaction: chat
description: Generate a commit message
opts:
  alias: ai_commit
  auto_submit: true
  is_slash_cmd: true
---

## user

You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me. Output only the commit message, nothing else. The first line only contain precise descriptive text, no tags or paths. Then use bullet point for details.

`````diff
${ai_commit.diff}
`````

