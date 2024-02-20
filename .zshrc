# Add ~/bin to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Add nvm to our path
source ~/.nvm/nvm.sh

# path,bash_prompt,exports,aliases,functions,extra,gitcompletion,tmux,shopify
# Load the shell dotfiles
for file (exports zsh aliases functions prompt tmux programs); do
  src=~/.$file
	[ -r "$src" ] && [ -f "$src" ] && source "$src";
done

unset file
unset src
