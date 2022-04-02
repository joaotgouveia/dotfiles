# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="gozilla"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Neofetch
neofetch

# Aliases
alias clear="clear;neofetch"
alias shutdown="shutdown now"
alias restart="shutdown -r now"
alias mv="mv -v"
alias rm="rm -I"
# Git aliases
alias add="git add"
alias commit="git commit -m"
alias push="git push origin main"
# Git bare repo aliases for dotfiles repo
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias confpush="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push git@github.com:joaotgouveia/dotfiles.git"
# Copying to clipboard
alias cpc="xclip -sel c < "

# Enabling vi mode
bindkey -v
