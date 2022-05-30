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
# School aliases
alias iaed="gcc -Wall -Wextra -Werror -ansi -pedantic"
alias valgrind="valgrind -s --tool=memcheck"
alias simul="java -jar ~/Escola/IAC/simulador-23-5-2022.jar"
