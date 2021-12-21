HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# When entering line with history expansion, load line into editing buffer
setopt HIST_VERIFY

# Share history between sessions
setopt SHARE_HISTORY

# Add timestamp to history
setopt EXTENDED_HISTORY

# Try to correct spelling of commands
setopt CORRECT

# Require the use of exit or logout
setopt IGNORE_EOF

# Case-insensitive globbing
unsetopt CASE_GLOB

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY

# Dedup back to back entries in the history
setopt HIST_IGNORE_ALL_DUPS

# Don't expand alias until completion has finished
setopt COMPLETE_ALIASES

# Support parameter expansion, command substitution and arithmetic expansion in prompts
setopt PROMPT_SUBST

# Allow functions to have local options
setopt LOCAL_OPTIONS

# Allow functions to have local traps
setopt LOCAL_TRAPS