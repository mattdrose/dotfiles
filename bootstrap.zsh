#!/bin/zsh

if [ $SPIN ]; then
  sudo apt-get install -y rsync
fi

function init() {
  rsync \
    --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "config/" \
    --exclude "setup/" \
    --exclude "bootstrap.zsh" \
    --exclude "README.md" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;
  source ~/.zshrc;

  if type tmux >/dev/null 2>/dev/null; then
    tmux source-file ~/.tmux.conf
  fi
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then 
  init
elif [ $SPIN ]; then
  init
else
  read "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) "
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    init
  fi
fi

unset init
