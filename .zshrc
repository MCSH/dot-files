# Path to your oh-my-zsh installation.
export ZSH=/home/sajjad/.oh-my-zsh

ZSH_THEME="eastwood"

# Custom, custom folder
ZSH_CUSTOM=/home/sajjad/src/git/dot-files/zsh-custom/

plugins=(git jump flutter cargo go history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# File manager key bound (Alt+Left/Up)
cdUndoKey() {
  popd
  zle       reset-prompt
  echo
  ls
  zle       reset-prompt
}

cdParentKey() {
  pushd ..
  zle      reset-prompt
  echo
  ls
  zle       reset-prompt
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdUndoKey
bindkey '^[[1;3D'      cdParentKey

# Variables
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin/
export PATH=$PATH:~/.gem/ruby/2.5.0/bin/

# Aliases
alias gstat="git status" gadd="git add" gcom="git commit -m" gpush="git push" gpull="git pull"
alias ls='ls -v --color=tty'
alias vim=nvim

export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export EDITOR=nvim

alias emacs='emacsclient -n  -a ""'
alias emacs-win='emacsclient -n -c -a ""'
alias em=emacs
alias :q=exit

export GEM_HOME=$HOME/.gem

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
export PATH=$PATH:/home/sajjad/App/mendeleyBibFix
export PATH=$PATH:/home/sajjad/.dotnet/tools
alias adb=/opt/android-sdk/platform-tools/adb
alias emulator=/opt/android-sdk/emulator/emulator
export PATH=$PATH:/opt/flutter/bin/cache/dart-sdk/bin


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true


export RUMI_PATH=~/.local/share/rumi/
export PATH=$PATH:~/.local/share/rumi/bin/

# Issue with cargo completion
compinit
