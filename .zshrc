# Path to your oh-my-zsh installation.
export ZSH=/home/sajjad/.oh-my-zsh

ZSH_THEME="eastwood"

# Custom, custom folder
ZSH_CUSTOM=/home/sajjad/src/git/dot-files/zsh-custom/

plugins=(git jump history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# Variables
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin/

# Aliases
alias gstat="git status" gadd="git add" gcom="git commit -m" gpush="git push" gpull="git pull"
alias ls='ls -v --color=tty'
alias vim=nvim

export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export EDITOR=nvim

alias emacs='emacsclient -n  -a ""'
alias emacs-win='emacsclient -n -c -a ""'
