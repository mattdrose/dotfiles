# Add ~/bin to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Add nvm to our path
source ~/.nvm/nvm.sh

# Add pyenv to our path
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# path,bash_prompt,exports,aliases,functions,extra,gitcompletion,tmux,shopify
# Load the shell dotfiles
for file (exports zsh aliases functions prompt tmux programs); do
  src=~/.$file
	[ -r "$src" ] && [ -f "$src" ] && source "$src";
done

unset file
unset src
