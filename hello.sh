#!/usr/bin/env bash

frame=$'   .------------------------.
  /  ____________________  \
 |  / ____/ ___/ __ \__  \ |
 | / /   / /  / /_/ /_/ / / |
 |/ /___/ /__/ ____/ __ / /  |
 |\____/\___/_/   /_/ /_/   |
 |          OpenCode         |
  \__________________________/'

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
  for color in "${colors[@]}"; do
    printf '\033[H\033[J%b%s\033[0m\n' "$color" "$frame"
    sleep 0.2
  done
done
