# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="gozilla"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Neofetch 
neofetch

# General aliases
alias clear="clear;neofetch"
alias shutdown="sudo shutdown now"
alias reboot="sudo reboot"
alias mv="mv -v"
alias rm="rm -I"
# Start SSH
alias startssh="eval $(ssh-agent -s)"
# Git bare repo alias for dotfiles repo
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
# Copying to clipboard
alias cpc="xclip -sel c < "
# School aliases
alias iaed="gcc -Wall -Wextra -Werror -ansi -pedantic"
