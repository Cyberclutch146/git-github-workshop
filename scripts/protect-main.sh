#!/usr/bin/env bash
# ============================================================
# protect-main.sh — Apply branch protection to main
# ============================================================
#
# This script uses the GitHub CLI (gh api) to protect the
# main branch with these settings:
#
#   - Require a pull request before merging
#   - Required approvals: 0 (instructor merges directly)
#   - Block force pushes
#   - Block branch deletion
#   - Require the validate-pr status check to pass
#
# Usage:
#   bash scripts/protect-main.sh
#
# Note: Branch protection rules require a GitHub Pro, Team,
# or Enterprise plan for private repos. Public repos on the
# free plan support basic branch protection.
#
# ============================================================

set -euo pipefail

# Get the repo owner and name from the current git remote
REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')

if [ -z "$REPO" ]; then
  echo "❌ Could not determine the repository."
  echo "   Make sure you're in a git repo with a GitHub remote."
  exit 1
fi

echo "🔒 Applying branch protection to main on $REPO..."
echo ""

# Apply branch protection using the GitHub REST API
# Docs: https://docs.github.com/en/rest/branches/branch-protection
RESPONSE=$(gh api \
  --method PUT \
  "repos/$REPO/branches/main/protection" \
  --input - <<'EOF' 2>&1) || {
    echo ""
    echo "⚠️  Branch protection could not be applied."
    echo ""
    echo "Possible reasons:"
    echo "  - The repository might be private on the free plan"
    echo "    (branch protection requires GitHub Pro/Team/Enterprise"
    echo "    for private repos, but works on free public repos)."
    echo "  - Your GitHub token may not have sufficient permissions."
    echo ""
    echo "API response:"
    echo "$RESPONSE"
    echo ""
    echo "💡 You can set branch protection manually:"
    echo "   Settings → Branches → Add rule → Branch name: main"
    exit 1
  }
{
  "required_status_checks": {
    "strict": false,
    "contexts": ["Check student PR"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null,
  "allow_force_pushes": false,
  "allow_deletions": false
}
EOF

echo "✅ Branch protection applied successfully!"
echo ""
echo "Settings:"
echo "  ✓ Pull requests required before merging"
echo "  ✓ Required approvals: 0 (you can merge directly)"
echo "  ✓ Required status check: 'Check student PR'"
echo "  ✓ Force pushes: blocked"
echo "  ✓ Branch deletion: blocked"
echo ""
echo "🔗 View settings: https://github.com/$REPO/settings/branches"
