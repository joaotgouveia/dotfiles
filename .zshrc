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
# Git bare repo alias for dotfiles repo
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
# Copying to clipboard
alias cpc="xclip -sel c < "
# VSCodium
alias code="codium"
# School
runpo="java -cp prr-core/prr-core.jar:prr-app/prr-app.jar:po-uilib-202209081626/po-uilib.jar prr.app.App"
