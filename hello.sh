#!/usr/bin/env bash

frames=(
$'   .-.\n  (o o)\n   |O|   hello from opencode\n   | |\''
$'   .-.\n  (o o)\n  /|O|\\  hello from opencode\n   / \134'
$'   .-.\n  (o o)\n   \\|O|/ hello from opencode\n   / \134'
)

colors=(
  $'\033[31m'
  $'\033[33m'
  $'\033[32m'
)

for i in "${!frames[@]}"; do
  printf '\033[H\033[J%s%b\033[0m\n' "${colors[$i]}" "${frames[$i]}"
  sleep 0.2
done
