#!/usr/bin/env sh

cd ~/repos
for r in $(ls -1 ~/repos); do
  echo $r
  cd $r
  git status
  cd ..
  echo "=============================="
done
