---
name: Commit message
interaction: chat
description: Generate a commit message
opts:
  alias: ai_commit
  auto_submit: false
  is_slash_cmd: true
---

## user

You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

`````diff
${ai_commit.diff}
`````

