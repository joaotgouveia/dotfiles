# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ESof setup
export POSTGRES_DB=hedb
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export POSTGRES_HOST_AUTH_METHOD=trust
export PSQL_INT_TEST_DB_USERNAME=postgres
export PSQL_INT_TEST_DB_PASSWORD=postgres
export cypress_psql_db_name=hedb
export cypress_psql_db_username=postgres
export cypress_psql_db_password=postgres
export cypress_psql_db_host=localhost
export cypress_psql_db_port=5432

# History
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS # Don't put duplicate commands in history
setopt HIST_SAVE_NO_DUPS # Don't save duplicate commands
setopt HIST_REDUCE_BLANKS # Remove unnecessary blanks
setopt INC_APPEND_HISTORY # Append command to history file immediately

# Theme
ZSH_THEME="eastwood"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Conda setup
[ -f /opt/anaconda/etc/profile.d/conda.sh ] && source /opt/anaconda/etc/profile.d/conda.sh

# Skim setup
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

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
