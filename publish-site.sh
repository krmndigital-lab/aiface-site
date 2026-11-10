#!/bin/bash
# AI Face site: creates the PUBLIC GitHub repo krmndigital-lab/aiface-site from this folder,
# pushes it and turns on GitHub Pages (main branch, root).
set -euo pipefail
cd "$(dirname "$0")"
git add -A && git commit -q -m "site" || true
gh repo create krmndigital-lab/aiface-site --public \
  --description "AI Face — privacy policy, terms, licences and support page (no source code)" \
  --source . --remote origin --push
gh api -X POST repos/krmndigital-lab/aiface-site/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null \
  || gh api -X PUT repos/krmndigital-lab/aiface-site/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null
echo "Pages: https://krmndigital-lab.github.io/aiface-site/"
