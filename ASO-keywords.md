# sprouguard Family — ASO copy + keyword test asset

> Purpose: the **cheapest real demand signal** = does "family / parental mode" copy pull
> organic App Store taps? Update sprouguard's existing US listing (or a TestFlight/subtitle
> A/B) with the copy below, then watch impressions→taps in App Store Connect for 3–7 days.
> This does NOT require building the feature — it's a listing-level smoke test.

---

## 1. App Store metadata to drop in

**Subtitle (30 char max)** — pick one, A/B if you can:
- `Screen time + safety alerts` (28)
- `Parental controls that alert` (28)
- `See & guard your kid's phone` (28)

**Promotional text (170 char, editable anytime, no review):**
> New: Family mode. Get alerted the moment an app is installed or a setting changes on your kid's device — real visibility, not a dashboard that stays silent.

**Keyword field (100 char, comma-sep, no spaces after commas — every char counts):**
```
parental,control,family,kids,screen,time,safety,child,block,monitor,limit,focus,guard,routine
```
> Notes: don't repeat words already in the app **name/subtitle** (Apple indexes those
> separately — repeating wastes chars). Singular forms auto-match plurals. "app store"
> stopwords and your own brand are auto-indexed — don't spend chars on "sprouguard".

**Description — new opening 3 lines (the part shown before "more"):**
> Know what your kid's phone is actually doing. sprouguard Family alerts you the moment an app is installed or a control changes — the visibility other parental apps don't give you.
>
> Built on Apple Screen Time & Family Controls. Private, on-device, no creepy cloud profile.

---

## 2. Keywords to watch (rank + your tap-through)

Track where sprouguard surfaces for these, and — more importantly — the **tap-through rate**
on the ones where you already get impressions:

| Intent bucket | Terms to monitor |
|---|---|
| Core parental | `parental controls`, `parental control app`, `kids phone control` |
| Safety-driven (the HN emotion) | `child safety app`, `app blocker for kids`, `screen time for kids` |
| Roblox/game panic (long-tail, low comp) | `roblox parental controls`, `block roblox`, `discord parental` |
| Adjacent to your current positioning | `screen time limit`, `focus app for family`, `phone rules for kids` |

The **Roblox/Discord long-tail** is the sharpest test: it's low-competition, directly tied to
the pain signal, and if those tiny-volume terms convert, the emotion is real and monetizable.

---

## 3. What "pass" looks like (listing test)

Over 3–7 days in App Store Connect → **App Analytics → Impressions & Product Page Views**:

- **Weak/kill:** family/parental keywords add impressions but **tap-through ≤ baseline**
  (people see it, don't care) → the parental angle isn't pulling; don't build the feature.
- **Promising:** tap-through on parental/safety terms is **noticeably above** your detox
  keyword baseline → parents are leaning in → greenlight a lightweight Family MVP.
- **Strong:** the Roblox/Discord long-tail converts at all → run the landing-page +
  Reddit test to size willingness-to-pay, then build.

> ⚠️ China gate (from your research rules): this English "Family / parental" ASO test is a
> **US/overseas** test. Mainland CN needs a separate "未成年人模式" product framing — don't
> conflate the two markets in one listing.
