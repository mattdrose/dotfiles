# Load the shell dotfiles
for file (path exports zsh aliases functions prompt tmux programs); do
  src=~/.$file
  [ -r "$src" ] && [ -f "$src" ] && source "$src";
done

unset file
unset src
