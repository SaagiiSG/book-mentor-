#!/usr/bin/env bash
# Install Book Board as a personal Claude Code skill (works in every project on this machine).
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
dest="${HOME}/.claude/skills/book-board"
if [ ! -f "$here/skills/book-board/SKILL.md" ]; then
  echo "Run this from the book-board folder (skills/book-board/SKILL.md not found)." >&2
  exit 1
fi
mkdir -p "${HOME}/.claude/skills"
if [ -d "$dest" ]; then
  echo "Updating existing install at $dest"
  rm -rf "$dest"
fi
cp -R "$here/skills/book-board" "$dest"
echo "Installed to $dest"
echo "Start a new Claude Code session and run: /book-board <your question>"
