#!/usr/bin/env bash

declare -A login_commands
login_commands["jasonsimac"]="ssh jasonchambers@10.27.27.5"
login_commands["jasonsmbp"]="ssh jasonchambers@10.27.27.6"
login_commands["meerkat"]="ssh jasonchambers@10.27.27.8"
login_commands["thelio"]="ssh jasonchambers@10.27.27.9"

selected_machine=$(printf "%s\n" "${!login_commands[@]}" | fzf)

if [[ -n "$selected_machine" ]]; then
  command_to_run="${login_commands[$selected_machine]}"
  eval "${command_to_run}"
fi

