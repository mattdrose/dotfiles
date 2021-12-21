# Add ~/bin to the `$PATH`
export PATH="$HOME/bin:$PATH"

# path,bash_prompt,exports,aliases,functions,extra,gitcompletion,tmux,shopify
# Load the shell dotfiles
for file (exports zsh aliases functions prompt tmux shopify); do
  src=~/.$file
	[ -r "$src" ] && [ -f "$src" ] && source "$src";
done

unset file
unset src
