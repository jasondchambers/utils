#!/usr/bin/env bash

config="${SSH_HOSTS_FILE:-$HOME/.ssh_hosts}"

if [[ ! -f "$config" ]]; then
  echo "Error: config file not found at $config" >&2
  echo "Copy ssh_hosts.example to ~/.ssh_hosts and fill in your hosts." >&2
  exit 1
fi

declare -A login_commands

while IFS='|' read -r name cmd; do
  [[ "$name" =~ ^#|^[[:space:]]*$ ]] && continue
  login_commands["$name"]="$cmd"
done < "$config"

selected_machine=$(printf "%s\n" "${!login_commands[@]}" | sort | fzf)

if [[ -n "$selected_machine" ]]; then
  command_to_run="${login_commands[$selected_machine]}"
  echo "${command_to_run}"
  eval "${command_to_run}"
fi
