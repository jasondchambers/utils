#!/usr/bin/env bash

launch_browser_cmd="xdg-open"
if [ "$(uname)" = "Darwin" ]; then 
  echo "Running on macOS"
  launch_browser_cmd="open"
fi

cd $(tmux run "echo #{pane_start_path}")
url=$(git remote get-url origin)

if [[ $url == *github.com* ]]; then
  if [[ $url == git@* ]]; then # git@github.com:jasondchambers/utils.git
    url="${url#git@}"         # github.com:jasondchambers/utils.git
    url="${url/:/\/}"         # github.com/jasondchambers/utils.git
    url="https://$url"        # https://github.com/jasondchambers/utils.git
    echo $url
  fi
  $launch_browser_cmd "$url"
else
  echo "This rep is not hosted on GitHub"
fi
