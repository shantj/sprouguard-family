#!/usr/bin/env bash
# ============================================================
# deploy.sh — take the sprouguard Family landing page LIVE.
# Publishes this folder to GitHub Pages under your account.
#
# ONE-TIME (only thing that needs YOU — ~30 sec):
#     gh auth login            # pick GitHub.com > HTTPS > login with browser
#
# THEN just run:
#     bash deploy.sh
#
# It will: create a public repo, push index.html, enable Pages,
# and print your LIVE URL. Re-running redeploys (idempotent).
# ============================================================
set -euo pipefail

REPO="sprouguard-family"        # change if you want a different repo/URL slug
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

# --- 0. preflight ---------------------------------------------------------
if ! command -v gh >/dev/null 2>&1; then
  echo "❌ gh (GitHub CLI) not found. Install: brew install gh"; exit 1
fi
if ! gh auth status >/dev/null 2>&1; then
  echo "❌ Not logged in to GitHub."
  echo "   Run this once, then re-run deploy.sh:"
  echo ""
  echo "       gh auth login"
  echo ""
  echo "   (choose: GitHub.com  →  HTTPS  →  Login with a web browser)"
  exit 1
fi
USER_LOGIN="$(gh api user --jq .login)"
echo "✅ Authed as: $USER_LOGIN"

# --- 1. git init (idempotent) ---------------------------------------------
if [ ! -d .git ]; then
  git init -q
  git checkout -q -b main 2>/dev/null || git branch -q -M main
fi
# minimal .gitignore so we don't ship junk
cat > .gitignore <<'EOF'
.DS_Store
node_modules/
EOF
git add -A
git commit -q -m "Deploy sprouguard Family landing page" || echo "   (nothing new to commit)"

# --- 2. create or reuse the remote repo -----------------------------------
if gh repo view "$USER_LOGIN/$REPO" >/dev/null 2>&1; then
  echo "ℹ️  Repo exists, pushing update…"
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$USER_LOGIN/$REPO.git"
  git push -q -u origin main --force
else
  echo "📦 Creating public repo $USER_LOGIN/$REPO …"
  gh repo create "$REPO" --public --source=. --remote=origin --push
fi

# --- 3. enable GitHub Pages (main branch, root) ---------------------------
echo "🌐 Enabling GitHub Pages…"
gh api -X POST "repos/$USER_LOGIN/$REPO/pages" \
  -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || gh api -X PUT "repos/$USER_LOGIN/$REPO/pages" \
       -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || echo "   (Pages may already be enabled)"

URL="https://$USER_LOGIN.github.io/$REPO/"
echo ""
echo "============================================================"
echo "✅ LIVE (give it ~1 min for the first build):"
echo "   $URL"
echo "============================================================"
echo ""
echo "Next:"
echo "  1) Open the URL, confirm it renders."
echo "  2) Wire real email capture: make a free Formspree form,"
echo "     paste its endpoint into the ENDPOINT=\"\" line in index.html,"
echo "     then re-run: bash deploy.sh"
echo "  3) Drive traffic (Reddit post, HN thread reply) — see RUNBOOK.md"
