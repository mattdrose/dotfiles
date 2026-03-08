# Matt Rose's dotfiles

## Setup

Clone into your home directory:

```bash
cd ~ && git clone https://github.com/mattdrose/dotfiles.git && cd dotfiles
```

For initial install, run:

```bash
bin/dotfiles
```

## Commands

### `dotfiles`

Symlinks all dotfiles from the repo into your home directory. Existing files are backed up with a `.old` extension. Since files are symlinked (not copied), edits in `~` are reflected back in the repo.

### `dotfiles brew`

Installs Homebrew (if needed) and all packages defined in the `Brewfile`, including modern CLI tools like `ripgrep`, `fd`, `bat`, `fzf`, and `eza`. Also installs nvm for Node.js version management.

### `dotfiles symlinks`

Creates symlinks for app-specific configs (VS Code settings, Karabiner) into their expected locations.

### `dotfiles reload`

Re-sources all dotfiles in the current shell, picking up any changes without replacing the shell process.

### `dotfiles macos`

Configures macOS system defaults (Finder, Dock, keyboard, trackpad, etc.).

## File Structure

| File | Purpose |
|------|---------|
| `.zshrc` | Entry point — sources all other dotfiles |
| `.path` | PATH modifications and tool initialization (Homebrew, nvm, pyenv, bun, etc.) |
| `.exports` | Environment variables (editor, locale, colors) |
| `.aliases` | Shell aliases |
| `.functions` | Shell helper functions |
| `.zsh` | Zsh-specific options (history, completion) |
| `.prompt` | Custom Zsh prompt with git status |
| `.gitconfig` | Git config with extensive aliases |
| `.gitconfig-suns` | Work-specific git identity (included via `includeIf`) |
| `.editorconfig` | Editor formatting defaults |
| `.tmux.conf` | Tmux configuration |
| `Brewfile` | Declarative Homebrew package list |
| `config/` | App configs symlinked by `bin/dotfiles symlinks` |
| `commands/` | Scripts invoked by `bin/dotfiles <command>` |

## Customization

Create a `~/.extra` file for machine-specific settings you don't want committed (it's gitignored). It will be sourced automatically if present.
