#!/usr/bin/env bash

declare -a status_report

cd ~/repos
i=0
for r in $(ls -1 ~/repos); do
  if [ -d "${r}" ]; then
    echo -ne "                                                                                          \r"
    echo -ne " Checking $r\r"
    cd $r
    if [ -d ".git" ]; then
      git fetch >/dev/null 2>&1
      s=$(git status)
      if [[ "$s" == *"Your branch is behind"* ]]; then
        status_report[$i]="${r} is behind"
      elif [[ "$s" == *"Changes not staged"* ]] || [[ "$s" == *"Your branch is ahead"* ]]; then
        status_report[$i]="${r} is ahead"
      fi
      ((i++))
    fi
    cd ..
  fi
done

echo -ne "                                                                                          \r"

for item in "${status_report[@]}"; do
  echo "$item"
done
