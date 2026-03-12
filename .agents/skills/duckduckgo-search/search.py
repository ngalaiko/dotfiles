#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "beautifulsoup4",
#   "requests",
# ]
# ///

import argparse
import json
import sys
import urllib.parse

import requests
from bs4 import BeautifulSoup


def extract_url(href: str) -> str:
    """Decode DuckDuckGo redirect URL to the real destination."""
    parsed = urllib.parse.urlparse(href)
    params = urllib.parse.parse_qs(parsed.query)
    if "uddg" in params:
        return params["uddg"][0]
    return href


def search(query: str, limit: int) -> list[dict]:
    url = "https://html.duckduckgo.com/html/"
    headers = {
        "User-Agent": (
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
            "(KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
        ),
        "Accept": "text/html,application/xhtml+xml",
        "Accept-Language": "en-US,en;q=0.9",
    }

    resp = requests.post(url, data={"q": query}, headers=headers, timeout=15)
    resp.raise_for_status()

    soup = BeautifulSoup(resp.text, "html.parser")
    results = []

    for block in soup.select(".result.web-result"):
        if len(results) >= limit:
            break
        title_tag = block.select_one(".result__a")
        snippet_tag = block.select_one(".result__snippet")
        if not title_tag:
            continue
        title = title_tag.get_text(strip=True)
        href = title_tag.get("href", "")
        link = extract_url(href)
        snippet = snippet_tag.get_text(strip=True) if snippet_tag else ""
        if title and link:
            results.append({"title": title, "link": link, "snippet": snippet})

    return results


def main() -> None:
    parser = argparse.ArgumentParser(description="Search DuckDuckGo from the CLI.")
    parser.add_argument("query", nargs="+", help="Search query")
    parser.add_argument("--limit", type=int, default=10, help="Max results (default: 10)")
    parser.add_argument("--json", dest="json_output", action="store_true", help="Output as JSON")
    args = parser.parse_args()

    query = " ".join(args.query)

    try:
        results = search(query, args.limit)
    except Exception as exc:
        print(f"Request failed: {exc}", file=sys.stderr)
        sys.exit(1)

    if args.json_output:
        print(json.dumps({"query": query, "results": results}, indent=2))
    else:
        if not results:
            print("No results found.")
            return
        print(f'Search results for: "{query}"\n')
        for i, r in enumerate(results, 1):
            print(f"{i}. {r['title']}")
            print(f"   {r['link']}")
            if r["snippet"]:
                print(f"   {r['snippet']}")
            print()


if __name__ == "__main__":
    main()
