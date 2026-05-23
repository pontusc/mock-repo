#!/usr/bin/env bash

train=$'      ====        ________
  _D _|  |_______/        \\
   \\-___________/  o  o  o  \\
    (o)    (o)    (o)    (o)'

cleanup() {
  [[ ${cleaned_up:-0} -eq 1 ]] && return
  cleaned_up=1
  printf '\033[0m\033[?25h'
}

trap cleanup EXIT
trap 'cleanup; exit 130' INT TERM

printf '\033[?25l'

cols=$(tput cols 2>/dev/null || printf '80')
train_width=32
max_offset=$((cols > train_width ? cols - train_width : 0))

while :; do
  for ((offset = 0; offset <= max_offset; offset++)); do
    printf '\033[H\033[J%*s%b\n' "$offset" '' "$train"
    sleep 0.05
  done
done
