#!/usr/bin/env bash

# Runs git fetch for all cloned repos

get_repos() {
  # Use a "while read" loop to safely handle all paths, even with spaces
  while IFS= read -r git_dir; do
    # Use dirname to correctly get the parent directory. It's safer than cut.
    # This will give you paths like "./utils"
    repo_path=$(dirname "$git_dir")

    # Optional: remove the leading './' for a cleaner name
    repo_path=${repo_path#./}

    echo "${repo_path}"
  done < <(find . -maxdepth 2 -type d -name ".git") # Using -maxdepth for efficiency if repos are not nested too deep
}

progress_bar() {
  local current=$1
  local len=$2
  local length=50
  local perc_done=$((current * 100 / len))
  local num_bars=$((perc_done * length / 100))

  local i=0
  local s='['
  for ((i = 0; i < num_bars; i++)); do
    s+='|'
  done
  for ((i = num_bars; i < length; i++)); do
    s+=' '
  done
  s+=']'

  echo -ne "$s $current/$len ($perc_done%)\r"
}

git_fetch() {
  local r=$1
  cd $r
  git fetch >/dev/null 2>&1
  cd ..
}

process_repos() {
  local repos=("$@")
  local len=${#repos[@]}
  echo "Running git fetch for $len repos"

  local i=0
  for repo in "${repos[@]}"; do
    progress_bar "$((i + 1))" "$len"
    git_fetch $repo

    ((i++))
  done
}

main() {
  cd ~/repos
  local repos
  readarray -t repos < <(get_repos)
  process_repos "${repos[@]}"
  echo
}

main

