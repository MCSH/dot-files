# Path to your oh-my-zsh installation.
  export ZSH=/home/sajjad/.oh-my-zsh

#Theme
ZSH_THEME="gallois"
ZSH_THEME="eastwood"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

plugins=(git jump web-search zsh-syntax-highlighting history-substring-search)

#NOTE: syntax must be last

# User configuration

 export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
  
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# PATH
PATH=$PATH:/home/sajjad/bin
PATH=$PATH:/home/sajjad/app/Telegram

export WORKON_HOME=~/.Envs
source /usr/bin/virtualenvwrapper.sh

alias gstat="git status" gadd="git add" gcom="git commit -m" gpush="git push" gpull="git pull"

alias emacs='emacsclient -n  -a ""'
alias emacs-win='emacsclient -n -c -a ""'

#fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
#ponysay $(fortune)
#screenfetch

alias ls='ls -v --color=tty'
PATH=$PATH:/opt/cuda/bin/

#Substring search config:
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

alias vim=nvim

export PATH=$PATH:/home/sajjad/.gem/ruby/2.3.0/bin

alias chrome="google-chrome-stable"
