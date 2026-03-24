# Jump plugin with subdirectory tab completion
# marks are stored as symbolic links in $MARKPATH (default $HOME/.marks)
#
# jump FOO:       cd to mark FOO
# jump FOO/bar:   cd to subdirectory bar under mark FOO
# mark FOO:       create a mark named FOO for current directory
# unmark FOO:     delete a mark
# marks:          list all marks

export MARKPATH=${MARKPATH:-$HOME/.marks}

jump() {
  builtin cd -P "$MARKPATH/$1" 2>/dev/null || { echo "No such mark: $1"; return 1 }
}

mark() {
  if [[ $# -eq 0 || "$1" = "." ]]; then
    MARK=${PWD:t}
  else
    MARK="$1"
  fi
  if read -q "?Mark $PWD as ${MARK}? (y/n) "; then
    command mkdir -p "$MARKPATH"
    command ln -sfn "$PWD" "$MARKPATH/$MARK"
  fi
}

unmark() {
  LANG= command rm -i "$MARKPATH/$1"
}

marks() {
  local link max=0
  for link in $MARKPATH/{,.}*(@N); do
    if [[ ${#link:t} -gt $max ]]; then
      max=${#link:t}
    fi
  done
  local printf_markname_template="$(printf -- "%%%us " "$max")"
  for link in $MARKPATH/{,.}*(@N); do
    local markname="$fg[cyan]${link:t}$reset_color"
    local markpath="$fg[blue]$(readlink $link)$reset_color"
    printf -- "$printf_markname_template" "$markname"
    printf -- "-> %s\n" "$markpath"
  done
}

_mark_expansion() {
  setopt localoptions extendedglob
  autoload -U modify-current-argument
  modify-current-argument '$(readlink "$MARKPATH/$ARG" || echo "$ARG")'
}
zle -N _mark_expansion
bindkey "^g" _mark_expansion

# Completion for jump: mark names + subdirectories
_comp_jump() {
  local markpath="${MARKPATH:-$HOME/.marks}"
  local input="$words[CURRENT]"

  if [[ "$input" == */* ]]; then
    local mark="${input%%/*}"
    local subpath="${input#*/}"
    local markdir="$(readlink "$markpath/$mark" 2>/dev/null)"

    [[ -z "$markdir" || ! -d "$markdir" ]] && return 1

    local basedir="$markdir"
    if [[ "$subpath" == */* ]]; then
      basedir="$markdir/${subpath%/*}"
    fi

    [[ -d "$basedir" ]] || return 1

    local -a dirs
    dirs=("$basedir"/*(/:t))

    local prefix
    if [[ "$subpath" == */* ]]; then
      prefix="$mark/${subpath%/*}/"
    else
      prefix="$mark/"
    fi

    compadd -P "$prefix" -S "/" -q -- "${dirs[@]}"
  else
    local -a marks
    marks=("$markpath"/{,.}*(@N:t))
    compadd -S "/" -q -- "${marks[@]}"
  fi
}

# Completion for unmark: mark names only
_comp_unmark() {
  local markpath="${MARKPATH:-$HOME/.marks}"
  local -a marks
  marks=("$markpath"/{,.}*(@N:t))
  compadd -- "${marks[@]}"
}

# compdef registration happens in .zshrc after compinit
