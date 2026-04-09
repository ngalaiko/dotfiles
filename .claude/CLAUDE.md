# Global Preferences

## Version Control
- Always use `jj` instead of `git` for all version control operations.
- Always use `commit` instead of `describe` when making new commits.
- Do not include cluade as a co-author in the commit description.
- When working on a Linear ticket, include `ref <ticket-id>` or `closes <ticket-id>`

## golang
- When using `go build` to verify compilation, make sure that the artifact is placed in `/tmp` to avoid indexing it with version control.
