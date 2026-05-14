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

cleanup() {
  [[ ${cleaned_up:-0} -eq 1 ]] && return
  cleaned_up=1
  printf '\033[0m\033[?25h'
}

trap cleanup EXIT
trap 'cleanup; exit 130' INT TERM

printf '\033[?25l'

while :; do
  for i in "${!frames[@]}"; do
    printf '\033[H\033[J%s%b\033[0m\n' "${colors[$i]}" "${frames[$i]}"
    sleep 0.2
  done
done
