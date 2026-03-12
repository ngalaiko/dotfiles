---
name: duckduckgo-search
description: Search the web using DuckDuckGo and get back titles, links, and summaries. Use when you need to look up current information, documentation, news, or any web content. No API key required.
---

# DuckDuckGo Search

Fetches results from DuckDuckGo's HTML endpoint and parses them with BeautifulSoup. No API key or account needed.

## Usage

```bash
uv run /Users/nikita.galaiko/.pi/agent/skills/duckduckgo-search/search.py "<query>"
```

### Options

| Flag | Description |
|------|-------------|
| `--limit N` | Return at most N results (default: 10) |
| `--json` | Output as JSON instead of plain text |

### Examples

```bash
# Plain text output
uv run /Users/nikita.galaiko/.pi/agent/skills/duckduckgo-search/search.py "neovim lua plugins"

# Limit to 5 results
uv run /Users/nikita.galaiko/.pi/agent/skills/duckduckgo-search/search.py "rust async runtime" --limit 5

# JSON output for programmatic use
uv run /Users/nikita.galaiko/.pi/agent/skills/duckduckgo-search/search.py "typescript generics" --json
```

## Output Format

**Plain text:**
```
1. Result Title
   https://example.com/page
   Short summary of the page content.
```

**JSON:**
```json
{
  "query": "your query",
  "results": [
    {
      "title": "Result Title",
      "link": "https://example.com/page",
      "snippet": "Short summary of the page content."
    }
  ]
}
```

## Notes

- Uses DuckDuckGo's HTML endpoint (`https://html.duckduckgo.com/html/`) — no JS rendering needed
- DuckDuckGo redirect URLs are automatically decoded to real destination URLs via `urllib.parse`
- HTML is parsed with `beautifulsoup4` using CSS selectors — no fragile regex
- Dependencies (`beautifulsoup4`, `requests`) are declared inline and managed automatically by `uv`
