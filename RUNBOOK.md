# sprouguard Family Mode — 3-Day Validation Runbook

**What this is:** a done-for-you demand test for turning sprouguard into a family/parental
product, built off the HN signal (Roblox "linked parent" takeover, zero platform alerts).
The premise: **the wedge is visibility + alerts, not more blocking.** Everything here is
built and ready — you just point traffic at it and read the numbers.

**Positioning (the one-liner the whole thing is built on):**
> Other parental apps show you a dashboard that can stay silent while control is taken away.
> sprouguard Family *tells you the instant anything changes* — install, setting, linked
> account — and lets you approve or block. Same Screen Time / Family Controls engine
> sprouguard already runs on.

---

## What's in this folder

| File | What it is | Status |
|---|---|---|
| `index.html` | Full smoke-test landing page: HN-pain hero, alert-feed phone mock, feature grid, compare table, $4.99/mo founder-price anchor, email capture ×2 | ✅ built + browser-tested (form works, counter 128→129, funnel tracked) |
| `deploy.sh` | **One-command deploy to a LIVE public URL** (GitHub Pages). Repo already git-initialized + committed. | ✅ built + syntax-tested; needs `gh auth login` once |
| `ASO-keywords.md` | App Store subtitle / promo text / keyword field / description opener + keywords to watch + pass criteria | ✅ ready to paste into App Store Connect |
| `reddit-post.md` | r/Parenting-safe question post + r/daddit WTP version + result-reading gate | ✅ ready to post |
| `preview.sh` | One command to open the page locally | ✅ |
| `RUNBOOK.md` | this file | ✅ |

---

## The 3 tests, cheapest → strongest signal

### Test A — ASO listing test (no traffic needed, ~5 min setup)
1. In **App Store Connect**, update sprouguard's US listing with the subtitle + promo text +
   description opener from `ASO-keywords.md`. Promo text & keywords need **no review**;
   subtitle/description need a (fast) review.
2. Wait 3–7 days. Read **App Analytics → Impressions & Product Page Views**, filtered to the
   parental/safety keywords.
3. **Pass:** tap-through on family/parental terms beats your detox-keyword baseline.

### Test B — Landing page + waitlist (the real "would you sign up" test)
1. **Deploy `index.html`** (2 min, free): drag the folder to **Netlify Drop**
   (app.netlify.com/drop) or `vercel deploy`, or push to GitHub Pages. It's a single static
   file — zero build.
2. **Wire real email capture** (2 min): make a free **Formspree** form, paste its endpoint
   into the `ENDPOINT = ""` line near the bottom of `index.html`. Emails then POST to you.
   (Until you do, signups still record in the browser's localStorage — call `sgExport()` in
   the console to dump them — but Formspree is how you collect for real.)
3. **Drive ~100–300 visitors**: the Reddit post (Test C), a Show HN, a comment on the
   original HN thread, or a tiny $20 test of App Store Search Ads pointed at "parental
   controls".
4. Read the funnel: open the deployed page, DevTools console → `sgExport()` prints
   page_views / signups / **signup_rate**.

### Test C — Reddit WTP probe (the "do they say money" test)
1. Post the question version from `reddit-post.md` to **r/Parenting** (no links — mods),
   and/or the WTP version to **r/daddit** / **r/Mommit**.
2. If someone asks "does this exist?", reply as yourself + DM the landing-page link.
3. Read replies at 72h against the gate in that file.

---

## 🚦 Go / Kill decision (decide, don't drift)

Run for **3 days minimum**. Then:

| Outcome | Signal | Decision |
|---|---|---|
| 🟢 **GO — build MVP** | Landing signup_rate **≥ 8–10%** of visitors, OR multiple unprompted "I'd pay" on Reddit, OR Roblox/Discord long-tail converts in ASO | Build a thin Family MVP: reuse sprouguard's Family Controls engine, add the **change-alert feed** (install / setting / linked-account) as the hero feature. Ship the alert, not a big dashboard. |
| 🟡 **MAYBE — one more loop** | signup_rate 3–8%, pain clearly resonates but no money mentioned | Iterate the hero (lead harder on a specific fear, e.g. Roblox), retest one week. Don't build yet. |
| 🔴 **KILL — don't build** | signup_rate < 3% with real traffic AND Reddit says "Screen Time already does this / too surveillance-y" AND ASO tap-through flat | Parental angle isn't a paid wedge. Bank the learning, keep doubling down on sprouguard's core detox monetization (the Freemium PRD). |

**Why a threshold at all:** the trap with an idea this emotionally appealing is building it
because it *feels* right. A cold-traffic signup_rate and an unprompted "take my money" are
the two signals that survive that bias. Everything above exists so you're deciding on
numbers in 3 days, not months of code.

---

## ⚠️ Two gates baked in (from your own research rules)

- **China:** this English "Family / parental" framing is an **overseas** test. Mainland CN
  is a separate "未成年人模式" product — validate that separately, don't mix markets.
- **Feasibility:** Family mode is genuinely in reach — it's the **same Screen Time /
  DeviceActivity / Family Controls stack sprouguard already uses** (your PRD even lists
  "家庭共享" as known-adjacent out-of-scope). The new build is the alert/visibility layer,
  not a new foundation. That's exactly the "extend an app you already own" bet the
  research filter prefers over a from-scratch app.

---

## Fastest possible start (2 commands + one paste)
```bash
gh auth login          # once, ~30 sec: GitHub.com → HTTPS → browser
bash deploy.sh         # → prints your LIVE https://<you>.github.io/sprouguard-family/ URL
```
Then make a free Formspree form, paste its endpoint into the `ENDPOINT=""` line in
`index.html`, run `bash deploy.sh` again, and drop the link in a reply on the original HN
thread + post the r/daddit WTP version. You'll have a real signal by the weekend.
