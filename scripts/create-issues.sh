#!/usr/bin/env bash
# ============================================================
# create-issues.sh — Create starter issues for the workshop
# ============================================================
#
# This script uses the GitHub CLI (gh) to create a set of
# beginner-friendly issues that students can pick up during
# or after the workshop.
#
# Usage:
#   bash scripts/create-issues.sh
#
# Prerequisites:
#   - gh CLI installed and authenticated
#   - Run from the root of the repository
#
# ============================================================

set -euo pipefail

echo "🎫 Creating starter issues for the workshop..."
echo ""

# ---------- Ensure labels exist ----------
# gh label create is idempotent — it won't error if the label exists.

echo "🏷️  Ensuring labels exist..."

gh label create "good first issue" --color "7057ff" --description "Good for newcomers" --force 2>/dev/null || true
gh label create "documentation"    --color "0075ca" --description "Improvements to docs"   --force 2>/dev/null || true
gh label create "enhancement"      --color "a2eeef" --description "New feature or request"  --force 2>/dev/null || true
gh label create "bug"              --color "d73a4a" --description "Something isn't working" --force 2>/dev/null || true

echo "  ✅ Labels ready."
echo ""

# ---------- Create issues ----------

echo "📝 Creating issues..."
echo ""

# Issue 1: Search box
gh issue create \
  --title "Add a search box to the class wall" \
  --label "good first issue" --label "enhancement" \
  --body "## 💡 Description

Add a search/filter box to the Class Wall (\`wall/index.html\`) so students
can search for a classmate by name or username.

## ✅ Acceptance Criteria

- [ ] An input field appears at the top of the page
- [ ] Typing in the input filters the cards in real time
- [ ] Clearing the input shows all cards again
- [ ] The search is case-insensitive

## 💡 Hint

Look at the TODO comment in \`wall/index.html\` near the bottom of the
\`<script>\` block. You can use \`element.style.display\` to show/hide cards."
echo "  ✅ Issue 1: Search box"

# Issue 2: Colour-code cards
gh issue create \
  --title "Colour-code cards by favourite language" \
  --label "good first issue" --label "enhancement" \
  --body "## 💡 Description

Each student card on the Class Wall shows their favourite language/tool as a
badge. Make the card (or the badge) a different colour based on the language.

## ✅ Acceptance Criteria

- [ ] Cards or badges have different colours for at least 3 languages
      (e.g. Python = blue, JavaScript = yellow, Java = red)
- [ ] Unknown languages get a default colour
- [ ] Looks good in both light and dark mode

## 💡 Hint

Look at the TODO comment in the \`createCard()\` function in
\`wall/index.html\`. You could add a CSS class like \`lang-python\` and
style it in \`wall/style.css\`."
echo "  ✅ Issue 2: Colour-code cards"

# Issue 3: Footer
gh issue create \
  --title "Add a footer with a link to this repo" \
  --label "good first issue" \
  --body "## 💡 Description

The Class Wall page is missing a footer. Add one with a link back to the
GitHub repository.

## ✅ Acceptance Criteria

- [ ] A footer appears at the bottom of the page
- [ ] It contains a link to the GitHub repo
- [ ] It looks clean and matches the rest of the design
- [ ] Looks good in dark mode too

## 💡 Hint

Look at the TODO comment in \`wall/index.html\` — there's already a
suggested HTML snippet. You'll also need to add styles in \`wall/style.css\`."
echo "  ✅ Issue 3: Footer"

# Issue 4: Git cheat sheet
gh issue create \
  --title "Improve the README with a Git cheat sheet" \
  --label "good first issue" --label "documentation" \
  --body "## 💡 Description

Add a handy Git cheat sheet section to \`README.md\` with the most common
commands students will use.

## ✅ Acceptance Criteria

- [ ] A new section titled \"Git Cheat Sheet\" is added to the README
- [ ] Includes at least these commands with short descriptions:
      \`git clone\`, \`git status\`, \`git add\`, \`git commit\`,
      \`git push\`, \`git pull\`, \`git switch\`, \`git log\`
- [ ] Uses a clean markdown table or code block format

## 💡 Hint

Add it after the Glossary section. A markdown table works great:
\`\`\`
| Command | What it does |
|---------|-------------|
| \`git status\` | Shows what files have changed |
\`\`\`"
echo "  ✅ Issue 4: Git cheat sheet"

# Issue 5: Fix the typo
gh issue create \
  --title "Fix the typo in CONTRIBUTING.md" \
  --label "good first issue" --label "bug" \
  --body "## 🐛 Description

There's a typo in \`CONTRIBUTING.md\` under the General Rules section.
Can you find it and fix it?

## ✅ Acceptance Criteria

- [ ] The typo is corrected
- [ ] No other changes are made to the file

## 💡 Hint

Read the General Rules section carefully — one of the words is misspelled.
Look for \"confunsing\" 😉"
echo "  ✅ Issue 5: Fix typo"

# Issue 6: Theme toggle
gh issue create \
  --title "Add a dark/light theme toggle" \
  --label "enhancement" \
  --body "## 💡 Description

The Class Wall currently uses \`prefers-color-scheme\` to automatically
switch between light and dark mode. Add a toggle button so users can
switch manually.

## ✅ Acceptance Criteria

- [ ] A toggle button (e.g. 🌙/☀️) appears in the header
- [ ] Clicking it switches between dark and light themes
- [ ] The user's choice is saved (e.g. in \`localStorage\`)
- [ ] On page load, the saved preference is applied

## 💡 Hint

You can add a \`data-theme\` attribute to the \`<html>\` element and use
CSS like \`[data-theme=\"dark\"] { ... }\` to override the variables in
\`:root\`. Store the choice with \`localStorage.setItem('theme', 'dark')\`."
echo "  ✅ Issue 6: Theme toggle"

echo ""
echo "🎉 All 6 issues created successfully!"
echo "   View them at: https://github.com/Cyberclutch146/git-github-workshop/issues"
