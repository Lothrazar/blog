#!/usr/bin/env bash
# Local preview of the Hugo blog at http://localhost:1313/blog/
cd "$(dirname "$0")" || exit 1

if ! command -v hugo >/dev/null 2>&1; then
  echo "hugo not found. Install it with: winget install Hugo.Hugo.Extended"
  exit 1
fi

# The Congo theme is a git submodule, make sure it is checked out
if [ ! -f themes/congo/theme.toml ]; then
  echo "themes/congo is empty. Run: git submodule update --init --recursive"
  exit 1
fi

# Drafts and future-dated posts are shown locally, as they are not in the deployed build
hugo serve -D -F "$@"
