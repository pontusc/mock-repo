#!/usr/bin/env bash

frames=(
"   .-.\n  (o o)\n   |O|   hello from opencode\n   | |'"
"   .-.\n  (o o)\n  /|O|\\  hello from opencode\n   / \\"
"   .-.\n  (o o)\n   \\|O|/ hello from opencode\n   / \\"
)

for frame in "${frames[@]}"; do
  printf '\033[H\033[J%b\n' "$frame"
  sleep 0.2
done
