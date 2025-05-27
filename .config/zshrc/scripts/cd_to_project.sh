#!/bin/bash

lang_dir="$(find ~/Documents/dev/ -maxdepth 1 -type d | fzf)"
if [ -n "$lang_dir" ]; then
  project_dir=$(find "$lang_dir" -maxdepth 1 -type d | fzf)
fi

if [ -n "$project_dir" ]; then
  cd $project_dir
fi
