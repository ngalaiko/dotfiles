#!/usr/bin/env node

const https = require('https');

const args = process.argv.slice(2);
const jsonOutput = args.includes('--json');
const limitFlag = args.indexOf('--limit');
const limit = limitFlag !== -1 ? parseInt(args[limitFlag + 1], 10) : 10;
const query = args.filter(a => a !== '--json' && a !== '--limit' && !parseInt(a)).join(' ');

if (!query) {
  console.error('Usage: ./search.js <query> [--json] [--limit N]');
  process.exit(1);
}

function decodeHtml(html) {
  return html
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#x27;/g, "'")
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/&#x2F;/g, '/')
    .trim();
}

function stripHtml(html) {
  return decodeHtml(html.replace(/<[^>]+>/g, ''));
}

// Extract real URL from DuckDuckGo redirect link
function extractUrl(href) {
  try {
    const match = href.match(/uddg=([^&]+)/);
    if (match) return decodeURIComponent(match[1]);
  } catch (_) {}
  return href;
}

const url = `https://html.duckduckgo.com/html/?q=${encodeURIComponent(query)}`;

const options = {
  headers: {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml',
    'Accept-Language': 'en-US,en;q=0.9',
  }
};

https.get(url, options, (res) => {
  // Follow redirects
  if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
    console.error('Redirected to:', res.headers.location);
    process.exit(1);
  }

  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    const results = [];

    // Each result block sits between result__title and result__snippet
    // Pattern: grab result__a (title+href) and result__snippet together
    const blockRe = /<a[^>]+class="result__a"[^>]+href="([^"]*)"[^>]*>([\s\S]*?)<\/a>[\s\S]*?<a[^>]+class="result__snippet"[^>]*>([\s\S]*?)<\/a>/g;

    let match;
    while ((match = blockRe.exec(data)) !== null && results.length < limit) {
      const href = match[1];
      const title = stripHtml(match[2]);
      const snippet = stripHtml(match[3]);
      const link = extractUrl(href);

      if (title && link) {
        results.push({ title, link, snippet });
      }
    }

    if (results.length === 0) {
      if (jsonOutput) {
        console.log(JSON.stringify({ query, results: [] }));
      } else {
        console.log('No results found.');
      }
      process.exit(0);
    }

    if (jsonOutput) {
      console.log(JSON.stringify({ query, results }, null, 2));
    } else {
      console.log(`Search results for: "${query}"\n`);
      results.forEach((r, i) => {
        console.log(`${i + 1}. ${r.title}`);
        console.log(`   ${r.link}`);
        if (r.snippet) console.log(`   ${r.snippet}`);
        console.log();
      });
    }
  });
}).on('error', err => {
  console.error('Request failed:', err.message);
  process.exit(1);
});
