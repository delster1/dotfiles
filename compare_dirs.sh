#!/bin/bash

DIR1="${1-}"
if [[ -z "$DIR1" ]]; then
  echo "Usage: $0 <directory-name>" >&2
  exit 1
fi

DOTFILESDIR="$HOME/.dotfiles/$DIR1/.config/$DIR1"
CONFIGDIR="$HOME/.config/$DIR1"

if [[ ! -d "$DOTFILESDIR" || ! -d "$CONFIGDIR" ]]; then
  echo "Error: One or both directories do not exist:" >&2
  echo "  $DOTFILESDIR" >&2
  echo "  $CONFIGDIR" >&2
  exit 1
fi

# Use temporary files in /tmp so you don't clutter cwd
DOT_TMP=$(mktemp)
CFG_TMP=$(mktemp)

tree -a --noreport $DOTFILESDIR > "$DOT_TMP"
tree -a --noreport $CONFIGDIR > "$CFG_TMP"

echo "=== Diffing tree of $DOTFILESDIR vs $CONFIGDIR ==="
diff -u "$DOT_TMP" "$CFG_TMP" || true

rm -f "$DOT_TMP" "$CFG_TMP"
