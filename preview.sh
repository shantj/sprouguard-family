#!/usr/bin/env bash
# Open the sprouguard Family Mode validation landing page locally.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAGE="$DIR/index.html"
echo "Opening $PAGE"
open "$PAGE"   # macOS
