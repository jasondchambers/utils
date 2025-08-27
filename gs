#!/usr/bin/env sh

cd ~/repos
for r in $(ls -1 ~/repos); do
  cd $r
  git fetch >/dev/null 2>&1
  s=$(git status)
  if [[ "$s" == *"Your branch is behind"* ]]; then
    printf "${r} is behind\n"
  elif [[ "$s" == *"Changes not staged"* ]] || [[ "$s" == *"Your branc is ahead"* ]]; then
    printf "${r} is ahead\n"
  fi
  cd ..
done

