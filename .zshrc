# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="eastwood"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Neofetch
neofetch

# General aliases
alias clear="clear;neofetch"
alias mv="mv -v"
alias rm="rm -I"
alias reset="reset;neofetch"
alias shutdown="shutdown now"
# Git bare repo alias for dotfiles repo
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
# Copying to clipboard
alias cpc="xclip -sel c < "

# Removing binds that affect rTorrent
stty stop undef
stty start undef
