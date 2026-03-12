## Behavior
- Do NOT start implementing, designing, or modifying code unless explicitly asked
- When user mentions an issue or topic, just summarize/discuss it - don't jump in to action
- Wait for explicit instructions Like "implement this", "fix this", "create this"

## Version Control
- Always use `jj` instead of `git` for all version control operations
- Always use `commit` instead of `describe` when making new commits
- Do not include agents as a co-author in the commit description
- When working on a Linear ticket, include `ref <ticket-id>` or `closes <ticket-id>`

## golang
- prefer `go test` or `go run` instead of `go build`
- When using `go build` to verify compilation, make sure that the artifact is placed in `/tmp` to avoid indexing it with version control.
