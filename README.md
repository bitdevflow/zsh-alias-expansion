# zsh-alias-expansion

A lightweight Zsh plugin that brings Fish shell's abbreviation expansion behavior to Zsh. It automatically expands both regular and global aliases in real-time as you type, triggered by **Space** or **Enter**.

## Features

- **Real-time Expansion:** Aliases are expanded immediately when you press Space.
- **Enter Expansion:** Aliases at the end of a command are expanded when you press Enter to execute.
- **Global Alias Support:** Fully supports Zsh global aliases ( `alias -g ...`).
- **Lightweight:** Minimal overhead, implemented with native Zsh widgets.

## Installation

### 1. Download the script

Download the `zsh-alias-expansion.zsh` file to your Zsh configuration directory (e.g., `~/.config/zsh/`).

```bash
mkdir -p ~/.config/zsh
curl -o ~/.config/zsh/zsh-alias-expansion.zsh https://raw.githubusercontent.com/bitdevflow/zsh-alias-expansion/refs/heads/main/zsh-alias-expansion.zsh
```

### 2. Source in `.zshrc`

Add the following to your `.zshrc` file to load the plugin.

> **Note:** It is recommended to put this in `.zshrc` rather than `.zprofile` because it defines key bindings for the interactive shell.

```zsh
# Source alias expansion logic
if [[ -f "$HOME/.config/zsh/zsh-alias-expansion.zsh" ]]; then
  source "$HOME/.config/zsh/zsh-alias-expansion.zsh"
fi
```

### 3. Reload Zsh

Restart your terminal or reload your configuration:

```bash
source ~/.zshrc
```

## Usage

Define your aliases normally in your `.zshrc`:

```zsh
alias g="git"
alias -g G="| grep"
```

1. Type `g` and press **Space** -> it automatically becomes `git `.
2. Type `history G` and press **Enter** -> it expands to `history | grep` and executes.
