#!/bin/bash

# Check if inside a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "❌ Not a Git repository."
  exit 1
fi

# Use fzf to select a branch (local + remote, de-duped)
branch=$(git branch -a \
  | grep -v 'HEAD' \
  | sed 's/remotes\/origin\///' \
  | sed 's/^[* ]*//' \
  | sort -u \
  | fzf --prompt="Select a branch: " --bind "j:down,k:up")

# Exit if user cancelled
if [[ -z "$branch" ]]; then
  echo "No branch selected."
  exit 0
fi

# Checkout the selected branch
echo "✅ Checking out to '$branch'..."
git checkout "$branch"
