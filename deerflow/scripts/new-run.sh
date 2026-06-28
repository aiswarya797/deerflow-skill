#!/usr/bin/env bash
set -euo pipefail

slug="${*:-run}"
safe_slug=$(printf "%s" "$slug" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
if [ -z "$safe_slug" ]; then
  safe_slug="run"
fi

timestamp=$(date -u +"%Y%m%dT%H%M%SZ")
root=".deerflow-runs/${timestamp}-${safe_slug}"

mkdir -p "$root/scratch" "$root/artifacts" "$root/evidence"

cat > "$root/manifest.md" <<EOF
# DeerFlow-Style Run

- Created: ${timestamp}
- Slug: ${safe_slug}
- Mode:
- Objective:
- Success criteria:

## Plan

## Evidence Index

## Synthesis Notes
EOF

printf "%s\n" "$root"
