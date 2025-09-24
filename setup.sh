#!/usr/bin/env bash

# Exit on error
set -e

echo "🔧 Installing fzf via Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew not found. Please install Homebrew first: https://brew.sh/"
  exit 1
fi
brew install fzf

echo "📄 Updating .zshrc..."
ZSHRC="$HOME/.zshrc"
ALIASES_SOURCE="source ~/.config/zsh/aliases.zsh"

# Add aliases source if not already in .zshrc
if ! grep -Fxq "$ALIASES_SOURCE" "$ZSHRC"; then
  echo "$ALIASES_SOURCE" >> "$ZSHRC"
  echo "✅ Added '$ALIASES_SOURCE' to $ZSHRC"
else
  echo "ℹ️ '$ALIASES_SOURCE' already exists in $ZSHRC"
fi

echo "🔒 Making git-checkout.sh executable..."
chmod +x "$HOME/.config/zsh/git-checkout.sh"

echo "🔄 Sourcing .zshrc..."
# safer than `source .zshrc` because it ensures we use zsh
zsh -c "source $ZSHRC"

echo "✨ Setup complete! Restart your terminal or run 'source ~/.zshrc' to apply changes."

