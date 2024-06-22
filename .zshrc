# Sets the environment for interactive shells

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
alias fmtbib="biber --tool --nolog --onlylog --output_align --output_indent=2 --output_fieldcase=lower --output_file=/home/joaotgouveia/docs/bibliography/library.bib ~/docs/bibliography/library.bib && sed -i -e 's/arxiv/arXiv/gI' -e 's/journaltitle/journal     /' -e 's/date/year/' ~/docs/bibliography/library.bib"
# Git bare repo alias for dotfiles repo
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
# Copying to clipboard
alias cpc="xclip -sel c < "

# Removing binds that affect rTorrent
stty stop undef
stty start undef

