# Path to your oh-my-zsh installation.
export ZSH=/home/sajjad/.oh-my-zsh

ZSH_THEME="eastwood"

# Custom folder for completions, plugins, and themes
ZSH_CUSTOM=/home/sajjad/.zsh-custom/

# Add custom completions to fpath
fpath=($ZSH_CUSTOM/completions $fpath)

#plugins=(git jump flutter cargo golang stack yarn history-substring-search)
plugins=(git jump flutter cargo golang yarn mix-fast history-substring-search)

export DISABLE_AUTO_UPDATE="true" 

source $ZSH/oh-my-zsh.sh

unset DISABLE_AUTO_UPDATE

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

# Environment variables
export LANG=en_US.UTF-8
export EDITOR=nvim
export GEM_HOME=$HOME/.gem
export WORKON_HOME=$HOME/.virtualenvs

# PATH configuration - consolidated for performance
PATH=$PATH:~/bin/
PATH=$PATH:~/.gem/ruby/2.5.0/bin/
PATH=$PATH:/home/sajjad/App/mendeleyBibFix
PATH=$PATH:/home/sajjad/.dotnet/tools
PATH=$PATH:/opt/flutter/bin/cache/dart-sdk/bin
PATH=$PATH:~/.local/share/rumi/bin/
PATH=$PATH:~/.cargo/bin/
PATH=$PATH:~/.idris2/bin/
PATH=~/.local/bin:$PATH  # Prepend for stack
export PATH

# Git aliases
alias gstat="git status"
alias gadd="git add"
alias gcom="git commit -m"
alias gpush="git push"
alias gpull="git pull"

# General aliases
alias ls='ls -v --color=tty'
alias vim=nvim

# Emacs aliases
alias emacs='emacsclient -n -a ""'
alias emacs-win='emacsclient -n -c -a ""'
alias em=emacs
alias :q=exit

# Python virtualenvwrapper (can be slow to load)
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Ruby gem path (dynamic)
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Android SDK aliases
alias adb=/opt/android-sdk/platform-tools/adb
alias emulator=/opt/android-sdk/emulator/emulator

# Additional environment variables
export RUMI_PATH=~/.local/share/rumi/

# Tab completion for packages
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Fix cargo completion issue
compinit

# opam configuration
test -r /home/sajjad/.opam/opam-init/init.zsh && . /home/sajjad/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Disabled configurations (uncomment to enable)
# eval "$(direnv hook zsh)"
# export MSBuildSDKsPath=$( echo /usr/share/dotnet/sdk/3.*/Sdks );
