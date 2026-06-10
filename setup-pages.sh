#!/bin/bash
# Enable GitHub Pages and push items
TOK=$(cat /data/data/com.termux/files/home/.ghtoken2)

echo "=== Pushing PWA assets ==="
cd /data/data/com.termux/files/home/game-win

# Check pages status
echo "=== Checking Pages status ==="
STATUS=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $TOK" \
  "https://api.github.com/repos/raj86017-cmd/game-win/pages")
echo "Pages API status: $STATUS"

if [ "$STATUS" = "404" ]; then
  echo "=== Creating GitHub Pages ==="
  curl -s -X POST \
    -H "Authorization: token $TOK" \
    -H "Accept: application/vnd.github.v3+json" \
    -d '{"source":{"branch":"master","path":"/"}}' \
    "https://api.github.com/repos/raj86017-cmd/game-win/pages"
fi

echo ""
echo "=== Done ==="
